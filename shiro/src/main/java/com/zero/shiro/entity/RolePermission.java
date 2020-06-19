package com.zero.shiro.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 14:01
 */
@Entity(name="role_permission")
@Data
public class RolePermission {
    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private Integer createdUserId;

    @Column(nullable = false)
    private Integer permissionId;

    @Column(nullable = false)
    private Integer roleId;
}
