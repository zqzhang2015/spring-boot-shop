package com.lhrsite.shop.controller;


import com.alibaba.fastjson.JSON;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.entity.User;
import com.lhrsite.shop.services.UserService;
import com.lhrsite.shop.util.EncryptUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {

    private final UserService userService;
    private ResultVO resultVO;


    @Autowired
    public UserController(UserService userService, EntityManager entityManager) {
        resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("ok");
        this.userService = userService;
    }



//    @GetMapping("/getPassword")
//    public String getPassword(String str){
//        log.info("【加密密码】str={}", str);
//        return Encrypt.encryptPassword(str);
//    }

    @PostMapping("/login")
    public String login(String phone,
                        String password,
                        HttpServletRequest request)
            throws ErpException {
        log.info("【登录】phone={}, password={}", phone, password);
        resultVO.setData(JSON.toJSONString(userService.login(phone, password, request)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/loginAdmin")
    public String loginAdmin(String phone,
                        String password,
                        HttpServletRequest request)
            throws ErpException {
        log.info("【登录】phone={}, password={}", phone, password);
        resultVO.setData(JSON.toJSONString(userService.loginAdmin(phone, password, request)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/tokenUse")
    public String tokenUse(String token) throws ErpException {
        log.info("【验证token是否可用】token={}", token);

        resultVO.setData(JSON.toJSONString(userService.tokenCanUse(token)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/userList")
    public String userList(
            @RequestParam(required = false) String username,
            @RequestParam(required = false) String phoneNum,
            @RequestParam(required = false) String email,
            @RequestParam(required = false, defaultValue = "0") Integer enterpriseId,
            @RequestParam(required = false, defaultValue = "1") Integer page,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize,
            HttpServletRequest request){
        log.info("【查询用户】params={}", request.getParameterMap());
        User user = new User();
        user.setUsername(username);
        user.setPhone(phoneNum);
        user.setEmail(email);
        user.setEnterprise(enterpriseId);

        resultVO.setData(JSON
                .toJSONString(userService.getUser(user, page, pageSize)));

        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/getUser")
    public String getUser(Integer uid,
                          @RequestParam(defaultValue = "0") int showPhone)
            throws ErpException {
        log.info("【获取用户】uid={}", uid);
        if(uid == null){
            throw new ErpException(ErrEumn.PARAM_IS_NULL);
        }
        resultVO.setData(JSON.toJSONString(
                userService.findUserById(uid, showPhone == 1)
        ));

        return JSON.toJSONString(resultVO);
    }


    @PostMapping("/addUser")
    public String addUser(User user) throws ErpException {
        log.info("【添加用户】user={}", user);
        if (user == null){
            throw new ErpException(ErrEumn.ADD_USER_IS_NULL);
        }
        if (user.getUsername() == null){
            throw new ErpException(ErrEumn.ADD_USER_USERNAME_IS_NULL);
        }
        if (user.getPassword() == null){
            throw new ErpException(ErrEumn.ADD_USER_PASSWORD_IS_NULL);
        }
        if (user.getPhone() == null){
            throw new ErpException(ErrEumn.ADD_USER_PHONE_IS_NULL);
        }
        if (user.getEnterprise() == null){
            user.setEnterprise(0);
        }
        if (user.getStatus() == null){
            user.setStatus(0);

        }
        if (user.getHeader() == null){
            user.setHeader("");
        }
        if (user.getEmail() == null){
            user.setEmail("");
        }
        if (user.getAuthGroup() == null){
            user.setAuthGroup(0);
        }
        if (user.getAdmin() == null){
            user.setAdmin(0);
        }

        resultVO.setData(JSON.toJSONString(userService.addUser(user)));
        return JSON.toJSONString(resultVO);
    }
    @PostMapping("/upPassword")
    public String upPassword(String token, String oldPassword, String newPassword) throws ErpException {
        resultVO.setData(JSON.toJSONString(userService.UpPassword(token, oldPassword, newPassword)));
        return JSON.toJSONString(resultVO);
    }
    @PostMapping("/editUser")
    public String editUser(User user) throws ErpException {
        log.info("【修改用户】user={}", user);
        if (user == null){
            throw new ErpException(ErrEumn.ADD_USER_IS_NULL);
        }
        if (user.getUid() == null || user.getUid() == 0) {
            throw new ErpException(ErrEumn.ADD_USER_UID_IS_NULL);
        }
        User oldUser = userService.findById(user.getUid());
        if (user.getUsername() != null){
            oldUser.setUsername(user.getUsername());
        }
        if (user.getPassword() != null){
            oldUser.setPassword(EncryptUtil.encryptPassword(user.getPassword()));
        }
        if (user.getPhone() != null){
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
        resultVO.setData(JSON.toJSONString(userService.updateUser(user)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/phoneIsExist")
    public String phoneIsExist(String phone) throws ErpException {
        userService.phoneIsExist(phone);
        return JSON.toJSONString(resultVO);
    }

}
