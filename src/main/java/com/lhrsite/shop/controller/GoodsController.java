package com.lhrsite.shop.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.entity.Goods;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.services.GoodsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
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



    @PostMapping("/add")
    public String add(Goods goods){
        System.out.println(goods);
        resultVO.setData(JSON.toJSONString(goodsService.addGoods(goods)));
        return JSON.toJSONString(resultVO);
    }




    private JSONObject saveFile(String path, MultipartFile file) throws ErpException {
        String fileName = file.getOriginalFilename();
        System.out.println("上传的文件名为：" + fileName);
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        fileName = UUID.randomUUID()+ suffixName;
        System.out.println("上传的后缀名为：" + suffixName);
        // 文件上传后的路径
        // 解决中文问题，liunx下中文路径，图片显示问题
        // fileName = UUID.randomUUID() + suffixName;
        File dest = new File(path + fileName);
        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
            System.out.println("上传成功后的文件路径未：" + path + fileName);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("file", fileName);
            return jsonObject;
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        throw new ErpException(ErrEumn.UPLOAD_ERROR);

    }

    private List<JSONObject> saveFile(String path, MultipartFile[] files) throws ErpException {
        List<JSONObject> jsonObjects = new ArrayList<>();
        for (MultipartFile file : files){
            jsonObjects.add(saveFile(path, file));
        }
        return jsonObjects;
    }

    @RequestMapping(value = "/coverUpload", method = RequestMethod.POST)
    public String coverUpload(@RequestParam(value = "file") MultipartFile file)
            throws RuntimeException, ErpException {
        if (file.isEmpty()) {
            throw new ErpException(ErrEumn.UPLOAD_ERROR_FILE_NULL);
        }
        resultVO.setData(JSON.toJSONString(saveFile(coverUploadDir, file)));
        return JSON.toJSONString(resultVO);

    }

    @RequestMapping(value = "/picturesUpload", method = RequestMethod.POST)
    public String picturesUpload(@RequestParam(value = "file") MultipartFile file)
            throws RuntimeException, ErpException {
        resultVO.setData(JSON.toJSONString(saveFile(picturesUploadDir, file)));
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
        try {
            FileInputStream inputStream = new FileInputStream(filePath + fileName);
            int i = inputStream.available();
            byte[] buff = new byte[i];
            inputStream.read(buff);
            //记得关闭输入流
            inputStream.close();

            response.setContentType("image/*");
            OutputStream out = response.getOutputStream();
            out.write(buff);
            //关闭响应输出流
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}
