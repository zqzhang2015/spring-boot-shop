package com.lhrsite.shop.services.impl;

import com.lhrsite.shop.entity.Address;
import com.lhrsite.shop.entity.QAddress;
import com.lhrsite.shop.entity.User;
import com.lhrsite.shop.repository.AddressRepository;
import com.lhrsite.shop.services.AddressService;
import com.lhrsite.shop.services.UserService;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * (Address)表服务实现类
 *
 * @author lhr
 * @since 2018-08-22 14:08:29
 */
@Service
public class AddressServiceImpl extends BaseServiceImpl implements AddressService {

    private final UserService userService;

    private final AddressRepository addressRepository;

    //实体管理者
    private final EntityManager entityManager;
    //JPA查询工厂
    private JPAQueryFactory queryFactory;
    public AddressServiceImpl(EntityManager entityManager,
                              UserService userService,
                              AddressRepository addressRepository) {
        super(entityManager);
        this.userService = userService;
        this.addressRepository = addressRepository;
        this.entityManager = entityManager;
        queryFactory = getQueryFactory();

    }

    @Override
    public Address add(String token, String address, Integer defaultStatus) {
        User user = userService.tokenGetUser(token);
        Address addr = new Address();
        addr.setAddr(address);
        addr.setUid(user.getUid());
        addr.setDefaultStatus(defaultStatus);
        return addressRepository.save(addr);
    }

    @Override
    public Address updateDefaultAddr(Integer uid, Integer addrId) {
        // 取消该用户现有默认地址

        QAddress qAddress = QAddress.address;
        List<Address> addresses =
                queryFactory.selectFrom(qAddress)
                .where(qAddress.uid.eq(uid))
                .fetch();

//        if (addresses.size() > 0)

        return null;
    }

    @Override
    public Address updateAddr(Integer addrId, String address) {
        return null;
    }

    @Override
    public void delAddr(String token, Integer addrId) {

    }
}