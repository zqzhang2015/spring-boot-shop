package com.lhrsite.shop.services.impl;

import com.lhrsite.shop.VO.GoodsListVO;
import com.lhrsite.shop.VO.PageVO;
import com.lhrsite.shop.entity.Goods;
import com.lhrsite.shop.entity.QGoods;
import com.lhrsite.shop.entity.QUser;
import com.lhrsite.shop.repository.EnterpriseRepository;
import com.lhrsite.shop.repository.GoodsRepository;
import com.lhrsite.shop.services.GoodsService;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;

@Service
public class GoodsServiceImpl extends BaseServiceImpl implements GoodsService {


    private final GoodsRepository goodsRepository;
    private JPAQueryFactory queryFactory;

    @Autowired
    public GoodsServiceImpl(EntityManager entityManager, GoodsRepository goodsRepository) {
        super(entityManager);
        this.goodsRepository = goodsRepository;
        this.queryFactory = getQueryFactory();
    }

    @Override
    public PageVO<GoodsListVO> getGoodsList(String title, long page, long pageSize) {

        QGoods qGoods = QGoods.goods;
        QUser quser = QUser.user;
        BooleanBuilder builder = new BooleanBuilder();
        if (title != null && !title.equals("")){
            builder.and(qGoods.title.like("%" + title + "%"));
        }


        JPAQuery<GoodsListVO> jpaQuery = queryFactory
                .select(
                    Projections.bean(
                            GoodsListVO.class,
                            qGoods.goodsId,
                            qGoods.title,
                            qGoods.originalPrice,
                            qGoods.salePrice,
                            qGoods.saleStatus,
                            qGoods.cover,
                            qGoods.status,
                            qGoods.stock,
                            qGoods.salesVolume,
                            qGoods.deliveryPlace,
                            qGoods.updateUser,
                            qGoods.createTime,
                            qGoods.updateTime,
                            quser.username
                    )
                )
                .from(qGoods)
                .innerJoin(quser).on(qGoods.updateUser.eq(quser.uid))
                .offset((page - 1) * pageSize)
                .limit(pageSize)
                .where(builder)
                .orderBy(qGoods.updateTime.desc());

        PageVO<GoodsListVO> pageVO = new PageVO<>();

        pageVO.init(jpaQuery, pageSize);

        return pageVO;
    }

    @Override
    public Goods addGoods(Goods goods) {
        goods.setGoodsId(null);
        return goodsRepository.save(goods);
    }

    @Override
    public Goods updateGoods(Goods goods) {
        return goodsRepository.save(goods);
    }

    @Override
    public Goods getById(String goodsId) {
        return goodsRepository.findById(goodsId).get();
    }
}
