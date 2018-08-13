package com.lhrsite.shop.services.impl;

import com.lhrsite.shop.VO.BuyCarVO;
import com.lhrsite.shop.entity.BuyCar;
import com.lhrsite.shop.entity.QBuyCar;
import com.lhrsite.shop.entity.QGoods;
import com.lhrsite.shop.entity.User;
import com.lhrsite.shop.repository.BuyCarReository;
import com.lhrsite.shop.services.BuyCarService;
import com.lhrsite.shop.services.UserService;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class BuyCarServiceImpl extends BaseServiceImpl implements BuyCarService {


    private final BuyCarReository buyCarReository;
    private JPAQueryFactory queryFactory;
    private final UserService userService;

    @Autowired
    public BuyCarServiceImpl(EntityManager entityManager, BuyCarReository buyCarReository, UserService userService) {
        super(entityManager);
        this.userService = userService;
        this.queryFactory = getQueryFactory();
        this.buyCarReository = buyCarReository;
    }

    @Override
    public BuyCar addBuyCar(BuyCar buyCar) {
        BuyCar buyCar1 = buyCarReository.findByUserIdAndGoodsId(buyCar.getUserId(), buyCar.getGoodsId());
        if (buyCar1 != null){
            buyCar1.setNumber(buyCar1.getNumber() + 1);
        }else {
            buyCar1 = buyCar;
        }

        return buyCarReository.save(buyCar1);
    }

    @Override
    public BuyCar minusBuyCar(BuyCar buyCar, Integer number) {
        BuyCar buyCar1 = buyCarReository.findByUserIdAndGoodsId(buyCar.getUserId(), buyCar.getGoodsId());
        buyCar1.setNumber(buyCar1.getNumber() - number);
        if (buyCar1.getNumber() <= 0){
            deleteBuyCar(buyCar.getId());
        }
        return buyCarReository.save(buyCar1);
    }

    @Override
    public void deleteBuyCar(String buyCarId) {
        buyCarReository.deleteById(buyCarId);
    }

    @Override
    public List<BuyCarVO> getBuyCar(String token) {
        User user = userService.tokenGetUser(token);
        QBuyCar qBuyCar = QBuyCar.buyCar;
        QGoods qGoods = QGoods.goods;


        return queryFactory.select(
                Projections.bean(
                        BuyCarVO.class,
                        qBuyCar.id,
                        qBuyCar.number,
                        qBuyCar.userId,
                        qBuyCar.createTime,
                        QGoods.goods

//                        qGoods.goodsId,
//                        qGoods.title,
//                        qGoods.content,
//                        qGoods.describe,
//                        qGoods.originalPrice,
//                        qGoods.salePrice,
//                        qGoods.saleStatus,
//                        qGoods.cover,
//                        qGoods.status,
//                        qGoods.stock,
//                        qGoods.salesVolume,
//                        qGoods.deliveryPlace,
//                        qGoods.updateUser,
//                        qGoods.updateTime
                )
        ).from(qBuyCar)
        .innerJoin(qGoods).on(qGoods.goodsId.eq(qBuyCar.goodsId))
        .orderBy(qBuyCar.createTime.desc())
        .where(qBuyCar.userId.eq(user.getUid()))
        .fetch();

    }

    @Override
    public BuyCar addBuyCar(String token, String goodsId, Integer number) {
        User user = userService.tokenGetUser(token);
        BuyCar buyCar = new BuyCar();
        buyCar.setUserId(user.getUid());
        buyCar.setGoodsId(goodsId);
        buyCar.setNumber(number);
        buyCar.setId(createBuyCarId());
        return addBuyCar(buyCar);
    }

    private synchronized String createBuyCarId(){
        return String.valueOf(new Date().getTime());
    }
}
