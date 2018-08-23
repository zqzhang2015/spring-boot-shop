package com.lhrsite.shop.services.impl;

import com.lhrsite.shop.entity.Address;
import com.lhrsite.shop.entity.QAddress;
import com.lhrsite.shop.entity.User;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.repository.AddressRepository;
import com.lhrsite.shop.services.AddressService;
import com.lhrsite.shop.services.UserService;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
    public Address add(String token, String address, Integer defaultStatus) throws ErpException {
        User user = userService.tokenGetUser(token);
        Address addr = new Address();
        addr.setAddr(address);
        addr.setUid(user.getUid());
        if (this.getAddress(token).size() == 0){
            addr.setDefaultStatus(1);
        }else{
            addr.setDefaultStatus(defaultStatus);
        }
        Address address1 = addressRepository.save(addr);
        if (defaultStatus == 1){
            address1 = updateDefaultAddr(token, address1.getId());
        }
        return address1;
    }

    @Override
    public Address updateDefaultAddr(String token, Integer addrId) throws ErpException {
        User user = userService.tokenGetUser(token);
        // 取消该用户现有默认地址
        QAddress qAddress = QAddress.address;
        List<Address> addresses =
                queryFactory.selectFrom(qAddress)
                .where(qAddress.uid.eq(user.getUid())
                        .and(qAddress.defaultStatus.eq(1)))
                .fetch();

        List<Address> addressesUpDefault = new ArrayList<>();
        addresses.forEach(address -> {
            address.setDefaultStatus(0);
            addressesUpDefault.add(address);
        });
        if (addressesUpDefault.size() > 0){
            addressRepository.saveAll(addressesUpDefault);
        }

        // 修改欲要修改的地址
        Optional<Address> addressOptional = addressRepository.findById(addrId);
        if (!addressOptional.isPresent()){
            throw new ErpException(ErrEumn.ADDRESS_NOT_EXIST);
        }
        Address address = addressOptional.get();
        address.setDefaultStatus(1);
        addressRepository.save(address);
        return address;
    }

    @Override
    public Address updateAddr(Integer addrId, String address) throws ErpException {

        Optional<Address> addressOptional = addressRepository.findById(addrId);
        if (!addressOptional.isPresent()){
            throw new ErpException(ErrEumn.ADDRESS_NOT_EXIST);
        }
        Address addr = addressOptional.get();
        addr.setAddr(address);
        addressRepository.save(addr);
        return addr;
    }

    @Override
    public void delAddr(String token, Integer addrId) throws ErpException {
        User user = userService.tokenGetUser(token);
        Optional<Address> addressOptional = addressRepository.findById(addrId);
        if (!addressOptional.isPresent()){
            throw new ErpException(ErrEumn.ADDRESS_NOT_EXIST);
        }
        if (!user.getUid().equals(addressOptional.get().getUid())){
            throw new ErpException(ErrEumn.ONLY_DELETE_YOUERSELF_ADDRESS);
        }
        addressRepository.deleteById(addrId);
    }

    @Override
    public List<Address> getAddress(String token) {
        User user = userService.tokenGetUser(token);
        QAddress qAddress = QAddress.address;
        return queryFactory.selectFrom(qAddress)
                .where(qAddress.uid.eq(user.getUid()))
                .fetch();
    }

    @Override
    public Address getDefaultAddress(String token) {

        User user = userService.tokenGetUser(token);
        QAddress qAddress = QAddress.address;

        return queryFactory.selectFrom(qAddress)
                .where(
                        qAddress.uid.eq(user.getUid())
                        .and(qAddress.defaultStatus.eq(1))
                )
                .fetchOne();
    }
}