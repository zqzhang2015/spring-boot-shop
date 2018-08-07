package com.lhrsite.shop.controller;

import com.alibaba.fastjson.JSON;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.entity.BuyCar;
import com.lhrsite.shop.services.BuyCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/buyCar")
public class BuyCarController {

    private final BuyCarService buyCarService;
    private ResultVO resultVO;
    @Autowired
    public BuyCarController(BuyCarService buyCarService) {
        this.buyCarService = buyCarService;
        resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("ok");
    }

    @RequestMapping("/add")
    public String add(BuyCar buyCar){
        resultVO.setData(JSON.toJSONString(buyCarService.addBuyCar(buyCar)));
        return JSON.toJSONString(resultVO);
    }
    @RequestMapping("/getBuyCar")
    public String add(Integer userId){
        resultVO.setData(JSON.toJSONString(buyCarService.getBuyCar(userId)));
        return JSON.toJSONString(resultVO);
    }

    @RequestMapping("/minusBuyCar")
    public String minusBuyCar(BuyCar buyCar){
        resultVO.setData(JSON.toJSONString(buyCarService.minusBuyCar(buyCar, 1)));
        return JSON.toJSONString(resultVO);
    }

    @RequestMapping("/deleteBuyCar")
    public String deleteBuyCar(String buyCarId){
        buyCarService.deleteBuyCar(buyCarId);
        return JSON.toJSONString(resultVO);
    }

}
