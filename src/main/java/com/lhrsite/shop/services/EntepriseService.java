package com.lhrsite.shop.services;


import com.lhrsite.shop.VO.EnterpriseDropDownVO;
import com.lhrsite.shop.VO.PageVO;
import com.lhrsite.shop.entity.Enterprise;

import java.util.List;

public interface EntepriseService {

    List<EnterpriseDropDownVO> getDropDown(String keyword);

    /**
     * 查询企业
     * @param epName        企业名称
     * @param epType        企业类型
     * @param epStatus      企业状态
     * @param page          页码
     * @param pageSize      每页数量
     * @return              pagevo对象
     */
    PageVO<Enterprise> selectEnterprise(String epName,
                                        Integer epType,
                                        Integer epStatus,
                                        long page,
                                        long pageSize);



    Enterprise addEnterprise(Enterprise enterprise);

    Enterprise updateEnterprise(Enterprise enterprise);
}
