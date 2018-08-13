package com.lhrsite.shop.VO;

import com.lhrsite.shop.entity.Goods;
import lombok.Data;

import javax.persistence.Column;

@Data
public class BuyCarVO {

    private String id;
    private Integer userId;
    private Goods goods;

    private Integer number;
    @Column(insertable = false, updatable = false)
    private java.sql.Timestamp createTime;
}
