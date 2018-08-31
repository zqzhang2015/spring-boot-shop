package com.lhrsite.shop.services.impl;


import com.lhrsite.shop.VO.*;
import com.lhrsite.shop.entity.*;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.repository.GoodsRepository;
import com.lhrsite.shop.repository.OrderDetailsRepository;
import com.lhrsite.shop.repository.OrderRepository;
import com.lhrsite.shop.services.AddressService;
import com.lhrsite.shop.services.BuyCarService;
import com.lhrsite.shop.services.OrderService;
import com.lhrsite.shop.services.UserService;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.math.BigDecimal;
import java.util.*;

@Service
public class OrderServiceImpl extends BaseServiceImpl implements OrderService {

    private JPAQueryFactory queryFactory;

    private final OrderRepository orderRepository;
    private final UserService userService;

    private final OrderDetailsRepository orderDetailsRepository;
    private final BuyCarService buyCarService;
    private final AddressService addressService;

    private final GoodsRepository goodsRepository;
    public OrderServiceImpl(EntityManager entityManager, OrderRepository orderRepository, UserService userService, OrderDetailsRepository orderDetailsRepository, BuyCarService buyCarService, AddressService addressService, GoodsRepository goodsRepository) {
        super(entityManager);
        this.orderRepository = orderRepository;
        this.userService = userService;
        this.orderDetailsRepository = orderDetailsRepository;
        this.buyCarService = buyCarService;
        this.addressService = addressService;
        this.goodsRepository = goodsRepository;
        this.queryFactory = getQueryFactory();

    }

    @Override
    public OrderVO createOrder(String token) throws ErpException {


        // 获取用户购物车
        List<BuyCarVO> buyCarVOS = buyCarService.getBuyCar(token);
        List<String> buyCarIds = new ArrayList<>();

        if (buyCarVOS.size() == 0) {
            // 购物车为空
            throw new ErpException(ErrEumn.BUY_CAR_IS_NULL);
        }
        Order order = new Order();
        order.setOrderId(System.currentTimeMillis() + randomOrderIdEnd());

        List<OrderDetails> orderDetails = new ArrayList<>();
        BigDecimal orderAmount = new BigDecimal(0);
        BigDecimal despatchMoney = new BigDecimal(0);
        // 优惠
        BigDecimal offer = new BigDecimal(0);
        for (int i = 0; i < buyCarVOS.size(); i++) {
            buyCarIds.add(buyCarVOS.get(i).getId());
            orderDetails.add(buyCarVOSToOrderDetails(buyCarVOS.get(i), order.getOrderId(), i));
            // 算单个商品价格（价格*数量）
            Map<String, BigDecimal> result = settleAccountsOneGoods(buyCarVOS, orderAmount, offer, i, despatchMoney);
            orderAmount = result.get("orderAmount");
            despatchMoney = result.get("despatchMoney");
            offer = result.get("offer");
        }

        User user = userService.tokenGetUser(token);
        order.setDespatchMoney(despatchMoney);
        order.setUserId(user.getUid());
        order.setOrderAmount(orderAmount);
        order.setOffer(offer);
        order.setStatus(0);

        // 获取默认收货地址
        Address address = addressService.getDefaultAddress(token);
        if (address == null) {
            throw new ErpException(ErrEumn.NOT_DEFAULT_ADDRESS);
        }
        order.setAddrId(address.getId());

        OrderVO orderVO = new OrderVO();
        Order order1 = orderRepository.save(order);
        System.out.println(order1);
        orderVO.setOrder(order1);
        orderVO.setOrderDetails(orderDetailsRepository.saveAll(orderDetails));
        // 成功下单删除购物车商品
        for (String buyCarId : buyCarIds) {
            buyCarService.deleteBuyCar(buyCarId);
        }
        //下单成功减少库存
        List<Goods> goodses = new ArrayList<>();
        buyCarVOS.forEach(buyCarVO -> {
            Goods goods = buyCarVO.getGoods();
            goods.setStock(goods.getStock() - buyCarVO.getNumber());
            // 销量累加
            goods.setSalesVolume(goods.getSalesVolume() + buyCarVO.getNumber());
            goodses.add(goods);
        });
        goodsRepository.saveAll(goodses);
        return orderVO;
    }

