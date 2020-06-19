package com.zero.shiro.dao;

import com.zero.shiro.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 14:16
 */
public interface RoleRepository extends JpaRepository<Role,Integer> {
}
