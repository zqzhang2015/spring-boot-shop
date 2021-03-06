package com.lhrsite.shop.services.impl;

import com.querydsl.jpa.impl.JPAQueryFactory;

import javax.persistence.EntityManager;

public abstract class BaseServiceImpl {
    //实体管理者
    private final EntityManager entityManager;

    //JPA查询工厂
    private JPAQueryFactory queryFactory;

    public BaseServiceImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
        this.queryFactory = new JPAQueryFactory(entityManager);
    }

    public JPAQueryFactory getQueryFactory() {
        return queryFactory;
    }

}
