package com.lhrsite.shop.controller;


import com.alibaba.fastjson.JSON;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.entity.Order;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;
    private ResultVO resultVO;


    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
        resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("ok");
    }


    @PostMapping("/createOrder")
    public String createOrder(String token) throws ErpException {
        resultVO.setData(JSON.toJSONString(orderService.createOrder(token)));
        return JSON.toJSONString(resultVO);
    }


    @PostMapping("/settleAccounts")
    public String settleAccounts(String token) throws ErpException {
        resultVO.setData(JSON.toJSONString(orderService.settleAccounts(token)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/updateOrder")
    public String updateOrder(String token, Order order) throws ErpException {
        resultVO.setData(JSON.toJSONString(orderService.settleAccounts(token)));
        return JSON.toJSONString(resultVO);
    }


    @PostMapping("/orderList")
    public String getOrderList(String token,
                               @RequestParam(defaultValue = "1") long page,
                               @RequestParam(defaultValue = "5") long pageSize) throws ErpException {
        resultVO.setData(JSON.toJSONString(
                orderService.orderListByUser(token, page, pageSize)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/list")
    public String list(String token,
                               @RequestParam(defaultValue = "1") long page,
                               @RequestParam(defaultValue = "5") long pageSize) throws ErpException {
        resultVO.setData(JSON.toJSONString(
                orderService.list(token, page, pageSize)));
        return JSON.toJSONString(resultVO);
    }
}
