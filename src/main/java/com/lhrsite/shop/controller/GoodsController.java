package com.lhrsite.shop.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.entity.Goods;
import com.lhrsite.shop.entity.Classify;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.services.ClassifyService;
import com.lhrsite.shop.services.GoodsService;
import com.lhrsite.shop.util.HttpUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/goods")
@Slf4j
public class GoodsController {

    @Value("${app.upload.shop.cover}")
    private String coverUploadDir;
    @Value("${app.upload.shop.pictures}")
    private String picturesUploadDir;
    private final GoodsService goodsService;
    private ResultVO resultVO;

    private final ClassifyService classifyService;
    @Autowired
    public GoodsController(GoodsService goodsService, ClassifyService classifyService) {
        this.goodsService = goodsService;
        this.classifyService = classifyService;
        resultVO = new ResultVO();
        resultVO.setCode(0);
        resultVO.setMsg("ok");
    }

    @PostMapping("/list")
    public String list(@RequestParam(required = false) String title,
                       @RequestParam(required = false) Integer cid,
                       @RequestParam(defaultValue = "1") long page,
                       @RequestParam(defaultValue = "10") long pageSize){
        resultVO.setData(
                JSON.toJSONString(
                        goodsService.getGoodsList(title, cid, page, pageSize)
                )
        );
        return JSON.toJSONString(resultVO);
    }


    @PostMapping("/info")
    public String info(String goodsId){
        resultVO.setData(JSON.toJSONString(goodsService.getById(goodsId)));
        return JSON.toJSONString(resultVO);
    }

    @RequestMapping("/classifyTree")
    public String classifyTree(){
        resultVO.setData(JSON.toJSONString(classifyService.getClassifyTree()));
        return JSON.toJSONString(resultVO);
    }
    @GetMapping("/fClassify")
    public String fClassify(){
        resultVO.setData(JSON.toJSONString(classifyService.getFClassify()));
        return JSON.toJSONString(resultVO);
    }
    @PostMapping("/addClassify")
    public String add(Classify classify) throws ErpException {
        resultVO.setData(JSON.toJSONString(classifyService.add(classify)));
        return JSON.toJSONString(resultVO);
    }

    @PostMapping("/updateClassify")
    public String updateClassify(Classify classify){
        resultVO.setData(JSON.toJSONString(classifyService.update(classify)));
        return JSON.toJSONString(resultVO);
    }
    @PostMapping("/delClassify")
    public String delClassify(Integer clId) throws ErpException {
        classifyService.del(clId);
        return JSON.toJSONString(resultVO);
    }



    @PostMapping("/add")
    public String add(Goods goods){
        System.out.println(goods);
        resultVO.setData(JSON.toJSONString(goodsService.addGoods(goods)));
        return JSON.toJSONString(resultVO);
    }






    @RequestMapping(value = "/coverUpload", method = RequestMethod.POST)
    public String coverUpload(@RequestParam(value = "file") MultipartFile file)
            throws RuntimeException, ErpException {
        if (file.isEmpty()) {
            throw new ErpException(ErrEumn.UPLOAD_ERROR_FILE_NULL);
        }
        resultVO.setData(JSON.toJSONString(HttpUtil.saveFile(coverUploadDir, file)));
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
        writeImage(response, fileName, picturesUploadDir);
    }
    @RequestMapping(value = "/cover/{fileName}", method = RequestMethod.GET)
    public void cover(@PathVariable(name = "fileName") String fileName, HttpServletResponse response)
            throws RuntimeException, ErpException {
        writeImage(response, fileName, coverUploadDir);
    }

    private void writeImage(HttpServletResponse response, String fileName, String filePath){
        System.out.println(filePath + fileName);

        response.setContentType("image/*");
        HttpUtil.up(response, fileName, filePath);
    }



}
