package com.lhrsite.shop.repository;

import com.lhrsite.shop.entity.Order;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends BaseRepository<Order, String> {
}
