package com.lhrsite.shop.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class BuyCar {

  @Id
  private String id;
  private Integer userId;
  private String goodsId;
  private Integer number;
  private java.sql.Timestamp createTime;


}
