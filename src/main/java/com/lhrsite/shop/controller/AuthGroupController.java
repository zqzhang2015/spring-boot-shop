package com.lhrsite.shop.controller;

import com.alibaba.fastjson.JSON;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.enums.AuthGroupEnums;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.entity.AuthGroup;
import com.lhrsite.shop.entity.Menu;
import com.lhrsite.shop.entity.User;
import com.lhrsite.shop.services.AuthGroupService;
import com.lhrsite.shop.services.MenuService;
import com.lhrsite.shop.services.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/auth")
@Slf4j
public class AuthGroupController {


    private final AuthGroupService authGroupService;
    private final MenuService menuService;
    private ResultVO resultVO;
    private final UserService userService;

    @Autowired
    public AuthGroupController(AuthGroupService authGroupService, MenuService menuService, UserService userService) {
        this.menuService = menuService;
        this.userService = userService;
        resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("ok");
        this.authGroupService = authGroupService;
    }

    @GetMapping("/getAuthGroupDropDown")
    public String getAuthGroupDropDown(Integer enterprise){
        resultVO.setData(JSON.toJSONString(
                authGroupService.getAuthGroupDropDown(enterprise)));
        return JSON.toJSONString(resultVO);
    }

    @GetMapping("/getMenuList")
    public String getMenuList(Integer enterprise){
        resultVO.setData(JSON.toJSONString(menuService.getMenuTree(enterprise)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/getMenu")
    public String getMenu(Integer mid){
        resultVO.setData(JSON.toJSONString(menuService.getMenuById(mid)));
        return JSON.toJSONString(resultVO);
    }


    @PostMapping("/saveMenu")
    public String saveMenu(Menu menu){
        menu.setCreateTime(null);
        menu.setUpdateTime(null);
        log.info("【保存菜单】menu={}", menu);
        resultVO.setData(JSON.toJSONString(menuService.saveMenu(menu)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/getAuthGroup")
    public String getAuthGroup(
            @RequestParam(defaultValue = "1") long page,
            @RequestParam(defaultValue = "10") long pageSize,
            @RequestParam(required = false) String agName,
            @RequestParam(required = false, defaultValue = "0") Integer agStatus,
            @RequestParam Integer enterpriseId){
        resultVO.setData(JSON.toJSONString(
                authGroupService.selectAuthGroup(page, pageSize, agName, agStatus, enterpriseId)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/editAuthGroup")
    public String editAuthGroup(AuthGroup authGroup)
            throws ErpException {

        if (authGroup == null){
            throw new ErpException(ErrEumn.AUTH_GROUP_NULL);
        }
        if (authGroup.getAgName() == null ||
                "".equals(authGroup.getAgName())){
            throw new ErpException(ErrEumn.AUTH_GROUP_NAME_NULL);
        }
        if (authGroup.getAgStatus() == null){
            authGroup.setAgStatus(AuthGroupEnums.USE.getCode());
        }
        if (authGroup.getEnterprise() == null){
            throw new ErpException(ErrEumn.ENTERPRISE_NULL);
        }
        if (authGroup.getUpdateUser() == null){
            throw new ErpException(ErrEumn.UPDATEUSER_NULL);
        }


        resultVO.setData(JSON.toJSONString(
                authGroupService.editAuthGroup(authGroup)));
        return JSON.toJSONString(resultVO);
    }


    @PostMapping("/getAuthGroups")
    public String getAuthGroups(String token) throws ErpException {

        if (token == null || token.equals("")){
            throw new ErpException(ErrEumn.TOKEN_IS_NULL);
        }

        User user = userService.tokenGetUser(token);
        List<AuthGroup> authGroupList =
                authGroupService.getAuthGroup(user.getEnterprise());
        resultVO.setData(JSON.toJSONString(authGroupList));
        return JSON.toJSONString(resultVO);
    }


    @PostMapping("/getAuthValue")
    public String getAuthValue(Integer groupId){
        Map<String, String> mapData = new HashMap<>();
        mapData.put("openAuth", JSON.toJSONString(
                authGroupService.getOpenAuth(groupId)));
        mapData.put("authValue", JSON.toJSONString(
                authGroupService.getAuthValue(groupId)));
        resultVO.setData(JSON.toJSONString(mapData));
        return JSON.toJSONString(resultVO);
    }


    @PostMapping("/openAuth")
    public String getOpenAuth(Integer groupId){
        resultVO.setData(Arrays.toString(authGroupService.getOpenAuth(groupId)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/saveAuthValue")
    public String saveAuthValue(String authValues, Integer groupId, String token){
        String[] avs;
        if (!(authValues == null || "".equals(authValues))){
            avs = authValues.split("\\|");
            List<Integer> menuIds = Arrays.asList(new Integer[avs.length]);
            int i = 0;
            for (String authValueId : avs){
                if (!authValueId.equals("")){
                    menuIds.set(i, Integer.valueOf(authValueId));
                    i++;
                }
            }
            Map<String, String> mapData = new HashMap<>();

            mapData.put("openAuth", JSON.toJSONString(
                    authGroupService.getOpenAuth(groupId)));
            mapData.put("authValue", JSON.toJSONString(
                    authGroupService.saveAuthValue(menuIds, groupId, token)));

        }else {
            resultVO.setData(JSON.toJSONString(new ArrayList<>()));
        }

        return JSON.toJSONString(resultVO);



    }




}
