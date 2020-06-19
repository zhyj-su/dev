package com.zero.shiro.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 14:00
 */
@Entity(name="role")
public class Role {
    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private String lang1;

    @Column(nullable = false)
    private String roleName;

    @Column(nullable = false)
    private String status;

    @Column(nullable = false)
    private String description;
}
