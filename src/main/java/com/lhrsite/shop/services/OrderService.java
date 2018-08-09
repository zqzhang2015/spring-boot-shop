package com.lhrsite.shop.services;

import com.lhrsite.shop.VO.OrderVO;
import com.lhrsite.shop.entity.Order;
import com.lhrsite.shop.exception.ErpException;

import java.math.BigDecimal;
import java.util.Map;

public interface OrderService {

    OrderVO createOrder(Integer userId) throws ErpException;

    Map<String, BigDecimal> settleAccounts(Integer userId) throws ErpException;

    Order updateOrder(Order order);



}
