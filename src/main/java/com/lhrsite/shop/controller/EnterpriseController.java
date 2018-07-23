package com.lhrsite.shop.controller;

import com.alibaba.fastjson.JSON;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.entity.Enterprise;
import com.lhrsite.shop.services.EntepriseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/enterprise")
@Slf4j
public class EnterpriseController {

    private final EntepriseService entepriseService;
    private ResultVO resultVO;

    @Autowired
    public EnterpriseController(EntepriseService entepriseService) {
        resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("ok");
        this.entepriseService = entepriseService;
    }

    @GetMapping("/getEnterpriseDropDown")
    public String getEnterpriseDropDown(String keyword){
        log.info("【获取企业下拉】keyword={}", keyword);

        resultVO.setData(JSON.toJSONString(entepriseService.getDropDown(keyword)));
        return JSON.toJSONString(resultVO);
    }


    @PostMapping("/selectEnterprise")
    public String selectEnterprise(String epName, Integer epType, Integer epStatus,
                                   @RequestParam(defaultValue = "1") long page,
                                   @RequestParam(defaultValue = "10") long pageSize,
                                   HttpServletRequest request){
        log.info("【查询企业】epName={},epType={},epStatus={}", epName, epType, epStatus);

        resultVO.setData(JSON.toJSONString(
                entepriseService
                        .selectEnterprise(
                                epName, epType, epStatus, page, pageSize)));

        return JSON.toJSONString(resultVO);
    }


    @PostMapping("/addEnterprise")
    public String addEnterprise(Enterprise enterprise) throws ErpException {
        log.info("【添加企业】enterprise={}", enterprise);
        if (enterprise == null){
            throw new ErpException(ErrEumn.ADD_ENTERPRISE_NULL);
        }
        enterprise.setEid(null);
        if (enterprise.getEpShortName() == null ||
                "".equals(enterprise.getEpShortName())){
            throw new ErpException(ErrEumn.ADD_ENTERPRISE_SHORT_NAME_NULL);
        }
        if (enterprise.getEpName() == null || "".equals(enterprise.getEpName())){
            throw new ErpException(ErrEumn.ADD_ENTERPRISE_NAME_NULL);
        }
        if (enterprise.getEpShortName() == null || "".equals(enterprise.getEpStatus())){
            enterprise.setEpStatus(0);
        }

        resultVO.setData(JSON.toJSONString(entepriseService.addEnterprise(enterprise)));
        return JSON.toJSONString(resultVO);

    }

    @PostMapping("/updateEnterprise")
    public String updateEnterprise(Enterprise enterprise) throws ErpException {
        log.info("【修改企业】enterprise={}", enterprise);
        if (enterprise == null
                ||enterprise.getEid() == null
                || "".equals(enterprise.getEid())
                || enterprise.getEid() == 0){
            throw new ErpException(ErrEumn.ADD_ENTERPRISE_NULL);
        }
        resultVO.setData(JSON.toJSONString(entepriseService.updateEnterprise(enterprise)));
        return JSON.toJSONString(resultVO);

    }

}
