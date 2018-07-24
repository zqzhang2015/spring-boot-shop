package com.lhrsite.shop.services;


import com.lhrsite.shop.VO.MenuListVO;
import com.lhrsite.shop.entity.Menu;

import java.util.List;

public interface MenuService {



    List<MenuListVO> getMenuTree(Integer enterprise);

    List<Menu> getMenusByEnterprise(Integer eid, Integer status);

    List<Menu> getMenusByEnterprise(Integer eid);

    Menu getMenuById(Integer mid);

    Menu saveMenu(Menu menu);



}
