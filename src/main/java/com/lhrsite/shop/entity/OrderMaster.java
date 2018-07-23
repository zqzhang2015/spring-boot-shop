package com.lhrsite.shop.entity;


import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Data
public class OrderMaster implements Serializable {

    @Id
    private String orderId;
    private BigDecimal money;
    private Integer status;
    private BigDecimal despatchMoney;
    private Integer addressId;
    @Column(insertable = false, updatable = false)
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    private Integer orderUser;

}
