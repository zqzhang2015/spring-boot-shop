package com.lhrsite.shop.repository;

import com.lhrsite.shop.entity.AuthValue;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface AuthValueRepository
        extends JpaRepository<AuthValue, Integer> {

    List<AuthValue> findAllByGroupId(Integer groupId);

    @Transactional
    @Modifying
    @Query(value = "update AuthValue set value=0 where group_id=:groupId")
    void updateAllValueByGroupId(@Param("groupId") Integer groupId);

}