    public Map<String, BigDecimal> settleAccounts(String token) throws ErpException {
        // 获取用户购物车
        List<BuyCarVO> buyCarVOS = buyCarService.getBuyCar(token);
        if (buyCarVOS.size() == 0) {
            // 购物车为空
            throw new ErpException(ErrEumn.BUY_CAR_IS_NULL);
        }

        BigDecimal orderAmount = new BigDecimal(0);
        BigDecimal despatchMoney = new BigDecimal(0);
        // 优惠
        BigDecimal offer = new BigDecimal(0);
        for (int i = 0; i < buyCarVOS.size(); i++) {
            Map<String, BigDecimal> result = settleAccountsOneGoods(buyCarVOS, orderAmount, offer, i, despatchMoney);
            orderAmount = result.get("orderAmount");
            despatchMoney = result.get("despatchMoney");
            offer = result.get("offer");
        }

        Map<String, BigDecimal> zhang = new HashMap<>();
        zhang.put("orderAmount", orderAmount);
        zhang.put("offer", offer);
        zhang.put("despatchMoney", despatchMoney);
        return zhang;

    }

    private Map<String, BigDecimal> settleAccountsOneGoods(List<BuyCarVO> buyCarVOS, BigDecimal orderAmount, BigDecimal offer, int i, BigDecimal despatchMoney) {
        Map<String, BigDecimal> result = new HashMap<>();
        result.put("orderAmount", new BigDecimal(0));
        result.put("offer", new BigDecimal(0));
        result.put("despatchMoney", new BigDecimal(0));

        if (buyCarVOS.get(i).getGoods().getSaleStatus() == 1) {
            BigDecimal goodsSalePrice = buyCarVOS.get(i).getGoods()
                    .getSalePrice();
            BigDecimal number = new BigDecimal(buyCarVOS.get(i).getNumber());
            BigDecimal addUp = goodsSalePrice.multiply(number);
            orderAmount = orderAmount.add(addUp);
            result.put("orderAmount", orderAmount);
            offer = offer.add(
                    (
                            buyCarVOS.get(i).getGoods().getOriginalPrice()
                                    .subtract(
                                            buyCarVOS.get(i).getGoods().getSalePrice()
                                    )
                    ).multiply(number)
            );
            result.put("offer", offer);
        } else {
            BigDecimal goodsOriginalPrice = buyCarVOS.get(i).getGoods()
                    .getOriginalPrice();
            BigDecimal number = new BigDecimal(buyCarVOS.get(i).getNumber());
            BigDecimal addUp = goodsOriginalPrice.multiply(number);
            orderAmount = orderAmount.add(addUp);
            result.put("orderAmount", orderAmount);


        }
        despatchMoney = despatchMoney.add(
                buyCarVOS.get(i).getGoods().getDespatchMoney().multiply(
                        new BigDecimal(buyCarVOS.get(i).getNumber())
                )
        );
        result.put("despatchMoney", despatchMoney);
        return result;


    }

    private String randomOrderIdEnd() {
        StringBuilder orderIdEnd = new StringBuilder();
        Random random = new Random();
        int[] array = random.ints(3, 0, 10).toArray();
        for (int anArray : array) {
            orderIdEnd.append(anArray);
        }
        return orderIdEnd.toString();
    }

