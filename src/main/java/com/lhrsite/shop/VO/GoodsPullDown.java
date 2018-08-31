package com.lhrsite.shop.VO;


import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

@Data
public class GoodsPullDown {
    @JSONField(name = "value")
    private String goodsId;
    @JSONField(name = "label")
    private String title;
}
