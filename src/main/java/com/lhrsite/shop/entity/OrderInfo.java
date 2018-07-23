package com.lhrsite.shop.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Data
@IdClass(OrderInfoPK.class)
public class OrderInfo implements Serializable {

  @Id
  private String orderId;
  @Id
  private String goodsId;
  private BigDecimal originalPrice;
  private BigDecimal salePrice;
  private Integer saleStatus;
  private Integer number;
  private BigDecimal price;


}