    private OrderDetails buyCarVOSToOrderDetails(BuyCarVO buyCarVO, String orderId, int time) {
        OrderDetails orderDetails = new OrderDetails();
        StringBuilder str = new StringBuilder();
        for (int i = 0; i < (4 - String.valueOf(time).length()); i++) {
            str.append("0");
        }
        str.append(time);

        orderDetails.setOdId(orderId + str.toString());
        orderDetails.setGoodsId(buyCarVO.getGoods().getGoodsId());
        orderDetails.setNumber(buyCarVO.getNumber());
        orderDetails.setTransactionPrice(
                buyCarVO.getGoods().getSaleStatus() == 1 ?
                        buyCarVO.getGoods().getSalePrice() :
                        buyCarVO.getGoods().getOriginalPrice());
        orderDetails.setOrderId(orderId);

        return orderDetails;

    }

    @Override
    public Order updateOrder(Order order) {
        return orderRepository.save(order);
    }

    @Override
    public List<OrderListVO> orderListByUser(String token, long page, long pageSize) throws ErpException {
        User user = userService.tokenGetUser(token);
        if (user == null) {
            throw new ErpException(ErrEumn.USER_NO_EXIST);
        }

        BooleanBuilder builder = new BooleanBuilder();
        QOrder qOrder = QOrder.order;

        if (user.getAdmin() != 1) {
            builder.and(qOrder.userId.eq(user.getUid()));
        }

        QUser qUser = QUser.user;

        // 查询订单列表
//        List<Order> orders = queryFactory.selectFrom(qOrder)
//                .where(builder)
//                .orderBy(qOrder.createTime.desc())
//                .offset((page - 1) * pageSize)
//                .limit(pageSize)
//                .fetch();
        QAddress qAddress = QAddress.address;
        List<OrderListVO> orders = queryFactory.select(
                Projections.bean(
                        OrderListVO.class,
                        qOrder.orderId,
                        qOrder.userId,
                        qOrder.orderAmount,
                        qOrder.despatchMoney,
                        qOrder.offer,
                        qOrder.status,
                        qOrder.createTime,
                        qUser.username,
                        qUser.phone,
                        qUser.email,
                        qAddress.addr
                )
        ).from(qOrder)
                .leftJoin(qUser).on(qOrder.userId.eq(qUser.uid))
                .leftJoin(qAddress).on(qUser.uid.eq(qAddress.uid)
                        .and(qAddress.defaultStatus.eq(1)))
                .where(builder)
                .orderBy(qOrder.createTime.desc())
                .offset((page - 1) * pageSize)
                .limit(pageSize)
                .fetch();
        System.out.println(orders);

        List<String> orderListId = new ArrayList<>();
        orders.forEach(orderListVO -> {
            orderListId.add(orderListVO.getOrderId());
            // 设置订单总价 总价 = 快递费+商品费用
            orderListVO.setOrderMoney(new BigDecimal(0)
                    .add(orderListVO.getDespatchMoney()
                            .add(orderListVO.getOrderAmount())));
            orderListVO.setOrderInfoVOS(new ArrayList<>());
        });
//        List<OrderListVO> orderListVOS = new ArrayList<>();
//        orders.forEach(order -> {
//            orderListId.add(order.getOrderId());
//            OrderListVO orderListVO = new OrderListVO();
//            BeanUtils.copyProperties(order, orderListVO);
//            orderListVO.setOrderInfoVOS(new ArrayList<>());
//            orderListVOS.add(orderListVO);
//
//        });


        // 查询订单详情
        QOrderDetails qOrderDetails = QOrderDetails.orderDetails;
        QGoods qGoods = QGoods.goods;
        List<OrderInfoVO> orderInfoVOS = queryFactory.select(Projections.bean(
                OrderInfoVO.class,
                qOrderDetails.odId,
                qOrderDetails.orderId,
                qOrderDetails.number,
                QGoods.goods,
                qOrderDetails.transactionPrice
        ))
                .from(qOrderDetails)
                .join(qGoods)
                .on(qGoods.goodsId.eq(qOrderDetails.goodsId))
                .where(qOrderDetails.orderId.in(orderListId))
                .orderBy(qOrderDetails.odId.desc())
                .fetch();
        orders.forEach(orderListVO -> {
            orderInfoVOS.forEach(orderInfoVO -> {
                if (orderInfoVO.getOrderId().equals(orderListVO.getOrderId())) {

                    orderInfoVO.setGoods(
                            getGoodsList(
                                    orderInfoVO.getGoods()));

                    orderListVO.getOrderInfoVOS().add(orderInfoVO);
                }
            });
        });


        return orders;
    }

