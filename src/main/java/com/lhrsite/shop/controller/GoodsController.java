package com.lhrsite.shop.controller;


import com.alibaba.fastjson.JSON;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.services.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/goods")
public class GoodsController {


    private final GoodsService goodsService;
    private ResultVO resultVO;
    @Autowired
    public GoodsController(GoodsService goodsService) {
        this.goodsService = goodsService;
        resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("ok");
    }

    @PostMapping("/list")
    public String list(String title,
                       @RequestParam(defaultValue = "1") long page,
                       @RequestParam(defaultValue = "10") long pageSize){
        resultVO.setData(
                JSON.toJSONString(
                        goodsService.getGoodsList(title, page, pageSize)
                )
        );
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/info")
    public String info(String goodsId){
        resultVO.setData(JSON.toJSONString(goodsService.getById(goodsId)));
        return JSON.toJSONString(resultVO);
    }







}
