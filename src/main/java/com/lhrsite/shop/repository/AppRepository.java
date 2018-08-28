package com.lhrsite.shop.repository;


import com.lhrsite.shop.entity.Address;
import com.lhrsite.shop.entity.App;
import org.springframework.stereotype.Repository;

/**
 * (App)表数据库访问层
 *
 * @author lhr
 * @since 2018-08-22 14:08:32
 */
@Repository
public interface AppRepository extends BaseRepository<App, Integer> {

}