    @Override
    public PageVO<OrderListVO> list(String token, long page, long pageSize) throws ErpException {
        User user = userService.tokenGetUser(token);

        QOrder qOrder = QOrder.order;
        JPAQuery<Order> orderJPAQuery = queryFactory.selectFrom(qOrder)
                .where(
                        qOrder.userId.eq(user.getUid())
                )
                .orderBy(qOrder.createTime.desc())
                .offset((page - 1) * pageSize)
                .limit(pageSize);
        // 查询订单列表

        PageVO<OrderListVO> pageVO = new PageVO<>();
        pageVO.init(orderJPAQuery.fetchCount(), page, orderListByUser(token, page, pageSize));
        return pageVO;
    }

    @Override
    public OrderListVO order(String orderId) {


        QOrder qOrder = QOrder.order;

        BooleanBuilder builder = new BooleanBuilder();
        builder.and(qOrder.orderId.eq(orderId));

        QUser qUser = QUser.user;

        QAddress qAddress = QAddress.address;
        List<OrderListVO> orders = queryFactory.select(
                Projections.bean(
                        OrderListVO.class,
                        qOrder.orderId,
                        qOrder.userId,
                        qOrder.orderAmount,
                        qOrder.despatchMoney,
                        qOrder.offer,
                        qOrder.status,
                        qOrder.createTime,
                        qUser.username,
                        qUser.phone,
                        qUser.email,
                        qAddress.addr
                )
        ).from(qOrder)
                .leftJoin(qUser).on(qOrder.userId.eq(qUser.uid))
                .leftJoin(qAddress).on(qUser.uid.eq(qAddress.uid)
                        .and(qAddress.defaultStatus.eq(1)))
                .where(builder)
                .orderBy(qOrder.createTime.desc())
                .fetch();
        System.out.println(orders);

        List<String> orderListId = new ArrayList<>();
        orders.forEach(orderListVO -> {
            orderListId.add(orderListVO.getOrderId());
            // 设置订单总价 总价 = 快递费+商品费用
            orderListVO.setOrderMoney(new BigDecimal(0)
                    .add(orderListVO.getDespatchMoney()
                            .add(orderListVO.getOrderAmount())));
            orderListVO.setOrderInfoVOS(new ArrayList<>());
        });


        // 查询订单详情
        QOrderDetails qOrderDetails = QOrderDetails.orderDetails;
        QGoods qGoods = QGoods.goods;
        List<OrderInfoVO> orderInfoVOS = queryFactory.select(Projections.bean(
                OrderInfoVO.class,
                qOrderDetails.odId,
                qOrderDetails.orderId,
                qOrderDetails.number,
                QGoods.goods,
                qOrderDetails.transactionPrice
        ))
                .from(qOrderDetails)
                .join(qGoods)
                .on(qGoods.goodsId.eq(qOrderDetails.goodsId))
                .where(qOrderDetails.orderId.in(orderListId))
                .orderBy(qOrderDetails.odId.desc())
                .fetch();
        orders.forEach(orderListVO -> {
            orderInfoVOS.forEach(orderInfoVO -> {
                if (orderInfoVO.getOrderId().equals(orderListVO.getOrderId())) {

                    orderInfoVO.setGoods(
                            getGoodsList(
                                    orderInfoVO.getGoods()));

                    orderListVO.getOrderInfoVOS().add(orderInfoVO);
                }
            });
        });


        return orders.get(0);
    }

    private Goods getGoodsList(Goods goods) {
        goods.setCreateTime(null);
        goods.setContent(null);
        goods.setDescribe(null);
        goods.setPictures(null);
        goods.setUpdateTime(null);
        goods.setUpdateUser(null);
        return goods;
    }
}
