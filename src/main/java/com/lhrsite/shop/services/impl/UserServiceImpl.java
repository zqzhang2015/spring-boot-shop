package com.lhrsite.shop.services.impl;

import com.lhrsite.shop.VO.PageVO;
import com.lhrsite.shop.VO.UserVO;
import com.lhrsite.shop.entity.*;
import com.lhrsite.shop.enums.UserStatusEnums;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.repository.AuthGroupRepository;
import com.lhrsite.shop.repository.EnterpriseRepository;
import com.lhrsite.shop.repository.UserLoginRepository;
import com.lhrsite.shop.repository.UserRepository;
import com.lhrsite.shop.services.UserService;
import com.lhrsite.shop.util.EncryptUtil;
import com.lhrsite.shop.util.IpUtil;
import com.lhrsite.shop.util.TimeUtil;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.Tuple;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@Service
public class UserServiceImpl extends BaseServiceImpl implements UserService  {

    private final UserRepository userRepository;

    private final EnterpriseRepository enterpriseRepository;

    private final AuthGroupRepository authGroupRepository;

    private final UserLoginRepository userLoginRepository;

    //JPA查询工厂
    private JPAQueryFactory queryFactory;
    @Autowired
    public UserServiceImpl(UserRepository userRepository,
                           EnterpriseRepository enterpriseRepository,
                           AuthGroupRepository authGroupRepository,
                           UserLoginRepository userLoginRepository,
                           EntityManager entityManager) {
        super(entityManager);
        this.userRepository = userRepository;
        this.enterpriseRepository = enterpriseRepository;
        this.authGroupRepository = authGroupRepository;
        this.userLoginRepository = userLoginRepository;
        this.queryFactory = getQueryFactory();
    }


    @Override
    public UserVO login(String phoneNumber, String password,
                        HttpServletRequest request) throws ErpException {
        User user = userRepository.findByPhone(phoneNumber);
        if (user != null &&
                user.getPassword().equals(EncryptUtil.encryptPassword(password))){

            UserLogin userLogin = new UserLogin();
            userLogin.setId(EncryptUtil.encryptPassword(UUID.randomUUID().toString()));
            userLogin.setLoginIp(IpUtil.getIpAddress(request));
            userLogin.setUserToken(
                    EncryptUtil.encryptPassword(
                            UUID.randomUUID()
                                    .toString()));
            userLogin.setUserId(user.getUid());

            userLogin.setExpireTime(new Timestamp(
                    TimeUtil.addDay(new Date(), 30).getTime()
            ));

            userLogin = userLoginRepository.save(userLogin);

            UserVO userVO = userToUserVO(user, false);
            userVO.setToken(userLogin.getUserToken());
            return userVO;
        }else {
            throw new ErpException(ErrEumn.LOGIN_ERR);
        }
    }

    @Override
    public UserVO tokenCanUse(String token) throws ErpException {
        UserLogin userLogin = userLoginRepository.findByUserToken(token);
        if (userLogin != null
                && userLogin.getExpireTime().getTime() > System.currentTimeMillis()){
            User user = userRepository.findById(userLogin.getUserId()).get();
            UserVO userVO = userToUserVO(user, true);
            userVO.setToken(userLogin.getUserToken());
            return userVO;
        }
        throw new ErpException(ErrEumn.EXPIRE_TOKEN);
    }

    @Override
    public PageVO<UserVO> getUser(User user, int page, int pageSize) {
        QUser qUser = QUser.user;
        QEnterprise qEnterprise = QEnterprise.enterprise;

        BooleanBuilder builder = new BooleanBuilder();
        builder.and(qUser.status.eq(0));

        if (user.getUsername() != null && !user.getUsername().isEmpty()){
            builder.and(qUser.username.like("%" + user.getUsername() + "%"));
        }
        if (user.getPhone() != null && !user.getPhone().equals("")){
            builder.and(qUser.phone.like("%" + user.getPhone() + "%"));
        }
        if (user.getEmail() != null && !user.getEmail().equals("")){
            builder.and(qUser.email.like("%" + user.getEmail() + "%"));

        }
        if (user.getEnterprise() != null && user.getEnterprise() != 0){
            builder.and(qUser.enterprise.eq(user.getEnterprise()));
        }

        JPAQuery<Tuple> tupleJPAQuery = queryFactory
                .select(qUser.uid, qUser.username,
                        qUser.phone, qUser.email,
                        qEnterprise.epName, qEnterprise.epShortName,
                        qUser.header, qUser.createTime,
                        qUser.updateTime, qUser.status)
                .from(qUser).leftJoin(qEnterprise)
                .on(qUser.enterprise.eq(qEnterprise.eid))
                .where(builder)
                .offset((page - 1) * pageSize)
                .limit(pageSize)
                .orderBy(qUser.uid.asc());

        List<Tuple> userList =  tupleJPAQuery.fetch();

        List<UserVO> userVOS = new ArrayList<>();
        userList.forEach(userItem -> UserVO.tupleToUserVO(userItem, userVOS));
        PageVO<UserVO> pageVO = new PageVO<>();

        pageVO.init(tupleJPAQuery.fetchCount(), page, userVOS);

        return pageVO;
    }

    @Override
    public UserVO findUserById(Integer userId,
                               boolean showPhoneNumber) throws ErpException {
        return userToUserVO(
                userRepository.findById(userId).get(),
                showPhoneNumber);

    }

    @Override
    public User findById(Integer userId) {
        return userRepository.findById(userId).get();
    }

    @Override
    public User addUser(User user) throws ErpException {

        phoneIsExist(user.getPhone());

        user.setPassword(
                EncryptUtil.encryptPassword(user.getPassword()));


        try {
            return userRepository.save(user);
        }catch (Exception e){
            throw new ErpException(ErrEumn.ADD_USER_ERR);
        }

    }

