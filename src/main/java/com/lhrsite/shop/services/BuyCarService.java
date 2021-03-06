package com.lhrsite.shop.services;

import com.lhrsite.shop.VO.BuyCarVO;
import com.lhrsite.shop.entity.BuyCar;

import java.util.List;

public interface BuyCarService {

    BuyCar addBuyCar(BuyCar buyCar);


    void deleteBuyCar(String buyCarId);



    List<BuyCarVO> getBuyCar(String token);

    BuyCar addBuyCar(String token, String goodsId, Integer number);

    BuyCar minusBuyCar(String token, String goodsId, Integer number);
}
