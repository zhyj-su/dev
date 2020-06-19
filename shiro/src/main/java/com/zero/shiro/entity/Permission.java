package com.zero.shiro.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 13:57
 */
@Data
@Entity(name="permission")
public class Permission {
    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private String lang1;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(nullable = false)
    private Integer parentId;

    @Column(nullable = false)
    private String type;

    @Column(nullable = false)
    private String value;

    @Column(nullable = false)
    private Integer status;

    @Column(nullable = false)
    private Integer sortCode;

    @Column(nullable = false)
    private Integer menuType;

    @Column(nullable = false)
    private String description;
}
