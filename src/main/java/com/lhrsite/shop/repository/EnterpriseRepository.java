package com.lhrsite.shop.repository;


import com.lhrsite.shop.entity.Enterprise;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EnterpriseRepository
        extends BaseRepository<Enterprise, Integer> {

    List<Enterprise> findEnterprisesByEpNameLike(String epName);


}
