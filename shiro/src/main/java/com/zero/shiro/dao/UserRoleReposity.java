package com.zero.shiro.dao;

import com.zero.shiro.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 14:20
 */
public interface UserRoleReposity extends JpaRepository<UserRole,Integer> {
    /**
     * 查询用户拥有的角色
     * @param id
     * @return List<UserRole>
     */
    List<UserRole> findByUserId(Integer id);
}
