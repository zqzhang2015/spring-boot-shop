package com.lhrsite.shop.services;

import com.lhrsite.shop.VO.OrderListVO;
import com.lhrsite.shop.VO.OrderVO;
import com.lhrsite.shop.entity.Order;
import com.lhrsite.shop.exception.ErpException;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface OrderService {


    @Transactional
    OrderVO createOrder(String token) throws ErpException;

    Map<String, BigDecimal> settleAccounts(String token) throws ErpException;

    Order updateOrder(Order order);


    List<OrderListVO> orderListByUser(String token, long page, long pageSize) throws ErpException;

}
