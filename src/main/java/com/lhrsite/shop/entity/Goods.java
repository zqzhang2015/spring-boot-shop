package com.lhrsite.shop.entity;


import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Data
public class Goods {

    @Id
    private String goodsId;
    private String title;
    private String describe;
    private BigDecimal originalPrice;
    private BigDecimal salePrice;
    private Integer saleStatus;
    private String cover;
    private Integer status;
    private Integer stock;
    private Integer salesVolume;
    private String deliveryPlace;
    private BigDecimal despatchMoney;
    private String pictures;
    private String content;
    private Integer updateUser;
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;


}
