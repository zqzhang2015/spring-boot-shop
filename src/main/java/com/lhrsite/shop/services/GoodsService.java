package com.lhrsite.shop.services;

import com.lhrsite.shop.VO.GoodsListVO;
import com.lhrsite.shop.VO.GoodsPullDown;
import com.lhrsite.shop.VO.PageVO;
import com.lhrsite.shop.entity.Goods;

import java.util.List;

public interface GoodsService {


    PageVO<GoodsListVO> getGoodsList(String title, Integer cid, long page, long pageSize);

    Goods addGoods(Goods goods);

    Goods updateGoods(Goods goods);

    Goods getById(String goodsId);

    List<GoodsPullDown> pullDown(String title);










}
