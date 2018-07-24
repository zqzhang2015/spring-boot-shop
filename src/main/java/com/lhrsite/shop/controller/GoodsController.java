package com.lhrsite.shop.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.services.GoodsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@RestController
@RequestMapping("/goods")
@Slf4j
public class GoodsController {

    @Value("${app.upload.shop.cover}")
    private String coverUploadDir;

    private final GoodsService goodsService;
    private ResultVO resultVO;
    @Autowired
    public GoodsController(GoodsService goodsService) {
        this.goodsService = goodsService;
        resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("ok");
    }

    @PostMapping("/list")
    public String list(String title,
                       @RequestParam(defaultValue = "1") long page,
                       @RequestParam(defaultValue = "10") long pageSize){
        resultVO.setData(
                JSON.toJSONString(
                        goodsService.getGoodsList(title, page, pageSize)
                )
        );
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/info")
    public String info(String goodsId){
        resultVO.setData(JSON.toJSONString(goodsService.getById(goodsId)));
        return JSON.toJSONString(resultVO);
    }


    @RequestMapping(value = "/coverUpload", method = RequestMethod.POST)
    public String uploadImage(@RequestParam(value = "file") MultipartFile file) throws RuntimeException, ErpException {
        if (file.isEmpty()) {
            throw new ErpException(ErrEumn.UPLOAD_ERROR_FILE_NULL);
        }
        // 获取文件名
        String fileName = file.getOriginalFilename();
        System.out.println("上传的文件名为：" + fileName);
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        fileName = UUID.randomUUID()+ suffixName;
        System.out.println("上传的后缀名为：" + suffixName);
        // 文件上传后的路径
        System.out.println(coverUploadDir);
        String filePath = coverUploadDir;
        // 解决中文问题，liunx下中文路径，图片显示问题
        // fileName = UUID.randomUUID() + suffixName;
        File dest = new File(filePath + fileName);
        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
            System.out.println("上传成功后的文件路径未：" + filePath + fileName);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("file", fileName);
            resultVO.setData(JSON.toJSONString(jsonObject));
            return JSON.toJSONString(resultVO);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        throw new ErpException(ErrEumn.UPLOAD_ERROR);
    }







}
