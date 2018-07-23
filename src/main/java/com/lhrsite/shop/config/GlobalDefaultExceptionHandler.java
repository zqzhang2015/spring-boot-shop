package com.lhrsite.shop.config;

import com.alibaba.fastjson.JSON;
import com.lhrsite.shop.VO.ResultVO;
import com.lhrsite.shop.exception.ErpException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 全局异常捕获
 */
@ControllerAdvice
public class GlobalDefaultExceptionHandler {
	@ExceptionHandler(value = ErpException.class)
    public void defaultErrorHandler(HttpServletRequest request,
                                    HttpServletResponse response,
                                    ErpException e)
            throws IOException {

        ResultVO resultVO = new ResultVO();
        resultVO.setCode(e.getErrEumn().getCode());
        resultVO.setMsg(e.getErrEumn().getMessage());
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.append(JSON.toJSONString(resultVO));
        out.flush();
        out.close();
  }
}
