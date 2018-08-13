package com.lhrsite.shop.services.impl;


import com.lhrsite.shop.VO.BuyCarVO;
import com.lhrsite.shop.VO.OrderVO;
import com.lhrsite.shop.entity.Order;
import com.lhrsite.shop.entity.OrderDetails;
import com.lhrsite.shop.entity.User;
import com.lhrsite.shop.enums.ErrEumn;
import com.lhrsite.shop.exception.ErpException;
import com.lhrsite.shop.repository.OrderDetailsRepository;
import com.lhrsite.shop.repository.OrderRepository;
import com.lhrsite.shop.services.BuyCarService;
import com.lhrsite.shop.services.OrderService;
import com.lhrsite.shop.services.UserService;
import com.querydsl.jpa.impl.JPAQueryFactory;

import javax.persistence.EntityManager;
import java.math.BigDecimal;
import java.util.*;

public class OrderServiceImpl extends BaseServiceImpl implements OrderService {

    private JPAQueryFactory queryFactory;

    private final OrderRepository orderRepository;
    private final UserService userService;

    private final OrderDetailsRepository orderDetailsRepository;
    private final BuyCarService buyCarService;

    public OrderServiceImpl(EntityManager entityManager, OrderRepository orderRepository, UserService userService, OrderDetailsRepository orderDetailsRepository, BuyCarService buyCarService) {
        super(entityManager);
        this.orderRepository = orderRepository;
        this.userService = userService;
        this.orderDetailsRepository = orderDetailsRepository;
        this.buyCarService = buyCarService;
        this.queryFactory = getQueryFactory();

    }

    @Override
    public OrderVO createOrder(String token) throws ErpException {


        // 获取用户购物车
        List<BuyCarVO> buyCarVOS = buyCarService.getBuyCar(token);
        if (buyCarVOS.size() == 0){
            // 购物车为空
            throw new ErpException(ErrEumn.BUY_CAR_IS_NULL);
        }
        Order order = new Order();
        order.setOrderId(System.currentTimeMillis()+randomOrderIdEnd());

        List<OrderDetails> orderDetails = new ArrayList<>();
        BigDecimal orderAmount = new BigDecimal(0);
        BigDecimal despatchMoney = new BigDecimal(0);
        // 优惠
        BigDecimal offer = new BigDecimal(0);
        for (int i = 0; i < buyCarVOS.size(); i++){
            orderDetails.add(buyCarVOSToOrderDetails(buyCarVOS.get(i), order.getOrderId(), i));
            if (buyCarVOS.get(i).getGoods().getSaleStatus() == 1){
                orderAmount.add(buyCarVOS.get(i).getGoods()
                        .getSalePrice()
                        .multiply(new BigDecimal(buyCarVOS.get(i).getNumber())));
                offer.add(
                        (
                                buyCarVOS.get(i).getGoods().getOriginalPrice()
                                .subtract(
                                        buyCarVOS.get(i).getGoods().getSalePrice()
                                )
                        )
                                .multiply(
                                        new BigDecimal(buyCarVOS.get(i).getNumber())
                                )
                );
                despatchMoney.add(
                        buyCarVOS.get(i).getGoods().getDespatchMoney().multiply(
                                new BigDecimal(buyCarVOS.get(i).getNumber())
                        )
                );
            }

        }
        User user = userService.tokenGetUser(token);
        order.setDespatchMoney(despatchMoney);
        order.setUserId(user.getUid());
        order.setOrderAmount(orderAmount);
        order.setOffer(offer);
        order.setStatus(0);

        OrderVO orderVO = new OrderVO();
        orderVO.setOrder(orderRepository.save(order));
        orderVO.setOrderDetails(orderDetailsRepository.saveAll(orderDetails));
        return orderVO;
    }

    public Map<String, BigDecimal> settleAccounts(String token) throws ErpException {
        // 获取用户购物车
        List<BuyCarVO> buyCarVOS = buyCarService.getBuyCar(token);
        if (buyCarVOS.size() == 0){
            // 购物车为空
            throw new ErpException(ErrEumn.BUY_CAR_IS_NULL);
        }

        BigDecimal orderAmount = new BigDecimal(0);
        BigDecimal despatchMoney = new BigDecimal(0);
        // 优惠
        BigDecimal offer = new BigDecimal(0);
        for (BuyCarVO buyCarVO : buyCarVOS) {
            if (buyCarVO.getGoods().getSaleStatus() == 1) {
                orderAmount.add(buyCarVO.getGoods()
                        .getSalePrice()
                        .multiply(new BigDecimal(buyCarVO.getNumber())));
                offer.add(
                        (
                                buyCarVO.getGoods().getOriginalPrice()
                                        .subtract(
                                                buyCarVO.getGoods().getSalePrice()
                                        )
                        )
                                .multiply(
                                        new BigDecimal(buyCarVO.getNumber())
                                )
                );
                despatchMoney.add(
                        buyCarVO.getGoods().getDespatchMoney().multiply(
                                new BigDecimal(buyCarVO.getNumber())
                        )
                );
            }

        }

        Map<String, BigDecimal> zhang = new HashMap<>();
        zhang.put("orderAmount", orderAmount);
        zhang.put("offer", offer);
        zhang.put("despatchMoney", despatchMoney);
        return zhang;

    }

    private String randomOrderIdEnd(){
        String orderIdEnd = "";
        Random random = new Random();
        int[] array = random.ints(6,0, 10).toArray();
        for (int i=0;i<array.length; i++){
            orderIdEnd += array[i];
        }
        return orderIdEnd;
    }
    private OrderDetails buyCarVOSToOrderDetails(BuyCarVO buyCarVO, String orderId, int time){
        OrderDetails orderDetails = new OrderDetails();
        StringBuilder str = new StringBuilder();
        for (int i=0 ; i < (4 - String.valueOf(time).length()); i++){
            str.append("0");
        }
        str.append(time);

        orderDetails.setOdId(orderId + str.toString());
        orderDetails.setGoodsId(buyCarVO.getGoods().getGoodsId());
        orderDetails.setNumber(buyCarVO.getNumber());

        return orderDetails;


    }
    @Override
    public Order updateOrder(Order order) {
        return orderRepository.save(order);
    }
}
