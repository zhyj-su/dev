/*
Navicat MySQL Data Transfer

Source Server         : 常记ERP
Source Server Version : 50727
Source Host           : 119.3.222.83:3306
Source Database       : e_project

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-06-24 10:37:23
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
  `no` varchar(40) DEFAULT NULL COMMENT '工号',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号（登录）',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `department_id` int(11) DEFAULT NULL COMMENT '部门id',
  `is_job` tinyint(1) DEFAULT NULL COMMENT '人员状态（0.离职，1.在职）',
  `token` varchar(255) DEFAULT NULL COMMENT '登录验证token',
  `is_one` int(11) DEFAULT NULL COMMENT '是否是第一次登陆 0.是   1.否',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '0', '1', '18361212568', '123456789', null, '2', '0', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjdXJyZW50VGltZSI6MTU5MTk0Njg2ODE2MywiaXNzIjoiYXV0aDAiLCJhY2NvdW50IjoiMTgzNjEyMTI1NjgifQ.YfeGpo1-j6CTzTodIXHChgfvfNBIkFx_InMYCmGmh6M', '1', null, null, null, '2020-06-07 15:51:28');
INSERT INTO `admin` VALUES ('4', 'xx', '0', '2', '123456', '123456', null, '13', '0', null, '0', null, '2020-06-07 15:52:25', null, '2020-06-07 16:36:54');
INSERT INTO `admin` VALUES ('5', '测试新增', '1', '5', '18912345677', '1234567', null, '15', '0', null, '0', null, '2020-06-08 09:22:27', null, '2020-06-08 14:54:11');
INSERT INTO `admin` VALUES ('13', 'test0608', '0', 'GH13', '145335456432', '123456', null, '4', '0', null, '0', null, '2020-06-08 12:48:37', '1', '2020-06-10 19:17:39');
INSERT INTO `admin` VALUES ('14', 'testWithCreateId', '1', 'GH14', '18913456789', '123456', null, '11', '1', null, '0', '1', '2020-06-08 14:57:56', '1', '2020-06-10 19:17:56');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='管理员角色关联表 admin_role';

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('8', '1', '9', '2020-06-07 15:51:28');
INSERT INTO `admin_role` VALUES ('10', '4', '13', '2020-06-07 16:36:54');
INSERT INTO `admin_role` VALUES ('11', '11', '17', '2020-06-08 12:45:10');
INSERT INTO `admin_role` VALUES ('12', '12', '17', '2020-06-08 12:47:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='品牌管理';

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '21', '测试品牌', 'PL20200525164025', '1', 'tester', '2020-05-25 16:40:25', '1', '2020-06-01 10:50:46', '1');
INSERT INTO `brand` VALUES ('2', '1', '测试品牌1', 'PL20200525164438', '0', null, '2020-05-25 16:44:38', '1', '2020-05-31 13:25:45', '1');
INSERT INTO `brand` VALUES ('3', '1', '测试品牌2', 'PL20200525164449', '1', null, '2020-05-25 16:44:50', '1', '2020-05-31 13:27:14', '1');
INSERT INTO `brand` VALUES ('4', '2', '测试品牌3', 'PL20200525164456', '0', null, '2020-05-25 16:44:56', '1', null, '1');
INSERT INTO `brand` VALUES ('5', '1', '测试品牌4', 'PL20200525164501', '1', null, '2020-05-25 16:45:02', '1', null, '1');
INSERT INTO `brand` VALUES ('6', '1', '测试品牌5', 'PL20200525164508', '0', null, '2020-05-25 16:45:08', '1', null, '1');
INSERT INTO `brand` VALUES ('7', '1', '测试品牌6', 'PL20200525164512', '0', null, '2020-05-25 16:45:12', '1', null, '1');
INSERT INTO `brand` VALUES ('8', '1', '测试品牌7', 'PL20200525164518', '1', null, '2020-05-25 16:45:19', '1', null, '1');
INSERT INTO `brand` VALUES ('9', '1', '测试品牌8', 'PL20200525164522', '0', null, '2020-05-25 16:45:22', '1', null, '1');
INSERT INTO `brand` VALUES ('10', '1', '测试品牌9', 'PL20200525164528', '1', null, '2020-05-25 16:45:29', '1', null, '1');
INSERT INTO `brand` VALUES ('11', '1', '测试品牌10', 'PL20200525164534', '0', null, '2020-05-25 16:45:34', '1', null, '1');
INSERT INTO `brand` VALUES ('12', '1', '测试品牌11', 'PL20200525164537', '1', null, '2020-05-25 16:45:38', '1', null, '1');
INSERT INTO `brand` VALUES ('13', '1', '测试品牌12', 'PL20200525164541', '0', null, '2020-05-25 16:45:42', '1', null, '1');
INSERT INTO `brand` VALUES ('14', '1', '测试品牌13', 'PL20200525164546', '0', null, '2020-05-25 16:45:46', '1', null, '1');
INSERT INTO `brand` VALUES ('15', '1', '测试品牌14', 'PL20200525164550', '0', null, '2020-05-25 16:45:50', '1', null, '1');
INSERT INTO `brand` VALUES ('16', '1', '测试品牌15', 'PL20200525164554', '0', null, '2020-05-25 16:45:54', '1', null, '1');
INSERT INTO `brand` VALUES ('17', '1', '测试品牌16', 'PL20200525164558', '1', null, '2020-05-25 16:45:58', '1', null, '1');
INSERT INTO `brand` VALUES ('18', '1', '测试品牌17', 'PL20200525164603', '0', null, '2020-05-25 16:46:03', '1', null, '1');
INSERT INTO `brand` VALUES ('19', '1', '测试品牌18', 'PL20200525164607', '0', null, '2020-05-25 16:46:07', '1', null, '1');
INSERT INTO `brand` VALUES ('20', '1', '测试品牌19', 'PL20200525164615', '0', null, '2020-05-25 16:46:15', '1', null, '1');
INSERT INTO `brand` VALUES ('21', '1', '测试品牌20', 'PL20200525164620', '1', null, '2020-05-25 16:46:20', '1', null, '1');
INSERT INTO `brand` VALUES ('22', '1', '测试品牌21', 'PL20200525164624', '0', null, '2020-05-25 16:46:24', '1', '2020-06-08 16:47:09', '1');
INSERT INTO `brand` VALUES ('23', '1', '测试品牌0101', 'PL20200526184236', '1', null, '2020-05-26 18:42:36', '1', null, '1');
INSERT INTO `brand` VALUES ('24', '1', '品牌a', 'PL20200528104027', '0', null, '2020-05-28 10:40:27', '1', null, '1');
INSERT INTO `brand` VALUES ('25', '2', '品牌B', 'PL20200528111348', '0', null, '2020-05-28 11:13:48', '1', null, '1');
INSERT INTO `brand` VALUES ('26', '21', '里昂', 'PL20200606035048', '0', '沙发定制，2020.06.06-Test', '2020-06-06 11:50:49', '1', null, '1');
INSERT INTO `brand` VALUES ('27', '1', '爱依瑞斯', 'PL20200606054138', '0', '', '2020-06-06 13:41:39', '1', null, '1');
INSERT INTO `brand` VALUES ('28', '5', '爱依瑞斯1', 'PL20200606054339', '0', '', '2020-06-06 13:43:40', '1', '2020-06-08 16:40:44', '1');
INSERT INTO `brand` VALUES ('29', '1', '测试0608', 'PL20200608164103', '0', '', '2020-06-08 16:41:04', null, '2020-06-08 16:41:13', null);
INSERT INTO `brand` VALUES ('30', '1', 'test0622', 'PL20200622092936', '0', '测试', '2020-06-22 09:29:37', null, '2020-06-22 09:29:37', null);
INSERT INTO `brand` VALUES ('31', '1', 'test062203', 'PL20200622093255', '4', '测试', '2020-06-22 09:32:56', null, '2020-06-22 09:59:22', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='品类';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '测试1', 'PL20200526151620', '1', '测试', '2020-05-26 15:16:20', '1', null, null);
INSERT INTO `category` VALUES ('2', '测试2', 'PL20200526151624', '1', '测试', '2020-05-26 15:16:25', '1', '2020-05-31 13:35:09', '1');
INSERT INTO `category` VALUES ('3', '测试3', 'PL20200526151629', '1', '测试', '2020-05-26 15:16:30', '1', '2020-06-02 11:22:32', null);
INSERT INTO `category` VALUES ('4', '测试4', 'PL20200526151634', '1', '测试', '2020-05-26 15:16:35', '1', null, '1');
INSERT INTO `category` VALUES ('5', '测试5', 'PL20200526151642', '0', '测试', '2020-05-26 15:16:43', '1', null, null);
INSERT INTO `category` VALUES ('6', '测试6', 'PL20200526151647', '0', '测试', '2020-05-26 15:16:47', '1', null, null);
INSERT INTO `category` VALUES ('7', '测试7', 'PL20200526151654', '0', '测试', '2020-05-26 15:16:55', '1', null, null);
INSERT INTO `category` VALUES ('8', '测试8', 'PL20200526151659', '0', '测试', '2020-05-26 15:17:00', '1', null, null);
INSERT INTO `category` VALUES ('9', '测试9', 'PL20200526151704', '0', '测试', '2020-05-26 15:17:04', '1', null, null);
INSERT INTO `category` VALUES ('10', '测试10', 'PL20200526151710', '0', '测试', '2020-05-26 15:17:10', '1', null, null);
INSERT INTO `category` VALUES ('11', '测试11', 'PL20200526151715', '0', '测试', '2020-05-26 15:17:16', '1', null, null);
INSERT INTO `category` VALUES ('12', '测试12', 'PL20200526151720', '0', '测试', '2020-05-26 15:17:20', '1', null, null);
INSERT INTO `category` VALUES ('13', '测试13', 'PL20200526151725', '0', '测试', '2020-05-26 15:17:26', '1', null, null);
INSERT INTO `category` VALUES ('14', '测试14', 'PL20200526151729', '0', '测试', '2020-05-26 15:17:30', '1', null, null);
INSERT INTO `category` VALUES ('15', '测试15', 'PL20200526151735', '0', '测试', '2020-05-26 15:17:35', '1', null, null);
INSERT INTO `category` VALUES ('16', '测试16', 'PL20200526151744', '0', '测试', '2020-05-26 15:17:44', '1', null, null);
INSERT INTO `category` VALUES ('17', '测试17', 'PL20200526151748', '0', '测试', '2020-05-26 15:17:49', '1', null, null);
INSERT INTO `category` VALUES ('18', '测试18', 'PL20200526151757', '0', '测试', '2020-05-26 15:17:58', '1', null, null);
INSERT INTO `category` VALUES ('19', '测试19', 'PL20200526151803', '0', '测试', '2020-05-26 15:18:04', '1', null, null);
INSERT INTO `category` VALUES ('20', '测试20', 'PL20200526151809', '0', '测试', '2020-05-26 15:18:10', '1', null, null);
INSERT INTO `category` VALUES ('21', '测试21', 'PL20200526151814', '1', '测试', '2020-05-26 15:18:14', '1', null, null);
INSERT INTO `category` VALUES ('22', '品类', 'PL20200527174344', '1', null, '2020-05-27 17:43:45', null, null, null);
INSERT INTO `category` VALUES ('23', '品类2', 'PL20200527174620', '1', null, '2020-05-27 17:46:20', null, null, null);
INSERT INTO `category` VALUES ('24', '品类3', 'PL20200527174712', '1', null, '2020-05-27 17:47:12', null, null, null);
INSERT INTO `category` VALUES ('25', '品类4', 'PL20200527174737', '1', null, '2020-05-27 17:47:37', null, null, null);
INSERT INTO `category` VALUES ('26', '品类5', 'PL20200527174816', '1', null, '2020-05-27 17:48:16', null, null, null);
INSERT INTO `category` VALUES ('27', '品类6', 'PL20200528105154', '1', null, '2020-05-28 10:51:54', null, null, null);
INSERT INTO `category` VALUES ('28', '6-1-修改', 'PL20200601103251', '0', '测试0601', '2020-06-01 10:32:52', null, '2020-06-01 10:36:21', null);
INSERT INTO `category` VALUES ('29', '床', 'PL20200601104350', '1', '', '2020-06-01 10:43:51', null, '2020-06-06 10:27:35', null);
INSERT INTO `category` VALUES ('30', '沙发', 'PL20200606035130', '0', '0606Test 沙发定制', '2020-06-06 11:51:30', null, null, null);
INSERT INTO `category` VALUES ('31', '茶几', 'PL20200606040453', '0', '0606Test', '2020-06-06 12:04:53', null, '2020-06-10 19:00:50', null);
INSERT INTO `category` VALUES ('32', '测试品类0608', 'PL20200608162715', '0', '测试', '2020-06-08 16:27:16', null, '2020-06-08 16:35:41', null);

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
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '领土只能', null, null, null, null, null);
INSERT INTO `company` VALUES ('2', '盘河是德国', null, null, null, null, null);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '副组织id',
  `people_num` int(11) DEFAULT NULL COMMENT '部门人数',
  `status` tinyint(255) DEFAULT NULL COMMENT '部门状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '部门表述',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `update_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '瓴图智能', '0', '0', '0', '测试', '1', null, '2020-06-02 12:43:18', '2020-06-02 12:43:18');
INSERT INTO `department` VALUES ('2', '开发部1', '1', '4', '0', 'xxxsss', '1', null, '2020-06-08 12:34:22', '2020-06-08 12:34:26');
INSERT INTO `department` VALUES ('3', '财务部1', '1', '0', '1', 'xxxx', null, null, '2020-06-01 12:34:29', '2020-06-09 12:34:55');
INSERT INTO `department` VALUES ('4', '硬件部门', '1', '5', '1', null, null, null, '2020-06-01 12:34:41', '2020-06-09 12:35:01');
INSERT INTO `department` VALUES ('5', '阿里巴巴', '0', '0', '0', null, null, null, '2020-06-01 12:34:45', '2020-06-09 12:35:05');
INSERT INTO `department` VALUES ('6', '腾讯', '0', '1', '0', null, null, null, '2020-06-01 12:34:49', '2020-06-09 12:35:08');
INSERT INTO `department` VALUES ('7', '百度', '0', '0', '0', null, null, null, '2020-06-01 12:34:52', '2020-06-09 12:35:12');
INSERT INTO `department` VALUES ('9', '测试部', '1', '2', '1', '测试部描述', null, null, '2020-06-03 14:06:26', '2020-06-03 14:06:26');
INSERT INTO `department` VALUES ('10', '测试1部', '1', '0', '0', '测试部1描述', null, null, '2020-06-03 14:21:16', '2020-06-03 14:21:16');
INSERT INTO `department` VALUES ('11', '测试3部', '1', '5', '1', '测试3部测试3部测试3部测试3部测试3部', null, null, '2020-06-03 14:33:35', '2020-06-03 14:33:35');
INSERT INTO `department` VALUES ('12', '测试2部', '1', '5', '1', '测试2部测试2部测试2部测试2部2部', null, null, '2020-06-03 14:41:03', '2020-06-03 14:41:03');
INSERT INTO `department` VALUES ('13', '采购部', '1', '1', '1', '', null, null, '2020-06-06 13:17:18', '2020-06-06 13:17:18');
INSERT INTO `department` VALUES ('14', '测试新增部门', '1', '5', '1', '测试新增部门测试新增部门测试新增部门', null, null, '2020-06-07 22:23:14', '2020-06-07 22:23:14');
INSERT INTO `department` VALUES ('15', '测试新增部门2', '1', '4', '1', '测试新增部门2测试新增部门2测试新增部门2', null, null, '2020-06-07 22:46:12', '2020-06-07 22:46:12');
INSERT INTO `department` VALUES ('18', 'test0622', '0', null, '1', 'test0622', null, null, '2020-06-22 11:48:15', '2020-06-22 12:27:07');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) DEFAULT NULL,
  `database_name` varchar(40) DEFAULT NULL,
  `table_name` varchar(40) DEFAULT NULL,
  `field_name` varchar(40) DEFAULT NULL,
  `field_value` varchar(40) DEFAULT NULL,
  `field_detail` varchar(40) DEFAULT NULL,
  `depict` varchar(40) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('8', 'table', null, 'product', 'texture', '0', '皮艺', null, '2020-06-16 17:32:19', '2020-06-16 17:32:19');

-- ----------------------------
-- Table structure for fabric_level_message
-- ----------------------------
DROP TABLE IF EXISTS `fabric_level_message`;
CREATE TABLE `fabric_level_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `texture` tinyint(1) DEFAULT NULL,
  `level` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fabric_level_message
-- ----------------------------
INSERT INTO `fabric_level_message` VALUES ('1', '31', '1', '0', '0', null, '2020-06-07 11:19:10', null, '2020-06-07 12:40:45');
INSERT INTO `fabric_level_message` VALUES ('2', '30', '1', '1', '0', null, '2020-06-07 12:47:28', null, '2020-06-07 12:47:28');
INSERT INTO `fabric_level_message` VALUES ('3', '1', '1', '0', '0', null, '2020-06-07 12:53:04', null, '2020-06-08 15:44:49');
INSERT INTO `fabric_level_message` VALUES ('4', '31', '1', '1', '0', null, '2020-06-08 15:54:44', null, '2020-06-08 15:54:44');
INSERT INTO `fabric_level_message` VALUES ('8', '1', '0', '1', '0', null, '2020-06-11 16:12:32', null, '2020-06-11 16:12:32');

-- ----------------------------
-- Table structure for fabric_level_message_detail
-- ----------------------------
DROP TABLE IF EXISTS `fabric_level_message_detail`;
CREATE TABLE `fabric_level_message_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fabric_level_message_id` int(11) DEFAULT NULL,
  `edition` varchar(60) DEFAULT NULL,
  `new_number` varchar(60) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `factory_number` varchar(60) DEFAULT NULL,
  `washing_type` tinyint(1) DEFAULT NULL,
  `series_name` varchar(20) DEFAULT NULL,
  `ingredient` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fabric_level_message_detail
-- ----------------------------
INSERT INTO `fabric_level_message_detail` VALUES ('14', '1', 'SL0001', 'SL0001', '', 'SL0001', '0', 'SL0001', 'SL0001', 'SL0001');
INSERT INTO `fabric_level_message_detail` VALUES ('15', '1', 'SL0002', 'SL0002', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/1591502384242343aa64c-7d9b-410f-9907-c368eeec8287.png', 'SL0002', '0', 'SL0002', 'SL0002', 'SL0002');
INSERT INTO `fabric_level_message_detail` VALUES ('16', '2', '', 'A110-05', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/15915052374610846d5f5-1451-4faa-984b-e4dc4900612b.png', 'N901-1', '1', '提花系列1', '63%涤37%粘', '');
INSERT INTO `fabric_level_message_detail` VALUES ('18', '3', 'edition0607', 'newnumber0607', 'http://baidu.com', 'number0607', '0', 'seriesName', '成分', 'remark');
INSERT INTO `fabric_level_message_detail` VALUES ('19', '4', 'edition', '1111', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/159160285748825e22f2c-d7e2-423e-bd37-be9df8d1ef84.jpg', '1111', '0', 'ser0608', '111', '111');
INSERT INTO `fabric_level_message_detail` VALUES ('20', '4', 'edition2', '2222', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/1591603227034373bcd59-cad5-48fa-a052-50cb26257179.jpg', '22222', '0', '2222', '222', '222');
INSERT INTO `fabric_level_message_detail` VALUES ('21', '5', '', 'A084-01', '', 'NH254-1', '1', '提花系1', '35%涤(P)65%粘胶(VIS）', '');
INSERT INTO `fabric_level_message_detail` VALUES ('22', '5', '', 'A084-02', '', 'NH254-x3', '1', '提花系列', '35%涤(P)65%粘胶(VIS）', '');
INSERT INTO `fabric_level_message_detail` VALUES ('23', '5', '', 'A084-03', '', 'NH254-x6', '1', '提花系列1', '35%涤(P)65%粘胶(VIS）', '');
INSERT INTO `fabric_level_message_detail` VALUES ('26', '8', 'banhao', '12345', '111', '12341', '0', '111', '111', '111');
INSERT INTO `fabric_level_message_detail` VALUES ('27', '8', 'banhao', '123451', '111', '1234', '0', '111', '111', '111');

-- ----------------------------
-- Table structure for parts_accessory
-- ----------------------------
DROP TABLE IF EXISTS `parts_accessory`;
CREATE TABLE `parts_accessory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品配件      子件配件对象',
  `parts_management_id` int(11) DEFAULT NULL COMMENT '子件管理id',
  `parts_id` int(11) DEFAULT NULL COMMENT '部件id',
  `component_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `texture` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parts_accessory
-- ----------------------------
INSERT INTO `parts_accessory` VALUES ('1', '1', '1', '1', '12', null);
INSERT INTO `parts_accessory` VALUES ('2', '1', '2', '1', '12', null);
INSERT INTO `parts_accessory` VALUES ('3', '1', '2', '1', '15', null);
INSERT INTO `parts_accessory` VALUES ('4', '3', '38', '38', '11', null);
INSERT INTO `parts_accessory` VALUES ('5', '3', '37', '37', '11', null);
INSERT INTO `parts_accessory` VALUES ('11', '9', '38', '38', '11', null);
INSERT INTO `parts_accessory` VALUES ('12', '9', '35', '35', '11', null);
INSERT INTO `parts_accessory` VALUES ('13', '11', '38', '38', '11', null);
INSERT INTO `parts_accessory` VALUES ('14', '12', '38', '38', '11', null);
INSERT INTO `parts_accessory` VALUES ('15', '13', '38', '38', '11', null);
INSERT INTO `parts_accessory` VALUES ('16', '15', '1', '1', '12', null);
INSERT INTO `parts_accessory` VALUES ('17', '15', '2', '1', '12', null);
INSERT INTO `parts_accessory` VALUES ('18', '15', '2', '1', '15', null);
INSERT INTO `parts_accessory` VALUES ('29', '31', '33', '38', '11', null);
INSERT INTO `parts_accessory` VALUES ('30', '31', '33', '37', '11', null);
INSERT INTO `parts_accessory` VALUES ('31', '32', '33', '38', '11', null);
INSERT INTO `parts_accessory` VALUES ('32', '34', '29', '38', '1', null);
INSERT INTO `parts_accessory` VALUES ('36', '41', '1', '1', '12', null);
INSERT INTO `parts_accessory` VALUES ('37', '41', '2', '1', '12', null);
INSERT INTO `parts_accessory` VALUES ('38', '41', '2', '1', '15', null);
INSERT INTO `parts_accessory` VALUES ('39', '45', '3', '1', '12', null);
INSERT INTO `parts_accessory` VALUES ('40', '45', '17', '1', '12', null);
INSERT INTO `parts_accessory` VALUES ('41', '45', '17', '1', '15', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parts_craft
-- ----------------------------
INSERT INTO `parts_craft` VALUES ('1', '1', '1', '0', '1', '12.88', '12', '1');
INSERT INTO `parts_craft` VALUES ('2', '1', '2', '0', '1', '12.88', '12', '1');
INSERT INTO `parts_craft` VALUES ('3', '1', '2', '0', '1', '143.00', '24', '1');
INSERT INTO `parts_craft` VALUES ('4', '2', '32', '1', '2', '11.00', '11', '1');
INSERT INTO `parts_craft` VALUES ('5', '2', '29', '1', '1', '11.00', '11', '1');
INSERT INTO `parts_craft` VALUES ('6', '3', '33', '1', '6', '11.00', '11', '1');
INSERT INTO `parts_craft` VALUES ('7', '3', '32', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('13', '9', '1', '0', '1', '11.00', '11', '0');
INSERT INTO `parts_craft` VALUES ('16', '11', '33', '0', '4', '11.00', '11', '0');
INSERT INTO `parts_craft` VALUES ('17', '11', '32', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('18', '12', '33', '0', '4', '11.00', '11', '0');
INSERT INTO `parts_craft` VALUES ('19', '12', '32', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('20', '13', '33', '0', '1', '11.00', '11', '0');
INSERT INTO `parts_craft` VALUES ('21', '13', '32', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('22', '14', '33', '1', '1', '111.00', '11', '0');
INSERT INTO `parts_craft` VALUES ('23', '15', '1', '0', '1', '12.88', '12', '1');
INSERT INTO `parts_craft` VALUES ('24', '15', '2', '0', '1', '12.88', '12', '1');
INSERT INTO `parts_craft` VALUES ('25', '15', '2', '0', '1', '143.00', '24', '1');
INSERT INTO `parts_craft` VALUES ('46', '26', '2', '0', '9', '20.00', '2', '1');
INSERT INTO `parts_craft` VALUES ('47', '26', '24', '1', '8', '68.88', '1', '1');
INSERT INTO `parts_craft` VALUES ('48', '26', '24', '0', '8', '68.88', '1', '0');
INSERT INTO `parts_craft` VALUES ('49', '27', '33', '1', '8', '50.00', '1', '1');
INSERT INTO `parts_craft` VALUES ('50', '27', '33', '0', '8', '30.00', '1', '1');
INSERT INTO `parts_craft` VALUES ('51', '27', '32', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('57', '31', '33', '0', '4', '11.00', '11', '0');
INSERT INTO `parts_craft` VALUES ('58', '31', '32', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('59', '32', '33', '0', '1', '11.00', '11', '0');
INSERT INTO `parts_craft` VALUES ('60', '32', '32', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('62', '34', '29', '1', '8', '50.00', '2', '1');
INSERT INTO `parts_craft` VALUES ('67', '38', '4', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('68', '38', '1', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('69', '38', '23', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('72', '40', '32', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('73', '40', '29', '1', '2', '50.00', '1', null);
INSERT INTO `parts_craft` VALUES ('74', '41', '1', '0', '1', '12.88', '12', '1');
INSERT INTO `parts_craft` VALUES ('75', '41', '2', '0', '1', '12.88', '12', '1');
INSERT INTO `parts_craft` VALUES ('76', '41', '2', '0', '1', '143.00', '24', '1');
INSERT INTO `parts_craft` VALUES ('77', '43', '320', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('78', '43', '291', '1', '1', '100.00', '1', '1');
INSERT INTO `parts_craft` VALUES ('79', '44', '320', null, null, null, null, null);
INSERT INTO `parts_craft` VALUES ('80', '44', '291', '1', '1', '100.00', '1', '1');
INSERT INTO `parts_craft` VALUES ('81', '45', '17', '0', '1', '12.88', '12', '1');
INSERT INTO `parts_craft` VALUES ('82', '45', '17', '0', '1', '143.00', '24', '1');

-- ----------------------------
-- Table structure for parts_function
-- ----------------------------
DROP TABLE IF EXISTS `parts_function`;
CREATE TABLE `parts_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_user` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parts_function
-- ----------------------------
INSERT INTO `parts_function` VALUES ('1', '1', '电动', '2020-06-01 09:55:31');
INSERT INTO `parts_function` VALUES ('2', '1', '音箱', '2020-06-01 09:56:20');
INSERT INTO `parts_function` VALUES ('3', '1', '空气净化器', '2020-06-01 09:56:32');
INSERT INTO `parts_function` VALUES ('4', '1', '牛奶靠包', '2020-06-01 09:56:46');
INSERT INTO `parts_function` VALUES ('5', '1', '电灯', '2020-06-01 09:57:19');
INSERT INTO `parts_function` VALUES ('6', '1', '托', '2020-06-01 09:58:18');
INSERT INTO `parts_function` VALUES ('7', null, '手动', '2020-06-02 11:36:13');
INSERT INTO `parts_function` VALUES ('8', null, '垫子', '2020-06-02 11:37:37');
INSERT INTO `parts_function` VALUES ('9', null, '测试1', '2020-06-02 11:39:53');
INSERT INTO `parts_function` VALUES ('10', null, '测试', '2020-06-02 15:02:36');
INSERT INTO `parts_function` VALUES ('11', null, '222', '2020-06-11 11:19:33');
INSERT INTO `parts_function` VALUES ('12', null, '888', '2020-06-11 11:20:47');
INSERT INTO `parts_function` VALUES ('13', null, '带手机', '2020-06-11 11:21:18');
INSERT INTO `parts_function` VALUES ('14', null, '加热', '2020-06-12 09:28:41');
INSERT INTO `parts_function` VALUES ('15', null, '充电宝1', '2020-06-22 14:45:44');

-- ----------------------------
-- Table structure for parts_management
-- ----------------------------
DROP TABLE IF EXISTS `parts_management`;
CREATE TABLE `parts_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parts_management
-- ----------------------------
INSERT INTO `parts_management` VALUES ('1', '1');
INSERT INTO `parts_management` VALUES ('2', '2');
INSERT INTO `parts_management` VALUES ('3', '3');
INSERT INTO `parts_management` VALUES ('9', '7');
INSERT INTO `parts_management` VALUES ('11', '8');
INSERT INTO `parts_management` VALUES ('12', '9');
INSERT INTO `parts_management` VALUES ('13', '10');
INSERT INTO `parts_management` VALUES ('14', '11');
INSERT INTO `parts_management` VALUES ('15', '12');
INSERT INTO `parts_management` VALUES ('26', '23');
INSERT INTO `parts_management` VALUES ('27', '24');
INSERT INTO `parts_management` VALUES ('31', '28');
INSERT INTO `parts_management` VALUES ('32', '29');
INSERT INTO `parts_management` VALUES ('34', '25');
INSERT INTO `parts_management` VALUES ('38', '30');
INSERT INTO `parts_management` VALUES ('40', '31');
INSERT INTO `parts_management` VALUES ('41', '32');
INSERT INTO `parts_management` VALUES ('43', '34');
INSERT INTO `parts_management` VALUES ('44', '35');
INSERT INTO `parts_management` VALUES ('45', '36');

-- ----------------------------
-- Table structure for parts_management_parts
-- ----------------------------
DROP TABLE IF EXISTS `parts_management_parts`;
CREATE TABLE `parts_management_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_management_id` int(11) DEFAULT NULL,
  `parts_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parts_management_parts
-- ----------------------------
INSERT INTO `parts_management_parts` VALUES ('1', '1', '1');
INSERT INTO `parts_management_parts` VALUES ('2', '1', '2');
INSERT INTO `parts_management_parts` VALUES ('3', '2', '32');
INSERT INTO `parts_management_parts` VALUES ('4', '2', '29');
INSERT INTO `parts_management_parts` VALUES ('5', '3', '33');
INSERT INTO `parts_management_parts` VALUES ('6', '3', '32');
INSERT INTO `parts_management_parts` VALUES ('15', '9', '1');
INSERT INTO `parts_management_parts` VALUES ('18', '11', '33');
INSERT INTO `parts_management_parts` VALUES ('19', '11', '32');
INSERT INTO `parts_management_parts` VALUES ('20', '12', '33');
INSERT INTO `parts_management_parts` VALUES ('21', '12', '32');
INSERT INTO `parts_management_parts` VALUES ('22', '13', '33');
INSERT INTO `parts_management_parts` VALUES ('23', '13', '32');
INSERT INTO `parts_management_parts` VALUES ('24', '14', '33');
INSERT INTO `parts_management_parts` VALUES ('25', '15', '1');
INSERT INTO `parts_management_parts` VALUES ('26', '15', '2');
INSERT INTO `parts_management_parts` VALUES ('47', '26', '2');
INSERT INTO `parts_management_parts` VALUES ('48', '26', '24');
INSERT INTO `parts_management_parts` VALUES ('49', '27', '33');
INSERT INTO `parts_management_parts` VALUES ('50', '27', '32');
INSERT INTO `parts_management_parts` VALUES ('56', '31', '33');
INSERT INTO `parts_management_parts` VALUES ('57', '31', '32');
INSERT INTO `parts_management_parts` VALUES ('58', '32', '33');
INSERT INTO `parts_management_parts` VALUES ('59', '32', '32');
INSERT INTO `parts_management_parts` VALUES ('61', '34', '29');
INSERT INTO `parts_management_parts` VALUES ('66', '38', '4');
INSERT INTO `parts_management_parts` VALUES ('67', '38', '1');
INSERT INTO `parts_management_parts` VALUES ('68', '38', '23');
INSERT INTO `parts_management_parts` VALUES ('71', '40', '32');
INSERT INTO `parts_management_parts` VALUES ('72', '40', '29');
INSERT INTO `parts_management_parts` VALUES ('73', '41', '1');
INSERT INTO `parts_management_parts` VALUES ('74', '41', '2');
INSERT INTO `parts_management_parts` VALUES ('76', '43', '320');
INSERT INTO `parts_management_parts` VALUES ('77', '43', '291');
INSERT INTO `parts_management_parts` VALUES ('78', '44', '320');
INSERT INTO `parts_management_parts` VALUES ('79', '44', '291');
INSERT INTO `parts_management_parts` VALUES ('80', '45', '3');
INSERT INTO `parts_management_parts` VALUES ('81', '45', '16');
INSERT INTO `parts_management_parts` VALUES ('82', '45', '17');

-- ----------------------------
-- Table structure for parts_number
-- ----------------------------
DROP TABLE IF EXISTS `parts_number`;
CREATE TABLE `parts_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_management_id` int(11) DEFAULT NULL,
  `parts_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parts_number
-- ----------------------------
INSERT INTO `parts_number` VALUES ('1', '1', '1');
INSERT INTO `parts_number` VALUES ('2', '1', '2');
INSERT INTO `parts_number` VALUES ('3', '2', '32');
INSERT INTO `parts_number` VALUES ('4', '2', '29');
INSERT INTO `parts_number` VALUES ('5', '3', '33');
INSERT INTO `parts_number` VALUES ('6', '3', '32');
INSERT INTO `parts_number` VALUES ('12', '9', '1');
INSERT INTO `parts_number` VALUES ('15', '11', '33');
INSERT INTO `parts_number` VALUES ('16', '11', '32');
INSERT INTO `parts_number` VALUES ('17', '12', '33');
INSERT INTO `parts_number` VALUES ('18', '12', '32');
INSERT INTO `parts_number` VALUES ('19', '13', '33');
INSERT INTO `parts_number` VALUES ('20', '13', '32');
INSERT INTO `parts_number` VALUES ('21', '14', '33');
INSERT INTO `parts_number` VALUES ('22', '15', '1');
INSERT INTO `parts_number` VALUES ('23', '15', '2');
INSERT INTO `parts_number` VALUES ('44', '26', '2');
INSERT INTO `parts_number` VALUES ('45', '26', '24');
INSERT INTO `parts_number` VALUES ('46', '27', '33');
INSERT INTO `parts_number` VALUES ('47', '27', '32');
INSERT INTO `parts_number` VALUES ('53', '31', '33');
INSERT INTO `parts_number` VALUES ('54', '31', '32');
INSERT INTO `parts_number` VALUES ('55', '32', '33');
INSERT INTO `parts_number` VALUES ('56', '32', '32');
INSERT INTO `parts_number` VALUES ('58', '34', '29');
INSERT INTO `parts_number` VALUES ('63', '38', '4');
INSERT INTO `parts_number` VALUES ('64', '38', '1');
INSERT INTO `parts_number` VALUES ('65', '38', '23');
INSERT INTO `parts_number` VALUES ('68', '40', '32');
INSERT INTO `parts_number` VALUES ('69', '40', '29');
INSERT INTO `parts_number` VALUES ('70', '41', '1');
INSERT INTO `parts_number` VALUES ('71', '41', '2');
INSERT INTO `parts_number` VALUES ('72', '43', '320');
INSERT INTO `parts_number` VALUES ('73', '43', '291');
INSERT INTO `parts_number` VALUES ('74', '44', '320');
INSERT INTO `parts_number` VALUES ('75', '44', '291');
INSERT INTO `parts_number` VALUES ('76', '45', '3');
INSERT INTO `parts_number` VALUES ('77', '45', '16');
INSERT INTO `parts_number` VALUES ('78', '45', '17');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='配件价格';

-- ----------------------------
-- Records of parts_price
-- ----------------------------
INSERT INTO `parts_price` VALUES ('3', '1', '1', '0', '168.32');
INSERT INTO `parts_price` VALUES ('4', '1', '1', '1', '168.33');

-- ----------------------------
-- Table structure for parts_size
-- ----------------------------
DROP TABLE IF EXISTS `parts_size`;
CREATE TABLE `parts_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_management_id` int(11) DEFAULT NULL COMMENT '子件管理id',
  `parts_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `standard_size` varchar(20) DEFAULT NULL COMMENT '标配名称  标配尺寸',
  `abnormity` tinyint(1) DEFAULT NULL COMMENT '是否可以异形',
  `abnormity_start` decimal(8,2) DEFAULT NULL COMMENT '异形区间开始',
  `abnormity_end` decimal(8,2) DEFAULT NULL COMMENT '异形区间结束',
  `variation` decimal(8,2) DEFAULT NULL COMMENT '区间变化',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parts_size
-- ----------------------------
INSERT INTO `parts_size` VALUES ('1', '1', '1', '长', '10.00', '100', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('2', '1', '1', '宽', '10.00', '100', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('3', '1', '1', '高', '10.00', '100', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('4', '1', '2', '长', '10.00', '90', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('5', '1', '2', '宽', '10.00', '80', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('6', '1', '2', '高', '10.00', '70', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('7', '2', '32', '长', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('8', '2', '32', '宽', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('9', '2', '32', '高', '11.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('10', '2', '29', '长', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('11', '2', '29', '宽', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('12', '2', '29', '高', '1.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('13', '3', '33', '长', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('14', '3', '33', '宽', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('15', '3', '33', '高', '11.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('16', '3', '32', '长', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('17', '3', '32', '宽', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('18', '3', '32', '高', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('34', '9', '1', '长', '111.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('35', '9', '1', '宽', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('36', '9', '1', '高', '11.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('43', '11', '33', '长', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('44', '11', '33', '宽', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('45', '11', '33', '高', '11.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('46', '11', '32', '长', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('47', '11', '32', '宽', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('48', '11', '32', '高', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('49', '12', '33', '长', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('50', '12', '33', '宽', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('51', '12', '33', '高', '11.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('52', '12', '32', '长', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('53', '12', '32', '宽', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('54', '12', '32', '高', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('55', '13', '33', '长', '1.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('56', '13', '33', '宽', '111.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('57', '13', '33', '高', '11.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('58', '13', '32', '长', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('59', '13', '32', '宽', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('60', '13', '32', '高', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('61', '14', '33', '长', '111.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('62', '14', '33', '宽', '111.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('63', '14', '33', '高', '111.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('64', '15', '1', '长', '0.00', '100', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('65', '15', '1', '宽', '0.00', '100', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('66', '15', '1', '高', '0.00', '100', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('67', '15', '2', '长', '0.00', '90', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('68', '15', '2', '宽', '0.00', '80', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('69', '15', '2', '高', '0.00', '70', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('130', '26', '2', '长', '58.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('131', '26', '2', '宽', '58.00', '10', '58.00', '68.00', '1.00');
INSERT INTO `parts_size` VALUES ('132', '26', '2', '高', '8.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('133', '26', '24', '长', '60.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('134', '26', '24', '宽', '60.00', '10', '60.00', '70.00', '1.00');
INSERT INTO `parts_size` VALUES ('135', '26', '24', '高', '15.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('136', '27', '33', '长', '60.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('137', '27', '33', '宽', '60.00', '10', '60.00', '70.00', '1.00');
INSERT INTO `parts_size` VALUES ('138', '27', '33', '高', '15.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('139', '27', '32', '长', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('140', '27', '32', '宽', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('141', '27', '32', '高', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('157', '31', '33', '长', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('158', '31', '33', '宽', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('159', '31', '33', '高', '11.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('160', '31', '32', '长', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('161', '31', '32', '宽', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('162', '31', '32', '高', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('163', '32', '33', '长', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('164', '32', '33', '宽', '11.00', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('165', '32', '33', '高', '11.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('166', '32', '32', '长', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('167', '32', '32', '宽', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('168', '32', '32', '高', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('172', '34', '29', '长', '60.00', '10', '60.00', '70.00', '1.00');
INSERT INTO `parts_size` VALUES ('173', '34', '29', '宽', '60.00', '10', '60.00', '70.00', '1.00');
INSERT INTO `parts_size` VALUES ('174', '34', '29', '高', '10.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('187', '38', '4', '长', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('188', '38', '4', '宽', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('189', '38', '4', '高', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('190', '38', '1', '长', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('191', '38', '1', '宽', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('192', '38', '1', '高', null, null, null, null, null);
INSERT INTO `parts_size` VALUES ('193', '38', '23', '长', '10.00', '1', '10.00', '11.00', null);
INSERT INTO `parts_size` VALUES ('194', '38', '23', '宽', '10.00', '1', '10.00', '11.00', null);
INSERT INTO `parts_size` VALUES ('195', '38', '23', '高', '10.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('202', '40', '32', '长', '1000.00', '10', '10.00', '100.00', '1.00');
INSERT INTO `parts_size` VALUES ('203', '40', '32', '宽', '800.00', '10', '10.00', '100.00', '1.00');
INSERT INTO `parts_size` VALUES ('204', '40', '32', '高', '500.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('205', '40', '29', '长', '100.00', '5', '10.00', '100.00', '1.00');
INSERT INTO `parts_size` VALUES ('206', '40', '29', '宽', '50.00', '5', '10.00', '100.00', '1.00');
INSERT INTO `parts_size` VALUES ('207', '40', '29', '高', '10.00', null, null, null, null);
INSERT INTO `parts_size` VALUES ('208', '41', '1', '长', '0', '100', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('209', '41', '1', '宽', '0', '100', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('210', '41', '1', '高', '0', '100', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('211', '41', '2', '长', '100', '90', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('212', '41', '2', '宽', '100', '80', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('213', '41', '2', '高', '82/105', '70', '100.00', '150.00', '1.00');
INSERT INTO `parts_size` VALUES ('214', '43', '320', '长', '', null, null, null, null);
INSERT INTO `parts_size` VALUES ('215', '43', '320', '宽', '', null, null, null, null);
INSERT INTO `parts_size` VALUES ('216', '43', '320', '高', '', null, null, null, null);
INSERT INTO `parts_size` VALUES ('217', '43', '291', '长', '100', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('218', '43', '291', '宽', '200', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('219', '43', '291', '高', '50', null, null, null, null);
INSERT INTO `parts_size` VALUES ('220', '44', '320', '长', '', null, null, null, null);
INSERT INTO `parts_size` VALUES ('221', '44', '320', '宽', '', null, null, null, null);
INSERT INTO `parts_size` VALUES ('222', '44', '320', '高', '', null, null, null, null);
INSERT INTO `parts_size` VALUES ('223', '44', '291', '长', '100', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('224', '44', '291', '宽', '200', null, null, null, '0.00');
INSERT INTO `parts_size` VALUES ('225', '44', '291', '高', '50', null, null, null, null);
INSERT INTO `parts_size` VALUES ('226', '45', '3', '长', '174', '0', '50.00', '300.00', '1.00');
INSERT INTO `parts_size` VALUES ('227', '45', '3', '宽', '0', '0', '50.00', '300.00', '1.00');
INSERT INTO `parts_size` VALUES ('228', '45', '3', '高', '83', '1', null, null, '1.00');
INSERT INTO `parts_size` VALUES ('229', '45', '16', '长', '174', '0', '300.00', '50.00', '1.00');
INSERT INTO `parts_size` VALUES ('230', '45', '16', '宽', '98', '0', '300.00', '50.00', '1.00');
INSERT INTO `parts_size` VALUES ('231', '45', '16', '高', '83', '1', null, null, '1.00');
INSERT INTO `parts_size` VALUES ('232', '45', '17', '长', '80.5', '1', null, null, '1.00');
INSERT INTO `parts_size` VALUES ('233', '45', '17', '宽', '80.5', '1', null, null, '1.00');
INSERT INTO `parts_size` VALUES ('234', '45', '17', '高', '38', '1', null, null, '1.00');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `depict` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `type` varchar(50) DEFAULT NULL COMMENT '菜单类型 0.目录  1.菜单  2.按钮',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `url` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `status` tinyint(4) DEFAULT NULL COMMENT '是否启用  0.否  1.是',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间戳',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='权限表 permission';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'order_management', '订单管理', 'menu', '1', '0', 'baidu.com', '0', '2020-06-16 15:51:43', '2020-06-16 15:51:43');
INSERT INTO `permission` VALUES ('2', 'purchase_management', '采购管理', 'menu', '2', '0', null, '0', null, null);
INSERT INTO `permission` VALUES ('3', 'account_management', '出纳管理', 'menu', '2', '0', null, '0', null, null);
INSERT INTO `permission` VALUES ('4', 'yixiang', '意向单', 'menu', '4', '1', null, null, null, null);
INSERT INTO `permission` VALUES ('5', 'xiaoshou', '笑死订单', 'menu', '5', '1', null, null, null, null);
INSERT INTO `permission` VALUES ('6', 'test', 'test', 'menu', '6', '4', null, null, null, null);
INSERT INTO `permission` VALUES ('7', 'test1', 'test1', 'menu', '7', '6', null, null, null, null);

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
  `texture` tinyint(1) DEFAULT NULL COMMENT '材质  0  皮质  1  布艺',
  `product_direction` tinyint(1) DEFAULT NULL COMMENT '产品方向  0 左扶右踏  1  左踏右扶  3 两者都选',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片',
  `remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `update_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='产品管理';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '测试0608', '0', 'CP20200608192513', '31', '1', '1', '0', '1', 'http://www.baidu.com', 'remark', '2020-06-08 19:25:13', '1', '1', '2020-06-08 19:25:13');
INSERT INTO `product` VALUES ('2', 'cs ', '0', 'CP20200609095028', '32', '24', '29', '0', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/15916673358698bac5948-984f-4db9-a29b-a87b256e62b3.png', '测试11', '2020-06-09 09:50:29', null, null, '2020-06-09 09:50:29');
INSERT INTO `product` VALUES ('3', '测试1111', '0', 'CP20200609105322', '30', '22', '27', '0', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/1591671192464e85514d9-6796-4c0f-9496-4821d9b361b0.png', '测试1111', '2020-06-09 10:53:22', null, null, '2020-06-09 10:53:22');
INSERT INTO `product` VALUES ('7', 'cs12312', '0', 'CP20200609154134', '31', '24', '29', '0', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/1591688420590a11cc68c-65a5-4706-afa1-c10ce250b10e.png', '', '2020-06-09 15:41:35', null, null, '2020-06-10 13:20:50');
INSERT INTO `product` VALUES ('8', 'cs123123', '0', 'CP20200610133314', '32', '25', '29', '0', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/1591767143129d7cb39d7-5cda-4a5e-a060-eaf74eb3b788.png', 'scs', '2020-06-10 13:33:14', null, null, '2020-06-10 13:35:20');
INSERT INTO `product` VALUES ('9', 'cs1231211', '0', 'CP20200610133832', '31', '23', '28', '1', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/15917674553756072b666-9427-4950-8704-1c6c2cd7df55.png', 'cs23123', '2020-06-10 13:38:32', null, null, '2020-06-10 13:38:32');
INSERT INTO `product` VALUES ('10', '测试数据11', '0', 'CP20200610134104', '32', '25', '29', '1', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/15917676127921ca7c4f2-dfd6-42dc-83d0-cd5d8bbaa52c.png', '测试数据11', '2020-06-10 13:41:05', null, null, '2020-06-10 13:41:05');
INSERT INTO `product` VALUES ('11', '测试0610', '0', 'CP20200610140024', '32', '25', '29', '1', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/1591768734001da143a40-b25a-49cc-be11-537388fdf5cb.jpg', '111', '2020-06-10 14:00:25', null, null, '2020-06-10 14:00:25');
INSERT INTO `product` VALUES ('12', '测试061001', '0', 'CP20200610140429', '31', '1', '1', '0', '1', 'http://www.baidu.com', 'remark', '2020-06-10 14:04:29', '1', '1', '2020-06-10 14:04:29');
INSERT INTO `product` VALUES ('23', '沙发左扶手', '0', 'CP20200610150016', '30', '25', '29', '1', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/1591772383784bf8457b3-da1f-488b-a904-36acb0363120.png', '测试添加沙发的其他描述', '2020-06-10 15:00:17', null, null, '2020-06-10 15:00:17');
INSERT INTO `product` VALUES ('24', '爱依瑞斯牌-沙发-左扶', '0', 'CP20200610152922', '30', '24', '28', '1', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/15917731423984638d76c-cda3-4b0c-9563-e8f3f494a9fb.png', '', '2020-06-10 15:29:22', null, null, '2020-06-10 15:29:22');
INSERT INTO `product` VALUES ('25', '左扶手1', '0', 'CP20200610153827', '30', '25', '27', '1', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/15917745655837b0a2e3f-4470-4ee5-883b-d625e8d58f57.png', '', '2020-06-10 15:38:28', null, null, '2020-06-10 19:17:10');
INSERT INTO `product` VALUES ('28', '测试数据0004', '0', 'CP20200610161504', '32', '25', '29', '1', '1', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/159177684972685ff08b2-5cde-468e-a5c2-a10926ef2948.png', '测试数据0004描述', '2020-06-10 16:15:05', null, null, '2020-06-10 16:15:05');
INSERT INTO `product` VALUES ('29', '测试数据0005', '0', 'CP20200610183434', '32', '25', '29', '1', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/1591785161582a70e018f-6070-4fee-9b9f-833a9f446b22.png', '测试数据0005', '2020-06-10 18:34:35', null, null, '2020-06-10 18:34:35');
INSERT INTO `product` VALUES ('30', '测试001', '0', 'CP20200610195004', '32', '25', '29', '1', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/1591789711364d740c6b9-58b4-44cd-a690-e5af6de940de.jpg', '', '2020-06-10 19:50:04', null, null, '2020-06-11 11:06:53');
INSERT INTO `product` VALUES ('31', '沙发测试002', '0', 'CP20200611113501', '30', '24', '27', '1', '0', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/159184629651578507210-01ae-4ba3-b1b3-ae98c392da8d.jpg', '', '2020-06-11 11:35:02', null, null, '2020-06-11 11:36:37');
INSERT INTO `product` VALUES ('32', '测试0611', '0', 'CP20200611181642', '1', '1', '1', '0', '1', 'http://www.baidu.com', 'remark', '2020-06-11 18:16:43', '1', '1', '2020-06-11 18:16:43');
INSERT INTO `product` VALUES ('34', '测试1', '0', 'CP20200612092925', '30', '24', '27', '0', '1', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/159192527025965b4f158-0ae6-46d4-925a-25db57e4be20.png', '', '2020-06-12 09:29:26', null, null, '2020-06-12 09:29:26');
INSERT INTO `product` VALUES ('35', '商品测试88', '0', 'CP20200612093030', '30', '24', '27', '0', '1', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/159192527025965b4f158-0ae6-46d4-925a-25db57e4be20.png', '', '2020-06-12 09:30:30', null, null, '2020-06-12 09:30:30');
INSERT INTO `product` VALUES ('36', '19MIS025（科莫）', '0', 'CP20200612143055', '2', '1', '2', '1', '1', 'http://www.baidu.com', '19MIS025（科莫)', '2020-06-12 14:30:56', null, null, '2020-06-12 14:30:56');

-- ----------------------------
-- Table structure for product_compute_hisotry_detail
-- ----------------------------
DROP TABLE IF EXISTS `product_compute_hisotry_detail`;
CREATE TABLE `product_compute_hisotry_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(32) DEFAULT NULL,
  `product_detail` varchar(500) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL COMMENT '总件数',
  `price` decimal(10,2) DEFAULT NULL,
  `creater_id` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_compute_hisotry_detail
-- ----------------------------
INSERT INTO `product_compute_hisotry_detail` VALUES ('1', '测试(左踏右扶)', '双人位1【80*80*100,布艺-超特-1,含null,成品1个911元】;null(双人位1配件)【null22个12元】;', '2', '891.04', null, '2020-06-04 17:34:16', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('2', '11(左扶右踏)', '双人位1【5*7*7,皮质-A级-null,含音箱,成品1个,11元】;双人位1(双人位1配件)【null11个,11元】;', '2', '11.00', null, '2020-06-05 19:07:14', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('3', '11(左扶右踏)', '双人位1【200*116*80,皮质-A级-null,含音箱,成品1个,2203.40000000000009094947017729282379150390625元】;双人位1(双人位1配件)【null12个,11元】;', '2', '2203.40', null, '2020-06-05 20:24:47', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('4', '11(左扶右踏)', '双人位1【200*116*80,皮质-A级-null,含音箱,成品1个,2203.40000000000009094947017729282379150390625元】;双人位1(双人位1配件)【null12个,11.0元】;', '2', '2203.40', null, '2020-06-05 20:40:41', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('5', '11(左扶右踏)', '双人位1【200*116*80,皮质-A级-null,含音箱,成品1个,2203.40000000000009094947017729282379150390625元】;双人位1(双人位1配件)【null12个,11.0元】;', '2', '2203.40', null, '2020-06-05 20:53:44', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('6', '11(左扶右踏)', '双人位1【200*116*80,皮质-A级-null,含音箱,成品1个,2203.4元】;双人位1(双人位1配件)【null12个,11.0元】;', '2', '2203.40', null, '2020-06-05 20:54:51', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('7', '11(左扶右踏)', '双人位1【200*115*85,皮质-超特级-null,含音箱,成品1个,2173.5元】;双人位1(双人位1配件)【null11个,0.0元】;', '2', '2173.50', null, '2020-06-05 20:57:33', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('8', '11(左扶右踏)', '双人位1【200*115*85,皮质-超特级-null,含音箱,成品1个,2173.5元】;双人位1(双人位1配件)【null11个,0.0元】;', '2', '2173.50', null, '2020-06-05 20:58:38', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('9', '11(左扶右踏)', '双人位1【200*115*85,皮质-超特级-null,含音箱,成品1个,2173.5元】;双人位1(双人位1配件)【null11个,0.0元】;', '2', '2173.50', null, '2020-06-05 20:59:13', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('10', '11(左扶右踏)', '双人位1【200*115*85,皮质-超特级-null,含音箱,成品1个,2173.5元】;双人位1(双人位1配件)【null11个,0.0元】;', '2', '2173.50', null, '2020-06-05 20:59:58', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('11', '11(左扶右踏)', '双人位1【200*115*85,皮质-超特级-null,含音箱,成品1个,2173.5元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2173.50', null, '2020-06-05 21:05:23', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('12', '11(左扶右踏)', '双人位1【10*10*10,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-05 23:10:06', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('13', '11(左扶右踏)', '双人位1【195*119*89,皮质-超特级-null,含音箱,成品1个,2192.8725元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2192.87', null, '2020-06-06 07:02:22', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('14', '11(左扶右踏)', '双人位1【199*122*88,皮质-超特级-null,含音箱,成品1个,2294.271元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2294.27', null, '2020-06-06 07:08:52', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('15', '11(左扶右踏)', '双人位1【199*122*88,皮质-超特级-null,含音箱,成品1个,2294.271元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2294.27', null, '2020-06-06 07:13:36', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('16', '11(左扶右踏)', '双人位1【199*122*88,皮质-超特级-null,含音箱,成品1个,2294.271元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2294.27', null, '2020-06-06 07:13:36', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('17', '11(左扶右踏)', '双人位1【199*163*89,皮质-超特级-null,含音箱,成品1个,3065.2965元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '3065.30', null, '2020-06-06 07:14:16', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('18', '11(左扶右踏)', '双人位1【199*155*86,皮质-超特级-null,含音箱,成品1个,2914.8525元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2914.85', null, '2020-06-06 07:15:55', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('19', '11(左扶右踏)', '双人位1【195*114*84,皮质-超特级-null,含音箱,成品1个,2100.735元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2100.74', null, '2020-06-06 09:17:59', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('20', '11(左扶右踏)', '双人位1【195*114*84,皮质-超特级-null,含音箱,成品1个,2100.735元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2100.74', null, '2020-06-06 09:18:47', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('21', '11(左扶右踏)', '双人位1【195*114*84,皮质-超特级-null,含音箱,成品1个,2100.735元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2100.74', null, '2020-06-06 09:20:10', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('22', '11(左扶右踏)', '双人位1【200*120*100,皮质-超特级-null,含音箱,成品1个,2268.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2268.00', null, '2020-06-06 09:23:12', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('23', '11(左扶右踏)', '双人位1【195*114*84,皮质-超特级-null,含音箱,成品1个,2100.735元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2100.74', null, '2020-06-06 09:29:33', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('24', '11(左扶右踏)', '双人位1【195*114*84,皮质-超特级-null,含音箱,成品1个,2100.735元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2100.74', null, '2020-06-06 09:30:23', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('25', '11(左扶右踏)', '双人位1【195*114*84,皮质-超特级-null,含音箱,成品1个,2100.735元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2100.74', null, '2020-06-06 09:31:07', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('26', '11(左扶右踏)', '双人位1【195*114*84,皮质-超特级-null,含音箱,成品1个,2111.735元】;双人位1(双人位1配件)【null12个,132.0元】;', '2', '2111.74', null, '2020-06-06 09:31:15', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('27', '11(左扶右踏)', '双人位1【195*114*90,皮质-超特级-null,含音箱,成品1个,2111.735元】;双人位1(双人位1配件)【null12个,132.0元】;', '2', '2111.74', null, '2020-06-06 09:31:40', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('28', '11(左扶右踏)', '双人位1【195*118*90,皮质-超特级-null,含音箱,成品1个,2185.445元】;双人位1(双人位1配件)【null12个,132.0元】;', '2', '2185.45', null, '2020-06-06 09:32:00', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('29', '11(左扶右踏)', '双人位1【195*114*84,皮质-超特级-null,含音箱,成品1个,2100.735元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2100.74', null, '2020-06-06 09:34:46', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('30', '11(左扶右踏)', '双人位1【200*114*84,皮质-超特级-null,含音箱,成品1个,2154.6元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '2154.60', null, '2020-06-06 09:35:06', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('31', '11(左扶右踏)', '双人位1【15*15*84,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-06 09:39:02', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('32', '11(左扶右踏)', '双人位1【15*15*84,皮质-超特级-null,含音箱,成品1个,0.0元】;双人位1(双人位1配件)【null10个,110.0元】;', '2', '0.00', null, '2020-06-06 09:39:30', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('33', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-06 09:49:19', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('34', '11(左扶右踏)', '双人位1【22*114*84,皮质-超特级-null,含音箱,成品1个,237.006元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '237.01', null, '2020-06-06 09:49:29', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('35', '11(左扶右踏)', '双人位1【11*114*84,皮质-超特级-null,含音箱,成品1个,119.7元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '119.70', null, '2020-06-06 09:50:09', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('36', '11(左扶右踏)', '双人位1【11*11*84,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-06 09:50:37', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('37', '11(左扶右踏)', '双人位1【22*11*84,皮质-超特级-null,含音箱,成品1个,23.1元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '23.10', null, '2020-06-06 09:50:54', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('38', '11(左扶右踏)', '双人位1【25*30*13,皮质-特级-null,含音箱,成品1个,70.875元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '70.88', null, '2020-06-06 10:16:21', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('39', '11(左扶右踏)', '双人位1【150*100*11,皮质-超特级-null,含音箱,成品1个,1417.5元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '1417.50', null, '2020-06-06 10:18:45', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('40', '11(左扶右踏)', '', '0', '-11.00', null, '2020-06-06 10:19:07', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('41', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-06 10:26:02', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('42', '11(左扶右踏)', '双人位1【1000*11*11,皮质-超特级-null,含音箱,成品1个,1050.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '1050.00', null, '2020-06-06 10:44:56', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('43', '11(左扶右踏)', '双人位1【100*11*11,皮质-超特级-null,含音箱,成品1个,105.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '105.00', null, '2020-06-06 10:45:55', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('44', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11990.0元】;双人位1(双人位1配件)【null1100个,12100.0元】;', '2', '11990.00', null, '2020-06-06 10:53:47', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('45', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-06 10:54:17', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('46', '11(左扶右踏)', '双人位1【150*152*19,皮质-A级-null,含音箱,成品1个,2187.6元】;双人位1(双人位1配件)【null14个,154.0元】;', '2', '2187.60', null, '2020-06-06 11:01:15', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('47', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-06 11:06:00', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('48', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-06 12:05:03', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('49', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-06 23:28:59', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('50', '11(左扶右踏)', '', '0', '-11.00', null, '2020-06-06 23:29:34', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('51', '11(左扶右踏)', '', '0', '-11.00', null, '2020-06-06 23:30:01', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('52', '11(左扶右踏)', '双人位1【25*11*11,皮质-超特级-null,含音箱,成品1个,26.25元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '26.25', null, '2020-06-06 23:32:49', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('53', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 10:18:45', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('54', '11(左扶右踏)', '双人位1【113*114*11,皮质-特级-null,含音箱,成品1个,1217.3490000000002元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '1217.35', null, '2020-06-07 12:33:22', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('55', '11(左扶右踏)', '双人位1【99*11*11,皮质-A级-null,含音箱,成品1个,829.95元】;双人位1(双人位1配件)【null77个,847.0元】;', '2', '829.95', null, '2020-06-07 12:34:18', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('56', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 12:35:42', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('57', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 13:42:35', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('58', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 13:44:02', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('59', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 14:20:10', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('60', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 14:31:06', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('61', '11(左扶右踏)', '双人位1【811*11*11,皮质-超特级-null,含音箱,成品1个,851.5500000000001元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '851.55', null, '2020-06-07 14:32:21', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('62', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 16:35:35', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('63', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 16:37:57', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('64', '11(左扶右踏)', '双人位1【110*11*11,皮质-超特级-null,含音箱,成品1个,115.5元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '115.50', null, '2020-06-07 16:38:08', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('65', '测试11(左扶右踏)', '双人位1【1*111*11,皮质-超特级-null,含牛奶靠包,成品1个,11.0元】;牛奶靠包(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 16:38:23', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('66', '测试11(左扶右踏)', '双人位1【1*111*11,皮质-超特级-null,含牛奶靠包,成品1个,11.0元】;牛奶靠包(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 16:39:01', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('67', '11(左扶右踏)', '双人位1【11*11*11,皮质-超特级-null,含音箱,成品1个,11.0元】;双人位1(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 17:00:15', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('68', '测试11(左扶右踏)', '双人位1【11*11*11,布艺-特级-null,含电灯,成品1个,11.0元】;A级面料小垫(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 17:17:46', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('69', '测试11(左扶右踏)', '双人位1【15*11*11,布艺-特级-null,含电灯,成品1个,11.0元】;A级面料小垫(双人位1配件)【null11个,121.0元】;', '2', '11.00', null, '2020-06-07 17:18:00', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('70', '测试11(左扶右踏)', '双人位1【22*11*11,布艺-特级-null,含电灯,成品1个,22.66元】;A级面料小垫(双人位1配件)【null11个,121.0元】;', '2', '22.66', null, '2020-06-07 17:18:15', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('71', '测试11(左扶右踏)', '双人位1【22*11*11,布艺-特级-null,含电灯,成品1个,1111.66元】;A级面料小垫(双人位1配件)【null110个,1210.0元】;', '2', '1111.66', null, '2020-06-07 17:18:30', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('72', '测试11(左扶右踏)', '双人位1【2200*11*11,布艺-特级-null,含电灯,成品1个,3355.0元】;A级面料小垫(双人位1配件)【null110个,1210.0元】;', '2', '3355.00', null, '2020-06-07 17:19:10', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('73', '测试11(左扶右踏)', '双人位1【220000*11*11,布艺-特级-null,含电灯,成品1个,227689.0元】;A级面料小垫(双人位1配件)【null110个,1210.0元】;', '2', '227689.00', null, '2020-06-07 17:19:31', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('74', '测试产品1(左扶右踏)', '双人位1【40*11*11,皮质-超特级-null,含电动,成品1个,42.0元】;牛奶靠包(双人位1配件)【null11个,121.0元】;', '2', '42.00', null, '2020-06-08 10:38:37', '6');
INSERT INTO `product_compute_hisotry_detail` VALUES ('75', '测试0608(左踏右扶)', '双人位1【5*7*8,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【10*9*16,布艺-特级-null,含电动,含电动,成品1个,68.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-08 19:55:36', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('76', '测试0608(左踏右扶)', '双人位1【7*7*11,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【6*8*9,布艺-特级-null,含电动,含电动,成品1个,68.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-09 09:55:08', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('77', '测试0608(左踏右扶)', '双人位1【11*18*19,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;', '2', '-8.00', null, '2020-06-09 10:49:05', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('78', '测试0608(左踏右扶)', '双人位1【11*18*19,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;', '2', '-8.00', null, '2020-06-09 10:53:50', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('79', '测试0608(左踏右扶)', '双人位1【11*18*19,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;', '2', '-8.00', null, '2020-06-09 10:55:08', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('80', '测试0608(左踏右扶)', '双人位1【10*10*10,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【10*10*10,布艺-特级-null,含电动,含电动,成品1个,68.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-09 11:49:41', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('81', '测试0608(左踏右扶)', '双人位1【10*10*10,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【10*10*10,布艺-特级-null,含电动,含电动,成品1个,68.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-09 11:51:06', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('82', '测试0608(左踏右扶)', '双人位1【10*10*10,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【10*10*10,布艺-特级-null,含电动,含电动,成品1个,68.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-09 11:57:17', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('83', '测试0608(左踏右扶)', '双人位1【11*18*19,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;', '2', '-8.00', null, '2020-06-09 12:40:44', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('84', '测试0608(左踏右扶)', '双人位1【11*18*19,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;', '2', '12.00', null, '2020-06-09 13:08:35', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('85', '测试0608(左踏右扶)', '双人位1【10*10*10,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【10*10*10,布艺-特级-null,含电动,含电动,成品1个,68.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-09 13:09:45', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('86', '测试0608(左踏右扶)', '双人位1【10*10*10,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【10*10*10,布艺-特级-null,含电动,含电动,成品1个,68.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-09 13:52:15', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('87', '测试0608(左踏右扶)', '双人位1【10*10*10,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【10*10*10,布艺-特级-null,含电动,含电动,成品1个,68.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-09 13:55:49', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('88', '测试0608(左踏右扶)', '双人位1【10*10*10,布艺-特级-null,含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【10*10*10,布艺-特级-null,含电动,含电动,成品1个,68.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-09 15:49:03', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('89', '测试0608(左踏右扶)', '垫子【10*10*10,布艺-特级-null,含电动,含电动,成品1个,56.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;双人位1【10*10*10,布艺-特级-null,含电动,成品1个,68.0元】;双人位1(双人位1配件)【null12个,144.0元】;', '5', '68.00', null, '2020-06-09 17:44:18', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('90', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:07:46', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('91', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:26:13', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('92', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:26:14', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('93', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:26:46', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('94', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:29:00', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('95', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:31:24', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('96', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:32:19', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('97', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:34:35', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('98', 'cs (左扶右踏)', '方包【22*11*11,布艺-特级-null,含音箱,成品1个,22.66元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,33.66元】;', '2', '33.66', null, '2020-06-10 17:34:53', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('99', 'cs (左扶右踏)', '方包【22*11*11,布艺-特级-null,含音箱,成品1个,22.66元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,33.66元】;', '2', '33.66', null, '2020-06-10 17:36:40', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('100', 'cs (左扶右踏)', '方包【22*11*11,布艺-特级-null,含音箱,成品1个,22.66元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,33.66元】;', '2', '33.66', null, '2020-06-10 17:36:47', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('101', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:37:44', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('102', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:39:45', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('103', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,22.0元】;', '2', '22.00', null, '2020-06-10 17:42:08', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('104', 'cs (左扶右踏)', '方包【22*11*11,布艺-特级-null,含音箱,成品1个,22.66元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '33.66', null, '2020-06-10 17:47:37', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('105', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 17:47:51', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('106', 'cs (左扶右踏)', '方包【22*11*11,布艺-特级-null,含音箱,成品1个,22.66元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '33.66', null, '2020-06-10 17:48:04', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('107', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【20*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 17:48:32', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('108', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【22*11*1,布艺-特级-null,含电动,成品1个,22.66元】;', '2', '33.66', null, '2020-06-10 17:48:44', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('109', 'cs (左扶右踏)', '方包【22*11*11,布艺-特级-null,含音箱,成品1个,22.66元】;腰垫【22*11*1,布艺-特级-null,含电动,成品1个,22.66元】;', '2', '45.32', null, '2020-06-10 17:49:59', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('110', 'cs (左扶右踏)', '腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '1', '11.00', null, '2020-06-10 17:50:57', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('111', 'cs (左扶右踏)', '方包【15*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 17:51:44', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('112', 'cs (左扶右踏)', '方包【15*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 17:52:14', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('113', 'cs12312(左扶右踏)', '双人位1【111*11*11,布艺-特级-null,含电动,成品1个,11.0元】;', '1', '11.00', null, '2020-06-10 18:00:28', '7');
INSERT INTO `product_compute_hisotry_detail` VALUES ('114', 'cs12312(左扶右踏)', '双人位1【118*11*11,布艺-特级-null,含电动,成品1个,11.0元】;', '1', '11.00', null, '2020-06-10 18:00:41', '7');
INSERT INTO `product_compute_hisotry_detail` VALUES ('115', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 18:28:13', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('116', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 18:37:11', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('117', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 18:54:56', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('118', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 19:02:11', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('119', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 19:02:47', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('120', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 19:05:22', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('121', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 19:05:39', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('122', 'cs (左扶右踏)', '方包【88*11*11,布艺-特级-null,含音箱,成品1个,90.64元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '101.64', null, '2020-06-10 19:05:54', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('123', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 19:14:00', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('124', 'cs (左扶右踏)', '方包【11*11*11,布艺-特级-null,含音箱,成品1个,11.0元】;腰垫【11*11*1,布艺-特级-null,含电动,成品1个,11.0元】;', '2', '22.00', null, '2020-06-10 19:26:38', '2');
INSERT INTO `product_compute_hisotry_detail` VALUES ('125', '测试001(左扶右踏)', '单人位【100*150*50,皮质-超特级-null,含电动,成品1个,1000.0元】;', '1', '1000.00', null, '2020-06-10 19:50:47', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('126', '测试001(左扶右踏)', '单人位【100*150*50,皮质-超特级-null,含电动,成品1个,1000.0元】;牛奶靠包(单人位配件)【null5个,300.0元】;', '2', '1000.00', null, '2020-06-10 20:31:35', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('127', '测试001(左扶右踏)', '单人位【100*150*50,皮质-A级-null,含电动,成品1个,600.0元】;牛奶靠包(单人位配件)【null5个,300.0元】;', '2', '600.00', null, '2020-06-10 20:32:05', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('128', '测试001(左扶右踏)', '单人位【100*150*50,皮质-A级-null,含电动,成品1个,600.0元】;牛奶靠包(单人位配件)【null5个,300.0元】;', '2', '600.00', null, '2020-06-10 20:32:31', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('129', '测试001(左扶右踏)', '单人位【100*150*50,皮质-B级-null,含电动,成品1个,500.0元】;牛奶靠包(单人位配件)【null5个,300.0元】;', '2', '500.00', null, '2020-06-10 20:35:06', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('130', '测试001(左扶右踏)', '单人位【100*150*50,皮质-超特级含电动,成品1个,1000.0元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '1000.00', null, '2020-06-11 09:17:45', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('131', '测试001(左扶右踏)', '单人位【100*150*50,皮质-超特级含电动,成品1个,1000.0元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '1000.00', null, '2020-06-11 09:18:03', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('132', '测试001(左扶右踏)', '单人位【1000*150*50,皮质-超特级含电动,成品1个,10500.0元】;牛奶靠包(单人位配件)【null5个,300.0元】;', '2', '10500.00', null, '2020-06-11 09:19:48', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('133', '测试001(左扶右踏)', '单人位【100*150*50,皮质-超特级含电动,成品1个,1000.0元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '1000.00', null, '2020-06-11 10:06:34', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('134', '测试001(左扶右踏)', '单人位【100*150*50,皮质-超特级含电动,成品1个,1000.0元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '1000.00', null, '2020-06-11 10:33:57', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('135', '测试001(左扶右踏)', '单人位【100*150*50,皮质-特级含电动,成品1个,800.0元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '800.00', null, '2020-06-11 10:34:11', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('136', '测试001(左扶右踏)', '单人位【100*150*50,皮质-B级含电动,成品1个,500.0元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '500.00', null, '2020-06-11 10:34:18', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('137', '测试001(左扶右踏)', '单人位【100*150*50,皮质-超特级含电动,成品1个,1000.0元】;牛奶靠包(单人位配件)【null5个,400.0元】;', '2', '1000.00', null, '2020-06-11 10:42:34', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('138', '测试001(左扶右踏)', '单人位【100*150*50,皮质-超特级含电动,成品1个,1000.0元】;牛奶靠包(单人位配件)【null5个,300.0元】;', '2', '1000.00', null, '2020-06-11 10:42:54', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('139', '测试001(左扶右踏)', '单人位【100*150*50,皮质-A级含电动,成品1个,600.0元】;牛奶靠包(单人位配件)【null5个,300.0元】;', '2', '600.00', null, '2020-06-11 10:43:04', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('140', '测试001(左扶右踏)', '单人位【100*150*50,皮质-A级含电动,成品1个,600.0元】;牛奶靠包(单人位配件)【null5个,300.0元】;', '2', '600.00', null, '2020-06-11 10:43:31', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('141', '测试001(左扶右踏)', '单人位【100*150*50,皮质-超特级含电动,成品1个,1000.0元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '1000.00', null, '2020-06-11 10:58:19', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('142', '测试001(左扶右踏)', '单人位【1000*150*50,皮质-超特级含电动,成品1个,10500.0元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '10500.00', null, '2020-06-11 10:58:31', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('143', '测试001(左扶右踏)', '单人位【110*150*50,皮质-超特级含电动,成品1个,1000.0元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '1000.00', null, '2020-06-11 10:58:43', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('144', '测试001(左扶右踏)', '单人位【111*150*50,皮质-超特级含电动,成品1个,1165.5元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '1165.50', null, '2020-06-11 10:58:55', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('145', '测试001(左扶右踏)', '单人位【100*150*53,皮质-A级含电动,成品1个,700.0元】;牛奶靠包(单人位配件)【null6个,600.0元】;', '2', '700.00', null, '2020-06-11 11:03:46', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('146', '测试001(左扶右踏)', '单人位【100*150*50,皮质-超特级含电动,成品1个,1000.0元】;牛奶靠包(单人位配件)【null5个,500.0元】;', '2', '1000.00', null, '2020-06-11 11:04:47', '30');
INSERT INTO `product_compute_hisotry_detail` VALUES ('147', '测试0610(左扶右踏)', '单面拼接长方包【111*111*111,皮质-超特级-null,含电动,成品1个,111.0元】;', '1', '111.00', null, '2020-06-11 11:32:57', '11');
INSERT INTO `product_compute_hisotry_detail` VALUES ('148', '测试0608(左踏右扶)', '双人位1【10.00*10.00*10.00,布艺-特级含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【10.00*10.00*10.00,布艺-特级含电动,含电动,成品1个,56.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-12 09:32:06', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('149', '测试0608(左踏右扶)', '双人位1【10.00*10.00*10.00,布艺-特级含电动,成品1个,12.0元】;双人位1(双人位1配件)【null12个,144.0元】;垫子【10.00*10.00*10.00,布艺-特级含电动,含电动,成品1个,56.0元】;双人位1(垫子配件)【null12个,144.0元】;双人位1(垫子配件)【null15个,180.0元】;', '5', '68.00', null, '2020-06-12 09:33:43', '1');
INSERT INTO `product_compute_hisotry_detail` VALUES ('150', '测试0610(左扶右踏)', '单面拼接长方包【111.00*111.00*111.00,皮质-超特级含电动,成品1个,111.0元】;', '1', '111.00', null, '2020-06-12 09:35:03', '11');

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
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_customer_fabric_level
-- ----------------------------
INSERT INTO `product_customer_fabric_level` VALUES ('1', '0', '1', '1', '1', '1', '1', '12.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('2', '1', '1', '1', '1', '1', '1', '12.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('3', '0', '2', '1', '2', '1', '1', '20.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('4', '1', '2', '1', '2', '1', '1', '13.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('5', '0', '3', '2', '32', '0', '1', '11.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('6', '0', '3', '2', '32', null, '2', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('7', '0', '3', '2', '32', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('8', '0', '3', '2', '32', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('9', '0', '3', '2', '32', null, '5', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('10', '1', '3', '2', '32', null, '1', '10.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('11', '1', '3', '2', '32', null, '2', '20.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('12', '1', '3', '2', '32', null, '3', '30.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('13', '1', '3', '2', '32', null, '4', '40.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('14', '1', '3', '2', '32', null, '5', '50.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('15', '0', '4', '2', '29', '0', '1', '11.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('16', '0', '4', '2', '29', null, '2', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('17', '0', '4', '2', '29', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('18', '0', '4', '2', '29', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('19', '0', '4', '2', '29', null, '5', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('20', '1', '4', '2', '29', null, '1', '100.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('21', '1', '4', '2', '29', null, '2', '200.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('22', '1', '4', '2', '29', null, '3', '300.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('23', '1', '4', '2', '29', null, '4', '400.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('24', '1', '4', '2', '29', null, '5', '500.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('25', '0', '5', '3', '33', '1', '1', '11.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('26', '0', '5', '3', '33', null, '2', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('27', '0', '5', '3', '33', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('28', '0', '5', '3', '33', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('29', '0', '5', '3', '33', null, '5', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('30', '1', '5', '3', '33', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('31', '1', '5', '3', '33', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('32', '1', '5', '3', '33', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('33', '1', '5', '3', '33', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('34', '1', '5', '3', '33', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('35', '0', '6', '3', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('36', '0', '6', '3', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('37', '0', '6', '3', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('38', '0', '6', '3', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('39', '0', '6', '3', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('40', '1', '6', '3', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('41', '1', '6', '3', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('42', '1', '6', '3', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('43', '1', '6', '3', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('44', '1', '6', '3', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('88', '0', '12', '9', '1', '1', '1', '11.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('89', '0', '12', '9', '1', null, '2', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('90', '0', '12', '9', '1', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('91', '0', '12', '9', '1', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('92', '0', '12', '9', '1', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('93', '1', '12', '9', '1', null, '1', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('94', '1', '12', '9', '1', null, '2', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('95', '1', '12', '9', '1', null, '3', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('96', '1', '12', '9', '1', null, '4', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('97', '1', '12', '9', '1', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('118', '0', '15', '11', '33', '1', '1', '11.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('119', '0', '15', '11', '33', null, '2', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('120', '0', '15', '11', '33', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('121', '0', '15', '11', '33', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('122', '0', '15', '11', '33', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('123', '1', '15', '11', '33', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('124', '1', '15', '11', '33', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('125', '1', '15', '11', '33', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('126', '1', '15', '11', '33', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('127', '1', '15', '11', '33', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('128', '0', '16', '11', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('129', '0', '16', '11', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('130', '0', '16', '11', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('131', '0', '16', '11', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('132', '0', '16', '11', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('133', '1', '16', '11', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('134', '1', '16', '11', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('135', '1', '16', '11', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('136', '1', '16', '11', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('137', '1', '16', '11', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('138', '0', '17', '12', '33', '1', '1', '11.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('139', '0', '17', '12', '33', null, '2', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('140', '0', '17', '12', '33', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('141', '0', '17', '12', '33', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('142', '1', '17', '12', '33', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('143', '1', '17', '12', '33', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('144', '1', '17', '12', '33', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('145', '1', '17', '12', '33', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('146', '1', '17', '12', '33', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('147', '0', '18', '12', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('148', '0', '18', '12', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('149', '0', '18', '12', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('150', '0', '18', '12', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('151', '0', '18', '12', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('152', '1', '18', '12', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('153', '1', '18', '12', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('154', '1', '18', '12', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('155', '1', '18', '12', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('156', '1', '18', '12', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('157', '0', '19', '13', '33', '1', '1', '11.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('158', '0', '19', '13', '33', null, '2', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('159', '0', '19', '13', '33', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('160', '0', '19', '13', '33', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('161', '0', '19', '13', '33', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('162', '1', '19', '13', '33', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('163', '1', '19', '13', '33', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('164', '1', '19', '13', '33', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('165', '1', '19', '13', '33', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('166', '1', '19', '13', '33', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('167', '0', '20', '13', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('168', '0', '20', '13', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('169', '0', '20', '13', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('170', '0', '20', '13', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('171', '0', '20', '13', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('172', '1', '20', '13', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('173', '1', '20', '13', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('174', '1', '20', '13', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('175', '1', '20', '13', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('176', '1', '20', '13', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('177', '0', '21', '14', '33', '1', '1', '111.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('178', '0', '21', '14', '33', null, '2', '111.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('179', '0', '21', '14', '33', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('180', '0', '21', '14', '33', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('181', '0', '21', '14', '33', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('182', '1', '21', '14', '33', null, '1', '11.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('183', '1', '21', '14', '33', null, '2', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('184', '1', '21', '14', '33', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('185', '1', '21', '14', '33', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('186', '1', '21', '14', '33', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('187', '0', '22', '15', '1', '1', '1', '12.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('188', '1', '22', '15', '1', '1', '1', '12.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('189', '0', '23', '15', '2', '1', '1', '20.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('190', '1', '23', '15', '2', '1', '1', '13.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('391', '0', '44', '26', '2', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('392', '0', '44', '26', '2', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('393', '0', '44', '26', '2', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('394', '0', '44', '26', '2', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('395', '0', '44', '26', '2', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('396', '1', '44', '26', '2', '1', '1', '30.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('397', '1', '44', '26', '2', null, '2', '26.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('398', '1', '44', '26', '2', null, '3', '22.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('399', '1', '44', '26', '2', null, '4', '18.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('400', '1', '44', '26', '2', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('401', '0', '45', '26', '24', '1', '1', '460.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('402', '0', '45', '26', '24', null, '2', '430.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('403', '0', '45', '26', '24', null, '3', '400.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('404', '0', '45', '26', '24', null, '4', '360.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('405', '0', '45', '26', '24', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('406', '1', '45', '26', '24', '0', '1', '800.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('407', '1', '45', '26', '24', null, '2', '700.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('408', '1', '45', '26', '24', null, '3', '600.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('409', '1', '45', '26', '24', null, '4', '500.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('410', '1', '45', '26', '24', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('411', '0', '46', '27', '33', '1', '1', '100.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('412', '0', '46', '27', '33', null, '2', '90.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('413', '0', '46', '27', '33', '1', '3', '80.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('414', '0', '46', '27', '33', null, '4', '70.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('415', '0', '46', '27', '33', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('416', '1', '46', '27', '33', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('417', '1', '46', '27', '33', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('418', '1', '46', '27', '33', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('419', '1', '46', '27', '33', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('420', '1', '46', '27', '33', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('421', '0', '47', '27', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('422', '0', '47', '27', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('423', '0', '47', '27', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('424', '0', '47', '27', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('425', '0', '47', '27', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('426', '1', '47', '27', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('427', '1', '47', '27', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('428', '1', '47', '27', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('429', '1', '47', '27', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('430', '1', '47', '27', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('481', '0', '53', '31', '33', '1', '1', '11.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('482', '0', '53', '31', '33', null, '2', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('483', '0', '53', '31', '33', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('484', '0', '53', '31', '33', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('485', '0', '53', '31', '33', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('486', '1', '53', '31', '33', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('487', '1', '53', '31', '33', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('488', '1', '53', '31', '33', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('489', '1', '53', '31', '33', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('490', '1', '53', '31', '33', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('491', '0', '54', '31', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('492', '0', '54', '31', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('493', '0', '54', '31', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('494', '0', '54', '31', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('495', '0', '54', '31', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('496', '1', '54', '31', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('497', '1', '54', '31', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('498', '1', '54', '31', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('499', '1', '54', '31', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('500', '1', '54', '31', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('501', '0', '55', '32', '33', '1', '1', '11.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('502', '0', '55', '32', '33', null, '2', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('503', '0', '55', '32', '33', null, '3', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('504', '0', '55', '32', '33', null, '4', '11.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('505', '1', '55', '32', '33', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('506', '1', '55', '32', '33', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('507', '1', '55', '32', '33', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('508', '1', '55', '32', '33', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('509', '1', '55', '32', '33', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('510', '0', '56', '32', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('511', '0', '56', '32', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('512', '0', '56', '32', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('513', '0', '56', '32', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('514', '0', '56', '32', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('515', '1', '56', '32', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('516', '1', '56', '32', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('517', '1', '56', '32', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('518', '1', '56', '32', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('519', '1', '56', '32', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('530', '0', '58', '34', '29', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('531', '0', '58', '34', '29', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('532', '0', '58', '34', '29', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('533', '0', '58', '34', '29', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('534', '0', '58', '34', '29', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('535', '1', '58', '34', '29', null, '1', '60.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('536', '1', '58', '34', '29', '1', '2', '50.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('537', '1', '58', '34', '29', null, '3', '45.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('538', '1', '58', '34', '29', null, '4', '30.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('539', '1', '58', '34', '29', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('580', '0', '63', '38', '4', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('581', '0', '63', '38', '4', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('582', '0', '63', '38', '4', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('583', '0', '63', '38', '4', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('584', '0', '63', '38', '4', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('585', '1', '63', '38', '4', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('586', '1', '63', '38', '4', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('587', '1', '63', '38', '4', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('588', '1', '63', '38', '4', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('589', '1', '63', '38', '4', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('590', '0', '64', '38', '1', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('591', '0', '64', '38', '1', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('592', '0', '64', '38', '1', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('593', '0', '64', '38', '1', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('594', '0', '64', '38', '1', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('595', '1', '64', '38', '1', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('596', '1', '64', '38', '1', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('597', '1', '64', '38', '1', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('598', '1', '64', '38', '1', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('599', '1', '64', '38', '1', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('600', '0', '65', '38', '23', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('601', '0', '65', '38', '23', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('602', '0', '65', '38', '23', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('603', '0', '65', '38', '23', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('604', '0', '65', '38', '23', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('605', '1', '65', '38', '23', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('606', '1', '65', '38', '23', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('607', '1', '65', '38', '23', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('608', '1', '65', '38', '23', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('609', '1', '65', '38', '23', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('630', '0', '68', '40', '32', null, '1', '1000.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('631', '0', '68', '40', '32', null, '2', '800.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('632', '0', '68', '40', '32', null, '3', '500.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('633', '0', '68', '40', '32', null, '4', '300.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('634', '0', '68', '40', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('635', '1', '68', '40', '32', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('636', '1', '68', '40', '32', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('637', '1', '68', '40', '32', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('638', '1', '68', '40', '32', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('639', '1', '68', '40', '32', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('640', '0', '69', '40', '29', '1', '1', '3000.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('641', '0', '69', '40', '29', null, '2', '2000.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('642', '0', '69', '40', '29', null, '3', '1000.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('643', '0', '69', '40', '29', null, '4', '800.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('644', '0', '69', '40', '29', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('645', '1', '69', '40', '29', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('646', '1', '69', '40', '29', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('647', '1', '69', '40', '29', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('648', '1', '69', '40', '29', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('649', '1', '69', '40', '29', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('650', '0', '70', '41', '1', '1', '1', '12.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('651', '1', '70', '41', '1', '1', '1', '12.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('652', '0', '71', '41', '2', '1', '1', '20.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('653', '1', '71', '41', '2', '1', '1', '13.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('654', '0', '72', '43', '320', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('655', '0', '72', '43', '320', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('656', '0', '72', '43', '320', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('657', '0', '72', '43', '320', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('658', '0', '72', '43', '320', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('659', '1', '72', '43', '320', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('660', '1', '72', '43', '320', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('661', '1', '72', '43', '320', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('662', '1', '72', '43', '320', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('663', '1', '72', '43', '320', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('664', '0', '73', '43', '291', null, '1', '5800.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('665', '0', '73', '43', '291', null, '2', '5000.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('666', '0', '73', '43', '291', null, '3', '4800.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('667', '0', '73', '43', '291', null, '4', '4000.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('668', '0', '73', '43', '291', null, '5', null, null);
INSERT INTO `product_customer_fabric_level` VALUES ('669', '1', '73', '43', '291', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('670', '1', '73', '43', '291', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('671', '1', '73', '43', '291', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('672', '1', '73', '43', '291', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('673', '1', '73', '43', '291', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('674', '0', '74', '44', '320', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('675', '0', '74', '44', '320', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('676', '0', '74', '44', '320', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('677', '0', '74', '44', '320', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('678', '0', '74', '44', '320', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('679', '1', '74', '44', '320', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('680', '1', '74', '44', '320', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('681', '1', '74', '44', '320', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('682', '1', '74', '44', '320', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('683', '1', '74', '44', '320', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('684', '0', '75', '44', '291', null, '1', '5800.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('685', '0', '75', '44', '291', null, '2', '5000.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('686', '0', '75', '44', '291', null, '3', '4800.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('687', '0', '75', '44', '291', null, '4', '4000.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('688', '1', '75', '44', '291', null, '1', null, '1');
INSERT INTO `product_customer_fabric_level` VALUES ('689', '1', '75', '44', '291', null, '2', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('690', '1', '75', '44', '291', null, '3', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('691', '1', '75', '44', '291', null, '4', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('692', '1', '75', '44', '291', null, '5', null, '0');
INSERT INTO `product_customer_fabric_level` VALUES ('693', '0', '76', '45', '3', '20', '1', '7000.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('694', '0', '76', '45', '3', null, '2', '5630.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('695', '0', '76', '45', '3', null, '3', '5450.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('696', '0', '76', '45', '3', null, '4', '5330.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('697', '1', '76', '45', '3', '16', '1', '4180.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('698', '1', '76', '45', '3', null, '2', '4180.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('699', '1', '76', '45', '3', null, '3', '4180.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('700', '1', '76', '45', '3', null, '4', '4180.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('701', '0', '77', '45', '16', '20', '1', '3530.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('702', '0', '77', '45', '16', null, '2', '2860.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('703', '0', '77', '45', '16', null, '3', '2750.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('704', '0', '77', '45', '16', null, '4', '2700.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('705', '1', '77', '45', '16', '16', '1', '2050.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('706', '1', '77', '45', '16', null, '2', '1450.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('707', '1', '77', '45', '16', null, '3', '1300.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('708', '1', '77', '45', '16', null, '4', '1250.00', '0');
INSERT INTO `product_customer_fabric_level` VALUES ('709', '0', '78', '45', '17', '1', '1', '20.00', '1');
INSERT INTO `product_customer_fabric_level` VALUES ('710', '1', '78', '45', '17', '1', '1', '13.00', '1');

-- ----------------------------
-- Table structure for product_customize_parts_price
-- ----------------------------
DROP TABLE IF EXISTS `product_customize_parts_price`;
CREATE TABLE `product_customize_parts_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品定制部件价格对象    id',
  `product_id` int(11) DEFAULT NULL COMMENT '产品id',
  `parts_id` int(11) DEFAULT NULL COMMENT '部件id',
  `component_id` int(11) DEFAULT NULL,
  `fabric_no_id` int(11) DEFAULT NULL COMMENT '面料号',
  `fabric_no_level` tinyint(1) DEFAULT NULL,
  `parts_management_id` int(11) DEFAULT NULL,
  `parts_accessory_id` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_customize_parts_price
-- ----------------------------
INSERT INTO `product_customize_parts_price` VALUES ('1', '1', '1', '1', '1', '0', '1', '1', '12.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('2', '1', '1', '1', '1', '0', '1', '2', '12.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('3', '1', '1', '1', '1', '0', '1', '3', '12.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('4', '3', null, '38', '0', '1', '3', '4', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('5', '3', null, '38', null, '2', '3', '4', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('6', '3', null, '38', null, '3', '3', '4', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('7', '3', null, '38', null, '4', '3', '4', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('8', '3', null, '38', null, '5', '3', '4', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('9', '3', null, '37', '0', '1', '3', '5', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('10', '3', null, '37', null, '2', '3', '5', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('11', '3', null, '37', null, '3', '3', '5', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('12', '3', null, '37', null, '4', '3', '5', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('13', '3', null, '37', null, '5', '3', '5', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('82', '7', null, '38', '0', '1', '9', '11', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('83', '7', null, '38', null, '2', '9', '11', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('84', '7', null, '38', null, '3', '9', '11', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('85', '7', null, '38', null, '4', '9', '11', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('86', '7', null, '38', '0', '5', '9', '11', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('87', '7', null, '38', null, '5', '9', '11', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('88', '7', null, '38', null, '5', '9', '11', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('89', '7', null, '38', null, '5', '9', '11', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('90', '7', null, '35', '0', '1', '9', '12', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('91', '7', null, '35', null, '2', '9', '12', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('92', '7', null, '35', null, '3', '9', '12', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('93', '7', null, '35', null, '4', '9', '12', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('94', '7', null, '35', '0', '5', '9', '12', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('95', '7', null, '35', null, '5', '9', '12', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('96', '7', null, '35', null, '5', '9', '12', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('97', '7', null, '35', null, '5', '9', '12', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('98', '8', null, '38', null, '1', '11', '13', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('99', '8', null, '38', null, '2', '11', '13', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('100', '8', null, '38', null, '3', '11', '13', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('101', '8', null, '38', null, '4', '11', '13', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('102', '8', null, '38', null, '5', '11', '13', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('103', '8', null, '38', null, '5', '11', '13', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('104', '8', null, '38', null, '5', '11', '13', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('105', '8', null, '38', null, '5', '11', '13', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('106', '9', '38', '38', null, null, '12', '14', null, null);
INSERT INTO `product_customize_parts_price` VALUES ('107', '10', null, '38', '0', '1', '13', '15', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('108', '10', null, '38', null, '2', '13', '15', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('109', '10', null, '38', null, '3', '13', '15', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('110', '10', null, '38', null, '4', '13', '15', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('111', '10', null, '38', '0', '5', '13', '15', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('112', '10', null, '38', null, '5', '13', '15', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('113', '10', null, '38', null, '5', '13', '15', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('114', '10', null, '38', null, '5', '13', '15', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('115', '12', '1', '1', '1', '0', '15', '16', '12.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('116', '12', '1', '1', '1', '0', '15', '17', '12.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('117', '12', '1', '1', '1', '0', '15', '18', '12.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('135', '28', null, '38', '1', '1', '31', '29', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('136', '28', null, '38', null, '2', '31', '29', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('137', '28', null, '38', null, '3', '31', '29', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('138', '28', null, '38', null, '4', '31', '29', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('139', '28', null, '38', '1', '5', '31', '29', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('140', '28', null, '38', null, '5', '31', '29', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('141', '28', null, '38', null, '5', '31', '29', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('142', '28', null, '38', null, '5', '31', '29', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('143', '28', null, '37', '1', '1', '31', '30', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('144', '28', null, '37', null, '2', '31', '30', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('145', '28', null, '37', null, '3', '31', '30', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('146', '28', null, '37', null, '4', '31', '30', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('147', '28', null, '37', '1', '5', '31', '30', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('148', '28', null, '37', null, '5', '31', '30', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('149', '28', null, '37', null, '5', '31', '30', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('150', '28', null, '37', null, '5', '31', '30', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('151', '29', null, '38', '1', '1', '32', '31', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('152', '29', null, '38', null, '2', '32', '31', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('153', '29', null, '38', null, '3', '32', '31', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('154', '29', null, '38', null, '4', '32', '31', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('155', '29', null, '38', '1', '5', '32', '31', '11.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('156', '29', null, '38', null, '5', '32', '31', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('157', '29', null, '38', null, '5', '32', '31', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('158', '29', null, '38', null, '5', '32', '31', '11.00', '0');
INSERT INTO `product_customize_parts_price` VALUES ('159', '25', null, '38', null, '1', '34', '32', '1.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('160', '25', null, '38', null, '2', '34', '32', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('161', '25', null, '38', null, '3', '34', '32', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('162', '25', null, '38', null, '4', '34', '32', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('163', '25', null, '38', null, '5', '34', '32', '1.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('164', '25', null, '38', null, '5', '34', '32', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('165', '25', null, '38', null, '5', '34', '32', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('166', '25', null, '38', null, '5', '34', '32', '11.00', null);
INSERT INTO `product_customize_parts_price` VALUES ('179', '32', '1', '1', '1', '0', '41', '36', '12.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('180', '32', '1', '1', '1', '0', '41', '37', '12.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('181', '32', '1', '1', '1', '0', '41', '38', '12.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('182', '36', '3', '1', '12', '1', '45', '39', '170.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('183', '36', '3', '1', null, '1', '45', '39', '170.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('184', '36', '3', '1', null, '1', '45', '39', '170.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('185', '36', '3', '1', '12', '1', '45', '39', '170.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('186', '36', '1', '1', '1', '0', '45', '40', '12.00', '1');
INSERT INTO `product_customize_parts_price` VALUES ('187', '36', '1', '1', '1', '0', '45', '41', '12.00', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='产品子件及配件管理';

-- ----------------------------
-- Records of product_parts
-- ----------------------------
INSERT INTO `product_parts` VALUES ('1', '双人位1', 'ZJPJ20200527110853', '0', '0', '1', '0', '2020-05-27 11:08:54', '1', '2020-05-27 11:29:22', '1');
INSERT INTO `product_parts` VALUES ('2', '垫子', 'ZJPJ20200528143209', '0', '0', '2', '0', '2020-05-28 14:32:10', null, '2020-05-28 14:32:10', null);
INSERT INTO `product_parts` VALUES ('3', '托', 'ZJPJ20200528143351', '0', '0', '4', '0', '2020-05-28 14:33:52', null, '2020-05-28 14:33:52', null);
INSERT INTO `product_parts` VALUES ('4', '单人位', 'ZJPJ20200528143745', '0', '0', '2', '0', '2020-05-28 14:37:45', null, '2020-05-28 14:37:45', null);
INSERT INTO `product_parts` VALUES ('5', '多人位', 'ZJPJ20200528143901', '0', '0', '6', '1', '2020-05-28 14:39:01', null, '2020-06-11 09:38:10', null);
INSERT INTO `product_parts` VALUES ('6', '测试1', 'ZJPJ20200528143949', '0', '0', '1', '0', '2020-05-28 14:39:49', null, '2020-05-28 14:39:49', null);
INSERT INTO `product_parts` VALUES ('7', '圆墩', 'ZJPJ20200528144208', '1', '0', '30', '0', '2020-05-28 14:42:08', null, '2020-06-07 13:09:11', null);
INSERT INTO `product_parts` VALUES ('8', '单层墩', 'ZJPJ20200531180643', '1', '0', '30', '0', '2020-05-31 18:06:43', null, '2020-06-07 13:07:47', null);
INSERT INTO `product_parts` VALUES ('9', '双层墩', 'ZJPJ20200606023442', '1', '0', '30', '0', '2020-06-06 10:34:42', null, '2020-06-07 13:06:26', null);
INSERT INTO `product_parts` VALUES ('10', '扶位', 'ZJPJ20200606035232', '1', '1', '30', '0', '2020-06-06 11:52:33', null, '2020-06-06 11:52:33', null);
INSERT INTO `product_parts` VALUES ('11', '单背', 'ZJPJ20200606041006', '1', '0', '30', '0', '2020-06-06 12:10:06', null, '2020-06-06 12:10:06', null);
INSERT INTO `product_parts` VALUES ('12', '短扶', 'ZJPJ20200606041507', '1', '1', '30', '0', '2020-06-06 12:15:08', null, '2020-06-06 12:15:08', null);
INSERT INTO `product_parts` VALUES ('13', '长扶', 'ZJPJ20200606041913', '1', '1', '30', '0', '2020-06-06 12:19:14', null, '2020-06-06 12:19:14', null);
INSERT INTO `product_parts` VALUES ('14', '踏位', 'ZJPJ20200606044647', '1', '1', '30', '0', '2020-06-06 12:46:47', null, '2020-06-06 12:46:47', null);
INSERT INTO `product_parts` VALUES ('15', '双人位', 'ZJPJ20200606052323', '1', '0', '30', '0', '2020-06-06 13:23:23', null, '2020-06-06 13:23:23', null);
INSERT INTO `product_parts` VALUES ('16', '角位', 'ZJPJ20200606052507', '1', '0', '30', '0', '2020-06-06 13:25:07', null, '2020-06-06 13:25:07', null);
INSERT INTO `product_parts` VALUES ('17', '墩', 'ZJPJ20200607125331', '1', '1', '30', '0', '2020-06-07 12:53:32', null, '2020-06-07 12:53:32', null);
INSERT INTO `product_parts` VALUES ('18', '长单背', 'ZJPJ20200607125455', '1', '0', '30', '0', '2020-06-07 12:54:56', null, '2020-06-07 12:54:56', null);
INSERT INTO `product_parts` VALUES ('19', '三人位', 'ZJPJ20200607125737', '1', '0', '30', '0', '2020-06-07 12:57:38', null, '2020-06-07 12:57:38', null);
INSERT INTO `product_parts` VALUES ('20', '大角位', 'ZJPJ20200607125802', '1', '0', '30', '0', '2020-06-07 12:58:03', null, '2020-06-07 12:58:03', null);
INSERT INTO `product_parts` VALUES ('21', '小角位', 'ZJPJ20200607125814', '1', '0', '30', '0', '2020-06-07 12:58:14', null, '2020-06-07 12:58:14', null);
INSERT INTO `product_parts` VALUES ('22', '短位', 'ZJPJ20200607125825', '1', '0', '30', '0', '2020-06-07 12:58:26', null, '2020-06-07 12:58:26', null);
INSERT INTO `product_parts` VALUES ('23', '长墩', 'ZJPJ20200607125837', '0', '0', '30', '0', '2020-06-07 12:58:37', null, '2020-06-07 16:47:38', null);
INSERT INTO `product_parts` VALUES ('24', '背垫', 'ZJPJ20200607131639', '0', '0', '30', '0', '2020-06-07 13:16:40', null, '2020-06-07 13:16:40', null);
INSERT INTO `product_parts` VALUES ('25', '小背垫', 'ZJPJ20200607131657', '0', '0', '30', '0', '2020-06-07 13:16:57', null, '2020-06-07 13:16:57', null);
INSERT INTO `product_parts` VALUES ('26', '中背垫', 'ZJPJ20200607131707', '0', '0', '30', '0', '2020-06-07 13:17:07', null, '2020-06-07 13:17:07', null);
INSERT INTO `product_parts` VALUES ('27', '带圆枕背垫', 'ZJPJ20200607131724', '0', '0', '30', '0', '2020-06-07 13:17:25', null, '2020-06-07 13:17:25', null);
INSERT INTO `product_parts` VALUES ('28', '带围条背垫', 'ZJPJ20200607131736', '0', '0', '30', '0', '2020-06-07 13:17:36', null, '2020-06-07 13:17:36', null);
INSERT INTO `product_parts` VALUES ('29', '腰垫', 'ZJPJ20200607131746', '0', '0', '30', '0', '2020-06-07 13:17:47', null, '2020-06-07 13:17:47', null);
INSERT INTO `product_parts` VALUES ('30', '切割线腰垫', 'ZJPJ20200607131830', '0', '0', '30', '0', '2020-06-07 13:18:31', null, '2020-06-07 13:18:31', null);
INSERT INTO `product_parts` VALUES ('31', '单面拼接腰垫', 'ZJPJ20200607131840', '0', '0', '30', '0', '2020-06-07 13:18:40', null, '2020-06-07 13:18:40', null);
INSERT INTO `product_parts` VALUES ('32', '方包', 'ZJPJ20200607131900', '0', '0', '30', '0', '2020-06-07 13:19:01', null, '2020-06-07 13:19:01', null);
INSERT INTO `product_parts` VALUES ('33', '单面拼接长方包', 'ZJPJ20200607131910', '0', '0', '30', '0', '2020-06-07 13:19:10', null, '2020-06-07 13:19:10', null);
INSERT INTO `product_parts` VALUES ('34', '小垫', 'ZJPJ20200607132114', '1', '0', '30', '0', '2020-06-07 13:21:15', null, '2020-06-08 09:41:05', null);
INSERT INTO `product_parts` VALUES ('35', 'A级面料小垫', 'ZJPJ20200607132126', '1', '0', '30', '0', '2020-06-07 13:21:26', null, '2020-06-07 16:48:21', null);
INSERT INTO `product_parts` VALUES ('36', '带滚绳小垫', 'ZJPJ20200607132136', '1', '0', '30', '0', '2020-06-07 13:21:36', null, '2020-06-07 16:47:28', null);
INSERT INTO `product_parts` VALUES ('37', '神采飞扬小垫', 'ZJPJ20200607132145', '1', '0', '30', '0', '2020-06-07 13:21:45', null, '2020-06-07 16:47:23', null);
INSERT INTO `product_parts` VALUES ('38', '牛奶靠包', 'ZJPJ20200607132153', '1', '0', '30', '0', '2020-06-07 13:21:53', null, '2020-06-07 16:47:17', null);
INSERT INTO `product_parts` VALUES ('39', '测试0612', 'ZJPJ20200612095809', '0', '0', '26', '0', '2020-06-12 09:58:09', null, '2020-06-12 10:08:53', null);

-- ----------------------------
-- Table structure for product_parts_price
-- ----------------------------
DROP TABLE IF EXISTS `product_parts_price`;
CREATE TABLE `product_parts_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_id` tinyint(1) DEFAULT NULL,
  `texture` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_parts_price
-- ----------------------------
INSERT INTO `product_parts_price` VALUES ('2', '1', '1', '1', '1', '2020-06-04 02:35:43', null, '2020-06-08 18:22:52');
INSERT INTO `product_parts_price` VALUES ('3', '1', '2', '0', '1', '2020-06-04 02:44:50', '1', '2020-06-04 02:44:50');
INSERT INTO `product_parts_price` VALUES ('4', '2', '1', '0', '1', '2020-06-04 17:50:21', '1', '2020-06-07 14:31:37');
INSERT INTO `product_parts_price` VALUES ('5', '2', '0', '0', '1', '2020-06-04 19:07:47', '1', '2020-06-04 19:07:47');
INSERT INTO `product_parts_price` VALUES ('6', '7', '0', '0', '1', '2020-06-06 23:34:03', '1', '2020-06-06 23:34:03');
INSERT INTO `product_parts_price` VALUES ('7', '32', '0', '0', '1', '2020-06-07 13:44:01', '1', '2020-06-08 18:23:05');
INSERT INTO `product_parts_price` VALUES ('8', '29', '0', '0', '1', '2020-06-07 14:19:19', '1', '2020-06-07 14:53:35');

-- ----------------------------
-- Table structure for product_parts_price_detail
-- ----------------------------
DROP TABLE IF EXISTS `product_parts_price_detail`;
CREATE TABLE `product_parts_price_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parts_price_id` int(11) DEFAULT NULL,
  `level` tinyint(1) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_parts_price_detail
-- ----------------------------
INSERT INTO `product_parts_price_detail` VALUES ('11', '3', '3', '1288.00');
INSERT INTO `product_parts_price_detail` VALUES ('12', '3', '4', '1288.00');
INSERT INTO `product_parts_price_detail` VALUES ('13', '3', '5', '1288.00');
INSERT INTO `product_parts_price_detail` VALUES ('15', '5', '2', '112.00');
INSERT INTO `product_parts_price_detail` VALUES ('16', '6', '0', '10.00');
INSERT INTO `product_parts_price_detail` VALUES ('17', '6', '2', '100.00');
INSERT INTO `product_parts_price_detail` VALUES ('22', '5', '0', '130.00');
INSERT INTO `product_parts_price_detail` VALUES ('23', '5', '1', '90.00');
INSERT INTO `product_parts_price_detail` VALUES ('24', '5', '3', '90.00');
INSERT INTO `product_parts_price_detail` VALUES ('29', '4', '1', '111.00');
INSERT INTO `product_parts_price_detail` VALUES ('30', '4', '0', '111.00');
INSERT INTO `product_parts_price_detail` VALUES ('35', '8', '0', '170.00');
INSERT INTO `product_parts_price_detail` VALUES ('36', '8', '1', '130.00');
INSERT INTO `product_parts_price_detail` VALUES ('37', '8', '3', '130.00');
INSERT INTO `product_parts_price_detail` VALUES ('38', '8', '2', '110.00');
INSERT INTO `product_parts_price_detail` VALUES ('46', '2', '3', '1288.00');
INSERT INTO `product_parts_price_detail` VALUES ('47', '2', '4', '1288.00');
INSERT INTO `product_parts_price_detail` VALUES ('48', '2', '5', '1288.00');
INSERT INTO `product_parts_price_detail` VALUES ('49', '2', null, null);
INSERT INTO `product_parts_price_detail` VALUES ('50', '2', null, null);
INSERT INTO `product_parts_price_detail` VALUES ('51', '2', null, null);
INSERT INTO `product_parts_price_detail` VALUES ('52', '2', null, null);
INSERT INTO `product_parts_price_detail` VALUES ('53', '7', '0', '210.00');
INSERT INTO `product_parts_price_detail` VALUES ('54', '7', '1', '150.00');
INSERT INTO `product_parts_price_detail` VALUES ('55', '7', '3', '150.00');
INSERT INTO `product_parts_price_detail` VALUES ('56', '7', '2', '150.00');
INSERT INTO `product_parts_price_detail` VALUES ('57', '7', null, null);
INSERT INTO `product_parts_price_detail` VALUES ('58', '7', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='角色表 role';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '测试角色', 'remark', 'USER_ROLE', '0', null, '2020-05-28 00:08:30', null, '2020-05-28 00:08:30');
INSERT INTO `role` VALUES ('2', '测试角色1', 'remark', 'USER_ROLE', '1', null, '2020-05-28 00:08:47', null, '2020-05-28 00:08:47');
INSERT INTO `role` VALUES ('3', '测试角色2', 'remark', 'USER_ROLE', '1', null, '2020-05-28 00:08:51', null, '2020-05-28 00:08:51');
INSERT INTO `role` VALUES ('4', '测试角色3', 'remark', 'USER_ROLE', '1', null, '2020-05-28 00:08:57', null, '2020-05-28 00:08:57');
INSERT INTO `role` VALUES ('5', '测试角色4', 'remark', 'USER_ROLE', '1', null, '2020-05-28 00:09:03', null, '2020-05-28 00:09:03');
INSERT INTO `role` VALUES ('6', '测试角色5', 'remark', 'USER_ROLE', '0', null, '2020-05-28 00:09:07', null, '2020-05-28 00:09:07');
INSERT INTO `role` VALUES ('7', '测试角色6', 'remark', 'USER_ROLE', '0', null, '2020-05-28 00:09:12', null, '2020-05-28 00:09:12');
INSERT INTO `role` VALUES ('8', '测试角色7', 'remark', 'USER_ROLE', '0', null, '2020-05-28 00:09:18', null, '2020-05-28 00:09:18');
INSERT INTO `role` VALUES ('9', '测试角色8', 'remark', 'USER_ROLE', '0', null, '2020-05-28 00:09:23', null, '2020-05-28 00:09:23');
INSERT INTO `role` VALUES ('10', '测试角色9', 'remark', 'USER_ROLE', '0', null, '2020-05-28 00:09:30', null, '2020-05-28 00:09:30');
INSERT INTO `role` VALUES ('11', '测试角色10', 'remark', 'USER_ROLE', '1', null, '2020-05-28 00:09:35', null, '2020-05-28 00:09:35');
INSERT INTO `role` VALUES ('12', '角色测试1', '角色测试1描述角色测试1描述角色', 'USER_ROLE', '1', null, '2020-05-31 15:14:53', null, '2020-05-31 15:14:53');
INSERT INTO `role` VALUES ('13', '采购人员', '', 'USER_ROLE', '1', null, '2020-06-06 11:41:47', null, '2020-06-06 11:41:47');
INSERT INTO `role` VALUES ('14', '采购主管', '', 'USER_ROLE', '0', null, '2020-06-06 12:32:27', null, '2020-06-06 12:32:27');
INSERT INTO `role` VALUES ('15', '测试新增后验证', '测试新增后验证测试新增后验证', 'USER_ROLE', '1', null, '2020-06-07 22:01:24', null, '2020-06-07 22:01:24');
INSERT INTO `role` VALUES ('16', '新增角色测试', '新增角色测试', 'USER_ROLE', '0', null, '2020-06-07 22:16:40', null, '2020-06-07 22:16:40');
INSERT INTO `role` VALUES ('17', '新增aa', 'aaaaaaa', 'USER_ROLE', '1', null, '2020-06-08 11:11:15', null, '2020-06-08 11:11:15');
INSERT INTO `role` VALUES ('18', 'test0623', '测试', 'USER_ROLE', '1', null, '2020-06-22 16:44:06', null, '2020-06-22 16:45:49');

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
-- Records of role_permission
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'GYS20200526115834', '供应商A', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-19 11:58:35', '1', '2020-05-19 11:58:35', null);
INSERT INTO `supplier` VALUES ('2', 'GYS20200526131011', '供应商AW', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-20 13:10:11', null, '2020-05-20 13:10:11', null);
INSERT INTO `supplier` VALUES ('3', 'GYS20200526131019', '供应商C', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-21 13:10:20', null, '2020-05-21 13:10:20', null);
INSERT INTO `supplier` VALUES ('4', 'GYS20200526131028', '供应商D', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-26 13:10:29', null, '2020-05-26 13:10:29', null);
INSERT INTO `supplier` VALUES ('5', 'GYS20200526131034', '供应商E', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-26 13:10:34', null, '2020-05-26 13:10:34', null);
INSERT INTO `supplier` VALUES ('6', 'GYS20200526131039', '供应商F', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-26 13:10:39', null, '2020-05-26 13:10:39', null);
INSERT INTO `supplier` VALUES ('7', 'GYS20200526131044', '供应商G', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-26 13:10:45', null, '2020-05-26 13:10:45', null);
INSERT INTO `supplier` VALUES ('8', 'GYS20200526131050', '供应商H', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-18 13:10:51', null, '2020-05-18 13:10:51', null);
INSERT INTO `supplier` VALUES ('9', 'GYS20200526131421', '供应商AA', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '0', null, '2020-05-26 13:14:21', null, '2020-05-26 13:14:21', null);
INSERT INTO `supplier` VALUES ('10', 'GYS20200526132408', '供应商AB', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '0', null, '2020-05-26 13:24:09', null, '2020-05-26 13:24:09', null);
INSERT INTO `supplier` VALUES ('11', 'GYS20200526132412', '供应商AC', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '0', null, '2020-05-26 13:24:13', null, '2020-05-26 13:24:13', null);
INSERT INTO `supplier` VALUES ('12', 'GYS20200526132418', '供应商AD', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '0', null, '2020-05-26 13:24:19', null, '2020-05-26 13:24:19', null);
INSERT INTO `supplier` VALUES ('13', 'GYS20200526132423', '供应商AE', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '0', null, '2020-05-26 13:24:23', null, '2020-05-26 13:24:23', null);
INSERT INTO `supplier` VALUES ('14', 'GYS20200526132428', '供应商AF', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-26 13:24:28', null, '2020-05-26 13:24:28', null);
INSERT INTO `supplier` VALUES ('15', 'GYS20200526132435', '供应商AG', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-26 13:24:35', null, '2020-05-26 13:24:35', null);
INSERT INTO `supplier` VALUES ('16', 'GYS20200526135023', '供应商BA', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-26 13:50:23', null, '2020-05-26 13:50:23', null);
INSERT INTO `supplier` VALUES ('17', 'GYS20200526171915', '供应商BAc', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-26 17:19:15', null, '2020-05-26 17:19:15', null);
INSERT INTO `supplier` VALUES ('18', 'GYS20200526172023', '供应商BAcd', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-26 17:20:24', null, '2020-05-26 17:20:24', null);
INSERT INTO `supplier` VALUES ('19', 'GYS20200526172210', '供应商BAcde', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '1', null, '2020-05-26 17:22:11', null, '2020-05-26 17:22:11', null);
INSERT INTO `supplier` VALUES ('20', 'GYS20200529131428', 'a', '', '', '', '', '浙江省', '南京', null, 'c', '0', null, '2020-05-29 13:14:29', null, '2020-05-29 13:14:29', null);
INSERT INTO `supplier` VALUES ('21', 'GYS20200601102436', '林氏木业', '林氏', '华南', '211000', '-02588847', '江苏省', '南京', null, '', '1', 'Test one two three', '2020-06-01 10:24:37', null, '2020-06-01 10:24:37', null);
INSERT INTO `supplier` VALUES ('22', 'GYS20200608005206', 'aaaaa', '', '', '', '', '', '', null, '', '1', '', '2020-06-08 08:52:07', null, '2020-06-08 08:52:07', null);
INSERT INTO `supplier` VALUES ('23', 'GYS20200608005355', 'aaaaaa', '', '华北', '', '', '北京市', '北京市', '平谷区', 'fssfsfsf', '0', '', '2020-06-08 08:53:56', null, '2020-06-11 09:40:24', null);
INSERT INTO `supplier` VALUES ('24', 'GYS20200608005707', '供应商名称', '简介', '东北', '12345', '123464', '河北省', '秦皇岛市', '北戴河区', 'xxxx', '0', '', '2020-06-08 08:57:07', null, '2020-06-10 19:27:13', null);
INSERT INTO `supplier` VALUES ('25', 'GYS20200608172537', '供应商0608', '0608', '华北', '215000', '010-123456', '北京市', '北京市', '东城区', '', '0', '备注', '2020-06-08 17:25:37', null, '2020-06-08 17:25:37', null);
INSERT INTO `supplier` VALUES ('26', 'GYS20200622172305', '供应商0622', 'A', '华北', '123456', '123345', '江苏', '苏州', '工业园区', '东环路', '0', null, '2020-06-22 17:23:05', null, '2020-06-22 17:30:40', null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='供应商账户';

-- ----------------------------
-- Records of supplier_account
-- ----------------------------
INSERT INTO `supplier_account` VALUES ('1', '1', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('3', '3', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('4', '4', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('5', '5', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('6', '6', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('7', '7', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('8', '8', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('9', '9', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('10', '10', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('11', '11', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('12', '12', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('13', '13', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('14', '14', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('15', '15', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('17', '16', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('20', '2', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('21', '17', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('22', '18', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('23', '19', '工商银行', '123456', '123456');
INSERT INTO `supplier_account` VALUES ('24', '20', 'c', 'd', null);
INSERT INTO `supplier_account` VALUES ('25', '21', '中国工商银行', '622202777777777', '');
INSERT INTO `supplier_account` VALUES ('26', '22', 'aaa', 'aaaaaaaa', 'aaaaa');
INSERT INTO `supplier_account` VALUES ('29', '25', '招商', '123456', '备注1');
INSERT INTO `supplier_account` VALUES ('30', '25', '中信', '1234567', '备注2');
INSERT INTO `supplier_account` VALUES ('33', '24', '开户行', '汇款账户', 'aaaa');
INSERT INTO `supplier_account` VALUES ('36', '23', '开户行', '银行卡号', '备注');
INSERT INTO `supplier_account` VALUES ('38', '26', '招商', '123456', 'test');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='供应商地址管理';

-- ----------------------------
-- Records of supplier_address
-- ----------------------------
INSERT INTO `supplier_address` VALUES ('2', '1', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('4', '1', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('5', '1', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('7', '3', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('8', '4', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('9', '5', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('10', '6', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('11', '7', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('12', '8', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('13', '9', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('14', '10', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('15', '11', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('16', '12', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('17', '13', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('18', '14', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('19', '15', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('21', '16', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('24', '2', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('25', '17', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('26', '18', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('27', '19', '江苏', '苏州', '工业园区', '东环路', '备注');
INSERT INTO `supplier_address` VALUES ('28', '20', '江西省', '苏州', '姑苏区', 'a', 'c');
INSERT INTO `supplier_address` VALUES ('29', '21', '江苏省', '南京', '新区', '原初地址', '');
INSERT INTO `supplier_address` VALUES ('30', '21', '江苏省', '苏州', '工业园区', '地址1', '');
INSERT INTO `supplier_address` VALUES ('31', '21', '江苏省', '苏州', '吴中区', '地址2', '');
INSERT INTO `supplier_address` VALUES ('32', '22', '河北省', '石家庄市', '长安区', 'ccccc', 'ccccc');
INSERT INTO `supplier_address` VALUES ('35', '25', '天津市', '天津市', '河东区', '街道1', '备注1');
INSERT INTO `supplier_address` VALUES ('36', '25', '山西省', '太原市', '小店区', '街道2', '备注2');
INSERT INTO `supplier_address` VALUES ('39', '24', '河北省', '秦皇岛市', '山海关区', '地址管理 详细', '地址备注');
INSERT INTO `supplier_address` VALUES ('42', '23', '山西省', '大同市', '矿区', 'aaaa', 'aaa');
INSERT INTO `supplier_address` VALUES ('44', '26', '江苏省', '苏州市', 'ss区', '陇西路', 'test');

-- ----------------------------
-- Table structure for supplier_contact
-- ----------------------------
DROP TABLE IF EXISTS `supplier_contact`;
CREATE TABLE `supplier_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `name` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系人电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='供应商联系人';

-- ----------------------------
-- Records of supplier_contact
-- ----------------------------
INSERT INTO `supplier_contact` VALUES ('2', '1', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('4', '1', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('5', '1', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('7', '3', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('8', '4', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('9', '5', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('10', '6', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('11', '7', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('12', '8', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('13', '9', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('14', '10', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('15', '11', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('16', '12', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('17', '13', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('18', '14', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('19', '15', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('21', '16', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('24', '2', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('25', '17', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('26', '18', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('27', '19', '张三', '15367897678');
INSERT INTO `supplier_contact` VALUES ('28', '20', 'a', 'b');
INSERT INTO `supplier_contact` VALUES ('29', '21', '张三', '10010');
INSERT INTO `supplier_contact` VALUES ('30', '22', '测试', '18912345678');
INSERT INTO `supplier_contact` VALUES ('33', '25', '张三', '13787678765');
INSERT INTO `supplier_contact` VALUES ('34', '25', '李四', '15456789876');
INSERT INTO `supplier_contact` VALUES ('37', '24', '189', '18912345678');
INSERT INTO `supplier_contact` VALUES ('40', '23', 'aaaaaa', '18912345678');
INSERT INTO `supplier_contact` VALUES ('42', '26', '张三', '13765676543');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='供应商代理合同';

-- ----------------------------
-- Records of supplier_contract
-- ----------------------------
INSERT INTO `supplier_contract` VALUES ('1', '1', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('3', '3', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('4', '4', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('5', '5', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('6', '6', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('7', '7', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('8', '8', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('9', '9', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('10', '10', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('11', '11', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('12', '12', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('13', '13', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('14', '14', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('15', '15', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('17', '16', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('20', '2', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('21', '17', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('22', '18', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('23', '19', '代理合同', null, null, 'http://1111.com', '122');
INSERT INTO `supplier_contract` VALUES ('24', '20', 'e', '2020-04-30', '2021-04-30', 'https://dunk-test.obs.cn-north-4.myhuaweicloud.com/user/15907293475699fa2a6a2-4ec5-4937-9f58-fb3a34eb8c5b.jpg', null);
INSERT INTO `supplier_contract` VALUES ('25', '21', '', '2020-06-09', '2020-06-29', '', '');
INSERT INTO `supplier_contract` VALUES ('26', '21', '', null, null, '', '');
INSERT INTO `supplier_contract` VALUES ('27', '22', '', null, null, '', '');
INSERT INTO `supplier_contract` VALUES ('30', '25', '合同1', '2020-05-31', '2020-06-08', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/15916083060572f52d7d9-e6aa-4219-b327-98ba9c9b7f8c.jpg', '备注1');
INSERT INTO `supplier_contract` VALUES ('31', '25', '合同2', '2020-05-31', '2020-06-16', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/1591608331900358ffaae-d55f-46bf-8178-e6d9080af048.jpg', '备注2');
INSERT INTO `supplier_contract` VALUES ('34', '24', 'name', '2020-05-31', '2020-06-29', 'https://cj-erp.obs.cn-north-4.myhuaweicloud.com/user/15916132563688c6cb9a7-124d-41c0-9794-72e19b54e756.png', '备注');
INSERT INTO `supplier_contract` VALUES ('37', '23', '', null, null, '', '');
INSERT INTO `supplier_contract` VALUES ('39', '26', '合同1', null, null, 'baidu.com', '测试');
