package com.lhrsite.shop.repository;


import com.lhrsite.shop.entity.OrderInfo;
import com.lhrsite.shop.entity.OrderInfoPK;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderInfoRepository
        extends JpaRepository<OrderInfo, OrderInfoPK> {



}
