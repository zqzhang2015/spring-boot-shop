package com.lhrsite.shop.VO;

import com.lhrsite.shop.entity.Goods;
import com.lhrsite.shop.entity.OrderInfo;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class OrderInfoVO {
    private String odId;

    private String orderId;
    private Goods goods;

    private Integer number;

    private BigDecimal transactionPrice;

}
