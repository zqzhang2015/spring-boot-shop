package com.lhrsite.shop.VO;

import com.alibaba.fastjson.annotation.JSONField;
import com.lhrsite.shop.entity.OrderInfo;
import lombok.Data;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;


@Data
public class OrderListVO {

    private String orderId;
    private Integer userId;
    private BigDecimal orderAmount;
    private BigDecimal despatchMoney;
    // 优惠
    private BigDecimal offer;
    private Integer status;
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    private List<OrderInfoVO> orderInfoVOS;

}
