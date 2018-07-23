package com.lhrsite.shop.repository;


import com.lhrsite.shop.entity.Goods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GoodsRepository
        extends JpaRepository<Goods, Integer> {



}
