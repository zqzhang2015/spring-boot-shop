package com.lhrsite.shop.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.entity.BuyCar;
import com.lhrsite.shop.services.BuyCarService;
import com.lhrsite.shop.services.UserService;
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
    public String add(String token, String goodsId, Integer number){
        resultVO.setData(JSON.toJSONString(buyCarService.addBuyCar(token, goodsId, number)));
        return JSON.toJSONString(resultVO);
    }

    @RequestMapping("/getBuyCar")
    public String add(String token){
        if (token == null || "".equals(token)|| "undefined".equals(token)){
            resultVO.setData(JSON.toJSONString(new JSONArray()));
        }else {
            String data = JSON.toJSONString(buyCarService.getBuyCar(token));
            resultVO.setData(data);
        }
        return JSON.toJSONString(resultVO);
    }

    @RequestMapping("/minusBuyCar")
    public String minusBuyCar(String token, String goodsId, Integer number){
        resultVO.setData(JSON.toJSONString(buyCarService.minusBuyCar(token, goodsId,number)));
        return JSON.toJSONString(resultVO);
    }

    @RequestMapping("/deleteBuyCar")
    public String deleteBuyCar(String buyCarId){
        buyCarService.deleteBuyCar(buyCarId);
        return JSON.toJSONString(resultVO);
    }

}
