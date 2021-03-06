package com.lhrsite.shop.services.impl;

import com.lhrsite.shop.VO.GoodsListVO;
import com.lhrsite.shop.VO.GoodsPullDown;
import com.lhrsite.shop.VO.PageVO;
import com.lhrsite.shop.entity.*;
import com.lhrsite.shop.repository.GoodsRepository;
import com.lhrsite.shop.services.GoodsService;
import com.lhrsite.shop.util.EncryptUtil;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.nio.file.OpenOption;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
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
    public PageVO<GoodsListVO> getGoodsList(String title, Integer cid, long page, long pageSize) {

        QGoods qGoods = QGoods.goods;
        QUser quser = QUser.user;
        QClassify qClassify = QClassify.classify;
        BooleanBuilder builder = new BooleanBuilder();
        if (title != null && !title.equals("")){
            builder.and(qGoods.title.like("%" + title + "%"));
        }
        if (cid != null){
            builder.and(qGoods.clId.eq(cid));
        }
        log.info("【分页】page={}, pageSize={}", page, pageSize);

        JPAQuery<GoodsListVO> jpaQuery = queryFactory
                .select(
                    Projections.bean(
                            GoodsListVO.class,
                            qGoods.goodsId,
                            qGoods.title,
                            qGoods.content,
                            qGoods.describe,
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
                            quser.username,
                            qClassify.clId,
                            qClassify.clName,
                            qClassify.clFid
                    )
                )
                .from(qGoods)
                .innerJoin(quser).on(qGoods.updateUser.eq(quser.uid))
                .innerJoin(qClassify).on(qClassify.clId.eq(qGoods.clId))
                .offset((page - 1) * pageSize)
                .limit(pageSize)
                .where(builder)
                .orderBy(qGoods.salesVolume.asc());


        PageVO<GoodsListVO> pageVO = new PageVO<>();

        pageVO.init(jpaQuery, page);

        return pageVO;
    }


    @Override
    public Goods addGoods(Goods goods) {
        //月销量0
        goods.setSalesVolume(0);
        if (goods.getGoodsId() == null || "".equals(goods.getGoodsId())){
            goods.setGoodsId(EncryptUtil.encryptPassword(UUID.randomUUID().toString()));
        }
        return goodsRepository.save(goods);
    }

    @Override
    public Goods updateGoods(Goods goods) {
        return goodsRepository.save(goods);
    }

    @Override
    public Goods getById(String goodsId) {
        Optional<Goods> goodsOptional = goodsRepository.findById(goodsId);
        return goodsOptional.orElse(null);
    }

    @Override
    public List<GoodsPullDown> pullDown(String title) {
        QGoods qGoods = QGoods.goods;

        return queryFactory.select(
                Projections.bean(
                        GoodsPullDown.class,
                        qGoods.goodsId,
                        qGoods.title
                )
        ).from(qGoods)
                .where(qGoods.title.like("%" + title + "%"))
                .fetch();
    }
}
