package com.lhrsite.shop.services;

import com.lhrsite.shop.VO.GoodsListVO;
import com.lhrsite.shop.VO.PageVO;

public interface GoodsService {


    PageVO<GoodsListVO> getGoodsList(String title, long page, long pageSize);









}
