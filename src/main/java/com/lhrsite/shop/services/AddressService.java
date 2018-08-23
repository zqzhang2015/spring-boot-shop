package com.lhrsite.shop.services;


import com.lhrsite.shop.entity.Address;
import com.lhrsite.shop.exception.ErpException;

import java.util.List;

/**
 * (Address)表服务接口
 *
 * @author lhr
 * @since 2018-08-22 14:08:28
 */
public interface AddressService {

    /**
     * 添加收货地址
     * @param token             用户登录令牌
     * @param address           用户地址
     * @param defaultStatus     是否默认收货地址
     * @return                  添加的收货地址
     */
    Address add(String token, String address, Integer defaultStatus) throws ErpException;

    /**
     * 更新默认收货地址
     * @param token         用户token
     * @param addrId        欲设为默认地址的地址id
     * @return              设置后的对象
     */
    Address updateDefaultAddr(String token, Integer addrId) throws ErpException;

    /**
     * 更新收货地址
     * @param addrId        收货地址id
     * @param address       收货地址
     * @return              设置后的对象
     */
    Address updateAddr(Integer addrId, String address) throws ErpException;

    /**
     * 删除收货地址
     * @param token         用户token
     * @param addrId        地址id
     */
    void delAddr(String token, Integer addrId) throws ErpException;

    List<Address> getAddress(String token);

    Address getDefaultAddress(String token);


}