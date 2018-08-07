package com.lhrsite.shop.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;

@Data
@Entity
public class Order {

  @Id
  private String orderId;
  private Integer userId;
  private BigDecimal orderAmount;
  private BigDecimal despatchMoney;
  // 优惠
  private BigDecimal offer;
  private Integer status;
  private java.sql.Timestamp createTime;


}
