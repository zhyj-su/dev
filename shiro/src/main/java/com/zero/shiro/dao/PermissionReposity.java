package com.zero.shiro.dao;

import com.zero.shiro.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 14:17
 */
public interface PermissionReposity extends JpaRepository<Permission,Integer> {
}
