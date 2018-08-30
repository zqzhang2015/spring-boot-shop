package com.lhrsite.shop.util;

import com.alibaba.fastjson.JSONObject;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.exception.ErpException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class HttpUtil {

    /**
     * 通过Response输出图片
     *
     * @param response HttpServletResponse 对象
     * @param fileName 文件名称
     * @param filePath 文件路径
     */
    public static void writeImage(HttpServletResponse response, String fileName, String filePath) {
        System.out.println(filePath + fileName);

        response.setContentType("image/*");
        up(response, fileName, filePath);
    }

    public static void up(HttpServletResponse response, String fileName, String filePath) {
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

    /**
     * 单文件上传
     *
     * @param path 上传路径
     * @param file 欲上传的文件
     * @return 文件名称错误代码
     * @throws ErpException 异常
     */
    public static JSONObject saveFile(String path, MultipartFile file) throws ErpException {
        String fileName = file.getOriginalFilename();
        System.out.println("上传的文件名为：" + fileName);
        // 获取文件的后缀名
        String suffixName = null;
        if (fileName != null) {
            suffixName = fileName.substring(fileName.lastIndexOf("."));
        }
        fileName = UUID.randomUUID() + suffixName;
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

    /**
     * 对文件上传
     * @param path 上传路径
     * @param files 欲上传的文件
     * @return 文件名称错误代码
     * @throws ErpException 异常
     */
    public static List<JSONObject> saveFile(String path, MultipartFile[] files) throws ErpException {
        List<JSONObject> jsonObjects = new ArrayList<>();
        for (MultipartFile file : files) {
            jsonObjects.add(saveFile(path, file));
        }
        return jsonObjects;
    }
}
