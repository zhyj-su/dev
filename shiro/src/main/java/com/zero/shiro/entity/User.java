package com.zero.shiro.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 13:21
 */
@Entity(name="user")
@Data
public class User {
    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false, unique = true)
    private String userName;

    @Column(nullable = true, unique = true)
    private String nickName;

    @Column(nullable = false, unique = true)
    private String phone;

    @Column(nullable = false)
    private String passWord;

    @Column(nullable = false, unique = true)
    private String email;



}
