package com.lhrsite.shop.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
@Data
public class AuthCode implements Serializable {
    @Id
    private String phoneNumber;

    private String code;

    @Column(insertable = false, updatable = false)
    private String createTime;

}
