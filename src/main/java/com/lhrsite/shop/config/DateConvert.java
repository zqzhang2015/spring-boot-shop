package com.lhrsite.shop.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 全局日期处理类
 * Convert<T,S>
 *         泛型T:代表客户端提交的参数 String
 *         泛型S:通过convert转换的类型

 */
@Configuration
@Slf4j
public class DateConvert {
    private static final String DATE_TIME_FORMATE = "yyyy-MM-dd HH:mm:ss";

    @Bean
    public Converter<String, Date> convertDateTime(){
        return new Converter<String, Date>(){
            @Override
            public Date convert(String source) {
                Date date = null;
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_TIME_FORMATE);
                try{
                    simpleDateFormat.parse(source);
                }catch (ParseException e){
                    log.info("parse date failed!" + e);
                }
                return date;
            }
        };
    }
    @Bean
    public Converter<String, java.sql.Date> convertSqlDateTime(){
        return new Converter<String, java.sql.Date>(){
            @Override
            public java.sql.Date convert(String source) {
                java.sql.Date date = null;
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_TIME_FORMATE);
                try{
                    simpleDateFormat.parse(source);
                }catch (ParseException e){
                    log.info("parse date failed!" + e);
                }
                return date;
            }
        };
    }
}
