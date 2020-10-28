package com.zero.springboot.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zero.springboot.entity.SysUser;
/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @Author scott
 * @since 2018-12-20
 */
public interface ISysUserService extends IService<SysUser> {
	
	public SysUser getUserByName(String username);

}
