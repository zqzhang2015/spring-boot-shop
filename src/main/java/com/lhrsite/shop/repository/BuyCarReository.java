package com.lhrsite.shop.repository;


import com.lhrsite.shop.entity.BuyCar;
import com.lhrsite.shop.services.impl.BaseServiceImpl;
import org.springframework.stereotype.Repository;

@Repository
public interface BuyCarReository extends BaseRepository<BuyCar, String> {

    BuyCar findByUserIdAndGoodsId(Integer userId, String goodId);

}
