package com.lhrsite.shop.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class OrderInfoPK implements Serializable {

  @Id
  private String orderId;
  @Id
  private String goodsId;
}
