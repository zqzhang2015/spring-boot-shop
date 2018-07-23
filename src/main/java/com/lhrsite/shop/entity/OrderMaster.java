package com.lhrsite.shop.entity;


import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;

@Entity
@Data
public class OrderMaster {

    @Id
    private String orderId;
    private BigDecimal money;
    private Integer status;
    private BigDecimal despatchMoney;
    private Integer addressId;
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Data createTime;
    private Integer orderUser;

}
