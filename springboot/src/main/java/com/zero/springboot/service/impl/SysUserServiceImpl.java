package com.zero.springboot.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zero.springboot.entity.SysUser;
import com.zero.springboot.mapper.SysUserMapper;
import com.zero.springboot.service.ISysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @Author: scott
 * @Date: 2018-12-20
 */
@Service
@Slf4j
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {
	
	@Resource
	private SysUserMapper userMapper;

	@Override
	public SysUser getUserByName(String username) {
		return userMapper.getUserByName(username);
	}
	

}
