package com.lhrsite.shop.services;

import com.lhrsite.shop.VO.GoodsListVO;
import com.lhrsite.shop.VO.PageVO;
import com.lhrsite.shop.entity.Goods;

public interface GoodsService {


    PageVO<GoodsListVO> getGoodsList(String title, long page, long pageSize);

    Goods addGoods(Goods goods);

    Goods updateGoods(Goods goods);

    Goods getById(String goodsId);










}
