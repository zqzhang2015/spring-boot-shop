package com.lhrsite.shop.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;

@Entity
@Data
public class OrderDetails {

  @Id
  private String odId;
  private String orderId;
  private String goodsId;
  private Integer number;
  private BigDecimal transactionPrice;



}
