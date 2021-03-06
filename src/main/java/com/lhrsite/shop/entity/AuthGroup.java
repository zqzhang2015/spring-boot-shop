package com.lhrsite.shop.entity;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;


/**
 * 权限组
 */
@Entity
@Data
public class AuthGroup implements Serializable {


    /** 权限组id */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer agid;

    /** 权限组名称 */
    private String agName;

    /** 权限组状态 */
    private Integer agStatus;

    /** 所属企业 */
    private Integer enterprise;

    /** 所属项目 */
    private Integer project;

    /** 创建时间 */
    @Column(insertable = false, updatable = false)
    private java.sql.Timestamp createTime;

    /** 更新人 */
    private Integer updateUser;

    /** 更新时间 */
    @Column(insertable = false, updatable = false)
    private java.sql.Timestamp updateTime;

}
