package com.lhrsite.shop.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.lhrsite.shop.VO.OrderListVO;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.entity.Order;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.services.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/order")
@Slf4j
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

    @ResponseBody
    @GetMapping("/print.html")
    public ModelAndView print(String orderId)
            throws ErpException {
        OrderListVO order = orderService.order(orderId);
        System.out.println(order);
        ModelAndView modelAndView = new ModelAndView("print");
        modelAndView.addObject("order", order);
        return modelAndView;
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
        resultVO.setData(JSON.toJSONStringWithDateFormat(
                orderService.list(token, page, pageSize),"yyyy-MM-dd HH:mm:ss", SerializerFeature.DisableCircularReferenceDetect));
        return JSON.toJSONString(resultVO);
    }
}
