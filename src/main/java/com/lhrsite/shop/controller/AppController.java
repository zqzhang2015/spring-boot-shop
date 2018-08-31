package com.lhrsite.shop.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.entity.App;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.services.AppService;
import com.lhrsite.shop.util.HttpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/app")
public class AppController {

    private final AppService appService;
    private ResultVO resultVO;
    @Value("${app.upload.home.pictures}")
    private String picturesUploadDir;
    @Autowired
    public AppController(AppService appService) {
        this.appService = appService;
        resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("ok");
    }

    @GetMapping("/picture")
    public String getPicture(){
        resultVO.setData(appService.getPicture());
        return JSON.toJSONString(resultVO);
    }

    @GetMapping("/link")
    public String getLink(){
        resultVO.setData(appService.getLink());
        return JSON.toJSONString(resultVO);
    }
    @PostMapping("/save")
    public String edit(String link, String picture, String token) throws ErpException {
        App app = new App();
        app.setId(1);
        app.setLink(link);
        app.setPicture(picture);
        appService.edit(app, token);
        return JSON.toJSONString(resultVO);
    }

    @RequestMapping(value = "/picturesUpload", method = RequestMethod.POST)
    public String picturesUpload(@RequestParam(value = "file") MultipartFile file)
            throws RuntimeException, ErpException {
        resultVO.setData(JSON.toJSONString(HttpUtil.saveFile(picturesUploadDir, file)));
        return JSON.toJSONString(resultVO);
    }

    @RequestMapping(value = "/pictures/{fileName}", method = RequestMethod.GET)
    public void pictures(@PathVariable(name = "fileName") String fileName, HttpServletResponse response)
            throws RuntimeException, ErpException {
        HttpUtil.writeImage(response, fileName, picturesUploadDir);
    }









}
