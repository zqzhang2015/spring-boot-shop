package com.lhrsite.shop.VO;

import com.lhrsite.shop.entity.Goods;
import com.lhrsite.shop.entity.Order;
import com.lhrsite.shop.entity.OrderDetails;
import lombok.Data;

import java.util.List;

@Data
public class OrderDetailsVO {

    private String orderId;
    private Order order;
    private List<OrderDetails> orderDetails;
    private List<Goods> goods;

}
