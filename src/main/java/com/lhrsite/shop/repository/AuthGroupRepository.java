package com.lhrsite.shop.repository;


import com.lhrsite.shop.entity.AuthGroup;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AuthGroupRepository
        extends BaseRepository<AuthGroup, Integer> {


    List<AuthGroup> findAllByEnterpriseAndAgStatus(
            Integer enterprise, Integer status);


}
