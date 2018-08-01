package com.lhrsite.shop.VO;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class GoodsListVO {

    private String goodsId;
    private String title;
    private BigDecimal originalPrice;

    private BigDecimal salePrice;

    private Integer saleStatus;

    private String cover;
    /** 状态 */
    private Integer status;
    /** 库存 */
    private Integer stock;

    /** 月销量 */
    private Integer salesVolume;

    private String deliveryPlace;


//    /* 发货地 */
//    private BigDecimal despatchMoney;
    private Integer updateUser;

    private String updateUserName;


    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private Integer clId;
    private String clName;

    private Integer clFid;
    private String clFName;


}
