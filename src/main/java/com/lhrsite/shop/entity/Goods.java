package com.lhrsite.shop.entity;


import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Data
public class Goods implements Serializable {

    @Id
    private String goodsId;
    private String title;
    @Column(name = "`describe`")
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
    @Column(insertable = false, updatable = false)
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @Column(insertable = false, updatable = false)
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private Integer clId;

}
