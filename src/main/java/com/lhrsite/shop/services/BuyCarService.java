package com.lhrsite.shop.services;

import com.lhrsite.shop.VO.BuyCarVO;
import com.lhrsite.shop.entity.BuyCar;

import java.util.List;

public interface BuyCarService {

    BuyCar addBuyCar(BuyCar buyCar);

    BuyCar minusBuyCar(BuyCar buyCar, Integer number);

    void deleteBuyCar(String buyCarId);

    List<BuyCarVO> getBuyCar(Integer userId);

}
