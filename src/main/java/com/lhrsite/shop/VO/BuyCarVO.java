package com.lhrsite.shop.VO;

import com.lhrsite.shop.entity.Goods;
import lombok.Data;

@Data
public class BuyCarVO {

    private String id;
    private Integer userId;
    private Goods goods;
    private Integer number;
    private java.sql.Timestamp createTime;
}
