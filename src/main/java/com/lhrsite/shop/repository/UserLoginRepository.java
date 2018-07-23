package com.lhrsite.shop.repository;

import com.lhrsite.shop.entity.UserLogin;
import org.springframework.stereotype.Repository;

@Repository
public interface UserLoginRepository
        extends BaseRepository<UserLogin, String> {


    UserLogin findByUserToken(String userToken);



}
