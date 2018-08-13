package com.lhrsite.shop.services;

import com.lhrsite.shop.VO.OrderVO;
import com.lhrsite.shop.entity.Order;
import com.lhrsite.shop.exception.ErpException;

import java.math.BigDecimal;
import java.util.Map;

public interface OrderService {


    OrderVO createOrder(String token) throws ErpException;

    Map<String, BigDecimal> settleAccounts(String token) throws ErpException;

    Order updateOrder(Order order);



}
