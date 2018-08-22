package com.lhrsite.shop.entity;


import lombok.Data;

import javax.persistence.*;

/**
 * (Address)表实体类
 *
 * @author lhr
 * @since 2018-08-22 14:08:28
 */
@Entity
@Data
@Table(name = "`address`")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    //用户id
    private Integer uid;
    //地址
    private String addr;
    //是否默认
    private Integer defaultStatus;

}