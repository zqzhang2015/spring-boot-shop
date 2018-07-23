package com.lhrsite.shop.services;

import com.lhrsite.shop.VO.AuthGroupDropDownVO;
import com.lhrsite.shop.VO.AuthGroupVO;
import com.lhrsite.shop.VO.AuthValueVO;
import com.lhrsite.shop.VO.PageVO;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.entity.AuthGroup;
import com.lhrsite.shop.entity.AuthValue;

import javax.transaction.Transactional;
import java.util.List;

public interface AuthGroupService {

    /**
     * select auth group drop down (group id and group name) for enterprise
     * @param enterprise       enterprise id
     * @return                 auth group drop down
     */
    List<AuthGroupDropDownVO> getAuthGroupDropDown(Integer enterprise);


    /**
     * select auth group
     * @param page          page number
     * @param agName        auth group name
     * @param agStatus      auth group status
     * @param enterprise    enterprise code if enterprise
     *                      is 0 get all enterprise auth group
     * @param pageSize      number of one page
     * @return              page vo obj with auth group
     */
    PageVO<AuthGroupVO> selectAuthGroup(
            long page, long pageSize,
            String agName,
            Integer agStatus,
            Integer enterprise);


    AuthGroup editAuthGroup(AuthGroup authGroup) throws ErpException;




    /**
     * 获取企业的启用权限组
     * @param enterpriseId      权限组id
     * @return                  当前企业的权限组
     */
    List<AuthGroup> getAuthGroup(Integer enterpriseId);


    List<AuthValueVO> getAuthValue(Integer groupId);


    /**
     * 保存权限
     * @param menuId       有权限的菜单id
     * @param groupId      权限组id
     * @param token        用户token
     * @return             saved auth values
     */
    @Transactional
    List<AuthValue> saveAuthValue(List<Integer> menuId, Integer groupId, String token);

    Integer[] getOpenAuth(Integer groupId);
}
