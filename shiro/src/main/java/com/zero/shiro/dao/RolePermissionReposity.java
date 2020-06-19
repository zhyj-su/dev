package com.zero.shiro.dao;

import com.zero.shiro.entity.RolePermission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 14:20
 */
public interface RolePermissionReposity extends JpaRepository<RolePermission,Integer> {
    List<RolePermission> findByRoleId(Integer roleId);
}
