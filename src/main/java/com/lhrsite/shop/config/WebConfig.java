package com.lhrsite.shop.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;

import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;


/**
 * @ClassName: WebConfig
 * @Description:
 * @author weiyb
 * @date 2018年5月7日 上午11:30:58
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Resource
    private AdminInterceptor adminInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 自定义拦截器，添加拦截路径和排除拦截路径
        registry.addInterceptor(adminInterceptor).addPathPatterns("/**");
    }
}