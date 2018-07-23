package com.lhrsite.shop.repository;


import com.lhrsite.shop.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository
        extends BaseRepository<User, Integer> {


    User findByPhone(String phone);

}
