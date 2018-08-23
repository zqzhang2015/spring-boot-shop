package com.lhrsite.shop.controller;


import com.alibaba.fastjson.JSON;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.services.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * (Address)表控制层
 *
 * @author lhr
 * @since 2018-08-22 14:08:32
 */
@RestController
@RequestMapping("/address")
public class AddressController {

    private final AddressService addressService;

    private ResultVO resultVO;

    @Autowired
    public AddressController(AddressService addressService) {
        this.addressService = addressService;
        resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("ok");
    }



    @PostMapping("/add")
    public String add(String address, String token, Integer defaultStatus) throws ErpException {
        resultVO.setData(JSON.toJSONString(
                addressService.add(token, address, defaultStatus)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/updateDefaultAddr")
    public String updateDefaultAddr(String token, Integer addrId) throws ErpException {
        resultVO.setData(JSON.toJSONString(
                addressService.updateDefaultAddr(token, addrId)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/updateAddr")
    public String updateAddr(Integer addrId, String address) throws ErpException {
        resultVO.setData(JSON.toJSONString(
                addressService.updateAddr(addrId, address)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/delAddr")
    public String delAddr(String token, Integer addrId) throws ErpException {
        addressService.delAddr(token, addrId);
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/getAddress")
    public String getAddress(String token) throws ErpException {
        resultVO.setData(JSON.toJSONString(
                addressService.getAddress(token)));
        return JSON.toJSONString(resultVO);
    }

}