    @Override
    public UserVO updateUser(User user) throws ErpException {

        if (user == null || user.getUid() <= 0){
            //当修改用户或找不到该用户的id时
            throw new ErpException(ErrEumn.UPDATE_USER_PARAMS_ERR);
        }

        User oldUser = userRepository.findById(user.getUid()).get();

        /* 允许修改的字段才进行修改 */
        if (user.getUsername() != null){
            oldUser.setUsername(user.getUsername());
        }
        if (user.getPassword() != null){
            oldUser.setPassword(EncryptUtil.encryptPassword(user.getPassword()));
        }
        if (user.getPhone() != null){
            // 当修改手机号时判断手机号是否存在
            phoneIsExist(user.getPhone());
            oldUser.setPhone(user.getPhone());
        }
        if (user.getHeader() != null){
            oldUser.setHeader(user.getHeader());
        }
        if (user.getEmail() != null){
            oldUser.setEmail(user.getEmail());
        }
        if (user.getAuthGroup() != null){
            oldUser.setAuthGroup(user.getAuthGroup());
        }


        try {
            return userToUserVO(userRepository.save(oldUser),
                    true);

        }catch (Exception e){
            // 处理入库失败情况
            throw new ErpException(ErrEumn.UPDATE_USER_ERR);
        }



    }

    @Override
    public UserVO delUser(User user) throws ErpException {
        // 伪删除

        if (user == null || user.getUid() <= 0){
            throw new ErpException(ErrEumn.DELECT_USER_ERR);
        }
        user = userRepository.findById(user.getUid()).get();

        user.setStatus(UserStatusEnums.NOUSE.getCode());

        try {
            return userToUserVO(userRepository.save(user),
                    true);
        }catch (Exception e){
            throw new ErpException(ErrEumn.DELECT_USER_ERR);
        }

    }

    @Override
    public User tokenGetUser(String token) {

        UserLogin userLogin =
                userLoginRepository.findByUserToken(token);

        return userRepository
                .findById(userLogin.getUserId()).get();
    }


    /**
     * User对象转uservo对象
     * @param userList          user集合
     * @param showPhoneNumber   是否显示手机号:true为显示
     * @return                  userVO集合
     */
    private List<UserVO> userToUserVO(List<User> userList, boolean showPhoneNumber){
        List<Integer> enterpriseIds = new ArrayList<>();
        List<Integer> authGroupIds = new ArrayList<>();

        List<UserVO> userVOS = new ArrayList<>();
        for (User user : userList){
            UserVO userVO = new UserVO();
            BeanUtils.copyProperties(user, userVO);
            userVOS.add(userVO);
        }

        userList.forEach(item ->
                getEnterpriseIds(item, enterpriseIds, authGroupIds));

        List<Enterprise> enterprises =
                enterpriseRepository.findAllById(enterpriseIds);
        List<AuthGroup> authGroups =
                authGroupRepository.findAllById(authGroupIds);


        userVOS.forEach(item ->
                putName(item, enterprises, authGroups));


        // 当不显示手机号时隐藏中间几位手机号
        if (!showPhoneNumber){
            userList.forEach(item ->
                    item.setPhone(item.getPhone()
                            .replaceAll("(\\d{3})\\d{4}(\\d{4})",
                                    "$1****$2")));
        }


        return userVOS;
    }


    /**
     * 同上处理单个
     * @param user              单个用户
     * @param showPhoneNumber   是否显示手机号：true为显示
     * @return                  单个用户的uservo
     * @throws ErpException
     */
    private UserVO userToUserVO(User user, boolean showPhoneNumber) throws ErpException {
        if (user == null){
            throw new ErpException(ErrEumn.USER_NO_EXIT);
        }
        List<User> users = new ArrayList<>();
        users.add(user);
        List<UserVO> userVOS = userToUserVO(users, showPhoneNumber);
        return userVOS.get(0);
    }


    /**
     * 为一组用户的所有item进行赋值其所属的企业名称和权限组名称
     * @param userVO        用户vo对象
     * @param enterprises   企业集合
     * @param authGroups    权限组集合
     */
    private void putName(
            UserVO userVO, List<Enterprise> enterprises,
            List<AuthGroup> authGroups){

        // 遍历企业对用户所属企业进行匹配
        enterprises.stream()
                .filter(item -> item.getEid().equals(userVO.getEnterprise()))
                .forEach(item -> {
                    userVO.setEnterpriseName(item.getEpShortName());
                });



        // 遍历权限组为用户所属的权限组赋值。
        authGroups.stream()
                .filter(authGroup -> authGroup.getAgid().equals(userVO.getAuthGroup()))
                .forEach(
                        item -> {
                            userVO.setAuthGroupName(item.getAgName());
                        }
                );

    }

    /**
     * 获取一批用户的所有包含企业和权限组。
     * @param user              用户列表
     * @param enterpriseIds     存放企业id的集合
     * @param authGroupIds      存放权限组id的集合
     */
    private void getEnterpriseIds(
            User user,
            List<Integer> enterpriseIds,
            List<Integer> authGroupIds){

        enterpriseIds.add(user.getEnterprise());
        authGroupIds.add(user.getAuthGroup());
    }


    /**
     * 判断手机号是否存在
     * @param phone             手机号
     * @throws ErpException     如果存在抛出异常
     */
    @Override
    public void phoneIsExist(String phone) throws ErpException {
        User user = userRepository.findByPhone(phone);
        if(user != null){
            throw new ErpException(ErrEumn.ADD_USER_PHONE_EXIST);
        }
    }

}
