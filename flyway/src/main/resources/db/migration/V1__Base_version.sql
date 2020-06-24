/*
Navicat MySQL Data Transfer

Source Server         : 常记ERP
Source Server Version : 50727
Source Host           : 119.3.222.83:3306
Source Database       : e_project

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-05-31 13:05:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别（0.男 ，1.女）',
  `no` int(11) DEFAULT NULL COMMENT '工号',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号（登录）',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `department_id` int(11) DEFAULT NULL COMMENT '部门id',
  `is_job` varchar(255) DEFAULT NULL COMMENT '人员状态（0.离职，1.在职）',
  `token` varchar(255) DEFAULT NULL COMMENT '登录验证token',
  `is_one` int(11) DEFAULT NULL COMMENT '是否是第一次登陆 0.是   1.否',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员角色关联表 admin_role';

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `name` varchar(30) DEFAULT NULL COMMENT '品牌名称',
  `number` varchar(45) DEFAULT NULL COMMENT '品牌编号',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0  启用  1  禁用',
  `remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='品牌管理';

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '品类名称',
  `number` varchar(45) DEFAULT NULL COMMENT '品类编码',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0 启用  1 禁用',
  `remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='品类';

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `introduce` varchar(255) DEFAULT NULL COMMENT '公司介绍',
  `tel` varchar(255) DEFAULT NULL COMMENT '公司电话',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `company_id` int(11) DEFAULT NULL COMMENT '副组织id',
  `people_num` int(11) DEFAULT NULL COMMENT '部门人数',
  `state` tinyint(255) DEFAULT NULL COMMENT '部门状态',
  `remake` varchar(255) DEFAULT NULL COMMENT '部门表述',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fabric_level
-- ----------------------------
DROP TABLE IF EXISTS `fabric_level`;
CREATE TABLE `fabric_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` int(11) DEFAULT NULL COMMENT '品类ID',
  `material` tinyint(1) DEFAULT NULL COMMENT '外罩材质  0  皮质  1  布艺',
  `level` tinyint(1) DEFAULT NULL COMMENT '面料等级',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态  0 启用  1  禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='面料等级';

-- ----------------------------
-- Table structure for fabric_message
-- ----------------------------
DROP TABLE IF EXISTS `fabric_message`;
CREATE TABLE `fabric_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fabric_id` int(11) DEFAULT NULL COMMENT '面料等级ID',
  `version` varchar(40) DEFAULT NULL COMMENT '版号',
  `fabric_no` varchar(40) DEFAULT NULL COMMENT '新面料号',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `factory_fabric_no` varchar(40) DEFAULT NULL COMMENT '厂家面料号',
  `washing_type` tinyint(1) DEFAULT NULL COMMENT '洗涤方式',
  `name` varchar(20) DEFAULT NULL COMMENT '系列名称',
  `component` varchar(40) DEFAULT NULL COMMENT '成分',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='面料信息';

-- ----------------------------
-- Table structure for parts
-- ----------------------------
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) DEFAULT NULL COMMENT '配件名称',
  `number` varchar(45) DEFAULT NULL COMMENT '配件编码',
  `material` tinyint(1) DEFAULT NULL COMMENT '材质  0  皮质  1  布艺',
  `status` int(11) DEFAULT NULL COMMENT '状态  0  启用  1  禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配件';

-- ----------------------------
-- Table structure for parts_accessory
-- ----------------------------
DROP TABLE IF EXISTS `parts_accessory`;
CREATE TABLE `parts_accessory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品配件      子件配件对象',
  `parts_management_id` int(11) DEFAULT NULL COMMENT '子件管理id',
  `parts_id` int(11) DEFAULT NULL COMMENT '部件id',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for parts_craft
-- ----------------------------
DROP TABLE IF EXISTS `parts_craft`;
CREATE TABLE `parts_craft` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '子件工艺管理  id      子件尺寸管理对象',
  `parts_management_id` int(11) DEFAULT NULL COMMENT '子件管理id',
  `parts_id` int(11) DEFAULT NULL,
  `by_default` tinyint(1) DEFAULT NULL COMMENT '默认是否有 0有 1没有',
  `function_id` tinyint(1) DEFAULT NULL COMMENT '功能id',
  `price` decimal(8,2) DEFAULT NULL COMMENT '单价',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `configurable` tinyint(1) DEFAULT NULL COMMENT '是否可配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for parts_management
-- ----------------------------
DROP TABLE IF EXISTS `parts_management`;
CREATE TABLE `parts_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for parts_management_parts
-- ----------------------------
DROP TABLE IF EXISTS `parts_management_parts`;
CREATE TABLE `parts_management_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_management_id` int(11) DEFAULT NULL,
  `parts_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for parts_number
-- ----------------------------
DROP TABLE IF EXISTS `parts_number`;
CREATE TABLE `parts_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_management_id` int(11) DEFAULT NULL,
  `parts_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for parts_price
-- ----------------------------
DROP TABLE IF EXISTS `parts_price`;
CREATE TABLE `parts_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parts_id` int(11) DEFAULT NULL COMMENT '配件ID',
  `texture` tinyint(1) DEFAULT NULL COMMENT '材质  0 布质  1 皮质',
  `level` tinyint(1) DEFAULT NULL COMMENT '等级',
  `price` decimal(8,2) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='配件价格';

-- ----------------------------
-- Table structure for parts_size
-- ----------------------------
DROP TABLE IF EXISTS `parts_size`;
CREATE TABLE `parts_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_management_id` int(11) DEFAULT NULL COMMENT '子件管理id',
  `parts_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `standard_size` decimal(8,2) DEFAULT NULL COMMENT '标配名称  标配尺寸',
  `abnormity` tinyint(1) DEFAULT NULL COMMENT '是否可以异形',
  `abnormity_start` decimal(8,2) DEFAULT NULL COMMENT '异形区间开始',
  `abnormity_end` decimal(8,2) DEFAULT NULL COMMENT '异形区间结束',
  `variation` decimal(8,2) DEFAULT NULL COMMENT '区间变化',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `pei_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `pei_name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `pei_describe` varchar(10) DEFAULT NULL COMMENT '权限标识',
  `pei_type` int(11) DEFAULT NULL COMMENT '菜单类型 0.目录  1.菜单  2.按钮',
  `pei_sort` int(11) DEFAULT NULL COMMENT '排序',
  `pei_icon` varchar(255) DEFAULT NULL COMMENT '图标icon',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `pei_url` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `is_enable` tinyint(4) DEFAULT NULL COMMENT '是否启用  0.否  1.是',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`pei_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限表 permission';

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) DEFAULT NULL COMMENT '产品名称',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0有效',
  `number` varchar(40) DEFAULT NULL COMMENT '产品数量',
  `category_id` int(11) DEFAULT NULL COMMENT '品类ID',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌ID',
  `material` tinyint(1) DEFAULT NULL COMMENT '材质  0  皮质  1  布艺',
  `product_direction` tinyint(1) DEFAULT NULL COMMENT '产品方向  0 左扶右踏  1  左踏右扶  3 两者都选',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片',
  `remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `update_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品管理';

-- ----------------------------
-- Table structure for product_customer_fabric_level
-- ----------------------------
DROP TABLE IF EXISTS `product_customer_fabric_level`;
CREATE TABLE `product_customer_fabric_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL,
  `parts_number_id` int(11) DEFAULT NULL,
  `parts_management_id` int(11) DEFAULT NULL,
  `parts_id` int(11) DEFAULT NULL,
  `fabric_no_id` int(11) DEFAULT NULL,
  `fabric_no_level` tinyint(1) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_customize_parts_price
-- ----------------------------
DROP TABLE IF EXISTS `product_customize_parts_price`;
CREATE TABLE `product_customize_parts_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品定制部件价格对象    id',
  `product_id` int(11) DEFAULT NULL COMMENT '产品id',
  `parts_id` int(11) DEFAULT NULL COMMENT '部件id',
  `fabric_no_id` int(11) DEFAULT NULL COMMENT '面料号',
  `fabric_no_level` tinyint(1) DEFAULT NULL,
  `parts_accessory_id` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_parts
-- ----------------------------
DROP TABLE IF EXISTS `product_parts`;
CREATE TABLE `product_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) DEFAULT NULL COMMENT '子件名称',
  `number` varchar(45) DEFAULT NULL COMMENT '子件编码',
  `type` tinyint(1) DEFAULT NULL COMMENT '子建类型  0  子件  1  子件附属',
  `direction` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT '品类ID',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态  0  启用  1  禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人员',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='产品子件及配件管理';

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `type` varchar(20) DEFAULT NULL COMMENT '角色类型标识',
  `status` tinyint(4) DEFAULT NULL COMMENT '是否启用  0.否  1.是',
  `create_user` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间戳',
  `update_user` tinyint(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='角色表 role';

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `pei_id` int(11) DEFAULT NULL COMMENT '权限id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色权限表 role_permission';

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(45) DEFAULT NULL COMMENT '供应商编码',
  `name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `abbreviation` varchar(40) DEFAULT NULL COMMENT '供应商简称',
  `region` varchar(45) DEFAULT NULL COMMENT '区域',
  `post_code` varchar(20) DEFAULT NULL COMMENT '邮编',
  `fax` varchar(40) DEFAULT NULL COMMENT '传真',
  `province` varchar(45) DEFAULT NULL COMMENT '省',
  `city` varchar(45) DEFAULT NULL COMMENT '市',
  `area` varchar(45) DEFAULT NULL COMMENT '区',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态  0 启用  1 禁用',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Table structure for supplier_account
-- ----------------------------
DROP TABLE IF EXISTS `supplier_account`;
CREATE TABLE `supplier_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `bank_name` varchar(60) DEFAULT NULL COMMENT '开户银行',
  `bank_no` varchar(100) DEFAULT NULL COMMENT '汇款账户',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='供应商账户';

-- ----------------------------
-- Table structure for supplier_address
-- ----------------------------
DROP TABLE IF EXISTS `supplier_address`;
CREATE TABLE `supplier_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `province` varchar(45) DEFAULT NULL COMMENT '省',
  `city` varchar(45) DEFAULT NULL COMMENT '市',
  `area` varchar(45) DEFAULT NULL COMMENT '区',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='供应商地址管理';

-- ----------------------------
-- Table structure for supplier_contact
-- ----------------------------
DROP TABLE IF EXISTS `supplier_contact`;
CREATE TABLE `supplier_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `name` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系人电话',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='供应商联系人';

-- ----------------------------
-- Table structure for supplier_contract
-- ----------------------------
DROP TABLE IF EXISTS `supplier_contract`;
CREATE TABLE `supplier_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `name` varchar(100) DEFAULT NULL COMMENT '代理合同名称',
  `start_date` date DEFAULT NULL COMMENT '合同有效期起始时间',
  `end_date` date DEFAULT NULL COMMENT '合同有效期结束时间',
  `pic_url` varchar(1000) DEFAULT NULL COMMENT '代理合同图片路径',
  `remark` varchar(500) DEFAULT NULL COMMENT '代理合同备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='供应商代理合同';
