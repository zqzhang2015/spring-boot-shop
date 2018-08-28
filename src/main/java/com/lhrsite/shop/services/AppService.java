package com.lhrsite.shop.services;


import com.lhrsite.shop.entity.App;

/**
 * (App)表服务接口
 *
 * @author lhr
 * @since 2018-08-22 14:08:28
 */
public interface AppService {

    String getPicture();
    String getLink();

    void edit(App app);

}