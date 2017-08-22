/*
Navicat MySQL Data Transfer

Source Server         : wersty
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : jolly

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-08-22 22:45:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for log_payment
-- ----------------------------
DROP TABLE IF EXISTS `log_payment`;
CREATE TABLE `log_payment` (
  `id` varchar(40) NOT NULL,
  `amount` double DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `sys_type` tinyint(4) DEFAULT NULL,
  `req_content` text,
  `req_result` text,
  `return_content` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `callback_task` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_payment
-- ----------------------------
INSERT INTO `log_payment` VALUES ('4028ad815a9c1569015a9c18c2950008', '141', '0', '1', null, null, null, '2017-03-05 09:32:32', '2017-03-05 09:32:32', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815a9c1569015a9c18b2230006');
INSERT INTO `log_payment` VALUES ('4028ad815a9c1569015a9c18f3920009', '141', '1', '1', null, null, '{transaction_id=4002402001201703052278870250, nonce_str=tvrbjmqrs0z3gdddmx49i11llfvgowp8, bank_type=CFT, openid=oSCYFv_YOSERijDdf2oQcjwJKfEs, sign=31C13A0A860405CF20F08C255A7EB2C0, fee_type=CNY, mch_id=1442720602, cash_fee=1, out_trade_no=4028ad815a9c1569015a9c18f3920009, appid=wx7a2a9989083b3725, total_fee=1, trade_type=JSAPI, result_code=SUCCESS, time_end=20170305093220, is_subscribe=N, return_code=SUCCESS}', '2017-03-05 09:32:45', '2017-03-05 09:32:54', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815a9c1569015a9c18b2230006');
INSERT INTO `log_payment` VALUES ('4028ad815a9d2eaf015a9d3e88230014', '1290', '0', '1', null, null, null, '2017-03-05 14:53:25', '2017-03-05 14:53:25', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815a9d2eaf015a9d3e7c8f0011');
INSERT INTO `log_payment` VALUES ('4028ad815a9d2eaf015a9d40c3c30016', '1290', '1', '1', null, null, '{transaction_id=4009492001201703052317545162, nonce_str=29qzovhxd7zhhv0d70bcsqcwqwd7261d, bank_type=CFT, openid=oSCYFv7oV2rJ2m8qgBhCydjqM_ew, sign=A9DFEA8E1A182203E6797B10B30D6006, fee_type=CNY, mch_id=1442720602, cash_fee=1, out_trade_no=4028ad815a9d2eaf015a9d40c3c30016, appid=wx7a2a9989083b3725, total_fee=1, trade_type=JSAPI, result_code=SUCCESS, time_end=20170305145527, is_subscribe=N, return_code=SUCCESS}', '2017-03-05 14:55:51', '2017-03-05 14:56:01', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815a9d2eaf015a9d3e7c8f0011');
INSERT INTO `log_payment` VALUES ('4028ad815aa71389015aa785a701000f', '882', '0', '1', null, null, null, '2017-03-07 14:47:18', '2017-03-07 14:47:18', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa77555a1000a');
INSERT INTO `log_payment` VALUES ('4028ad815aa71389015aa786e6940010', '882', '0', '1', null, null, null, '2017-03-07 14:48:40', '2017-03-07 14:48:40', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa77555a1000a');
INSERT INTO `log_payment` VALUES ('4028ad815aa71389015aa787e0c30011', '882', '0', '1', null, null, null, '2017-03-07 14:49:44', '2017-03-07 14:49:44', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa77555a1000a');
INSERT INTO `log_payment` VALUES ('4028ad815aa71389015aa78808560012', '882', '0', '1', null, null, null, '2017-03-07 14:49:54', '2017-03-07 14:49:54', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa77555a1000a');
INSERT INTO `log_payment` VALUES ('4028ad815aa71389015aa788669d0016', '141', '0', '1', null, null, null, '2017-03-07 14:50:18', '2017-03-07 14:50:18', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa7885e0e0014');
INSERT INTO `log_payment` VALUES ('4028ad815aabc185015aabe163e40001', '141', '0', '1', null, null, null, '2017-03-08 11:05:59', '2017-03-08 11:05:59', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa7885e0e0014');
INSERT INTO `log_payment` VALUES ('4028ad815aabc185015aabe183490002', '141', '0', '1', null, null, null, '2017-03-08 11:06:07', '2017-03-08 11:06:07', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa7885e0e0014');
INSERT INTO `log_payment` VALUES ('4028ad815aabc185015aabe1ddad0003', '141', '0', '1', null, null, null, '2017-03-08 11:06:30', '2017-03-08 11:06:30', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa7885e0e0014');
INSERT INTO `log_payment` VALUES ('4028ad815aabc185015aabe2fde70004', '141', '0', '1', null, null, null, '2017-03-08 11:07:44', '2017-03-08 11:07:44', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa7885e0e0014');
INSERT INTO `log_payment` VALUES ('4028ad815aabc185015aabe51e5f0005', '141', '1', '1', null, null, '{transaction_id=4002402001201703082632946388, nonce_str=uc1um9z4ujm92qxjmhv5xv61m4ux9abz, bank_type=CFT, openid=oSCYFv_YOSERijDdf2oQcjwJKfEs, sign=E4043B7A6DE01104AF38D5F0E04154A5, fee_type=CNY, mch_id=1442720602, cash_fee=1, out_trade_no=4028ad815aabc185015aabe51e5f0005, appid=wx7a2a9989083b3725, total_fee=1, trade_type=JSAPI, result_code=SUCCESS, time_end=20170308110934, is_subscribe=N, return_code=SUCCESS}', '2017-03-08 11:10:03', '2017-03-08 11:10:10', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa7885e0e0014');
INSERT INTO `log_payment` VALUES ('4028ad815acb1c88015acb1f30900001', '882', '0', '1', null, null, null, '2017-03-14 12:41:43', '2017-03-14 12:41:43', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815aa71389015aa77555a1000a');
INSERT INTO `log_payment` VALUES ('4028ad815b03dada015b043298dc0004', '400', '0', '1', null, null, null, '2017-03-25 14:41:16', '2017-03-25 14:41:16', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815b03dada015b042b7e390002');
INSERT INTO `log_payment` VALUES ('4028ad815b03dada015b043325010005', '400', '0', '1', null, null, null, '2017-03-25 14:41:52', '2017-03-25 14:41:52', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815b03dada015b042b7e390002');
INSERT INTO `log_payment` VALUES ('4028ad815b03dada015b0433864e0006', '400', '0', '1', null, null, null, '2017-03-25 14:42:17', '2017-03-25 14:42:17', 'com.web.utils.BookformPaymentCallbackUtils', '4028ad815b03dada015b042b7e390002');

-- ----------------------------
-- Table structure for sys_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `parent_id` varchar(40) DEFAULT NULL COMMENT '父ID',
  `code` varchar(100) DEFAULT NULL COMMENT '模块编码',
  `name` varchar(50) NOT NULL COMMENT '模块名称',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  CONSTRAINT `sys_module_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sys_module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES ('', null, null, '', null, '2017-08-22 18:59:58', '2017-08-22 18:59:58');
INSERT INTO `sys_module` VALUES ('1', null, null, '商城管理', null, '2017-02-17 23:54:54', '2017-02-17 23:54:54');
INSERT INTO `sys_module` VALUES ('11', '1', null, '商城管理', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('110', '11', null, '广告位管理', null, '2017-03-01 23:19:46', '2017-03-01 23:19:46');
INSERT INTO `sys_module` VALUES ('111', '11', null, '系统角色', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('112', '11', null, '系统账号', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('113', '11', null, '商家管理', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('114', '11', null, '商家账号', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('115', '11', null, '商品管理', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('116', '11', null, '订单管理', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('117', '11', null, '邮费管理', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('118', '11', null, '账单管理', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('119', '11', null, '账单明细', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('120', '11', null, '地推管理', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('121', '11', null, '防伪码查询', null, '2017-02-17 23:54:55', '2017-02-17 23:54:55');
INSERT INTO `sys_module` VALUES ('122', '11', null, '品牌管理', null, '2017-08-22 20:34:30', '2017-08-22 20:34:30');

-- ----------------------------
-- Table structure for sys_modulerole
-- ----------------------------
DROP TABLE IF EXISTS `sys_modulerole`;
CREATE TABLE `sys_modulerole` (
  `id` varchar(40) NOT NULL COMMENT '唯一标识',
  `module_id` varchar(40) NOT NULL COMMENT '模块id（SYS_MODULE.ID)',
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色ID（SYS_ROLE.ID)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `module_id` (`module_id`) USING BTREE,
  CONSTRAINT `sys_modulerole_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `sys_modulerole_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `sys_module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_modulerole
-- ----------------------------
INSERT INTO `sys_modulerole` VALUES ('', '112', null, '2017-08-22 18:40:29', '2017-08-22 18:40:29');
INSERT INTO `sys_modulerole` VALUES ('1', '1', 'admin', '2017-02-18 00:00:11', '2017-02-18 00:00:11');
INSERT INTO `sys_modulerole` VALUES ('10', '118', 'admin', '2017-02-18 00:00:12', '2017-02-18 00:00:12');
INSERT INTO `sys_modulerole` VALUES ('11', '119', 'admin', '2017-02-18 00:00:12', '2017-02-18 00:00:12');
INSERT INTO `sys_modulerole` VALUES ('12', '120', 'admin', '2017-02-18 00:00:12', '2017-02-18 00:00:12');
INSERT INTO `sys_modulerole` VALUES ('123', '110', 'admin', '2017-03-01 23:20:18', '2017-03-01 23:20:18');
INSERT INTO `sys_modulerole` VALUES ('13', '121', 'admin', '2017-02-18 00:00:12', '2017-02-18 00:00:12');
INSERT INTO `sys_modulerole` VALUES ('2', '11', 'admin', '2017-02-18 00:00:11', '2017-02-18 00:00:11');
INSERT INTO `sys_modulerole` VALUES ('3', '111', 'admin', '2017-02-18 00:00:11', '2017-02-18 00:00:11');
INSERT INTO `sys_modulerole` VALUES ('4', '112', 'admin', '2017-02-18 00:00:11', '2017-02-18 00:00:11');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec950006', '1', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec950007', '11', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec950008', '111', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec950009', '112', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec95000a', '113', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec95000b', '114', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec95000c', '115', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec96000d', '116', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec96000e', '117', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec96000f', '118', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec960010', '119', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec960011', '120', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4f0157015a4f2cec960012', '121', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4ff856015a4ffb02ea0002', '1', '4028ad815a4ff856015a4ffb02a70001', '2017-02-18 14:48:54', '2017-02-18 14:48:54');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4ff856015a4ffb02ea0003', '11', '4028ad815a4ff856015a4ffb02a70001', '2017-02-18 14:48:54', '2017-02-18 14:48:54');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4ff856015a4ffb02ea0004', '113', '4028ad815a4ff856015a4ffb02a70001', '2017-02-18 14:48:54', '2017-02-18 14:48:54');
INSERT INTO `sys_modulerole` VALUES ('4028ad815a4ff856015a4ffb02ea0005', '122', 'admin', '2017-08-22 20:34:54', '2017-08-22 20:34:54');
INSERT INTO `sys_modulerole` VALUES ('5', '113', 'admin', '2017-02-18 00:00:11', '2017-02-18 00:00:11');
INSERT INTO `sys_modulerole` VALUES ('6', '114', 'admin', '2017-02-18 00:00:11', '2017-02-18 00:00:11');
INSERT INTO `sys_modulerole` VALUES ('7', '115', 'admin', '2017-02-18 00:00:11', '2017-02-18 00:00:11');
INSERT INTO `sys_modulerole` VALUES ('8', '116', 'admin', '2017-02-18 00:00:11', '2017-02-18 00:00:11');
INSERT INTO `sys_modulerole` VALUES ('9', '117', 'admin', '2017-02-18 00:00:11', '2017-02-18 00:00:11');

-- ----------------------------
-- Table structure for sys_navtree
-- ----------------------------
DROP TABLE IF EXISTS `sys_navtree`;
CREATE TABLE `sys_navtree` (
  `id` varchar(40) NOT NULL,
  `parent_id` varchar(40) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `module_id` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL COMMENT '功能链接地址',
  `furl` varchar(200) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL COMMENT '序列',
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  CONSTRAINT `sys_navtree_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `sys_module` (`id`),
  CONSTRAINT `sys_navtree_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `sys_navtree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_navtree
-- ----------------------------
INSERT INTO `sys_navtree` VALUES ('1', null, '后台管理', '1', null, null, '1');
INSERT INTO `sys_navtree` VALUES ('11', '1', '商城管理', '11', null, null, '2');
INSERT INTO `sys_navtree` VALUES ('110', '11', '广告位管理', '110', null, '/pmanager/ad/ad.do?op=query', '2');
INSERT INTO `sys_navtree` VALUES ('111', '11', '系统角色', '111', null, '/pmanager/sysrole/sys_role.do?op=query', '11');
INSERT INTO `sys_navtree` VALUES ('112', '11', '系统账号', '112', null, '/pmanager/sysuser/sys_user.do?op=query', '12');
INSERT INTO `sys_navtree` VALUES ('113', '11', '商家管理', '113', null, '/pmanager/factory/factory.do?op=query', '3');
INSERT INTO `sys_navtree` VALUES ('114', '11', '商家账号', '114', null, '/pmanager/factoryuser/factory_user.do?op=query', '4');
INSERT INTO `sys_navtree` VALUES ('115', '11', '商品管理', '115', null, '/pmanager/product/product.do?op=query', '5');
INSERT INTO `sys_navtree` VALUES ('116', '11', '订单管理', '116', null, '/pmanager/order/bookform.do?op=query', '6');
INSERT INTO `sys_navtree` VALUES ('117', '11', '邮费管理', '117', null, '/pmanager/expressfee/express_fee.do?op=query', '9');
INSERT INTO `sys_navtree` VALUES ('118', '11', '账单管理', '118', null, '/pmanager/bill/bill.do?op=query', '7');
INSERT INTO `sys_navtree` VALUES ('119', '11', '账单明细', '119', null, '/pmanager/billdetail/bill_detail.do?op=query', '8');
INSERT INTO `sys_navtree` VALUES ('120', '11', '地推管理', '120', null, '/pmanager/employee/employee.do', '9');
INSERT INTO `sys_navtree` VALUES ('121', '11', '防伪码查询', '121', null, '/pmanager/product/product.do?op=securityInfo', '10');
INSERT INTO `sys_navtree` VALUES ('122', '11', '品牌管理', '122', null, '/pmanager/productbrand/product_brand.do?op=query', '4');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` varchar(40) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `parent_id` varchar(40) DEFAULT NULL,
  `config` varchar(255) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `FULL_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', '总裁办', null, null, null, '总裁办');
INSERT INTO `sys_organization` VALUES ('3', '客服部', '1', null, null, '客服部');
INSERT INTO `sys_organization` VALUES ('channel', '渠道部', '1', null, null, '渠道部');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(40) NOT NULL COMMENT '唯一标识',
  `name` varchar(16) NOT NULL COMMENT '角色名称',
  `remark` varchar(400) DEFAULT NULL COMMENT '角色备注',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('4028ad815a4f0157015a4f2cec830005', '渠道', '', '2017-02-18 11:03:48', '2017-02-18 11:03:48');
INSERT INTO `sys_role` VALUES ('4028ad815a4ff856015a4ffb02a70001', '客服部', '', '2017-02-18 14:48:54', '2017-02-18 14:48:54');
INSERT INTO `sys_role` VALUES ('admin', '系统管理', '1', '2017-02-17 23:47:37', '2017-02-17 23:47:37');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(40) NOT NULL COMMENT '用户ID',
  `code` varchar(256) NOT NULL COMMENT '工号',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '用户名称',
  `tel_no` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间（触发器维护）',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间（触发器维护）',
  `status` tinyint(4) DEFAULT NULL COMMENT '0:新增，未激活；1:有效账号；-1:已被禁用的账号',
  `organization_id` varchar(40) DEFAULT NULL COMMENT 'sys_organization.id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', '倬利管理员', '13760755956', '2017-02-17 23:48:19', '2017-08-14 00:17:09', '1', '1');
INSERT INTO `sys_user` VALUES ('4028ad815a4f0157015a4f2dd88a0010', 'xp', '0cc175b9c0f1b6a831c399e269772661', '小庞', '13712345217', '2017-02-18 11:05:32', '2017-02-18 11:08:56', '1', 'channel');
INSERT INTO `sys_user` VALUES ('4028ad815a4f0157015a4f2dd88a0011', 'xz', '0cc175b9c0f1b6a831c399e269772661', '小张', '13712345216', '2017-02-18 11:05:22', '2017-02-18 11:08:53', '1', 'channel');
INSERT INTO `sys_user` VALUES ('4028ad815a4f0157015a4f2dd88a0012', 'xh', '0cc175b9c0f1b6a831c399e269772661', '小黄', '13712345215', '2017-02-18 11:05:14', '2017-02-18 11:08:46', '1', 'channel');
INSERT INTO `sys_user` VALUES ('4028ad815a4f0157015a4f2dd88a0013', 'xm', '0cc175b9c0f1b6a831c399e269772661', '小明', '13712345214', '2017-02-18 11:04:49', '2017-02-18 11:06:33', '1', 'channel');
INSERT INTO `sys_user` VALUES ('4028ad815a4f0157015a4f2dd88a0016', 'xc', '0cc175b9c0f1b6a831c399e269772661', '小陈', '13712345218', '2017-02-18 11:05:51', '2017-02-18 11:08:58', '1', 'channel');
INSERT INTO `sys_user` VALUES ('4028ad815a4f0157015a4f2dd88a011', 'dc', '0cc175b9c0f1b6a831c399e269772661', '大陈', '13712345220', '2017-02-18 11:06:14', '2017-02-18 11:09:05', '1', 'channel');
INSERT INTO `sys_user` VALUES ('4028ad815a4f0157015a4f2dd8a0011', 'xl', '0cc175b9c0f1b6a831c399e269772661', '小李', '13712345219', '2017-02-18 11:06:06', '2017-02-18 11:09:00', '1', 'channel');
INSERT INTO `sys_user` VALUES ('4028ad815a4ff856015a4ffc3e390005', 'alan', '0cc175b9c0f1b6a831c399e269772661', 'alan', '13711111111', '2017-02-18 14:50:15', '2017-02-18 14:50:15', '1', '3');
INSERT INTO `sys_user` VALUES ('4028ad815a4ff856015a4ffe04a00007', 'jim', '0cc175b9c0f1b6a831c399e269772661', 'jim', '13778945612', '2017-02-18 14:52:11', '2017-02-18 14:52:11', '1', 'channel');
INSERT INTO `sys_user` VALUES ('4028ad815a9d2eaf015a9d31e17c0002', '18922378766', '0cc175b9c0f1b6a831c399e269772661', '0305测试', '18922378766', '2017-03-05 14:39:36', '2017-03-05 14:39:36', '1', 'channel');

-- ----------------------------
-- Table structure for sys_userrole
-- ----------------------------
DROP TABLE IF EXISTS `sys_userrole`;
CREATE TABLE `sys_userrole` (
  `id` varchar(40) NOT NULL COMMENT '唯一标识',
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `role_id` varchar(40) DEFAULT NULL COMMENT '角色ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `sys_userrole_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `sys_userrole_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userrole
-- ----------------------------
INSERT INTO `sys_userrole` VALUES ('1', '1', 'admin', '2017-02-17 23:48:32', '2017-02-17 23:48:32');
INSERT INTO `sys_userrole` VALUES ('4028ad815a4f0157015a4f2dd88c0014', '4028ad815a4f0157015a4f2dd88a0013', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 11:04:49', '2017-02-18 11:04:49');
INSERT INTO `sys_userrole` VALUES ('4028ad815a4ff856015a4ffc3e4b0006', '4028ad815a4ff856015a4ffc3e390005', '4028ad815a4ff856015a4ffb02a70001', '2017-02-18 14:50:15', '2017-02-18 14:50:15');
INSERT INTO `sys_userrole` VALUES ('4028ad815a4ff856015a4ffe04a50008', '4028ad815a4ff856015a4ffe04a00007', '4028ad815a4f0157015a4f2cec830005', '2017-02-18 14:52:11', '2017-02-18 14:52:11');
INSERT INTO `sys_userrole` VALUES ('4028ad815a9d2eaf015a9d31e1890003', '4028ad815a9d2eaf015a9d31e17c0002', '4028ad815a4f0157015a4f2cec830005', '2017-03-05 14:39:36', '2017-03-05 14:39:36');

-- ----------------------------
-- Table structure for t_ad
-- ----------------------------
DROP TABLE IF EXISTS `t_ad`;
CREATE TABLE `t_ad` (
  `id` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `ad_photo_id` varchar(32) DEFAULT NULL,
  `content_photo_id` varchar(32) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ad
-- ----------------------------

-- ----------------------------
-- Table structure for t_area
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `id` varchar(40) NOT NULL,
  `parent_id` varchar(40) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL COMMENT '行政区划代码',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `city_code` varchar(100) DEFAULT NULL COMMENT '区号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_area
-- ----------------------------
INSERT INTO `t_area` VALUES ('0', '-1', ' ', ' ', ' ', '2017-03-02 13:22:01', '2017-03-02 13:22:01', ' ', null);
INSERT INTO `t_area` VALUES ('100', '0', '中国', 'zg', '000000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '中国', null);
INSERT INTO `t_area` VALUES ('1000', '991', '栖霞区', 'js,nj,qxq', '320113', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南京市栖霞区', '025');
INSERT INTO `t_area` VALUES ('1001', '991', '雨花台区', 'js,nj,yhtq', '320114', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南京市雨花台区', '025');
INSERT INTO `t_area` VALUES ('1002', '991', '江宁区', 'js,nj,jnq', '320115', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南京市江宁区', '025');
INSERT INTO `t_area` VALUES ('1003', '991', '六合区', 'js,nj,lhq', '320116', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南京市六合区', '025');
INSERT INTO `t_area` VALUES ('1004', '991', '溧水县', 'js,nj,lsx', '320124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南京市溧水县', '025');
INSERT INTO `t_area` VALUES ('1005', '991', '高淳县', 'js,nj,gcx', '320125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南京市高淳县', '025');
INSERT INTO `t_area` VALUES ('1006', '990', '无锡市', 'js,wx', '320200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省无锡市', '0510');
INSERT INTO `t_area` VALUES ('1007', '1006', '市辖区', 'js,wx,sxq', '320201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省无锡市市辖区', '0510');
INSERT INTO `t_area` VALUES ('1008', '1006', '崇安区', 'js,wx,caq', '320202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省无锡市崇安区', '0510');
INSERT INTO `t_area` VALUES ('1009', '1006', '南长区', 'js,wx,ncq', '320203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省无锡市南长区', '0510');
INSERT INTO `t_area` VALUES ('101', '100', '北京', 'bj', '110000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市', '010');
INSERT INTO `t_area` VALUES ('1010', '1006', '北塘区', 'js,wx,btq', '320204', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省无锡市北塘区', '0510');
INSERT INTO `t_area` VALUES ('1011', '1006', '锡山区', 'js,wx,xsq', '320205', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省无锡市锡山区', '0510');
INSERT INTO `t_area` VALUES ('1012', '1006', '惠山区', 'js,wx,hsq', '320206', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省无锡市惠山区', '0510');
INSERT INTO `t_area` VALUES ('1013', '1006', '滨湖区', 'js,wx,bhq', '320211', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省无锡市滨湖区', '0510');
INSERT INTO `t_area` VALUES ('1014', '1006', '江阴市', 'js,wx,jy', '320281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省无锡市江阴市', '0510');
INSERT INTO `t_area` VALUES ('1015', '1006', '宜兴市', 'js,wx,yx', '320282', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省无锡市宜兴市', '0510');
INSERT INTO `t_area` VALUES ('1016', '990', '徐州市', 'js,xz', '320300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市', '0516');
INSERT INTO `t_area` VALUES ('1017', '1016', '市辖区', 'js,xz,sxq', '320301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市市辖区', '0516');
INSERT INTO `t_area` VALUES ('1018', '1016', '鼓楼区', 'js,xz,glq', '320302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市鼓楼区', '0516');
INSERT INTO `t_area` VALUES ('1019', '1016', '云龙区', 'js,xz,ylq', '320303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市云龙区', '0516');
INSERT INTO `t_area` VALUES ('102', '101', '北京市', 'bj,sxq', '110100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区', '010');
INSERT INTO `t_area` VALUES ('1020', '1016', '九里区', 'js,xz,jlq', '320304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市九里区', '0516');
INSERT INTO `t_area` VALUES ('1021', '1016', '贾汪区', 'js,xz,jwq', '320305', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市贾汪区', '0516');
INSERT INTO `t_area` VALUES ('1022', '1016', '泉山区', 'js,xz,qsq', '320311', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市泉山区', '0516');
INSERT INTO `t_area` VALUES ('1023', '1016', '丰县', 'js,xz,fx', '320321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市丰县', '0516');
INSERT INTO `t_area` VALUES ('1024', '1016', '沛县', 'js,xz,px', '320322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市沛县', '0516');
INSERT INTO `t_area` VALUES ('1025', '1016', '铜山县', 'js,xz,tsx', '320323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市铜山县', '0516');
INSERT INTO `t_area` VALUES ('1026', '1016', '睢宁县', 'js,xz,snx', '320324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市睢宁县', '0516');
INSERT INTO `t_area` VALUES ('1027', '1016', '新沂市', 'js,xz,xy', '320381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市新沂市', '0516');
INSERT INTO `t_area` VALUES ('1028', '1016', '邳州市', 'js,xz,pz', '320382', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省徐州市邳州市', '0516');
INSERT INTO `t_area` VALUES ('1029', '990', '常州市', 'js,cz', '320400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省常州市', '0519');
INSERT INTO `t_area` VALUES ('103', '102', '东城区', 'bj,sxq,dcq', '110101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区东城区', '010');
INSERT INTO `t_area` VALUES ('1030', '1029', '市辖区', 'js,cz,sxq', '320401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省常州市市辖区', '0519');
INSERT INTO `t_area` VALUES ('1031', '1029', '天宁区', 'js,cz,tnq', '320402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省常州市天宁区', '0519');
INSERT INTO `t_area` VALUES ('1032', '1029', '钟楼区', 'js,cz,zlq', '320404', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省常州市钟楼区', '0519');
INSERT INTO `t_area` VALUES ('1033', '1029', '戚墅堰区', 'js,cz,qsyq', '320405', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省常州市戚墅堰区', '0519');
INSERT INTO `t_area` VALUES ('1034', '1029', '新北区', 'js,cz,xbq', '320411', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省常州市新北区', '0519');
INSERT INTO `t_area` VALUES ('1035', '1029', '武进区', 'js,cz,wjq', '320412', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省常州市武进区', '0519');
INSERT INTO `t_area` VALUES ('1036', '1029', '溧阳市', 'js,cz,ly', '320481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省常州市溧阳市', '0519');
INSERT INTO `t_area` VALUES ('1037', '1029', '金坛市', 'js,cz,jt', '320482', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省常州市金坛市', '0519');
INSERT INTO `t_area` VALUES ('1038', '990', '苏州市', 'js,sz', '320500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市', '0512');
INSERT INTO `t_area` VALUES ('1039', '1038', '市辖区', 'js,sz,sxq', '320501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市市辖区', '0512');
INSERT INTO `t_area` VALUES ('104', '102', '西城区', 'bj,sxq,xcq', '110102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区西城区', '010');
INSERT INTO `t_area` VALUES ('1040', '1038', '沧浪区', 'js,sz,clq', '320502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市沧浪区', '0512');
INSERT INTO `t_area` VALUES ('1041', '1038', '平江区', 'js,sz,pjq', '320503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市平江区', '0512');
INSERT INTO `t_area` VALUES ('1042', '1038', '金阊区', 'js,sz,jcq', '320504', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市金阊区', '0512');
INSERT INTO `t_area` VALUES ('1043', '1038', '虎丘区', 'js,sz,hqq', '320505', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市虎丘区', '0512');
INSERT INTO `t_area` VALUES ('1044', '1038', '吴中区', 'js,sz,wzq', '320506', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市吴中区', '0512');
INSERT INTO `t_area` VALUES ('1045', '1038', '相城区', 'js,sz,xcq', '320507', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市相城区', '0512');
INSERT INTO `t_area` VALUES ('1046', '1038', '常熟市', 'js,sz,cs', '320581', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市常熟市', '0512');
INSERT INTO `t_area` VALUES ('1047', '1038', '张家港市', 'js,sz,zjg', '320582', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市张家港市', '0512');
INSERT INTO `t_area` VALUES ('1048', '1038', '昆山市', 'js,sz,ks', '320583', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市昆山市', '0512');
INSERT INTO `t_area` VALUES ('1049', '1038', '吴江市', 'js,sz,wj', '320584', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市吴江市', '0512');
INSERT INTO `t_area` VALUES ('105', '102', '崇文区', 'bj,sxq,cwq', '110103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区崇文区', '010');
INSERT INTO `t_area` VALUES ('1050', '1038', '太仓市', 'js,sz,tc', '320585', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省苏州市太仓市', '0512');
INSERT INTO `t_area` VALUES ('1051', '990', '南通市', 'js,nt', '320600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南通市', '0513');
INSERT INTO `t_area` VALUES ('1052', '1051', '市辖区', 'js,nt,sxq', '320601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南通市市辖区', '0513');
INSERT INTO `t_area` VALUES ('1053', '1051', '崇川区', 'js,nt,ccq', '320602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南通市崇川区', '0513');
INSERT INTO `t_area` VALUES ('1054', '1051', '港闸区', 'js,nt,gzq', '320611', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南通市港闸区', '0513');
INSERT INTO `t_area` VALUES ('1055', '1051', '海安县', 'js,nt,hax', '320621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南通市海安县', '0513');
INSERT INTO `t_area` VALUES ('1056', '1051', '如东县', 'js,nt,rdx', '320623', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南通市如东县', '0513');
INSERT INTO `t_area` VALUES ('1057', '1051', '启东市', 'js,nt,qd', '320681', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南通市启东市', '0513');
INSERT INTO `t_area` VALUES ('1058', '1051', '如皋市', 'js,nt,rg', '320682', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南通市如皋市', '0513');
INSERT INTO `t_area` VALUES ('1059', '1051', '通州市', 'js,nt,tz', '320683', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南通市通州市', '0513');
INSERT INTO `t_area` VALUES ('106', '102', '宣武区', 'bj,sxq,xwq', '110104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区宣武区', '010');
INSERT INTO `t_area` VALUES ('1060', '1051', '海门市', 'js,nt,hm', '320684', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省南通市海门市', '0513');
INSERT INTO `t_area` VALUES ('1061', '990', '连云港市', 'js,lyg', '320700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省连云港市', '0518');
INSERT INTO `t_area` VALUES ('1062', '1061', '市辖区', 'js,lyg,sxq', '320701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省连云港市市辖区', '0518');
INSERT INTO `t_area` VALUES ('1063', '1061', '连云区', 'js,lyg,lyq', '320703', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省连云港市连云区', '0518');
INSERT INTO `t_area` VALUES ('1064', '1061', '新浦区', 'js,lyg,xpq', '320705', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省连云港市新浦区', '0518');
INSERT INTO `t_area` VALUES ('1065', '1061', '海州区', 'js,lyg,hzq', '320706', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省连云港市海州区', '0518');
INSERT INTO `t_area` VALUES ('1066', '1061', '赣榆县', 'js,lyg,gyx', '320721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省连云港市赣榆县', '0518');
INSERT INTO `t_area` VALUES ('1067', '1061', '东海县', 'js,lyg,dhx', '320722', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省连云港市东海县', '0518');
INSERT INTO `t_area` VALUES ('1068', '1061', '灌云县', 'js,lyg,gyx', '320723', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省连云港市灌云县', '0518');
INSERT INTO `t_area` VALUES ('1069', '1061', '灌南县', 'js,lyg,gnx', '320724', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省连云港市灌南县', '0518');
INSERT INTO `t_area` VALUES ('107', '102', '朝阳区', 'bj,sxq,cyq', '110105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区朝阳区', '0421');
INSERT INTO `t_area` VALUES ('1070', '990', '淮安市', 'js,ha', '320800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省淮安市', '0516');
INSERT INTO `t_area` VALUES ('1071', '1070', '市辖区', 'js,ha,sxq', '320801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省淮安市市辖区', '0516');
INSERT INTO `t_area` VALUES ('1072', '1070', '清河区', 'js,ha,qhq', '320802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省淮安市清河区', '0516');
INSERT INTO `t_area` VALUES ('1073', '1070', '楚州区', 'js,ha,czq', '320803', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省淮安市楚州区', '0516');
INSERT INTO `t_area` VALUES ('1074', '1070', '淮阴区', 'js,ha,hyq', '320804', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省淮安市淮阴区', '0517');
INSERT INTO `t_area` VALUES ('1075', '1070', '清浦区', 'js,ha,qpq', '320811', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省淮安市清浦区', '0516');
INSERT INTO `t_area` VALUES ('1076', '1070', '涟水县', 'js,ha,lsx', '320826', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省淮安市涟水县', '0516');
INSERT INTO `t_area` VALUES ('1077', '1070', '洪泽县', 'js,ha,hzx', '320829', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省淮安市洪泽县', '0516');
INSERT INTO `t_area` VALUES ('1078', '1070', '盱眙县', 'js,ha,xyx', '320830', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省淮安市盱眙县', '0516');
INSERT INTO `t_area` VALUES ('1079', '1070', '金湖县', 'js,ha,jhx', '320831', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省淮安市金湖县', '0516');
INSERT INTO `t_area` VALUES ('108', '102', '丰台区', 'bj,sxq,ftq', '110106', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区丰台区', '010');
INSERT INTO `t_area` VALUES ('1080', '990', '盐城市', 'js,yc', '320900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市', '0515');
INSERT INTO `t_area` VALUES ('1081', '1080', '市辖区', 'js,yc,sxq', '320901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市市辖区', '0515');
INSERT INTO `t_area` VALUES ('1082', '1080', '亭湖区', 'js,yc,thq', '320902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市亭湖区', '0515');
INSERT INTO `t_area` VALUES ('1083', '1080', '盐都区', 'js,yc,ydq', '320903', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市盐都区', '0515');
INSERT INTO `t_area` VALUES ('1084', '1080', '响水县', 'js,yc,xsx', '320921', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市响水县', '0515');
INSERT INTO `t_area` VALUES ('1085', '1080', '滨海县', 'js,yc,bhx', '320922', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市滨海县', '0515');
INSERT INTO `t_area` VALUES ('1086', '1080', '阜宁县', 'js,yc,fnx', '320923', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市阜宁县', '0515');
INSERT INTO `t_area` VALUES ('1087', '1080', '射阳县', 'js,yc,syx', '320924', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市射阳县', '0515');
INSERT INTO `t_area` VALUES ('1088', '1080', '建湖县', 'js,yc,jhx', '320925', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市建湖县', '0515');
INSERT INTO `t_area` VALUES ('1089', '1080', '东台市', 'js,yc,dt', '320981', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市东台市', '0515');
INSERT INTO `t_area` VALUES ('109', '102', '石景山区', 'bj,sxq,sjsq', '110107', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区石景山区', '010');
INSERT INTO `t_area` VALUES ('1090', '1080', '大丰市', 'js,yc,df', '320982', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省盐城市大丰市', '0515');
INSERT INTO `t_area` VALUES ('1091', '990', '扬州市', 'js,yz', '321000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省扬州市', '0514');
INSERT INTO `t_area` VALUES ('1092', '1091', '市辖区', 'js,yz,sxq', '321001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省扬州市市辖区', '0514');
INSERT INTO `t_area` VALUES ('1093', '1091', '广陵区', 'js,yz,glq', '321002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省扬州市广陵区', '0514');
INSERT INTO `t_area` VALUES ('1094', '1091', '邗江区', 'js,yz,hjq', '321003', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省扬州市邗江区', '0514');
INSERT INTO `t_area` VALUES ('1095', '1091', '维扬区', 'js,yz,wyq', '321011', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省扬州市维扬区', '0514');
INSERT INTO `t_area` VALUES ('1096', '1091', '宝应县', 'js,yz,byx', '321023', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省扬州市宝应县', '0514');
INSERT INTO `t_area` VALUES ('1097', '1091', '仪征市', 'js,yz,yz', '321081', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省扬州市仪征市', '0514');
INSERT INTO `t_area` VALUES ('1098', '1091', '高邮市', 'js,yz,gy', '321084', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省扬州市高邮市', '0514');
INSERT INTO `t_area` VALUES ('1099', '1091', '江都市', 'js,yz,jd', '321088', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省扬州市江都市', '0514');
INSERT INTO `t_area` VALUES ('110', '102', '海淀区', 'bj,sxq,hdq', '110108', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区海淀区', '010');
INSERT INTO `t_area` VALUES ('1100', '990', '镇江市', 'js,zj', '321100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省镇江市', '0511');
INSERT INTO `t_area` VALUES ('1101', '1100', '市辖区', 'js,zj,sxq', '321101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省镇江市市辖区', '0511');
INSERT INTO `t_area` VALUES ('1102', '1100', '京口区', 'js,zj,jkq', '321102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省镇江市京口区', '0511');
INSERT INTO `t_area` VALUES ('1103', '1100', '润州区', 'js,zj,rzq', '321111', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省镇江市润州区', '0511');
INSERT INTO `t_area` VALUES ('1104', '1100', '丹徒区', 'js,zj,dtq', '321112', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省镇江市丹徒区', '0511');
INSERT INTO `t_area` VALUES ('1105', '1100', '丹阳市', 'js,zj,dy', '321181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省镇江市丹阳市', '0511');
INSERT INTO `t_area` VALUES ('1106', '1100', '扬中市', 'js,zj,yz', '321182', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省镇江市扬中市', '0511');
INSERT INTO `t_area` VALUES ('1107', '1100', '句容市', 'js,zj,jr', '321183', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省镇江市句容市', '0511');
INSERT INTO `t_area` VALUES ('1108', '990', '泰州市', 'js,tz', '321200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省泰州市', '0523');
INSERT INTO `t_area` VALUES ('1109', '1108', '市辖区', 'js,tz,sxq', '321201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省泰州市市辖区', '0523');
INSERT INTO `t_area` VALUES ('111', '102', '门头沟区', 'bj,sxq,mtgq', '110109', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区门头沟区', '010');
INSERT INTO `t_area` VALUES ('1110', '1108', '海陵区', 'js,tz,hlq', '321202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省泰州市海陵区', '0523');
INSERT INTO `t_area` VALUES ('1111', '1108', '高港区', 'js,tz,ggq', '321203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省泰州市高港区', '0523');
INSERT INTO `t_area` VALUES ('1112', '1108', '兴化市', 'js,tz,xh', '321281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省泰州市兴化市', '0523');
INSERT INTO `t_area` VALUES ('1113', '1108', '靖江市', 'js,tz,jj', '321282', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省泰州市靖江市', '0523');
INSERT INTO `t_area` VALUES ('1114', '1108', '泰兴市', 'js,tz,tx', '321283', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省泰州市泰兴市', '0523');
INSERT INTO `t_area` VALUES ('1115', '1108', '姜堰市', 'js,tz,jy', '321284', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省泰州市姜堰市', '0523');
INSERT INTO `t_area` VALUES ('1116', '990', '宿迁市', 'js,sq', '321300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省宿迁市', '0527');
INSERT INTO `t_area` VALUES ('1117', '1116', '市辖区', 'js,sq,sxq', '321301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省宿迁市市辖区', '0527');
INSERT INTO `t_area` VALUES ('1118', '1116', '宿城区', 'js,sq,scq', '321302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省宿迁市宿城区', '0527');
INSERT INTO `t_area` VALUES ('1119', '1116', '宿豫区', 'js,sq,syq', '321311', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省宿迁市宿豫区', '0527');
INSERT INTO `t_area` VALUES ('112', '102', '房山区', 'bj,sxq,fsq', '110111', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区房山区', '010');
INSERT INTO `t_area` VALUES ('1120', '1116', '沭阳县', 'js,sq,syx', '321322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省宿迁市沭阳县', '0527');
INSERT INTO `t_area` VALUES ('1121', '1116', '泗阳县', 'js,sq,syx', '321323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省宿迁市泗阳县', '0527');
INSERT INTO `t_area` VALUES ('1122', '1116', '泗洪县', 'js,sq,shx', '321324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江苏省宿迁市泗洪县', '0527');
INSERT INTO `t_area` VALUES ('1123', '100', '浙江省', 'zj', '330000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省', '0573');
INSERT INTO `t_area` VALUES ('1124', '1123', '杭州市', 'zj,hz', '330100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市', '0571');
INSERT INTO `t_area` VALUES ('1125', '1124', '市辖区', 'zj,hz,sxq', '330101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市市辖区', '0571');
INSERT INTO `t_area` VALUES ('1126', '1124', '上城区', 'zj,hz,scq', '330102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市上城区', '0571');
INSERT INTO `t_area` VALUES ('1127', '1124', '下城区', 'zj,hz,xcq', '330103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市下城区', '0571');
INSERT INTO `t_area` VALUES ('1128', '1124', '江干区', 'zj,hz,jgq', '330104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市江干区', '0571');
INSERT INTO `t_area` VALUES ('1129', '1124', '拱墅区', 'zj,hz,gsq', '330105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市拱墅区', '0571');
INSERT INTO `t_area` VALUES ('113', '102', '通州区', 'bj,sxq,tzq', '110112', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区通州区', '010');
INSERT INTO `t_area` VALUES ('1130', '1124', '西湖区', 'zj,hz,xhq', '330106', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市西湖区', '0571');
INSERT INTO `t_area` VALUES ('1131', '1124', '滨江区', 'zj,hz,bjq', '330108', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市滨江区', '0571');
INSERT INTO `t_area` VALUES ('1132', '1124', '萧山区', 'zj,hz,xsq', '330109', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市萧山区', '0571');
INSERT INTO `t_area` VALUES ('1133', '1124', '余杭区', 'zj,hz,yhq', '330110', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市余杭区', '0571');
INSERT INTO `t_area` VALUES ('1134', '1124', '桐庐县', 'zj,hz,tlx', '330122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市桐庐县', '0571');
INSERT INTO `t_area` VALUES ('1135', '1124', '淳安县', 'zj,hz,cax', '330127', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市淳安县', '0571');
INSERT INTO `t_area` VALUES ('1136', '1124', '建德市', 'zj,hz,jd', '330182', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市建德市', '0571');
INSERT INTO `t_area` VALUES ('1137', '1124', '富阳市', 'zj,hz,fy', '330183', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市富阳市', '0571');
INSERT INTO `t_area` VALUES ('1138', '1124', '临安市', 'zj,hz,la', '330185', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省杭州市临安市', '0571');
INSERT INTO `t_area` VALUES ('1139', '1123', '宁波市', 'zj,nb', '330200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市', '0574');
INSERT INTO `t_area` VALUES ('114', '102', '顺义区', 'bj,sxq,syq', '110113', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区顺义区', '010');
INSERT INTO `t_area` VALUES ('1140', '1139', '市辖区', 'zj,nb,sxq', '330201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市市辖区', '0574');
INSERT INTO `t_area` VALUES ('1141', '1139', '海曙区', 'zj,nb,hsq', '330203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市海曙区', '0574');
INSERT INTO `t_area` VALUES ('1142', '1139', '江东区', 'zj,nb,jdq', '330204', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市江东区', '0574');
INSERT INTO `t_area` VALUES ('1143', '1139', '江北区', 'zj,nb,jbq', '330205', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市江北区', '0574');
INSERT INTO `t_area` VALUES ('1144', '1139', '北仑区', 'zj,nb,blq', '330206', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市北仑区', '0574');
INSERT INTO `t_area` VALUES ('1145', '1139', '镇海区', 'zj,nb,zhq', '330211', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市镇海区', '0574');
INSERT INTO `t_area` VALUES ('1146', '1139', '鄞州区', 'zj,nb,yzq', '330212', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市鄞州区', '0574');
INSERT INTO `t_area` VALUES ('1147', '1139', '象山县', 'zj,nb,xsx', '330225', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市象山县', '0574');
INSERT INTO `t_area` VALUES ('1148', '1139', '宁海县', 'zj,nb,nhx', '330226', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市宁海县', '0574');
INSERT INTO `t_area` VALUES ('1149', '1139', '余姚市', 'zj,nb,yy', '330281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市余姚市', '0574');
INSERT INTO `t_area` VALUES ('115', '102', '昌平区', 'bj,sxq,cpq', '110114', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区昌平区', '010');
INSERT INTO `t_area` VALUES ('1150', '1139', '慈溪市', 'zj,nb,cx', '330282', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市慈溪市', '0574');
INSERT INTO `t_area` VALUES ('1151', '1139', '奉化市', 'zj,nb,fh', '330283', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省宁波市奉化市', '0574');
INSERT INTO `t_area` VALUES ('1152', '1123', '温州市', 'zj,wz', '330300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市', '0577');
INSERT INTO `t_area` VALUES ('1153', '1152', '市辖区', 'zj,wz,sxq', '330301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市市辖区', '0577');
INSERT INTO `t_area` VALUES ('1154', '1152', '鹿城区', 'zj,wz,lcq', '330302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市鹿城区', '0577');
INSERT INTO `t_area` VALUES ('1155', '1152', '龙湾区', 'zj,wz,lwq', '330303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市龙湾区', '0577');
INSERT INTO `t_area` VALUES ('1156', '1152', '瓯海区', 'zj,wz,ohq', '330304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市瓯海区', '0577');
INSERT INTO `t_area` VALUES ('1157', '1152', '洞头县', 'zj,wz,dtx', '330322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市洞头县', '0577');
INSERT INTO `t_area` VALUES ('1158', '1152', '永嘉县', 'zj,wz,yjx', '330324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市永嘉县', '0577');
INSERT INTO `t_area` VALUES ('1159', '1152', '平阳县', 'zj,wz,pyx', '330326', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市平阳县', '0577');
INSERT INTO `t_area` VALUES ('116', '102', '大兴区', 'bj,sxq,dxq', '110115', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区大兴区', '010');
INSERT INTO `t_area` VALUES ('1160', '1152', '苍南县', 'zj,wz,cnx', '330327', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市苍南县', '0577');
INSERT INTO `t_area` VALUES ('1161', '1152', '文成县', 'zj,wz,wcx', '330328', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市文成县', '0577');
INSERT INTO `t_area` VALUES ('1162', '1152', '泰顺县', 'zj,wz,tsx', '330329', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市泰顺县', '0577');
INSERT INTO `t_area` VALUES ('1163', '1152', '瑞安市', 'zj,wz,ra', '330381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市瑞安市', '0577');
INSERT INTO `t_area` VALUES ('1164', '1152', '乐清市', 'zj,wz,lq', '330382', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省温州市乐清市', '0577');
INSERT INTO `t_area` VALUES ('1165', '1123', '嘉兴市', 'zj,jx', '330400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省嘉兴市', '0573');
INSERT INTO `t_area` VALUES ('1166', '1165', '市辖区', 'zj,jx,sxq', '330401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省嘉兴市市辖区', '0573');
INSERT INTO `t_area` VALUES ('1167', '1165', '南湖区(**)', 'zj,jx,nhq(**)', '330402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省嘉兴市南湖区(**)', '0573');
INSERT INTO `t_area` VALUES ('1168', '1165', '秀洲区', 'zj,jx,xzq', '330411', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省嘉兴市秀洲区', '0573');
INSERT INTO `t_area` VALUES ('1169', '1165', '嘉善县', 'zj,jx,jsx', '330421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省嘉兴市嘉善县', '0573');
INSERT INTO `t_area` VALUES ('117', '102', '怀柔区', 'bj,sxq,hrq', '110116', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区怀柔区', '010');
INSERT INTO `t_area` VALUES ('1170', '1165', '海盐县', 'zj,jx,hyx', '330424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省嘉兴市海盐县', '0573');
INSERT INTO `t_area` VALUES ('1171', '1165', '海宁市', 'zj,jx,hn', '330481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省嘉兴市海宁市', '0573');
INSERT INTO `t_area` VALUES ('1172', '1165', '平湖市', 'zj,jx,ph', '330482', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省嘉兴市平湖市', '0573');
INSERT INTO `t_area` VALUES ('1173', '1165', '桐乡市', 'zj,jx,tx', '330483', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省嘉兴市桐乡市', '0573');
INSERT INTO `t_area` VALUES ('1174', '1123', '湖州市', 'zj,hz', '330500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省湖州市', '0572');
INSERT INTO `t_area` VALUES ('1175', '1174', '市辖区', 'zj,hz,sxq', '330501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省湖州市市辖区', '0572');
INSERT INTO `t_area` VALUES ('1176', '1174', '吴兴区', 'zj,hz,wxq', '330502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省湖州市吴兴区', '0572');
INSERT INTO `t_area` VALUES ('1177', '1174', '南浔区', 'zj,hz,nxq', '330503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省湖州市南浔区', '0572');
INSERT INTO `t_area` VALUES ('1178', '1174', '德清县', 'zj,hz,dqx', '330521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省湖州市德清县', '0572');
INSERT INTO `t_area` VALUES ('1179', '1174', '长兴县', 'zj,hz,cxx', '330522', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省湖州市长兴县', '0572');
INSERT INTO `t_area` VALUES ('118', '102', '平谷区', 'bj,sxq,pgq', '110117', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市市辖区平谷区', '010');
INSERT INTO `t_area` VALUES ('1180', '1174', '安吉县', 'zj,hz,ajx', '330523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省湖州市安吉县', '0572');
INSERT INTO `t_area` VALUES ('1181', '1123', '绍兴市', 'zj,sx', '330600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省绍兴市', '0575');
INSERT INTO `t_area` VALUES ('1182', '1181', '市辖区', 'zj,sx,sxq', '330601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省绍兴市市辖区', '0575');
INSERT INTO `t_area` VALUES ('1183', '1181', '越城区', 'zj,sx,ycq', '330602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省绍兴市越城区', '0575');
INSERT INTO `t_area` VALUES ('1184', '1181', '绍兴县', 'zj,sx,sxx', '330621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省绍兴市绍兴县', '0575');
INSERT INTO `t_area` VALUES ('1185', '1181', '新昌县', 'zj,sx,xcx', '330624', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省绍兴市新昌县', '0575');
INSERT INTO `t_area` VALUES ('1186', '1181', '诸暨市', 'zj,sx,zj', '330681', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省绍兴市诸暨市', '0575');
INSERT INTO `t_area` VALUES ('1187', '1181', '上虞市', 'zj,sx,sy', '330682', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省绍兴市上虞市', '0575');
INSERT INTO `t_area` VALUES ('1188', '1181', '嵊州市', 'zj,sx,sz', '330683', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省绍兴市嵊州市', '0575');
INSERT INTO `t_area` VALUES ('1189', '1123', '金华市', 'zj,jh', '330700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市', '0579');
INSERT INTO `t_area` VALUES ('1190', '1189', '市辖区', 'zj,jh,sxq', '330701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市市辖区', '0579');
INSERT INTO `t_area` VALUES ('1191', '1189', '婺城区', 'zj,jh,wcq', '330702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市婺城区', '0579');
INSERT INTO `t_area` VALUES ('1192', '1189', '金东区', 'zj,jh,jdq', '330703', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市金东区', '0579');
INSERT INTO `t_area` VALUES ('1193', '1189', '武义县', 'zj,jh,wyx', '330723', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市武义县', '0579');
INSERT INTO `t_area` VALUES ('1194', '1189', '浦江县', 'zj,jh,pjx', '330726', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市浦江县', '0579');
INSERT INTO `t_area` VALUES ('1195', '1189', '磐安县', 'zj,jh,pax', '330727', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市磐安县', '0579');
INSERT INTO `t_area` VALUES ('1196', '1189', '兰溪市', 'zj,jh,lx', '330781', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市兰溪市', '0579');
INSERT INTO `t_area` VALUES ('1197', '1189', '义乌市', 'zj,jh,yw', '330782', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市义乌市', '0579');
INSERT INTO `t_area` VALUES ('1198', '1189', '东阳市', 'zj,jh,dy', '330783', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市东阳市', '0579');
INSERT INTO `t_area` VALUES ('1199', '1189', '永康市', 'zj,jh,yk', '330784', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省金华市永康市', '0579');
INSERT INTO `t_area` VALUES ('120', '102', '密云县', 'bj,x,myx', '110228', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市县密云县', '010');
INSERT INTO `t_area` VALUES ('1200', '1123', '衢州市', 'zj,qz', '330800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省衢州市', '0573');
INSERT INTO `t_area` VALUES ('1201', '1200', '市辖区', 'zj,qz,sxq', '330801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省衢州市市辖区', '0573');
INSERT INTO `t_area` VALUES ('1202', '1200', '柯城区', 'zj,qz,kcq', '330802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省衢州市柯城区', '0573');
INSERT INTO `t_area` VALUES ('1203', '1200', '衢江区', 'zj,qz,qjq', '330803', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省衢州市衢江区', '0573');
INSERT INTO `t_area` VALUES ('1204', '1200', '常山县', 'zj,qz,csx', '330822', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省衢州市常山县', '0573');
INSERT INTO `t_area` VALUES ('1205', '1200', '开化县', 'zj,qz,khx', '330824', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省衢州市开化县', '0573');
INSERT INTO `t_area` VALUES ('1206', '1200', '龙游县', 'zj,qz,lyx', '330825', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省衢州市龙游县', '0573');
INSERT INTO `t_area` VALUES ('1207', '1200', '江山市', 'zj,qz,js', '330881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省衢州市江山市', '0573');
INSERT INTO `t_area` VALUES ('1208', '1123', '舟山市', 'zj,zs', '330900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省舟山市', '0580');
INSERT INTO `t_area` VALUES ('1209', '1208', '市辖区', 'zj,zs,sxq', '330901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省舟山市市辖区', '0580');
INSERT INTO `t_area` VALUES ('121', '102', '延庆县', 'bj,x,yqx', '110229', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '北京市县延庆县', '010');
INSERT INTO `t_area` VALUES ('1210', '1208', '定海区', 'zj,zs,dhq', '330902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省舟山市定海区', '0580');
INSERT INTO `t_area` VALUES ('1211', '1208', '普陀区', 'zj,zs,ptq', '330903', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省舟山市普陀区', '0580');
INSERT INTO `t_area` VALUES ('1212', '1208', '岱山县', 'zj,zs,dsx', '330921', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省舟山市岱山县', '0580');
INSERT INTO `t_area` VALUES ('1213', '1208', '嵊泗县', 'zj,zs,ssx', '330922', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省舟山市嵊泗县', '0580');
INSERT INTO `t_area` VALUES ('1214', '1123', '台州市', 'zj,tz', '331000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市', '0576');
INSERT INTO `t_area` VALUES ('1215', '1214', '市辖区', 'zj,tz,sxq', '331001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市市辖区', '0576');
INSERT INTO `t_area` VALUES ('1216', '1214', '椒江区', 'zj,tz,jjq', '331002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市椒江区', '0576');
INSERT INTO `t_area` VALUES ('1217', '1214', '黄岩区', 'zj,tz,hyq', '331003', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市黄岩区', '0576');
INSERT INTO `t_area` VALUES ('1218', '1214', '路桥区', 'zj,tz,lqq', '331004', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市路桥区', '0576');
INSERT INTO `t_area` VALUES ('1219', '1214', '玉环县', 'zj,tz,yhx', '331021', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市玉环县', '0576');
INSERT INTO `t_area` VALUES ('122', '100', '天津', 'tj', '120000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市', '022');
INSERT INTO `t_area` VALUES ('1220', '1214', '三门县', 'zj,tz,smx', '331022', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市三门县', '0576');
INSERT INTO `t_area` VALUES ('1221', '1214', '天台县', 'zj,tz,ttx', '331023', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市天台县', '0576');
INSERT INTO `t_area` VALUES ('1222', '1214', '仙居县', 'zj,tz,xjx', '331024', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市仙居县', '0576');
INSERT INTO `t_area` VALUES ('1223', '1214', '温岭市', 'zj,tz,wl', '331081', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市温岭市', '0576');
INSERT INTO `t_area` VALUES ('1224', '1214', '临海市', 'zj,tz,lh', '331082', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省台州市临海市', '0576');
INSERT INTO `t_area` VALUES ('1225', '1123', '丽水市', 'zj,ls', '331100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市', '0578');
INSERT INTO `t_area` VALUES ('1226', '1225', '市辖区', 'zj,ls,sxq', '331101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市市辖区', '0578');
INSERT INTO `t_area` VALUES ('1227', '1225', '莲都区', 'zj,ls,ldq', '331102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市莲都区', '0578');
INSERT INTO `t_area` VALUES ('1228', '1225', '青田县', 'zj,ls,qtx', '331121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市青田县', '0578');
INSERT INTO `t_area` VALUES ('1229', '1225', '缙云县', 'zj,ls,jyx', '331122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市缙云县', '0578');
INSERT INTO `t_area` VALUES ('123', '122', '天津市', 'tj,sxq', '120100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区', '022');
INSERT INTO `t_area` VALUES ('1230', '1225', '遂昌县', 'zj,ls,scx', '331123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市遂昌县', '0578');
INSERT INTO `t_area` VALUES ('1231', '1225', '松阳县', 'zj,ls,syx', '331124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市松阳县', '0578');
INSERT INTO `t_area` VALUES ('1232', '1225', '云和县', 'zj,ls,yhx', '331125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市云和县', '0578');
INSERT INTO `t_area` VALUES ('1233', '1225', '庆元县', 'zj,ls,qyx', '331126', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市庆元县', '0578');
INSERT INTO `t_area` VALUES ('1234', '1225', '景宁畲族自治县', 'zj,ls,jnszzzx', '331127', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市景宁畲族自治县', '0578');
INSERT INTO `t_area` VALUES ('1235', '1225', '龙泉市', 'zj,ls,lq', '331181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '浙江省丽水市龙泉市', '0578');
INSERT INTO `t_area` VALUES ('1236', '100', '安徽省', 'ah', '340000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省', '0551');
INSERT INTO `t_area` VALUES ('1237', '1236', '合肥市', 'ah,hf', '340100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省合肥市', '0551');
INSERT INTO `t_area` VALUES ('1238', '1237', '市辖区', 'ah,hf,sxq', '340101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省合肥市市辖区', '0551');
INSERT INTO `t_area` VALUES ('1239', '1237', '瑶海区', 'ah,hf,yhq', '340102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省合肥市瑶海区', '0551');
INSERT INTO `t_area` VALUES ('124', '123', '和平区', 'tj,sxq,hpq', '120101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区和平区', '022');
INSERT INTO `t_area` VALUES ('1240', '1237', '庐阳区', 'ah,hf,lyq', '340103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省合肥市庐阳区', '0551');
INSERT INTO `t_area` VALUES ('1241', '1237', '蜀山区', 'ah,hf,ssq', '340104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省合肥市蜀山区', '0551');
INSERT INTO `t_area` VALUES ('1242', '1237', '包河区', 'ah,hf,bhq', '340111', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省合肥市包河区', '0551');
INSERT INTO `t_area` VALUES ('1243', '1237', '长丰县', 'ah,hf,cfx', '340121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省合肥市长丰县', '0551');
INSERT INTO `t_area` VALUES ('1244', '1237', '肥东县', 'ah,hf,fdx', '340122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省合肥市肥东县', '0551');
INSERT INTO `t_area` VALUES ('1245', '1237', '肥西县', 'ah,hf,fxx', '340123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省合肥市肥西县', '0551');
INSERT INTO `t_area` VALUES ('1246', '1236', '芜湖市', 'ah,wh', '340200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省芜湖市', '0553');
INSERT INTO `t_area` VALUES ('1247', '1246', '市辖区', 'ah,wh,sxq', '340201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省芜湖市市辖区', '0553');
INSERT INTO `t_area` VALUES ('1248', '1246', '镜湖区', 'ah,wh,jhq', '340202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省芜湖市镜湖区', '0553');
INSERT INTO `t_area` VALUES ('1249', '1246', '弋江区', 'ah,wh,yjq', '340203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省芜湖市弋江区', '0553');
INSERT INTO `t_area` VALUES ('125', '123', '河东区', 'tj,sxq,hdq', '120102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区河东区', '022');
INSERT INTO `t_area` VALUES ('1250', '1246', '鸠江区', 'ah,wh,jjq', '340207', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省芜湖市鸠江区', '0553');
INSERT INTO `t_area` VALUES ('1251', '1246', '三山区', 'ah,wh,ssq', '340208', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省芜湖市三山区', '0553');
INSERT INTO `t_area` VALUES ('1252', '1246', '芜湖县', 'ah,wh,whx', '340221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省芜湖市芜湖县', '0553');
INSERT INTO `t_area` VALUES ('1253', '1246', '繁昌县', 'ah,wh,fcx', '340222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省芜湖市繁昌县', '0553');
INSERT INTO `t_area` VALUES ('1254', '1246', '南陵县', 'ah,wh,nlx', '340223', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省芜湖市南陵县', '0553');
INSERT INTO `t_area` VALUES ('1255', '1236', '蚌埠市', 'ah,bb', '340300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省蚌埠市', '0552');
INSERT INTO `t_area` VALUES ('1256', '1255', '市辖区', 'ah,bb,sxq', '340301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省蚌埠市市辖区', '0552');
INSERT INTO `t_area` VALUES ('1257', '1255', '龙子湖区', 'ah,bb,lzhq', '340302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省蚌埠市龙子湖区', '0552');
INSERT INTO `t_area` VALUES ('1258', '1255', '蚌山区', 'ah,bb,bsq', '340303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省蚌埠市蚌山区', '0552');
INSERT INTO `t_area` VALUES ('1259', '1255', '禹会区', 'ah,bb,yhq', '340304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省蚌埠市禹会区', '0552');
INSERT INTO `t_area` VALUES ('126', '123', '河西区', 'tj,sxq,hxq', '120103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区河西区', '022');
INSERT INTO `t_area` VALUES ('1260', '1255', '淮上区', 'ah,bb,hsq', '340311', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省蚌埠市淮上区', '0552');
INSERT INTO `t_area` VALUES ('1261', '1255', '怀远县', 'ah,bb,hyx', '340321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省蚌埠市怀远县', '0552');
INSERT INTO `t_area` VALUES ('1262', '1255', '五河县', 'ah,bb,whx', '340322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省蚌埠市五河县', '0552');
INSERT INTO `t_area` VALUES ('1263', '1255', '固镇县', 'ah,bb,gzx', '340323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省蚌埠市固镇县', '0552');
INSERT INTO `t_area` VALUES ('1264', '1236', '淮南市', 'ah,hn', '340400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮南市', '0554');
INSERT INTO `t_area` VALUES ('1265', '1264', '市辖区', 'ah,hn,sxq', '340401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮南市市辖区', '0554');
INSERT INTO `t_area` VALUES ('1266', '1264', '大通区', 'ah,hn,dtq', '340402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮南市大通区', '0554');
INSERT INTO `t_area` VALUES ('1267', '1264', '田家庵区', 'ah,hn,tjaq', '340403', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮南市田家庵区', '0554');
INSERT INTO `t_area` VALUES ('1268', '1264', '谢家集区', 'ah,hn,xjjq', '340404', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮南市谢家集区', '0554');
INSERT INTO `t_area` VALUES ('1269', '1264', '八公山区', 'ah,hn,bgsq', '340405', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮南市八公山区', '0554');
INSERT INTO `t_area` VALUES ('127', '123', '南开区', 'tj,sxq,nkq', '120104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区南开区', '022');
INSERT INTO `t_area` VALUES ('1270', '1264', '潘集区', 'ah,hn,pjq', '340406', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮南市潘集区', '0554');
INSERT INTO `t_area` VALUES ('1271', '1264', '凤台县', 'ah,hn,ftx', '340421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮南市凤台县', '0554');
INSERT INTO `t_area` VALUES ('1272', '1236', '马鞍山市', 'ah,mas', '340500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省马鞍山市', '0555');
INSERT INTO `t_area` VALUES ('1273', '1272', '市辖区', 'ah,mas,sxq', '340501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省马鞍山市市辖区', '0555');
INSERT INTO `t_area` VALUES ('1274', '1272', '金家庄区', 'ah,mas,jjzq', '340502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省马鞍山市金家庄区', '0555');
INSERT INTO `t_area` VALUES ('1275', '1272', '花山区', 'ah,mas,hsq', '340503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省马鞍山市花山区', '0555');
INSERT INTO `t_area` VALUES ('1276', '1272', '雨山区', 'ah,mas,ysq', '340504', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省马鞍山市雨山区', '0555');
INSERT INTO `t_area` VALUES ('1277', '1272', '当涂县', 'ah,mas,dtx', '340521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省马鞍山市当涂县', '0555');
INSERT INTO `t_area` VALUES ('1278', '1236', '淮北市', 'ah,hb', '340600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮北市', '0561');
INSERT INTO `t_area` VALUES ('1279', '1278', '市辖区', 'ah,hb,sxq', '340601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮北市市辖区', '0561');
INSERT INTO `t_area` VALUES ('128', '123', '河北区', 'tj,sxq,hbq', '120105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区河北区', '022');
INSERT INTO `t_area` VALUES ('1280', '1278', '杜集区', 'ah,hb,djq', '340602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮北市杜集区', '0561');
INSERT INTO `t_area` VALUES ('1281', '1278', '相山区', 'ah,hb,xsq', '340603', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮北市相山区', '0561');
INSERT INTO `t_area` VALUES ('1282', '1278', '烈山区', 'ah,hb,lsq', '340604', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮北市烈山区', '0561');
INSERT INTO `t_area` VALUES ('1283', '1278', '濉溪县', 'ah,hb,sxx', '340621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省淮北市濉溪县', '0561');
INSERT INTO `t_area` VALUES ('1284', '1236', '铜陵市', 'ah,tl', '340700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省铜陵市', '0562');
INSERT INTO `t_area` VALUES ('1285', '1284', '市辖区', 'ah,tl,sxq', '340701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省铜陵市市辖区', '0562');
INSERT INTO `t_area` VALUES ('1286', '1284', '铜官山区', 'ah,tl,tgsq', '340702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省铜陵市铜官山区', '0562');
INSERT INTO `t_area` VALUES ('1287', '1284', '狮子山区', 'ah,tl,szsq', '340703', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省铜陵市狮子山区', '0562');
INSERT INTO `t_area` VALUES ('1288', '1284', '郊区', 'ah,tl,jq', '340711', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省铜陵市郊区', '0562');
INSERT INTO `t_area` VALUES ('1289', '1284', '铜陵县', 'ah,tl,tlx', '340721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省铜陵市铜陵县', '0562');
INSERT INTO `t_area` VALUES ('129', '123', '红桥区', 'tj,sxq,hqq', '120106', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区红桥区', '022');
INSERT INTO `t_area` VALUES ('1290', '1236', '安庆市', 'ah,aq', '340800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市', '0556');
INSERT INTO `t_area` VALUES ('1291', '1290', '市辖区', 'ah,aq,sxq', '340801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市市辖区', '0556');
INSERT INTO `t_area` VALUES ('1292', '1290', '迎江区', 'ah,aq,yjq', '340802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市迎江区', '0556');
INSERT INTO `t_area` VALUES ('1293', '1290', '大观区', 'ah,aq,dgq', '340803', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市大观区', '0556');
INSERT INTO `t_area` VALUES ('1294', '1290', '宜秀区', 'ah,aq,yxq', '340811', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市宜秀区', '0556');
INSERT INTO `t_area` VALUES ('1295', '1290', '怀宁县', 'ah,aq,hnx', '340822', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市怀宁县', '0556');
INSERT INTO `t_area` VALUES ('1296', '1290', '枞阳县', 'ah,aq,cyx', '340823', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市枞阳县', '0556');
INSERT INTO `t_area` VALUES ('1297', '1290', '潜山县', 'ah,aq,qsx', '340824', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市潜山县', '0556');
INSERT INTO `t_area` VALUES ('1298', '1290', '太湖县', 'ah,aq,thx', '340825', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市太湖县', '0556');
INSERT INTO `t_area` VALUES ('1299', '1290', '宿松县', 'ah,aq,ssx', '340826', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市宿松县', '0556');
INSERT INTO `t_area` VALUES ('130', '123', '塘沽区', 'tj,sxq,tgq', '120107', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区塘沽区', '022');
INSERT INTO `t_area` VALUES ('1300', '1290', '望江县', 'ah,aq,wjx', '340827', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市望江县', '0556');
INSERT INTO `t_area` VALUES ('1301', '1290', '岳西县', 'ah,aq,yxx', '340828', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市岳西县', '0556');
INSERT INTO `t_area` VALUES ('1302', '1290', '桐城市', 'ah,aq,tc', '340881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省安庆市桐城市', '0556');
INSERT INTO `t_area` VALUES ('1303', '1236', '黄山市', 'ah,hs', '341000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省黄山市', '0559');
INSERT INTO `t_area` VALUES ('1304', '1303', '市辖区', 'ah,hs,sxq', '341001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省黄山市市辖区', '0559');
INSERT INTO `t_area` VALUES ('1305', '1303', '屯溪区', 'ah,hs,txq', '341002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省黄山市屯溪区', '0559');
INSERT INTO `t_area` VALUES ('1306', '1303', '黄山区', 'ah,hs,hsq', '341003', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省黄山市黄山区', '0559');
INSERT INTO `t_area` VALUES ('1307', '1303', '徽州区', 'ah,hs,hzq', '341004', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省黄山市徽州区', '0559');
INSERT INTO `t_area` VALUES ('1308', '1303', '歙县', 'ah,hs,sx', '341021', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省黄山市歙县', '0559');
INSERT INTO `t_area` VALUES ('1309', '1303', '休宁县', 'ah,hs,xnx', '341022', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省黄山市休宁县', '0559');
INSERT INTO `t_area` VALUES ('131', '123', '汉沽区', 'tj,sxq,hgq', '120108', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区汉沽区', '022');
INSERT INTO `t_area` VALUES ('1310', '1303', '黟县', 'ah,hs,yx', '341023', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省黄山市黟县', '0559');
INSERT INTO `t_area` VALUES ('1311', '1303', '祁门县', 'ah,hs,qmx', '341024', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省黄山市祁门县', '0559');
INSERT INTO `t_area` VALUES ('1312', '1236', '滁州市', 'ah,cz', '341100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省滁州市', '0550');
INSERT INTO `t_area` VALUES ('1313', '1312', '市辖区', 'ah,cz,sxq', '341101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省滁州市市辖区', '0550');
INSERT INTO `t_area` VALUES ('1314', '1312', '琅琊区', 'ah,cz,lyq', '341102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省滁州市琅琊区', '0550');
INSERT INTO `t_area` VALUES ('1315', '1312', '南谯区', 'ah,cz,nqq', '341103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省滁州市南谯区', '0550');
INSERT INTO `t_area` VALUES ('1316', '1312', '来安县', 'ah,cz,lax', '341122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省滁州市来安县', '0550');
INSERT INTO `t_area` VALUES ('1317', '1312', '全椒县', 'ah,cz,qjx', '341124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省滁州市全椒县', '0550');
INSERT INTO `t_area` VALUES ('1318', '1312', '定远县', 'ah,cz,dyx', '341125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省滁州市定远县', '0550');
INSERT INTO `t_area` VALUES ('1319', '1312', '凤阳县', 'ah,cz,fyx', '341126', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省滁州市凤阳县', '0550');
INSERT INTO `t_area` VALUES ('132', '123', '大港区', 'tj,sxq,dgq', '120109', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区大港区', '022');
INSERT INTO `t_area` VALUES ('1320', '1312', '天长市', 'ah,cz,tc', '341181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省滁州市天长市', '0550');
INSERT INTO `t_area` VALUES ('1321', '1312', '明光市', 'ah,cz,mg', '341182', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省滁州市明光市', '0550');
INSERT INTO `t_area` VALUES ('1322', '1236', '阜阳市', 'ah,fy', '341200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省阜阳市', '0558');
INSERT INTO `t_area` VALUES ('1323', '1322', '市辖区', 'ah,fy,sxq', '341201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省阜阳市市辖区', '0558');
INSERT INTO `t_area` VALUES ('1324', '1322', '颍州区', 'ah,fy,yzq', '341202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省阜阳市颍州区', '0558');
INSERT INTO `t_area` VALUES ('1325', '1322', '颍东区', 'ah,fy,ydq', '341203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省阜阳市颍东区', '0558');
INSERT INTO `t_area` VALUES ('1326', '1322', '颍泉区', 'ah,fy,yqq', '341204', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省阜阳市颍泉区', '0558');
INSERT INTO `t_area` VALUES ('1327', '1322', '临泉县', 'ah,fy,lqx', '341221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省阜阳市临泉县', '0558');
INSERT INTO `t_area` VALUES ('1328', '1322', '太和县', 'ah,fy,thx', '341222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省阜阳市太和县', '0558');
INSERT INTO `t_area` VALUES ('1329', '1322', '阜南县', 'ah,fy,fnx', '341225', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省阜阳市阜南县', '0558');
INSERT INTO `t_area` VALUES ('133', '123', '东丽区', 'tj,sxq,dlq', '120110', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区东丽区', '022');
INSERT INTO `t_area` VALUES ('1330', '1322', '颍上县', 'ah,fy,ysx', '341226', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省阜阳市颍上县', '0558');
INSERT INTO `t_area` VALUES ('1331', '1322', '界首市', 'ah,fy,js', '341282', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省阜阳市界首市', '0558');
INSERT INTO `t_area` VALUES ('1332', '1236', '宿州市', 'ah,sz', '341300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宿州市', '0557');
INSERT INTO `t_area` VALUES ('1333', '1332', '市辖区', 'ah,sz,sxq', '341301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宿州市市辖区', '0557');
INSERT INTO `t_area` VALUES ('1334', '1332', '埇桥区', 'ah,sz,qq', '341302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宿州市埇桥区', '0557');
INSERT INTO `t_area` VALUES ('1335', '1332', '砀山县', 'ah,sz,dsx', '341321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宿州市砀山县', '0557');
INSERT INTO `t_area` VALUES ('1336', '1332', '萧县', 'ah,sz,xx', '341322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宿州市萧县', '0557');
INSERT INTO `t_area` VALUES ('1337', '1332', '灵璧县', 'ah,sz,lbx', '341323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宿州市灵璧县', '0557');
INSERT INTO `t_area` VALUES ('1338', '1332', '泗县', 'ah,sz,sx', '341324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宿州市泗县', '0557');
INSERT INTO `t_area` VALUES ('1339', '1236', '巢湖市', 'ah,ch', '341400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省巢湖市', '0565');
INSERT INTO `t_area` VALUES ('134', '123', '西青区', 'tj,sxq,xqq', '120111', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区西青区', '022');
INSERT INTO `t_area` VALUES ('1340', '1339', '市辖区', 'ah,ch,sxq', '341401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省巢湖市市辖区', '0565');
INSERT INTO `t_area` VALUES ('1341', '1339', '居巢区', 'ah,ch,jcq', '341402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省巢湖市居巢区', '0565');
INSERT INTO `t_area` VALUES ('1342', '1339', '庐江县', 'ah,ch,ljx', '341421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省巢湖市庐江县', '0565');
INSERT INTO `t_area` VALUES ('1343', '1339', '无为县', 'ah,ch,wwx', '341422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省巢湖市无为县', '0565');
INSERT INTO `t_area` VALUES ('1344', '1339', '含山县', 'ah,ch,hsx', '341423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省巢湖市含山县', '0565');
INSERT INTO `t_area` VALUES ('1345', '1339', '和县', 'ah,ch,hx', '341424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省巢湖市和县', '0565');
INSERT INTO `t_area` VALUES ('1346', '1236', '六安市', 'ah,la', '341500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省六安市', '0564');
INSERT INTO `t_area` VALUES ('1347', '1346', '市辖区', 'ah,la,sxq', '341501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省六安市市辖区', '0564');
INSERT INTO `t_area` VALUES ('1348', '1346', '金安区', 'ah,la,jaq', '341502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省六安市金安区', '0564');
INSERT INTO `t_area` VALUES ('1349', '1346', '裕安区', 'ah,la,yaq', '341503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省六安市裕安区', '0564');
INSERT INTO `t_area` VALUES ('135', '123', '津南区', 'tj,sxq,jnq', '120112', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区津南区', '022');
INSERT INTO `t_area` VALUES ('1350', '1346', '寿县', 'ah,la,sx', '341521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省六安市寿县', '0564');
INSERT INTO `t_area` VALUES ('1351', '1346', '霍邱县', 'ah,la,hqx', '341522', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省六安市霍邱县', '0564');
INSERT INTO `t_area` VALUES ('1352', '1346', '舒城县', 'ah,la,scx', '341523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省六安市舒城县', '0564');
INSERT INTO `t_area` VALUES ('1353', '1346', '金寨县', 'ah,la,jzx', '341524', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省六安市金寨县', '0564');
INSERT INTO `t_area` VALUES ('1354', '1346', '霍山县', 'ah,la,hsx', '341525', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省六安市霍山县', '0564');
INSERT INTO `t_area` VALUES ('1355', '1236', '亳州市', 'ah,bz', '341600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省亳州市', '0551');
INSERT INTO `t_area` VALUES ('1356', '1355', '市辖区', 'ah,bz,sxq', '341601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省亳州市市辖区', '0551');
INSERT INTO `t_area` VALUES ('1357', '1355', '谯城区', 'ah,bz,qcq', '341602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省亳州市谯城区', '0551');
INSERT INTO `t_area` VALUES ('1358', '1355', '涡阳县', 'ah,bz,wyx', '341621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省亳州市涡阳县', '0551');
INSERT INTO `t_area` VALUES ('1359', '1355', '蒙城县', 'ah,bz,mcx', '341622', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省亳州市蒙城县', '0551');
INSERT INTO `t_area` VALUES ('136', '123', '北辰区', 'tj,sxq,bcq', '120113', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区北辰区', '022');
INSERT INTO `t_area` VALUES ('1360', '1355', '利辛县', 'ah,bz,lxx', '341623', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省亳州市利辛县', '0551');
INSERT INTO `t_area` VALUES ('1361', '1236', '池州市', 'ah,cz', '341700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省池州市', '0551');
INSERT INTO `t_area` VALUES ('1362', '1361', '市辖区', 'ah,cz,sxq', '341701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省池州市市辖区', '0551');
INSERT INTO `t_area` VALUES ('1363', '1361', '贵池区', 'ah,cz,gcq', '341702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省池州市贵池区', '0566');
INSERT INTO `t_area` VALUES ('1364', '1361', '东至县', 'ah,cz,dzx', '341721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省池州市东至县', '0551');
INSERT INTO `t_area` VALUES ('1365', '1361', '石台县', 'ah,cz,stx', '341722', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省池州市石台县', '0551');
INSERT INTO `t_area` VALUES ('1366', '1361', '青阳县', 'ah,cz,qyx', '341723', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省池州市青阳县', '0551');
INSERT INTO `t_area` VALUES ('1367', '1236', '宣城市', 'ah,xc', '341800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宣城市', '0551');
INSERT INTO `t_area` VALUES ('1368', '1367', '市辖区', 'ah,xc,sxq', '341801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宣城市市辖区', '0551');
INSERT INTO `t_area` VALUES ('1369', '1367', '宣州区', 'ah,xc,xzq', '341802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宣城市宣州区', '0563');
INSERT INTO `t_area` VALUES ('137', '123', '武清区', 'tj,sxq,wqq', '120114', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区武清区', '022');
INSERT INTO `t_area` VALUES ('1370', '1367', '郎溪县', 'ah,xc,lxx', '341821', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宣城市郎溪县', '0551');
INSERT INTO `t_area` VALUES ('1371', '1367', '广德县', 'ah,xc,gdx', '341822', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宣城市广德县', '0551');
INSERT INTO `t_area` VALUES ('1372', '1367', '泾县', 'ah,xc,jx', '341823', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宣城市泾县', '0551');
INSERT INTO `t_area` VALUES ('1373', '1367', '绩溪县', 'ah,xc,jxx', '341824', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宣城市绩溪县', '0551');
INSERT INTO `t_area` VALUES ('1374', '1367', '旌德县', 'ah,xc,jdx', '341825', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宣城市旌德县', '0551');
INSERT INTO `t_area` VALUES ('1375', '1367', '宁国市', 'ah,xc,ng', '341881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '安徽省宣城市宁国市', '0551');
INSERT INTO `t_area` VALUES ('1376', '100', '福建省', 'fj', '350000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省', '0591');
INSERT INTO `t_area` VALUES ('1377', '1376', '福州市', 'fj,fz', '350100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市', '0591');
INSERT INTO `t_area` VALUES ('1378', '1377', '市辖区', 'fj,fz,sxq', '350101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市市辖区', '0591');
INSERT INTO `t_area` VALUES ('1379', '1377', '鼓楼区', 'fj,fz,glq', '350102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市鼓楼区', '0591');
INSERT INTO `t_area` VALUES ('138', '123', '宝坻区', 'tj,sxq,bcq', '120115', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市市辖区宝坻区', '022');
INSERT INTO `t_area` VALUES ('1380', '1377', '台江区', 'fj,fz,tjq', '350103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市台江区', '0591');
INSERT INTO `t_area` VALUES ('1381', '1377', '仓山区', 'fj,fz,csq', '350104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市仓山区', '0591');
INSERT INTO `t_area` VALUES ('1382', '1377', '马尾区', 'fj,fz,mwq', '350105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市马尾区', '0591');
INSERT INTO `t_area` VALUES ('1383', '1377', '晋安区', 'fj,fz,jaq', '350111', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市晋安区', '0591');
INSERT INTO `t_area` VALUES ('1384', '1377', '闽侯县', 'fj,fz,mhx', '350121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市闽侯县', '0591');
INSERT INTO `t_area` VALUES ('1385', '1377', '连江县', 'fj,fz,ljx', '350122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市连江县', '0591');
INSERT INTO `t_area` VALUES ('1386', '1377', '罗源县', 'fj,fz,lyx', '350123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市罗源县', '0591');
INSERT INTO `t_area` VALUES ('1387', '1377', '闽清县', 'fj,fz,mqx', '350124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市闽清县', '0591');
INSERT INTO `t_area` VALUES ('1388', '1377', '永泰县', 'fj,fz,ytx', '350125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市永泰县', '0591');
INSERT INTO `t_area` VALUES ('1389', '1377', '平潭县', 'fj,fz,ptx', '350128', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市平潭县', '0591');
INSERT INTO `t_area` VALUES ('1390', '1377', '福清市', 'fj,fz,fq', '350181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市福清市', '0591');
INSERT INTO `t_area` VALUES ('1391', '1377', '长乐市', 'fj,fz,cl', '350182', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省福州市长乐市', '0591');
INSERT INTO `t_area` VALUES ('1392', '1376', '厦门市', 'fj,xm', '350200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省厦门市', '0592');
INSERT INTO `t_area` VALUES ('1393', '1392', '市辖区', 'fj,xm,sxq', '350201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省厦门市市辖区', '0592');
INSERT INTO `t_area` VALUES ('1394', '1392', '思明区', 'fj,xm,smq', '350203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省厦门市思明区', '0592');
INSERT INTO `t_area` VALUES ('1395', '1392', '海沧区', 'fj,xm,hcq', '350205', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省厦门市海沧区', '0592');
INSERT INTO `t_area` VALUES ('1396', '1392', '湖里区', 'fj,xm,hlq', '350206', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省厦门市湖里区', '0592');
INSERT INTO `t_area` VALUES ('1397', '1392', '集美区', 'fj,xm,jmq', '350211', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省厦门市集美区', '0592');
INSERT INTO `t_area` VALUES ('1398', '1392', '同安区', 'fj,xm,taq', '350212', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省厦门市同安区', '0592');
INSERT INTO `t_area` VALUES ('1399', '1392', '翔安区', 'fj,xm,xaq', '350213', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省厦门市翔安区', '0592');
INSERT INTO `t_area` VALUES ('140', '123', '宁河县', 'tj,x,nhx', '120221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市县宁河县', '022');
INSERT INTO `t_area` VALUES ('1400', '1376', '莆田市', 'fj,pt', '350300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省莆田市', '0594');
INSERT INTO `t_area` VALUES ('1401', '1400', '市辖区', 'fj,pt,sxq', '350301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省莆田市市辖区', '0594');
INSERT INTO `t_area` VALUES ('1402', '1400', '城厢区', 'fj,pt,cxq', '350302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省莆田市城厢区', '0594');
INSERT INTO `t_area` VALUES ('1403', '1400', '涵江区', 'fj,pt,hjq', '350303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省莆田市涵江区', '0594');
INSERT INTO `t_area` VALUES ('1404', '1400', '荔城区', 'fj,pt,lcq', '350304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省莆田市荔城区', '0594');
INSERT INTO `t_area` VALUES ('1405', '1400', '秀屿区', 'fj,pt,xyq', '350305', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省莆田市秀屿区', '0594');
INSERT INTO `t_area` VALUES ('1406', '1400', '仙游县', 'fj,pt,xyx', '350322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省莆田市仙游县', '0594');
INSERT INTO `t_area` VALUES ('1407', '1376', '三明市', 'fj,sm', '350400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市', '0598');
INSERT INTO `t_area` VALUES ('1408', '1407', '市辖区', 'fj,sm,sxq', '350401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市市辖区', '0598');
INSERT INTO `t_area` VALUES ('1409', '1407', '梅列区', 'fj,sm,mlq', '350402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市梅列区', '0598');
INSERT INTO `t_area` VALUES ('141', '123', '静海县', 'tj,x,jhx', '120223', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市县静海县', '022');
INSERT INTO `t_area` VALUES ('1410', '1407', '三元区', 'fj,sm,syq', '350403', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市三元区', '0598');
INSERT INTO `t_area` VALUES ('1411', '1407', '明溪县', 'fj,sm,mxx', '350421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市明溪县', '0598');
INSERT INTO `t_area` VALUES ('1412', '1407', '清流县', 'fj,sm,qlx', '350423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市清流县', '0598');
INSERT INTO `t_area` VALUES ('1413', '1407', '宁化县', 'fj,sm,nhx', '350424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市宁化县', '0598');
INSERT INTO `t_area` VALUES ('1414', '1407', '大田县', 'fj,sm,dtx', '350425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市大田县', '0598');
INSERT INTO `t_area` VALUES ('1415', '1407', '尤溪县', 'fj,sm,yxx', '350426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市尤溪县', '0598');
INSERT INTO `t_area` VALUES ('1416', '1407', '沙县', 'fj,sm,sx', '350427', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市沙县', '0598');
INSERT INTO `t_area` VALUES ('1417', '1407', '将乐县', 'fj,sm,jlx', '350428', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市将乐县', '0598');
INSERT INTO `t_area` VALUES ('1418', '1407', '泰宁县', 'fj,sm,tnx', '350429', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市泰宁县', '0598');
INSERT INTO `t_area` VALUES ('1419', '1407', '建宁县', 'fj,sm,jnx', '350430', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市建宁县', '0598');
INSERT INTO `t_area` VALUES ('142', '123', '蓟县', 'tj,x,jx', '120225', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '天津市县蓟县', '022');
INSERT INTO `t_area` VALUES ('1420', '1407', '永安市', 'fj,sm,ya', '350481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省三明市永安市', '0598');
INSERT INTO `t_area` VALUES ('1421', '1376', '泉州市', 'fj,qz', '350500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市', '0595');
INSERT INTO `t_area` VALUES ('1422', '1421', '市辖区', 'fj,qz,sxq', '350501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市市辖区', '0595');
INSERT INTO `t_area` VALUES ('1423', '1421', '鲤城区', 'fj,qz,lcq', '350502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市鲤城区', '0595');
INSERT INTO `t_area` VALUES ('1424', '1421', '丰泽区', 'fj,qz,fzq', '350503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市丰泽区', '0595');
INSERT INTO `t_area` VALUES ('1425', '1421', '洛江区', 'fj,qz,ljq', '350504', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市洛江区', '0595');
INSERT INTO `t_area` VALUES ('1426', '1421', '泉港区', 'fj,qz,qgq', '350505', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市泉港区', '0595');
INSERT INTO `t_area` VALUES ('1427', '1421', '惠安县', 'fj,qz,hax', '350521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市惠安县', '0595');
INSERT INTO `t_area` VALUES ('1428', '1421', '安溪县', 'fj,qz,axx', '350524', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市安溪县', '0595');
INSERT INTO `t_area` VALUES ('1429', '1421', '永春县', 'fj,qz,ycx', '350525', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市永春县', '0595');
INSERT INTO `t_area` VALUES ('143', '100', '河北省', 'hb', '130000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省', '0311');
INSERT INTO `t_area` VALUES ('1430', '1421', '德化县', 'fj,qz,dhx', '350526', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市德化县', '0595');
INSERT INTO `t_area` VALUES ('1431', '1421', '金门县', 'fj,qz,jmx', '350527', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市金门县', '0595');
INSERT INTO `t_area` VALUES ('1432', '1421', '石狮市', 'fj,qz,ss', '350581', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市石狮市', '0595');
INSERT INTO `t_area` VALUES ('1433', '1421', '晋江市', 'fj,qz,jj', '350582', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市晋江市', '0595');
INSERT INTO `t_area` VALUES ('1434', '1421', '南安市', 'fj,qz,na', '350583', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省泉州市南安市', '0595');
INSERT INTO `t_area` VALUES ('1435', '1376', '漳州市', 'fj,zz', '350600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市', '0596');
INSERT INTO `t_area` VALUES ('1436', '1435', '市辖区', 'fj,zz,sxq', '350601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市市辖区', '0596');
INSERT INTO `t_area` VALUES ('1437', '1435', '芗城区', 'fj,zz,xcq', '350602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市芗城区', '0596');
INSERT INTO `t_area` VALUES ('1438', '1435', '龙文区', 'fj,zz,lwq', '350603', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市龙文区', '0596');
INSERT INTO `t_area` VALUES ('1439', '1435', '云霄县', 'fj,zz,yxx', '350622', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市云霄县', '0596');
INSERT INTO `t_area` VALUES ('144', '143', '石家庄市', 'hb,sjz', '130100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市', '0311');
INSERT INTO `t_area` VALUES ('1440', '1435', '漳浦县', 'fj,zz,zpx', '350623', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市漳浦县', '0596');
INSERT INTO `t_area` VALUES ('1441', '1435', '诏安县', 'fj,zz,zax', '350624', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市诏安县', '0596');
INSERT INTO `t_area` VALUES ('1442', '1435', '长泰县', 'fj,zz,ctx', '350625', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市长泰县', '0596');
INSERT INTO `t_area` VALUES ('1443', '1435', '东山县', 'fj,zz,dsx', '350626', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市东山县', '0596');
INSERT INTO `t_area` VALUES ('1444', '1435', '南靖县', 'fj,zz,njx', '350627', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市南靖县', '0596');
INSERT INTO `t_area` VALUES ('1445', '1435', '平和县', 'fj,zz,phx', '350628', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市平和县', '0596');
INSERT INTO `t_area` VALUES ('1446', '1435', '华安县', 'fj,zz,hax', '350629', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市华安县', '0596');
INSERT INTO `t_area` VALUES ('1447', '1435', '龙海市', 'fj,zz,lh', '350681', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省漳州市龙海市', '0596');
INSERT INTO `t_area` VALUES ('1448', '1376', '南平市', 'fj,np', '350700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市', '0599');
INSERT INTO `t_area` VALUES ('1449', '1448', '市辖区', 'fj,np,sxq', '350701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市市辖区', '0599');
INSERT INTO `t_area` VALUES ('145', '144', '市辖区', 'hb,sjz,sxq', '130101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市市辖区', '0311');
INSERT INTO `t_area` VALUES ('1450', '1448', '延平区', 'fj,np,ypq', '350702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市延平区', '0599');
INSERT INTO `t_area` VALUES ('1451', '1448', '顺昌县', 'fj,np,scx', '350721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市顺昌县', '0599');
INSERT INTO `t_area` VALUES ('1452', '1448', '浦城县', 'fj,np,pcx', '350722', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市浦城县', '0599');
INSERT INTO `t_area` VALUES ('1453', '1448', '光泽县', 'fj,np,gzx', '350723', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市光泽县', '0599');
INSERT INTO `t_area` VALUES ('1454', '1448', '松溪县', 'fj,np,sxx', '350724', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市松溪县', '0599');
INSERT INTO `t_area` VALUES ('1455', '1448', '政和县', 'fj,np,zhx', '350725', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市政和县', '0599');
INSERT INTO `t_area` VALUES ('1456', '1448', '邵武市', 'fj,np,sw', '350781', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市邵武市', '0599');
INSERT INTO `t_area` VALUES ('1457', '1448', '武夷山市', 'fj,np,wys', '350782', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市武夷山市', '0599');
INSERT INTO `t_area` VALUES ('1458', '1448', '建瓯市', 'fj,np,jo', '350783', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市建瓯市', '0599');
INSERT INTO `t_area` VALUES ('1459', '1448', '建阳市', 'fj,np,jy', '350784', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省南平市建阳市', '0599');
INSERT INTO `t_area` VALUES ('146', '144', '长安区', 'hb,sjz,caq', '130102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市长安区', '0311');
INSERT INTO `t_area` VALUES ('1460', '1376', '龙岩市', 'fj,ly', '350800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省龙岩市', '0597');
INSERT INTO `t_area` VALUES ('1461', '1460', '市辖区', 'fj,ly,sxq', '350801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省龙岩市市辖区', '0597');
INSERT INTO `t_area` VALUES ('1462', '1460', '新罗区', 'fj,ly,xlq', '350802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省龙岩市新罗区', '0597');
INSERT INTO `t_area` VALUES ('1463', '1460', '长汀县', 'fj,ly,ctx', '350821', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省龙岩市长汀县', '0597');
INSERT INTO `t_area` VALUES ('1464', '1460', '永定县', 'fj,ly,ydx', '350822', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省龙岩市永定县', '0597');
INSERT INTO `t_area` VALUES ('1465', '1460', '上杭县', 'fj,ly,shx', '350823', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省龙岩市上杭县', '0597');
INSERT INTO `t_area` VALUES ('1466', '1460', '武平县', 'fj,ly,wpx', '350824', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省龙岩市武平县', '0597');
INSERT INTO `t_area` VALUES ('1467', '1460', '连城县', 'fj,ly,lcx', '350825', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省龙岩市连城县', '0597');
INSERT INTO `t_area` VALUES ('1468', '1460', '漳平市', 'fj,ly,zp', '350881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省龙岩市漳平市', '0597');
INSERT INTO `t_area` VALUES ('1469', '1376', '宁德市', 'fj,nd', '350900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市', '0593');
INSERT INTO `t_area` VALUES ('147', '144', '桥东区', 'hb,sjz,qdq', '130103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市桥东区', '0311');
INSERT INTO `t_area` VALUES ('1470', '1469', '市辖区', 'fj,nd,sxq', '350901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市市辖区', '0593');
INSERT INTO `t_area` VALUES ('1471', '1469', '蕉城区', 'fj,nd,jcq', '350902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市蕉城区', '0593');
INSERT INTO `t_area` VALUES ('1472', '1469', '霞浦县', 'fj,nd,xpx', '350921', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市霞浦县', '0593');
INSERT INTO `t_area` VALUES ('1473', '1469', '古田县', 'fj,nd,gtx', '350922', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市古田县', '0593');
INSERT INTO `t_area` VALUES ('1474', '1469', '屏南县', 'fj,nd,pnx', '350923', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市屏南县', '0593');
INSERT INTO `t_area` VALUES ('1475', '1469', '寿宁县', 'fj,nd,snx', '350924', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市寿宁县', '0593');
INSERT INTO `t_area` VALUES ('1476', '1469', '周宁县', 'fj,nd,znx', '350925', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市周宁县', '0593');
INSERT INTO `t_area` VALUES ('1477', '1469', '柘荣县', 'fj,nd,zrx', '350926', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市柘荣县', '0593');
INSERT INTO `t_area` VALUES ('1478', '1469', '福安市', 'fj,nd,fa', '350981', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市福安市', '0593');
INSERT INTO `t_area` VALUES ('1479', '1469', '福鼎市', 'fj,nd,fd', '350982', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '福建省宁德市福鼎市', '0593');
INSERT INTO `t_area` VALUES ('148', '144', '桥西区', 'hb,sjz,qxq', '130104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市桥西区', '0311');
INSERT INTO `t_area` VALUES ('1480', '100', '江西省', 'jx', '360000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省', '0798');
INSERT INTO `t_area` VALUES ('1481', '1480', '南昌市', 'jx,nc', '360100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市', '0791');
INSERT INTO `t_area` VALUES ('1482', '1481', '市辖区', 'jx,nc,sxq', '360101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市市辖区', '0791');
INSERT INTO `t_area` VALUES ('1483', '1481', '东湖区', 'jx,nc,dhq', '360102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市东湖区', '0791');
INSERT INTO `t_area` VALUES ('1484', '1481', '西湖区', 'jx,nc,xhq', '360103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市西湖区', '0791');
INSERT INTO `t_area` VALUES ('1485', '1481', '青云谱区', 'jx,nc,qypq', '360104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市青云谱区', '0791');
INSERT INTO `t_area` VALUES ('1486', '1481', '湾里区', 'jx,nc,wlq', '360105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市湾里区', '0791');
INSERT INTO `t_area` VALUES ('1487', '1481', '青山湖区', 'jx,nc,qshq', '360111', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市青山湖区', '0791');
INSERT INTO `t_area` VALUES ('1488', '1481', '南昌县', 'jx,nc,ncx', '360121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市南昌县', '0791');
INSERT INTO `t_area` VALUES ('1489', '1481', '新建县', 'jx,nc,xjx', '360122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市新建县', '0791');
INSERT INTO `t_area` VALUES ('149', '144', '新华区', 'hb,sjz,xhq', '130105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市新华区', '0311');
INSERT INTO `t_area` VALUES ('1490', '1481', '安义县', 'jx,nc,ayx', '360123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市安义县', '0791');
INSERT INTO `t_area` VALUES ('1491', '1481', '进贤县', 'jx,nc,jxx', '360124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省南昌市进贤县', '0791');
INSERT INTO `t_area` VALUES ('1492', '1480', '景德镇市', 'jx,jdz', '360200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省景德镇市', '0798');
INSERT INTO `t_area` VALUES ('1493', '1492', '市辖区', 'jx,jdz,sxq', '360201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省景德镇市市辖区', '0798');
INSERT INTO `t_area` VALUES ('1494', '1492', '昌江区', 'jx,jdz,cjq', '360202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省景德镇市昌江区', '0798');
INSERT INTO `t_area` VALUES ('1495', '1492', '珠山区', 'jx,jdz,zsq', '360203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省景德镇市珠山区', '0798');
INSERT INTO `t_area` VALUES ('1496', '1492', '浮梁县', 'jx,jdz,flx', '360222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省景德镇市浮梁县', '0798');
INSERT INTO `t_area` VALUES ('1497', '1492', '乐平市', 'jx,jdz,lp', '360281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省景德镇市乐平市', '0798');
INSERT INTO `t_area` VALUES ('1498', '1480', '萍乡市', 'jx,px', '360300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省萍乡市', '0799');
INSERT INTO `t_area` VALUES ('1499', '1498', '市辖区', 'jx,px,sxq', '360301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省萍乡市市辖区', '0799');
INSERT INTO `t_area` VALUES ('150', '144', '井陉矿区', 'hb,sjz,jxkq', '130107', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市井陉矿区', '0311');
INSERT INTO `t_area` VALUES ('1500', '1498', '安源区', 'jx,px,ayq', '360302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省萍乡市安源区', '0799');
INSERT INTO `t_area` VALUES ('1501', '1498', '湘东区', 'jx,px,xdq', '360313', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省萍乡市湘东区', '0799');
INSERT INTO `t_area` VALUES ('1502', '1498', '莲花县', 'jx,px,lhx', '360321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省萍乡市莲花县', '0799');
INSERT INTO `t_area` VALUES ('1503', '1498', '上栗县', 'jx,px,slx', '360322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省萍乡市上栗县', '0799');
INSERT INTO `t_area` VALUES ('1504', '1498', '芦溪县', 'jx,px,lxx', '360323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省萍乡市芦溪县', '0799');
INSERT INTO `t_area` VALUES ('1505', '1480', '九江市', 'jx,jj', '360400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市', '0792');
INSERT INTO `t_area` VALUES ('1506', '1505', '市辖区', 'jx,jj,sxq', '360401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市市辖区', '0792');
INSERT INTO `t_area` VALUES ('1507', '1505', '庐山区', 'jx,jj,lsq', '360402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市庐山区', '0792');
INSERT INTO `t_area` VALUES ('1508', '1505', '浔阳区', 'jx,jj,xyq', '360403', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市浔阳区', '0792');
INSERT INTO `t_area` VALUES ('1509', '1505', '九江县', 'jx,jj,jjx', '360421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市九江县', '0792');
INSERT INTO `t_area` VALUES ('151', '144', '裕华区', 'hb,sjz,yhq', '130108', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市裕华区', '0311');
INSERT INTO `t_area` VALUES ('1510', '1505', '武宁县', 'jx,jj,wnx', '360423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市武宁县', '0792');
INSERT INTO `t_area` VALUES ('1511', '1505', '修水县', 'jx,jj,xsx', '360424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市修水县', '0792');
INSERT INTO `t_area` VALUES ('1512', '1505', '永修县', 'jx,jj,yxx', '360425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市永修县', '0792');
INSERT INTO `t_area` VALUES ('1513', '1505', '德安县', 'jx,jj,dax', '360426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市德安县', '0792');
INSERT INTO `t_area` VALUES ('1514', '1505', '星子县', 'jx,jj,xzx', '360427', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市星子县', '0792');
INSERT INTO `t_area` VALUES ('1515', '1505', '都昌县', 'jx,jj,dcx', '360428', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市都昌县', '0792');
INSERT INTO `t_area` VALUES ('1516', '1505', '湖口县', 'jx,jj,hkx', '360429', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市湖口县', '0792');
INSERT INTO `t_area` VALUES ('1517', '1505', '彭泽县', 'jx,jj,pzx', '360430', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市彭泽县', '0792');
INSERT INTO `t_area` VALUES ('1518', '1505', '瑞昌市', 'jx,jj,rc', '360481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省九江市瑞昌市', '0792');
INSERT INTO `t_area` VALUES ('1519', '1480', '新余市', 'jx,xy', '360500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省新余市', '0790');
INSERT INTO `t_area` VALUES ('152', '144', '井陉县', 'hb,sjz,jxx', '130121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市井陉县', '0311');
INSERT INTO `t_area` VALUES ('1520', '1519', '市辖区', 'jx,xy,sxq', '360501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省新余市市辖区', '0790');
INSERT INTO `t_area` VALUES ('1521', '1519', '渝水区', 'jx,xy,ysq', '360502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省新余市渝水区', '0790');
INSERT INTO `t_area` VALUES ('1522', '1519', '分宜县', 'jx,xy,fyx', '360521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省新余市分宜县', '0790');
INSERT INTO `t_area` VALUES ('1523', '1480', '鹰潭市', 'jx,yt', '360600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省鹰潭市', '0701');
INSERT INTO `t_area` VALUES ('1524', '1523', '市辖区', 'jx,yt,sxq', '360601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省鹰潭市市辖区', '0701');
INSERT INTO `t_area` VALUES ('1525', '1523', '月湖区', 'jx,yt,yhq', '360602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省鹰潭市月湖区', '0701');
INSERT INTO `t_area` VALUES ('1526', '1523', '余江县', 'jx,yt,yjx', '360622', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省鹰潭市余江县', '0701');
INSERT INTO `t_area` VALUES ('1527', '1523', '贵溪市', 'jx,yt,gx', '360681', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省鹰潭市贵溪市', '0701');
INSERT INTO `t_area` VALUES ('1528', '1480', '赣州市', 'jx,gz', '360700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市', '0797');
INSERT INTO `t_area` VALUES ('1529', '1528', '市辖区', 'jx,gz,sxq', '360701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市市辖区', '0797');
INSERT INTO `t_area` VALUES ('153', '144', '正定县', 'hb,sjz,zdx', '130123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市正定县', '0311');
INSERT INTO `t_area` VALUES ('1530', '1528', '章贡区', 'jx,gz,zgq', '360702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市章贡区', '0797');
INSERT INTO `t_area` VALUES ('1531', '1528', '赣县', 'jx,gz,gx', '360721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市赣县', '0797');
INSERT INTO `t_area` VALUES ('1532', '1528', '信丰县', 'jx,gz,xfx', '360722', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市信丰县', '0797');
INSERT INTO `t_area` VALUES ('1533', '1528', '大余县', 'jx,gz,dyx', '360723', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市大余县', '0797');
INSERT INTO `t_area` VALUES ('1534', '1528', '上犹县', 'jx,gz,syx', '360724', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市上犹县', '0797');
INSERT INTO `t_area` VALUES ('1535', '1528', '崇义县', 'jx,gz,cyx', '360725', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市崇义县', '0797');
INSERT INTO `t_area` VALUES ('1536', '1528', '安远县', 'jx,gz,ayx', '360726', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市安远县', '0797');
INSERT INTO `t_area` VALUES ('1537', '1528', '龙南县', 'jx,gz,lnx', '360727', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市龙南县', '0797');
INSERT INTO `t_area` VALUES ('1538', '1528', '定南县', 'jx,gz,dnx', '360728', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市定南县', '0797');
INSERT INTO `t_area` VALUES ('1539', '1528', '全南县', 'jx,gz,qnx', '360729', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市全南县', '0797');
INSERT INTO `t_area` VALUES ('154', '144', '栾城县', 'hb,sjz,lcx', '130124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市栾城县', '0311');
INSERT INTO `t_area` VALUES ('1540', '1528', '宁都县', 'jx,gz,ndx', '360730', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市宁都县', '0797');
INSERT INTO `t_area` VALUES ('1541', '1528', '于都县', 'jx,gz,ydx', '360731', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市于都县', '0797');
INSERT INTO `t_area` VALUES ('1542', '1528', '兴国县', 'jx,gz,xgx', '360732', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市兴国县', '0797');
INSERT INTO `t_area` VALUES ('1543', '1528', '会昌县', 'jx,gz,hcx', '360733', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市会昌县', '0797');
INSERT INTO `t_area` VALUES ('1544', '1528', '寻乌县', 'jx,gz,xwx', '360734', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市寻乌县', '0797');
INSERT INTO `t_area` VALUES ('1545', '1528', '石城县', 'jx,gz,scx', '360735', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市石城县', '0797');
INSERT INTO `t_area` VALUES ('1546', '1528', '瑞金市', 'jx,gz,rj', '360781', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市瑞金市', '0797');
INSERT INTO `t_area` VALUES ('1547', '1528', '南康市', 'jx,gz,nk', '360782', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省赣州市南康市', '0797');
INSERT INTO `t_area` VALUES ('1548', '1480', '吉安市', 'jx,ja', '360800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市', '0796');
INSERT INTO `t_area` VALUES ('1549', '1548', '市辖区', 'jx,ja,sxq', '360801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市市辖区', '0796');
INSERT INTO `t_area` VALUES ('155', '144', '行唐县', 'hb,sjz,xtx', '130125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市行唐县', '0311');
INSERT INTO `t_area` VALUES ('1550', '1548', '吉州区', 'jx,ja,jzq', '360802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市吉州区', '0796');
INSERT INTO `t_area` VALUES ('1551', '1548', '青原区', 'jx,ja,qyq', '360803', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市青原区', '0796');
INSERT INTO `t_area` VALUES ('1552', '1548', '吉安县', 'jx,ja,jax', '360821', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市吉安县', '0796');
INSERT INTO `t_area` VALUES ('1553', '1548', '吉水县', 'jx,ja,jsx', '360822', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市吉水县', '0796');
INSERT INTO `t_area` VALUES ('1554', '1548', '峡江县', 'jx,ja,xjx', '360823', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市峡江县', '0796');
INSERT INTO `t_area` VALUES ('1555', '1548', '新干县', 'jx,ja,xgx', '360824', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市新干县', '0796');
INSERT INTO `t_area` VALUES ('1556', '1548', '永丰县', 'jx,ja,yfx', '360825', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市永丰县', '0796');
INSERT INTO `t_area` VALUES ('1557', '1548', '泰和县', 'jx,ja,thx', '360826', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市泰和县', '0796');
INSERT INTO `t_area` VALUES ('1558', '1548', '遂川县', 'jx,ja,scx', '360827', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市遂川县', '0796');
INSERT INTO `t_area` VALUES ('1559', '1548', '万安县', 'jx,ja,wax', '360828', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市万安县', '0796');
INSERT INTO `t_area` VALUES ('156', '144', '灵寿县', 'hb,sjz,lsx', '130126', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市灵寿县', '0311');
INSERT INTO `t_area` VALUES ('1560', '1548', '安福县', 'jx,ja,afx', '360829', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市安福县', '0796');
INSERT INTO `t_area` VALUES ('1561', '1548', '永新县', 'jx,ja,yxx', '360830', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市永新县', '0796');
INSERT INTO `t_area` VALUES ('1562', '1548', '井冈山市', 'jx,ja,jgs', '360881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省吉安市井冈山市', '0796');
INSERT INTO `t_area` VALUES ('1563', '1480', '宜春市', 'jx,yc', '360900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市', '0795');
INSERT INTO `t_area` VALUES ('1564', '1563', '市辖区', 'jx,yc,sxq', '360901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市市辖区', '0795');
INSERT INTO `t_area` VALUES ('1565', '1563', '袁州区', 'jx,yc,yzq', '360902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市袁州区', '0795');
INSERT INTO `t_area` VALUES ('1566', '1563', '奉新县', 'jx,yc,fxx', '360921', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市奉新县', '0795');
INSERT INTO `t_area` VALUES ('1567', '1563', '万载县', 'jx,yc,wzx', '360922', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市万载县', '0795');
INSERT INTO `t_area` VALUES ('1568', '1563', '上高县', 'jx,yc,sgx', '360923', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市上高县', '0795');
INSERT INTO `t_area` VALUES ('1569', '1563', '宜丰县', 'jx,yc,yfx', '360924', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市宜丰县', '0795');
INSERT INTO `t_area` VALUES ('157', '144', '高邑县', 'hb,sjz,gyx', '130127', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市高邑县', '0311');
INSERT INTO `t_area` VALUES ('1570', '1563', '靖安县', 'jx,yc,jax', '360925', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市靖安县', '0795');
INSERT INTO `t_area` VALUES ('1571', '1563', '铜鼓县', 'jx,yc,tgx', '360926', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市铜鼓县', '0795');
INSERT INTO `t_area` VALUES ('1572', '1563', '丰城市', 'jx,yc,fc', '360981', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市丰城市', '0795');
INSERT INTO `t_area` VALUES ('1573', '1563', '樟树市', 'jx,yc,zs', '360982', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市樟树市', '0795');
INSERT INTO `t_area` VALUES ('1574', '1563', '高安市', 'jx,yc,ga', '360983', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省宜春市高安市', '0795');
INSERT INTO `t_area` VALUES ('1575', '1480', '抚州市', 'jx,fz', '361000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市', '0798');
INSERT INTO `t_area` VALUES ('1576', '1575', '市辖区', 'jx,fz,sxq', '361001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市市辖区', '0798');
INSERT INTO `t_area` VALUES ('1577', '1575', '临川区', 'jx,fz,lcq', '361002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市临川区', '0794');
INSERT INTO `t_area` VALUES ('1578', '1575', '南城县', 'jx,fz,ncx', '361021', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市南城县', '0798');
INSERT INTO `t_area` VALUES ('1579', '1575', '黎川县', 'jx,fz,lcx', '361022', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市黎川县', '0798');
INSERT INTO `t_area` VALUES ('158', '144', '深泽县', 'hb,sjz,szx', '130128', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市深泽县', '0311');
INSERT INTO `t_area` VALUES ('1580', '1575', '南丰县', 'jx,fz,nfx', '361023', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市南丰县', '0798');
INSERT INTO `t_area` VALUES ('1581', '1575', '崇仁县', 'jx,fz,crx', '361024', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市崇仁县', '0798');
INSERT INTO `t_area` VALUES ('1582', '1575', '乐安县', 'jx,fz,lax', '361025', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市乐安县', '0798');
INSERT INTO `t_area` VALUES ('1583', '1575', '宜黄县', 'jx,fz,yhx', '361026', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市宜黄县', '0798');
INSERT INTO `t_area` VALUES ('1584', '1575', '金溪县', 'jx,fz,jxx', '361027', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市金溪县', '0798');
INSERT INTO `t_area` VALUES ('1585', '1575', '资溪县', 'jx,fz,zxx', '361028', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市资溪县', '0798');
INSERT INTO `t_area` VALUES ('1586', '1575', '东乡县', 'jx,fz,dxx', '361029', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市东乡县', '0798');
INSERT INTO `t_area` VALUES ('1587', '1575', '广昌县', 'jx,fz,gcx', '361030', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省抚州市广昌县', '0798');
INSERT INTO `t_area` VALUES ('1588', '1480', '上饶市', 'jx,sr', '361100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市', '0793');
INSERT INTO `t_area` VALUES ('1589', '1588', '市辖区', 'jx,sr,sxq', '361101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市市辖区', '0793');
INSERT INTO `t_area` VALUES ('159', '144', '赞皇县', 'hb,sjz,zhx', '130129', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市赞皇县', '0311');
INSERT INTO `t_area` VALUES ('1590', '1588', '信州区', 'jx,sr,xzq', '361102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市信州区', '0793');
INSERT INTO `t_area` VALUES ('1591', '1588', '上饶县', 'jx,sr,srx', '361121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市上饶县', '0793');
INSERT INTO `t_area` VALUES ('1592', '1588', '广丰县', 'jx,sr,gfx', '361122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市广丰县', '0793');
INSERT INTO `t_area` VALUES ('1593', '1588', '玉山县', 'jx,sr,ysx', '361123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市玉山县', '0793');
INSERT INTO `t_area` VALUES ('1594', '1588', '铅山县', 'jx,sr,qsx', '361124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市铅山县', '0793');
INSERT INTO `t_area` VALUES ('1595', '1588', '横峰县', 'jx,sr,hfx', '361125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市横峰县', '0793');
INSERT INTO `t_area` VALUES ('1596', '1588', '弋阳县', 'jx,sr,yyx', '361126', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市弋阳县', '0793');
INSERT INTO `t_area` VALUES ('1597', '1588', '余干县', 'jx,sr,ygx', '361127', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市余干县', '0793');
INSERT INTO `t_area` VALUES ('1598', '1588', '鄱阳县', 'jx,sr,pyx', '361128', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市鄱阳县', '0793');
INSERT INTO `t_area` VALUES ('1599', '1588', '万年县', 'jx,sr,wnx', '361129', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市万年县', '0793');
INSERT INTO `t_area` VALUES ('160', '144', '无极县', 'hb,sjz,wjx', '130130', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市无极县', '0311');
INSERT INTO `t_area` VALUES ('1600', '1588', '婺源县', 'jx,sr,wyx', '361130', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市婺源县', '0793');
INSERT INTO `t_area` VALUES ('1601', '1588', '德兴市', 'jx,sr,dx', '361181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '江西省上饶市德兴市', '0793');
INSERT INTO `t_area` VALUES ('1602', '100', '山东省', 'sd', '370000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省', '0534');
INSERT INTO `t_area` VALUES ('1603', '1602', '济南市', 'sd,jn', '370100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市', '0531');
INSERT INTO `t_area` VALUES ('1604', '1603', '市辖区', 'sd,jn,sxq', '370101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市市辖区', '0531');
INSERT INTO `t_area` VALUES ('1605', '1603', '历下区', 'sd,jn,lxq', '370102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市历下区', '0531');
INSERT INTO `t_area` VALUES ('1606', '1603', '市中区', 'sd,jn,szq', '370103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市市中区', '0531');
INSERT INTO `t_area` VALUES ('1607', '1603', '槐荫区', 'sd,jn,hyq', '370104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市槐荫区', '0531');
INSERT INTO `t_area` VALUES ('1608', '1603', '天桥区', 'sd,jn,tqq', '370105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市天桥区', '0531');
INSERT INTO `t_area` VALUES ('1609', '1603', '历城区', 'sd,jn,lcq', '370112', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市历城区', '0531');
INSERT INTO `t_area` VALUES ('161', '144', '平山县', 'hb,sjz,psx', '130131', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市平山县', '0311');
INSERT INTO `t_area` VALUES ('1610', '1603', '长清区', 'sd,jn,cqq', '370113', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市长清区', '0531');
INSERT INTO `t_area` VALUES ('1611', '1603', '平阴县', 'sd,jn,pyx', '370124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市平阴县', '0531');
INSERT INTO `t_area` VALUES ('1612', '1603', '济阳县', 'sd,jn,jyx', '370125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市济阳县', '0531');
INSERT INTO `t_area` VALUES ('1613', '1603', '商河县', 'sd,jn,shx', '370126', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市商河县', '0531');
INSERT INTO `t_area` VALUES ('1614', '1603', '章丘市', 'sd,jn,zq', '370181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济南市章丘市', '0531');
INSERT INTO `t_area` VALUES ('1615', '1602', '青岛市', 'sd,qd', '370200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市', '0532');
INSERT INTO `t_area` VALUES ('1616', '1615', '市辖区', 'sd,qd,sxq', '370201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市市辖区', '0532');
INSERT INTO `t_area` VALUES ('1617', '1615', '市南区', 'sd,qd,snq', '370202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市市南区', '0532');
INSERT INTO `t_area` VALUES ('1618', '1615', '市北区', 'sd,qd,sbq', '370203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市市北区', '0532');
INSERT INTO `t_area` VALUES ('1619', '1615', '四方区', 'sd,qd,sfq', '370205', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市四方区', '0532');
INSERT INTO `t_area` VALUES ('162', '144', '元氏县', 'hb,sjz,ysx', '130132', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市元氏县', '0311');
INSERT INTO `t_area` VALUES ('1620', '1615', '黄岛区', 'sd,qd,hdq', '370211', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市黄岛区', '0532');
INSERT INTO `t_area` VALUES ('1621', '1615', '崂山区', 'sd,qd,lsq', '370212', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市崂山区', '0532');
INSERT INTO `t_area` VALUES ('1622', '1615', '李沧区', 'sd,qd,lcq', '370213', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市李沧区', '0532');
INSERT INTO `t_area` VALUES ('1623', '1615', '城阳区', 'sd,qd,cyq', '370214', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市城阳区', '0532');
INSERT INTO `t_area` VALUES ('1624', '1615', '胶州市', 'sd,qd,jz', '370281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市胶州市', '0532');
INSERT INTO `t_area` VALUES ('1625', '1615', '即墨市', 'sd,qd,jm', '370282', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市即墨市', '0532');
INSERT INTO `t_area` VALUES ('1626', '1615', '平度市', 'sd,qd,pd', '370283', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市平度市', '0532');
INSERT INTO `t_area` VALUES ('1627', '1615', '胶南市', 'sd,qd,jn', '370284', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市胶南市', '0532');
INSERT INTO `t_area` VALUES ('1628', '1615', '莱西市', 'sd,qd,lx', '370285', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省青岛市莱西市', '0532');
INSERT INTO `t_area` VALUES ('1629', '1602', '淄博市', 'sd,zb', '370300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省淄博市', '0533');
INSERT INTO `t_area` VALUES ('163', '144', '赵县', 'hb,sjz,zx', '130133', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市赵县', '0311');
INSERT INTO `t_area` VALUES ('1630', '1629', '市辖区', 'sd,zb,sxq', '370301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省淄博市市辖区', '0533');
INSERT INTO `t_area` VALUES ('1631', '1629', '淄川区', 'sd,zb,zcq', '370302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省淄博市淄川区', '0533');
INSERT INTO `t_area` VALUES ('1632', '1629', '张店区', 'sd,zb,zdq', '370303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省淄博市张店区', '0533');
INSERT INTO `t_area` VALUES ('1633', '1629', '博山区', 'sd,zb,bsq', '370304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省淄博市博山区', '0533');
INSERT INTO `t_area` VALUES ('1634', '1629', '临淄区', 'sd,zb,lzq', '370305', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省淄博市临淄区', '0533');
INSERT INTO `t_area` VALUES ('1635', '1629', '周村区', 'sd,zb,zcq', '370306', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省淄博市周村区', '0533');
INSERT INTO `t_area` VALUES ('1636', '1629', '桓台县', 'sd,zb,htx', '370321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省淄博市桓台县', '0533');
INSERT INTO `t_area` VALUES ('1637', '1629', '高青县', 'sd,zb,gqx', '370322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省淄博市高青县', '0533');
INSERT INTO `t_area` VALUES ('1638', '1629', '沂源县', 'sd,zb,yyx', '370323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省淄博市沂源县', '0533');
INSERT INTO `t_area` VALUES ('1639', '1602', '枣庄市', 'sd,zz', '370400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省枣庄市', '0632');
INSERT INTO `t_area` VALUES ('164', '144', '辛集市', 'hb,sjz,xj', '130181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市辛集市', '0311');
INSERT INTO `t_area` VALUES ('1640', '1639', '市辖区', 'sd,zz,sxq', '370401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省枣庄市市辖区', '0632');
INSERT INTO `t_area` VALUES ('1641', '1639', '市中区', 'sd,zz,szq', '370402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省枣庄市市中区', '0632');
INSERT INTO `t_area` VALUES ('1642', '1639', '薛城区', 'sd,zz,xcq', '370403', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省枣庄市薛城区', '0632');
INSERT INTO `t_area` VALUES ('1643', '1639', '峄城区', 'sd,zz,ycq', '370404', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省枣庄市峄城区', '0632');
INSERT INTO `t_area` VALUES ('1644', '1639', '台儿庄区', 'sd,zz,tezq', '370405', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省枣庄市台儿庄区', '0632');
INSERT INTO `t_area` VALUES ('1645', '1639', '山亭区', 'sd,zz,stq', '370406', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省枣庄市山亭区', '0632');
INSERT INTO `t_area` VALUES ('1646', '1639', '滕州市', 'sd,zz,tz', '370481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省枣庄市滕州市', '0632');
INSERT INTO `t_area` VALUES ('1647', '1602', '东营市', 'sd,dy', '370500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省东营市', '0546');
INSERT INTO `t_area` VALUES ('1648', '1647', '市辖区', 'sd,dy,sxq', '370501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省东营市市辖区', '0546');
INSERT INTO `t_area` VALUES ('1649', '1647', '东营区', 'sd,dy,dyq', '370502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省东营市东营区', '0546');
INSERT INTO `t_area` VALUES ('165', '144', '藁城市', 'hb,sjz,gc', '130182', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市藁城市', '0311');
INSERT INTO `t_area` VALUES ('1650', '1647', '河口区', 'sd,dy,hkq', '370503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省东营市河口区', '0546');
INSERT INTO `t_area` VALUES ('1651', '1647', '垦利县', 'sd,dy,klx', '370521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省东营市垦利县', '0546');
INSERT INTO `t_area` VALUES ('1652', '1647', '利津县', 'sd,dy,ljx', '370522', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省东营市利津县', '0546');
INSERT INTO `t_area` VALUES ('1653', '1647', '广饶县', 'sd,dy,grx', '370523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省东营市广饶县', '0546');
INSERT INTO `t_area` VALUES ('1654', '1602', '烟台市', 'sd,yt', '370600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市', '0535');
INSERT INTO `t_area` VALUES ('1655', '1654', '市辖区', 'sd,yt,sxq', '370601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市市辖区', '0535');
INSERT INTO `t_area` VALUES ('1656', '1654', '芝罘区', 'sd,yt,zfq', '370602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市芝罘区', '0535');
INSERT INTO `t_area` VALUES ('1657', '1654', '福山区', 'sd,yt,fsq', '370611', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市福山区', '0535');
INSERT INTO `t_area` VALUES ('1658', '1654', '牟平区', 'sd,yt,mpq', '370612', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市牟平区', '0535');
INSERT INTO `t_area` VALUES ('1659', '1654', '莱山区', 'sd,yt,lsq', '370613', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市莱山区', '0535');
INSERT INTO `t_area` VALUES ('166', '144', '晋州市', 'hb,sjz,jz', '130183', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市晋州市', '0311');
INSERT INTO `t_area` VALUES ('1660', '1654', '长岛县', 'sd,yt,cdx', '370634', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市长岛县', '0535');
INSERT INTO `t_area` VALUES ('1661', '1654', '龙口市', 'sd,yt,lk', '370681', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市龙口市', '0535');
INSERT INTO `t_area` VALUES ('1662', '1654', '莱阳市', 'sd,yt,ly', '370682', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市莱阳市', '0535');
INSERT INTO `t_area` VALUES ('1663', '1654', '莱州市', 'sd,yt,lz', '370683', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市莱州市', '0535');
INSERT INTO `t_area` VALUES ('1664', '1654', '蓬莱市', 'sd,yt,pl', '370684', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市蓬莱市', '0535');
INSERT INTO `t_area` VALUES ('1665', '1654', '招远市', 'sd,yt,zy', '370685', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市招远市', '0535');
INSERT INTO `t_area` VALUES ('1666', '1654', '栖霞市', 'sd,yt,qx', '370686', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市栖霞市', '0535');
INSERT INTO `t_area` VALUES ('1667', '1654', '海阳市', 'sd,yt,hy', '370687', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省烟台市海阳市', '0535');
INSERT INTO `t_area` VALUES ('1668', '1602', '潍坊市', 'sd,wf', '370700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市', '0536');
INSERT INTO `t_area` VALUES ('1669', '1668', '市辖区', 'sd,wf,sxq', '370701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市市辖区', '0536');
INSERT INTO `t_area` VALUES ('167', '144', '新乐市', 'hb,sjz,xl', '130184', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市新乐市', '0311');
INSERT INTO `t_area` VALUES ('1670', '1668', '潍城区', 'sd,wf,wcq', '370702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市潍城区', '0536');
INSERT INTO `t_area` VALUES ('1671', '1668', '寒亭区', 'sd,wf,htq', '370703', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市寒亭区', '0536');
INSERT INTO `t_area` VALUES ('1672', '1668', '坊子区', 'sd,wf,fzq', '370704', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市坊子区', '0536');
INSERT INTO `t_area` VALUES ('1673', '1668', '奎文区', 'sd,wf,kwq', '370705', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市奎文区', '0536');
INSERT INTO `t_area` VALUES ('1674', '1668', '临朐县', 'sd,wf,lqx', '370724', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市临朐县', '0536');
INSERT INTO `t_area` VALUES ('1675', '1668', '昌乐县', 'sd,wf,clx', '370725', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市昌乐县', '0536');
INSERT INTO `t_area` VALUES ('1676', '1668', '青州市', 'sd,wf,qz', '370781', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市青州市', '0536');
INSERT INTO `t_area` VALUES ('1677', '1668', '诸城市', 'sd,wf,zc', '370782', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市诸城市', '0536');
INSERT INTO `t_area` VALUES ('1678', '1668', '寿光市', 'sd,wf,sg', '370783', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市寿光市', '0536');
INSERT INTO `t_area` VALUES ('1679', '1668', '安丘市', 'sd,wf,aq', '370784', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市安丘市', '0536');
INSERT INTO `t_area` VALUES ('168', '144', '鹿泉市', 'hb,sjz,lq', '130185', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省石家庄市鹿泉市', '0311');
INSERT INTO `t_area` VALUES ('1680', '1668', '高密市', 'sd,wf,gm', '370785', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市高密市', '0536');
INSERT INTO `t_area` VALUES ('1681', '1668', '昌邑市', 'sd,wf,cy', '370786', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省潍坊市昌邑市', '0536');
INSERT INTO `t_area` VALUES ('1682', '1602', '济宁市', 'sd,jn', '370800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市', '0537');
INSERT INTO `t_area` VALUES ('1683', '1682', '市辖区', 'sd,jn,sxq', '370801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市市辖区', '0537');
INSERT INTO `t_area` VALUES ('1684', '1682', '市中区', 'sd,jn,szq', '370802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市市中区', '0537');
INSERT INTO `t_area` VALUES ('1685', '1682', '任城区', 'sd,jn,rcq', '370811', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市任城区', '0537');
INSERT INTO `t_area` VALUES ('1686', '1682', '微山县', 'sd,jn,wsx', '370826', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市微山县', '0537');
INSERT INTO `t_area` VALUES ('1687', '1682', '鱼台县', 'sd,jn,ytx', '370827', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市鱼台县', '0537');
INSERT INTO `t_area` VALUES ('1688', '1682', '金乡县', 'sd,jn,jxx', '370828', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市金乡县', '0537');
INSERT INTO `t_area` VALUES ('1689', '1682', '嘉祥县', 'sd,jn,jxx', '370829', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市嘉祥县', '0537');
INSERT INTO `t_area` VALUES ('169', '143', '唐山市', 'hb,ts', '130200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市', '0315');
INSERT INTO `t_area` VALUES ('1690', '1682', '汶上县', 'sd,jn,wsx', '370830', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市汶上县', '0537');
INSERT INTO `t_area` VALUES ('1691', '1682', '泗水县', 'sd,jn,ssx', '370831', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市泗水县', '0537');
INSERT INTO `t_area` VALUES ('1692', '1682', '梁山县', 'sd,jn,lsx', '370832', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市梁山县', '0537');
INSERT INTO `t_area` VALUES ('1693', '1682', '曲阜市', 'sd,jn,qf', '370881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市曲阜市', '0537');
INSERT INTO `t_area` VALUES ('1694', '1682', '兖州市', 'sd,jn,yz', '370882', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市兖州市', '0537');
INSERT INTO `t_area` VALUES ('1695', '1682', '邹城市', 'sd,jn,zc', '370883', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省济宁市邹城市', '0537');
INSERT INTO `t_area` VALUES ('1696', '1602', '泰安市', 'sd,ta', '370900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省泰安市', '0538');
INSERT INTO `t_area` VALUES ('1697', '1696', '市辖区', 'sd,ta,sxq', '370901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省泰安市市辖区', '0538');
INSERT INTO `t_area` VALUES ('1698', '1696', '泰山区', 'sd,ta,tsq', '370902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省泰安市泰山区', '0538');
INSERT INTO `t_area` VALUES ('1699', '1696', '岱岳区(**)', 'sd,ta,dyq(**)', '370911', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省泰安市岱岳区(**)', '0538');
INSERT INTO `t_area` VALUES ('170', '169', '市辖区', 'hb,ts,sxq', '130201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市市辖区', '0315');
INSERT INTO `t_area` VALUES ('1700', '1696', '宁阳县', 'sd,ta,nyx', '370921', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省泰安市宁阳县', '0538');
INSERT INTO `t_area` VALUES ('1701', '1696', '东平县', 'sd,ta,dpx', '370923', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省泰安市东平县', '0538');
INSERT INTO `t_area` VALUES ('1702', '1696', '新泰市', 'sd,ta,xt', '370982', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省泰安市新泰市', '0538');
INSERT INTO `t_area` VALUES ('1703', '1696', '肥城市', 'sd,ta,fc', '370983', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省泰安市肥城市', '0538');
INSERT INTO `t_area` VALUES ('1704', '1602', '威海市', 'sd,wh', '371000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省威海市', '0631');
INSERT INTO `t_area` VALUES ('1705', '1704', '市辖区', 'sd,wh,sxq', '371001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省威海市市辖区', '0631');
INSERT INTO `t_area` VALUES ('1706', '1704', '环翠区', 'sd,wh,hcq', '371002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省威海市环翠区', '0631');
INSERT INTO `t_area` VALUES ('1707', '1704', '文登市', 'sd,wh,wd', '371081', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省威海市文登市', '0631');
INSERT INTO `t_area` VALUES ('1708', '1704', '荣成市', 'sd,wh,rc', '371082', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省威海市荣成市', '0631');
INSERT INTO `t_area` VALUES ('1709', '1704', '乳山市', 'sd,wh,rs', '371083', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省威海市乳山市', '0631');
INSERT INTO `t_area` VALUES ('171', '169', '路南区', 'hb,ts,lnq', '130202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市路南区', '0315');
INSERT INTO `t_area` VALUES ('1710', '1602', '日照市', 'sd,rz', '371100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省日照市', '0633');
INSERT INTO `t_area` VALUES ('1711', '1710', '市辖区', 'sd,rz,sxq', '371101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省日照市市辖区', '0633');
INSERT INTO `t_area` VALUES ('1712', '1710', '东港区', 'sd,rz,dgq', '371102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省日照市东港区', '0633');
INSERT INTO `t_area` VALUES ('1713', '1710', '岚山区', 'sd,rz,lsq', '371103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省日照市岚山区', '0633');
INSERT INTO `t_area` VALUES ('1714', '1710', '五莲县', 'sd,rz,wlx', '371121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省日照市五莲县', '0633');
INSERT INTO `t_area` VALUES ('1715', '1710', '莒县', 'sd,rz,jx', '371122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省日照市莒县', '0633');
INSERT INTO `t_area` VALUES ('1716', '1602', '莱芜市', 'sd,lw', '371200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省莱芜市', '0634');
INSERT INTO `t_area` VALUES ('1717', '1716', '市辖区', 'sd,lw,sxq', '371201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省莱芜市市辖区', '0634');
INSERT INTO `t_area` VALUES ('1718', '1716', '莱城区', 'sd,lw,lcq', '371202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省莱芜市莱城区', '0634');
INSERT INTO `t_area` VALUES ('1719', '1716', '钢城区', 'sd,lw,gcq', '371203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省莱芜市钢城区', '0634');
INSERT INTO `t_area` VALUES ('172', '169', '路北区', 'hb,ts,lbq', '130203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市路北区', '0315');
INSERT INTO `t_area` VALUES ('1720', '1602', '临沂市', 'sd,ly', '371300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市', '0539');
INSERT INTO `t_area` VALUES ('1721', '1720', '市辖区', 'sd,ly,sxq', '371301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市市辖区', '0539');
INSERT INTO `t_area` VALUES ('1722', '1720', '兰山区', 'sd,ly,lsq', '371302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市兰山区', '0539');
INSERT INTO `t_area` VALUES ('1723', '1720', '罗庄区', 'sd,ly,lzq', '371311', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市罗庄区', '0539');
INSERT INTO `t_area` VALUES ('1724', '1720', '河东区', 'sd,ly,hdq', '371312', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市河东区', '0539');
INSERT INTO `t_area` VALUES ('1725', '1720', '沂南县', 'sd,ly,ynx', '371321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市沂南县', '0539');
INSERT INTO `t_area` VALUES ('1726', '1720', '郯城县', 'sd,ly,tcx', '371322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市郯城县', '0539');
INSERT INTO `t_area` VALUES ('1727', '1720', '沂水县', 'sd,ly,ysx', '371323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市沂水县', '0539');
INSERT INTO `t_area` VALUES ('1728', '1720', '苍山县', 'sd,ly,csx', '371324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市苍山县', '0539');
INSERT INTO `t_area` VALUES ('1729', '1720', '费县', 'sd,ly,fx', '371325', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市费县', '0539');
INSERT INTO `t_area` VALUES ('173', '169', '古冶区', 'hb,ts,gyq', '130204', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市古冶区', '0315');
INSERT INTO `t_area` VALUES ('1730', '1720', '平邑县', 'sd,ly,pyx', '371326', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市平邑县', '0539');
INSERT INTO `t_area` VALUES ('1731', '1720', '莒南县', 'sd,ly,jnx', '371327', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市莒南县', '0539');
INSERT INTO `t_area` VALUES ('1732', '1720', '蒙阴县', 'sd,ly,myx', '371328', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市蒙阴县', '0539');
INSERT INTO `t_area` VALUES ('1733', '1720', '临沭县', 'sd,ly,lsx', '371329', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省临沂市临沭县', '0539');
INSERT INTO `t_area` VALUES ('1734', '1602', '德州市', 'sd,dz', '371400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市', '0534');
INSERT INTO `t_area` VALUES ('1735', '1734', '市辖区', 'sd,dz,sxq', '371401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市市辖区', '0534');
INSERT INTO `t_area` VALUES ('1736', '1734', '德城区', 'sd,dz,dcq', '371402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市德城区', '0534');
INSERT INTO `t_area` VALUES ('1737', '1734', '陵县', 'sd,dz,lx', '371421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市陵县', '0534');
INSERT INTO `t_area` VALUES ('1738', '1734', '宁津县', 'sd,dz,njx', '371422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市宁津县', '0534');
INSERT INTO `t_area` VALUES ('1739', '1734', '庆云县', 'sd,dz,qyx', '371423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市庆云县', '0534');
INSERT INTO `t_area` VALUES ('174', '169', '开平区', 'hb,ts,kpq', '130205', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市开平区', '0315');
INSERT INTO `t_area` VALUES ('1740', '1734', '临邑县', 'sd,dz,lyx', '371424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市临邑县', '0534');
INSERT INTO `t_area` VALUES ('1741', '1734', '齐河县', 'sd,dz,qhx', '371425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市齐河县', '0534');
INSERT INTO `t_area` VALUES ('1742', '1734', '平原县', 'sd,dz,pyx', '371426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市平原县', '0534');
INSERT INTO `t_area` VALUES ('1743', '1734', '夏津县', 'sd,dz,xjx', '371427', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市夏津县', '0534');
INSERT INTO `t_area` VALUES ('1744', '1734', '武城县', 'sd,dz,wcx', '371428', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市武城县', '0534');
INSERT INTO `t_area` VALUES ('1745', '1734', '乐陵市', 'sd,dz,ll', '371481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市乐陵市', '0534');
INSERT INTO `t_area` VALUES ('1746', '1734', '禹城市', 'sd,dz,yc', '371482', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省德州市禹城市', '0534');
INSERT INTO `t_area` VALUES ('1747', '1602', '聊城市', 'sd,lc', '371500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省聊城市', '0635');
INSERT INTO `t_area` VALUES ('1748', '1747', '市辖区', 'sd,lc,sxq', '371501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省聊城市市辖区', '0635');
INSERT INTO `t_area` VALUES ('1749', '1747', '东昌府区', 'sd,lc,dcfq', '371502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省聊城市东昌府区', '0635');
INSERT INTO `t_area` VALUES ('175', '169', '丰南区', 'hb,ts,fnq', '130207', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市丰南区', '0315');
INSERT INTO `t_area` VALUES ('1750', '1747', '阳谷县', 'sd,lc,ygx', '371521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省聊城市阳谷县', '0635');
INSERT INTO `t_area` VALUES ('1751', '1747', '莘县', 'sd,lc,sx', '371522', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省聊城市莘县', '0635');
INSERT INTO `t_area` VALUES ('1752', '1747', '茌平县', 'sd,lc,cpx', '371523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省聊城市茌平县', '0635');
INSERT INTO `t_area` VALUES ('1753', '1747', '东阿县', 'sd,lc,dax', '371524', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省聊城市东阿县', '0635');
INSERT INTO `t_area` VALUES ('1754', '1747', '冠县', 'sd,lc,gx', '371525', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省聊城市冠县', '0635');
INSERT INTO `t_area` VALUES ('1755', '1747', '高唐县', 'sd,lc,gtx', '371526', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省聊城市高唐县', '0635');
INSERT INTO `t_area` VALUES ('1756', '1747', '临清市', 'sd,lc,lq', '371581', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省聊城市临清市', '0635');
INSERT INTO `t_area` VALUES ('1757', '1602', '滨州市', 'sd,bz', '371600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省滨州市', '0543');
INSERT INTO `t_area` VALUES ('1758', '1757', '市辖区', 'sd,bz,sxq', '371601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省滨州市市辖区', '0543');
INSERT INTO `t_area` VALUES ('1759', '1757', '滨城区', 'sd,bz,bcq', '371602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省滨州市滨城区', '0543');
INSERT INTO `t_area` VALUES ('176', '169', '丰润区', 'hb,ts,frq', '130208', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市丰润区', '0315');
INSERT INTO `t_area` VALUES ('1760', '1757', '惠民县', 'sd,bz,hmx', '371621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省滨州市惠民县', '0543');
INSERT INTO `t_area` VALUES ('1761', '1757', '阳信县', 'sd,bz,yxx', '371622', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省滨州市阳信县', '0543');
INSERT INTO `t_area` VALUES ('1762', '1757', '无棣县', 'sd,bz,wdx', '371623', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省滨州市无棣县', '0543');
INSERT INTO `t_area` VALUES ('1763', '1757', '沾化县', 'sd,bz,zhx', '371624', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省滨州市沾化县', '0543');
INSERT INTO `t_area` VALUES ('1764', '1757', '博兴县', 'sd,bz,bxx', '371625', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省滨州市博兴县', '0543');
INSERT INTO `t_area` VALUES ('1765', '1757', '邹平县', 'sd,bz,zpx', '371626', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省滨州市邹平县', '0543');
INSERT INTO `t_area` VALUES ('1766', '1602', '菏泽市', 'sd,hz', '371700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市', '0530');
INSERT INTO `t_area` VALUES ('1767', '1766', '市辖区', 'sd,hz,sxq', '371701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市市辖区', '0530');
INSERT INTO `t_area` VALUES ('1768', '1766', '牡丹区', 'sd,hz,mdq', '371702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市牡丹区', '0530');
INSERT INTO `t_area` VALUES ('1769', '1766', '曹县', 'sd,hz,cx', '371721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市曹县', '0530');
INSERT INTO `t_area` VALUES ('177', '169', '滦县', 'hb,ts,lx', '130223', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市滦县', '0315');
INSERT INTO `t_area` VALUES ('1770', '1766', '单县', 'sd,hz,dx', '371722', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市单县', '0530');
INSERT INTO `t_area` VALUES ('1771', '1766', '成武县', 'sd,hz,cwx', '371723', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市成武县', '0530');
INSERT INTO `t_area` VALUES ('1772', '1766', '巨野县', 'sd,hz,jyx', '371724', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市巨野县', '0530');
INSERT INTO `t_area` VALUES ('1773', '1766', '郓城县', 'sd,hz,ycx', '371725', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市郓城县', '0530');
INSERT INTO `t_area` VALUES ('1774', '1766', '鄄城县', 'sd,hz,jcx', '371726', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市鄄城县', '0530');
INSERT INTO `t_area` VALUES ('1775', '1766', '定陶县', 'sd,hz,dtx', '371727', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市定陶县', '0530');
INSERT INTO `t_area` VALUES ('1776', '1766', '东明县', 'sd,hz,dmx', '371728', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山东省菏泽市东明县', '0530');
INSERT INTO `t_area` VALUES ('1777', '100', '河南省', 'hn', '410000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省', '0398');
INSERT INTO `t_area` VALUES ('1778', '1777', '郑州市', 'hn,zz', '410100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市', '0371');
INSERT INTO `t_area` VALUES ('1779', '1778', '市辖区', 'hn,zz,sxq', '410101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市市辖区', '0371');
INSERT INTO `t_area` VALUES ('178', '169', '滦南县', 'hb,ts,lnx', '130224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市滦南县', '0315');
INSERT INTO `t_area` VALUES ('1780', '1778', '中原区', 'hn,zz,zyq', '410102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市中原区', '0371');
INSERT INTO `t_area` VALUES ('1781', '1778', '二七区', 'hn,zz,eqq', '410103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市二七区', '0371');
INSERT INTO `t_area` VALUES ('1782', '1778', '管城回族区', 'hn,zz,gchzq', '410104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市管城回族区', '0371');
INSERT INTO `t_area` VALUES ('1783', '1778', '金水区', 'hn,zz,jsq', '410105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市金水区', '0371');
INSERT INTO `t_area` VALUES ('1784', '1778', '上街区', 'hn,zz,sjq', '410106', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市上街区', '0371');
INSERT INTO `t_area` VALUES ('1785', '1778', '惠济区', 'hn,zz,hjq', '410108', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市惠济区', '0371');
INSERT INTO `t_area` VALUES ('1786', '1778', '中牟县', 'hn,zz,zmx', '410122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市中牟县', '0371');
INSERT INTO `t_area` VALUES ('1787', '1778', '巩义市', 'hn,zz,gy', '410181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市巩义市', '0371');
INSERT INTO `t_area` VALUES ('1788', '1778', '荥阳市', 'hn,zz,xy', '410182', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市荥阳市', '0371');
INSERT INTO `t_area` VALUES ('1789', '1778', '新密市', 'hn,zz,xm', '410183', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市新密市', '0371');
INSERT INTO `t_area` VALUES ('179', '169', '乐亭县', 'hb,ts,ltx', '130225', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市乐亭县', '0315');
INSERT INTO `t_area` VALUES ('1790', '1778', '新郑市', 'hn,zz,xz', '410184', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市新郑市', '0371');
INSERT INTO `t_area` VALUES ('1791', '1778', '登封市', 'hn,zz,df', '410185', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省郑州市登封市', '0371');
INSERT INTO `t_area` VALUES ('1792', '1777', '开封市', 'hn,kf', '410200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市', '0378');
INSERT INTO `t_area` VALUES ('1793', '1792', '市辖区', 'hn,kf,sxq', '410201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市市辖区', '0378');
INSERT INTO `t_area` VALUES ('1794', '1792', '龙亭区', 'hn,kf,ltq', '410202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市龙亭区', '0378');
INSERT INTO `t_area` VALUES ('1795', '1792', '顺河回族区', 'hn,kf,shhzq', '410203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市顺河回族区', '0378');
INSERT INTO `t_area` VALUES ('1796', '1792', '鼓楼区', 'hn,kf,glq', '410204', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市鼓楼区', '0378');
INSERT INTO `t_area` VALUES ('1797', '1792', '禹王台区', 'hn,kf,ywtq', '410205', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市禹王台区', '0378');
INSERT INTO `t_area` VALUES ('1798', '1792', '金明区', 'hn,kf,jmq', '410211', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市金明区', '0378');
INSERT INTO `t_area` VALUES ('1799', '1792', '杞县', 'hn,kf,qx', '410221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市杞县', '0378');
INSERT INTO `t_area` VALUES ('180', '169', '迁西县', 'hb,ts,qxx', '130227', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市迁西县', '0315');
INSERT INTO `t_area` VALUES ('1800', '1792', '通许县', 'hn,kf,txx', '410222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市通许县', '0378');
INSERT INTO `t_area` VALUES ('1801', '1792', '尉氏县', 'hn,kf,wsx', '410223', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市尉氏县', '0378');
INSERT INTO `t_area` VALUES ('1802', '1792', '开封县', 'hn,kf,kfx', '410224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市开封县', '0378');
INSERT INTO `t_area` VALUES ('1803', '1792', '兰考县', 'hn,kf,lkx', '410225', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省开封市兰考县', '0378');
INSERT INTO `t_area` VALUES ('1804', '1777', '洛阳市', 'hn,ly', '410300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市', '0379');
INSERT INTO `t_area` VALUES ('1805', '1804', '市辖区', 'hn,ly,sxq', '410301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市市辖区', '0379');
INSERT INTO `t_area` VALUES ('1806', '1804', '老城区', 'hn,ly,lcq', '410302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市老城区', '0379');
INSERT INTO `t_area` VALUES ('1807', '1804', '西工区', 'hn,ly,xgq', '410303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市西工区', '0379');
INSERT INTO `t_area` VALUES ('1808', '1804', '瀍河回族区(**)', 'hn,ly,hhzq(**)', '410304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市瀍河回族区(**)', '0379');
INSERT INTO `t_area` VALUES ('1809', '1804', '涧西区', 'hn,ly,jxq', '410305', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市涧西区', '0379');
INSERT INTO `t_area` VALUES ('181', '169', '玉田县', 'hb,ts,ytx', '130229', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市玉田县', '0315');
INSERT INTO `t_area` VALUES ('1810', '1804', '吉利区', 'hn,ly,jlq', '410306', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市吉利区', '0379');
INSERT INTO `t_area` VALUES ('1811', '1804', '洛龙区(**)', 'hn,ly,llq(**)', '410311', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市洛龙区(**)', '0379');
INSERT INTO `t_area` VALUES ('1812', '1804', '孟津县', 'hn,ly,mjx', '410322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市孟津县', '0379');
INSERT INTO `t_area` VALUES ('1813', '1804', '新安县', 'hn,ly,xax', '410323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市新安县', '0379');
INSERT INTO `t_area` VALUES ('1814', '1804', '栾川县', 'hn,ly,lcx', '410324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市栾川县', '0379');
INSERT INTO `t_area` VALUES ('1815', '1804', '嵩县', 'hn,ly,sx', '410325', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市嵩县', '0379');
INSERT INTO `t_area` VALUES ('1816', '1804', '汝阳县', 'hn,ly,ryx', '410326', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市汝阳县', '0379');
INSERT INTO `t_area` VALUES ('1817', '1804', '宜阳县', 'hn,ly,yyx', '410327', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市宜阳县', '0379');
INSERT INTO `t_area` VALUES ('1818', '1804', '洛宁县', 'hn,ly,lnx', '410328', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市洛宁县', '0379');
INSERT INTO `t_area` VALUES ('1819', '1804', '伊川县', 'hn,ly,ycx', '410329', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市伊川县', '0379');
INSERT INTO `t_area` VALUES ('182', '169', '唐海县', 'hb,ts,thx', '130230', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市唐海县', '0315');
INSERT INTO `t_area` VALUES ('1820', '1804', '偃师市', 'hn,ly,ys', '410381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省洛阳市偃师市', '0379');
INSERT INTO `t_area` VALUES ('1821', '1777', '平顶山市', 'hn,pds', '410400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市', '0375');
INSERT INTO `t_area` VALUES ('1822', '1821', '市辖区', 'hn,pds,sxq', '410401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市市辖区', '0375');
INSERT INTO `t_area` VALUES ('1823', '1821', '新华区', 'hn,pds,xhq', '410402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市新华区', '0375');
INSERT INTO `t_area` VALUES ('1824', '1821', '卫东区', 'hn,pds,wdq', '410403', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市卫东区', '0375');
INSERT INTO `t_area` VALUES ('1825', '1821', '石龙区', 'hn,pds,slq', '410404', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市石龙区', '0375');
INSERT INTO `t_area` VALUES ('1826', '1821', '湛河区', 'hn,pds,zhq', '410411', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市湛河区', '0375');
INSERT INTO `t_area` VALUES ('1827', '1821', '宝丰县', 'hn,pds,bfx', '410421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市宝丰县', '0375');
INSERT INTO `t_area` VALUES ('1828', '1821', '叶县', 'hn,pds,yx', '410422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市叶县', '0375');
INSERT INTO `t_area` VALUES ('1829', '1821', '鲁山县', 'hn,pds,lsx', '410423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市鲁山县', '0375');
INSERT INTO `t_area` VALUES ('183', '169', '遵化市', 'hb,ts,zh', '130281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市遵化市', '0315');
INSERT INTO `t_area` VALUES ('1830', '1821', '郏县', 'hn,pds,jx', '410425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市郏县', '0375');
INSERT INTO `t_area` VALUES ('1831', '1821', '舞钢市', 'hn,pds,wg', '410481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市舞钢市', '0375');
INSERT INTO `t_area` VALUES ('1832', '1821', '汝州市', 'hn,pds,rz', '410482', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省平顶山市汝州市', '0375');
INSERT INTO `t_area` VALUES ('1833', '1777', '安阳市', 'hn,ay', '410500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市', '0372');
INSERT INTO `t_area` VALUES ('1834', '1833', '市辖区', 'hn,ay,sxq', '410501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市市辖区', '0372');
INSERT INTO `t_area` VALUES ('1835', '1833', '文峰区', 'hn,ay,wfq', '410502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市文峰区', '0372');
INSERT INTO `t_area` VALUES ('1836', '1833', '北关区', 'hn,ay,bgq', '410503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市北关区', '0372');
INSERT INTO `t_area` VALUES ('1837', '1833', '殷都区', 'hn,ay,ydq', '410505', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市殷都区', '0372');
INSERT INTO `t_area` VALUES ('1838', '1833', '龙安区', 'hn,ay,laq', '410506', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市龙安区', '0372');
INSERT INTO `t_area` VALUES ('1839', '1833', '安阳县', 'hn,ay,ayx', '410522', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市安阳县', '0372');
INSERT INTO `t_area` VALUES ('184', '169', '迁安市', 'hb,ts,qa', '130283', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省唐山市迁安市', '0315');
INSERT INTO `t_area` VALUES ('1840', '1833', '汤阴县', 'hn,ay,tyx', '410523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市汤阴县', '0372');
INSERT INTO `t_area` VALUES ('1841', '1833', '滑县', 'hn,ay,hx', '410526', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市滑县', '0372');
INSERT INTO `t_area` VALUES ('1842', '1833', '内黄县', 'hn,ay,nhx', '410527', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市内黄县', '0372');
INSERT INTO `t_area` VALUES ('1843', '1833', '林州市', 'hn,ay,lz', '410581', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省安阳市林州市', '0372');
INSERT INTO `t_area` VALUES ('1844', '1777', '鹤壁市', 'hn,hb', '410600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省鹤壁市', '0392');
INSERT INTO `t_area` VALUES ('1845', '1844', '市辖区', 'hn,hb,sxq', '410601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省鹤壁市市辖区', '0392');
INSERT INTO `t_area` VALUES ('1846', '1844', '鹤山区', 'hn,hb,hsq', '410602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省鹤壁市鹤山区', '0392');
INSERT INTO `t_area` VALUES ('1847', '1844', '山城区', 'hn,hb,scq', '410603', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省鹤壁市山城区', '0392');
INSERT INTO `t_area` VALUES ('1848', '1844', '淇滨区', 'hn,hb,qbq', '410611', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省鹤壁市淇滨区', '0392');
INSERT INTO `t_area` VALUES ('1849', '1844', '浚县', 'hn,hb,jx', '410621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省鹤壁市浚县', '0392');
INSERT INTO `t_area` VALUES ('185', '143', '秦皇岛市', 'hb,qhd', '130300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省秦皇岛市', '0335');
INSERT INTO `t_area` VALUES ('1850', '1844', '淇县', 'hn,hb,qx', '410622', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省鹤壁市淇县', '0392');
INSERT INTO `t_area` VALUES ('1851', '1777', '新乡市', 'hn,xx', '410700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市', '0373');
INSERT INTO `t_area` VALUES ('1852', '1851', '市辖区', 'hn,xx,sxq', '410701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市市辖区', '0373');
INSERT INTO `t_area` VALUES ('1853', '1851', '红旗区', 'hn,xx,hqq', '410702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市红旗区', '0373');
INSERT INTO `t_area` VALUES ('1854', '1851', '卫滨区', 'hn,xx,wbq', '410703', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市卫滨区', '0373');
INSERT INTO `t_area` VALUES ('1855', '1851', '凤泉区', 'hn,xx,fqq', '410704', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市凤泉区', '0373');
INSERT INTO `t_area` VALUES ('1856', '1851', '牧野区', 'hn,xx,myq', '410711', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市牧野区', '0373');
INSERT INTO `t_area` VALUES ('1857', '1851', '新乡县', 'hn,xx,xxx', '410721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市新乡县', '0373');
INSERT INTO `t_area` VALUES ('1858', '1851', '获嘉县', 'hn,xx,hjx', '410724', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市获嘉县', '0373');
INSERT INTO `t_area` VALUES ('1859', '1851', '原阳县', 'hn,xx,yyx', '410725', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市原阳县', '0373');
INSERT INTO `t_area` VALUES ('186', '185', '市辖区', 'hb,qhd,sxq', '130301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省秦皇岛市市辖区', '0335');
INSERT INTO `t_area` VALUES ('1860', '1851', '延津县', 'hn,xx,yjx', '410726', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市延津县', '0373');
INSERT INTO `t_area` VALUES ('1861', '1851', '封丘县', 'hn,xx,fqx', '410727', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市封丘县', '0373');
INSERT INTO `t_area` VALUES ('1862', '1851', '长垣县', 'hn,xx,cyx', '410728', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市长垣县', '0373');
INSERT INTO `t_area` VALUES ('1863', '1851', '卫辉市', 'hn,xx,wh', '410781', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市卫辉市', '0373');
INSERT INTO `t_area` VALUES ('1864', '1851', '辉县市', 'hn,xx,hx', '410782', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省新乡市辉县市', '0373');
INSERT INTO `t_area` VALUES ('1865', '1777', '焦作市', 'hn,jz', '410800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市', '0391');
INSERT INTO `t_area` VALUES ('1866', '1865', '市辖区', 'hn,jz,sxq', '410801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市市辖区', '0391');
INSERT INTO `t_area` VALUES ('1867', '1865', '解放区', 'hn,jz,jfq', '410802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市解放区', '0391');
INSERT INTO `t_area` VALUES ('1868', '1865', '中站区', 'hn,jz,zzq', '410803', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市中站区', '0391');
INSERT INTO `t_area` VALUES ('1869', '1865', '马村区', 'hn,jz,mcq', '410804', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市马村区', '0391');
INSERT INTO `t_area` VALUES ('187', '185', '海港区', 'hb,qhd,hgq', '130302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省秦皇岛市海港区', '0335');
INSERT INTO `t_area` VALUES ('1870', '1865', '山阳区', 'hn,jz,syq', '410811', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市山阳区', '0391');
INSERT INTO `t_area` VALUES ('1871', '1865', '修武县', 'hn,jz,xwx', '410821', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市修武县', '0391');
INSERT INTO `t_area` VALUES ('1872', '1865', '博爱县', 'hn,jz,bax', '410822', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市博爱县', '0391');
INSERT INTO `t_area` VALUES ('1873', '1865', '武陟县', 'hn,jz,wzx', '410823', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市武陟县', '0391');
INSERT INTO `t_area` VALUES ('1874', '1865', '温县', 'hn,jz,wx', '410825', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市温县', '0391');
INSERT INTO `t_area` VALUES ('1875', '1865', '济源市', 'hn,jz,jy', '410881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市济源市', '0391');
INSERT INTO `t_area` VALUES ('1876', '1865', '沁阳市', 'hn,jz,qy', '410882', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市沁阳市', '0391');
INSERT INTO `t_area` VALUES ('1877', '1865', '孟州市', 'hn,jz,mz', '410883', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省焦作市孟州市', '0391');
INSERT INTO `t_area` VALUES ('1878', '1777', '濮阳市', 'hn,py', '410900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省濮阳市', '0393');
INSERT INTO `t_area` VALUES ('1879', '1878', '市辖区', 'hn,py,sxq', '410901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省濮阳市市辖区', '0393');
INSERT INTO `t_area` VALUES ('188', '185', '山海关区', 'hb,qhd,shgq', '130303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省秦皇岛市山海关区', '0335');
INSERT INTO `t_area` VALUES ('1880', '1878', '华龙区', 'hn,py,hlq', '410902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省濮阳市华龙区', '0393');
INSERT INTO `t_area` VALUES ('1881', '1878', '清丰县', 'hn,py,qfx', '410922', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省濮阳市清丰县', '0393');
INSERT INTO `t_area` VALUES ('1882', '1878', '南乐县', 'hn,py,nlx', '410923', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省濮阳市南乐县', '0393');
INSERT INTO `t_area` VALUES ('1883', '1878', '范县', 'hn,py,fx', '410926', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省濮阳市范县', '0393');
INSERT INTO `t_area` VALUES ('1884', '1878', '台前县', 'hn,py,tqx', '410927', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省濮阳市台前县', '0393');
INSERT INTO `t_area` VALUES ('1885', '1878', '濮阳县', 'hn,py,pyx', '410928', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省濮阳市濮阳县', '0393');
INSERT INTO `t_area` VALUES ('1886', '1777', '许昌市', 'hn,xc', '411000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省许昌市', '0374');
INSERT INTO `t_area` VALUES ('1887', '1886', '市辖区', 'hn,xc,sxq', '411001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省许昌市市辖区', '0374');
INSERT INTO `t_area` VALUES ('1888', '1886', '魏都区', 'hn,xc,wdq', '411002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省许昌市魏都区', '0374');
INSERT INTO `t_area` VALUES ('1889', '1886', '许昌县', 'hn,xc,xcx', '411023', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省许昌市许昌县', '0374');
INSERT INTO `t_area` VALUES ('189', '185', '北戴河区', 'hb,qhd,bdhq', '130304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省秦皇岛市北戴河区', '0335');
INSERT INTO `t_area` VALUES ('1890', '1886', '鄢陵县', 'hn,xc,ylx', '411024', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省许昌市鄢陵县', '0374');
INSERT INTO `t_area` VALUES ('1891', '1886', '襄城县', 'hn,xc,xcx', '411025', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省许昌市襄城县', '0374');
INSERT INTO `t_area` VALUES ('1892', '1886', '禹州市', 'hn,xc,yz', '411081', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省许昌市禹州市', '0374');
INSERT INTO `t_area` VALUES ('1893', '1886', '长葛市', 'hn,xc,cg', '411082', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省许昌市长葛市', '0374');
INSERT INTO `t_area` VALUES ('1894', '1777', '漯河市', 'hn,lh', '411100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省漯河市', '0395');
INSERT INTO `t_area` VALUES ('1895', '1894', '市辖区', 'hn,lh,sxq', '411101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省漯河市市辖区', '0395');
INSERT INTO `t_area` VALUES ('1896', '1894', '源汇区', 'hn,lh,yhq', '411102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省漯河市源汇区', '0395');
INSERT INTO `t_area` VALUES ('1897', '1894', '郾城区', 'hn,lh,ycq', '411103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省漯河市郾城区', '0395');
INSERT INTO `t_area` VALUES ('1898', '1894', '召陵区', 'hn,lh,zlq', '411104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省漯河市召陵区', '0395');
INSERT INTO `t_area` VALUES ('1899', '1894', '舞阳县', 'hn,lh,wyx', '411121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省漯河市舞阳县', '0395');
INSERT INTO `t_area` VALUES ('190', '185', '青龙满族自治县', 'hb,qhd,qlmzzzx', '130321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省秦皇岛市青龙满族自治县', '0335');
INSERT INTO `t_area` VALUES ('1900', '1894', '临颍县', 'hn,lh,lyx', '411122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省漯河市临颍县', '0395');
INSERT INTO `t_area` VALUES ('1901', '1777', '三门峡市', 'hn,smx', '411200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省三门峡市', '0398');
INSERT INTO `t_area` VALUES ('1902', '1901', '市辖区', 'hn,smx,sxq', '411201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省三门峡市市辖区', '0398');
INSERT INTO `t_area` VALUES ('1903', '1901', '湖滨区', 'hn,smx,hbq', '411202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省三门峡市湖滨区', '0398');
INSERT INTO `t_area` VALUES ('1904', '1901', '渑池县', 'hn,smx,mcx', '411221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省三门峡市渑池县', '0398');
INSERT INTO `t_area` VALUES ('1905', '1901', '陕县', 'hn,smx,sx', '411222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省三门峡市陕县', '0398');
INSERT INTO `t_area` VALUES ('1906', '1901', '卢氏县', 'hn,smx,lsx', '411224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省三门峡市卢氏县', '0398');
INSERT INTO `t_area` VALUES ('1907', '1901', '义马市', 'hn,smx,ym', '411281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省三门峡市义马市', '0398');
INSERT INTO `t_area` VALUES ('1908', '1901', '灵宝市', 'hn,smx,lb', '411282', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省三门峡市灵宝市', '0398');
INSERT INTO `t_area` VALUES ('1909', '1777', '南阳市', 'hn,ny', '411300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市', '0377');
INSERT INTO `t_area` VALUES ('191', '185', '昌黎县', 'hb,qhd,clx', '130322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省秦皇岛市昌黎县', '0335');
INSERT INTO `t_area` VALUES ('1910', '1909', '市辖区', 'hn,ny,sxq', '411301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市市辖区', '0377');
INSERT INTO `t_area` VALUES ('1911', '1909', '宛城区', 'hn,ny,wcq', '411302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市宛城区', '0377');
INSERT INTO `t_area` VALUES ('1912', '1909', '卧龙区', 'hn,ny,wlq', '411303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市卧龙区', '0377');
INSERT INTO `t_area` VALUES ('1913', '1909', '南召县', 'hn,ny,nzx', '411321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市南召县', '0377');
INSERT INTO `t_area` VALUES ('1914', '1909', '方城县', 'hn,ny,fcx', '411322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市方城县', '0377');
INSERT INTO `t_area` VALUES ('1915', '1909', '西峡县', 'hn,ny,xxx', '411323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市西峡县', '0377');
INSERT INTO `t_area` VALUES ('1916', '1909', '镇平县', 'hn,ny,zpx', '411324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市镇平县', '0377');
INSERT INTO `t_area` VALUES ('1917', '1909', '内乡县', 'hn,ny,nxx', '411325', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市内乡县', '0377');
INSERT INTO `t_area` VALUES ('1918', '1909', '淅川县', 'hn,ny,xcx', '411326', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市淅川县', '0377');
INSERT INTO `t_area` VALUES ('1919', '1909', '社旗县', 'hn,ny,sqx', '411327', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市社旗县', '0377');
INSERT INTO `t_area` VALUES ('192', '185', '抚宁县', 'hb,qhd,fnx', '130323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省秦皇岛市抚宁县', '0335');
INSERT INTO `t_area` VALUES ('1920', '1909', '唐河县', 'hn,ny,thx', '411328', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市唐河县', '0377');
INSERT INTO `t_area` VALUES ('1921', '1909', '新野县', 'hn,ny,xyx', '411329', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市新野县', '0377');
INSERT INTO `t_area` VALUES ('1922', '1909', '桐柏县', 'hn,ny,tbx', '411330', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市桐柏县', '0377');
INSERT INTO `t_area` VALUES ('1923', '1909', '邓州市', 'hn,ny,dz', '411381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省南阳市邓州市', '0377');
INSERT INTO `t_area` VALUES ('1924', '1777', '商丘市', 'hn,sq', '411400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市', '0370');
INSERT INTO `t_area` VALUES ('1925', '1924', '市辖区', 'hn,sq,sxq', '411401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市市辖区', '0370');
INSERT INTO `t_area` VALUES ('1926', '1924', '梁园区', 'hn,sq,lyq', '411402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市梁园区', '0370');
INSERT INTO `t_area` VALUES ('1927', '1924', '睢阳区', 'hn,sq,syq', '411403', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市睢阳区', '0370');
INSERT INTO `t_area` VALUES ('1928', '1924', '民权县', 'hn,sq,mqx', '411421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市民权县', '0370');
INSERT INTO `t_area` VALUES ('1929', '1924', '睢县', 'hn,sq,sx', '411422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市睢县', '0370');
INSERT INTO `t_area` VALUES ('193', '185', '卢龙县', 'hb,qhd,llx', '130324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省秦皇岛市卢龙县', '0335');
INSERT INTO `t_area` VALUES ('1930', '1924', '宁陵县', 'hn,sq,nlx', '411423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市宁陵县', '0370');
INSERT INTO `t_area` VALUES ('1931', '1924', '柘城县', 'hn,sq,zcx', '411424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市柘城县', '0370');
INSERT INTO `t_area` VALUES ('1932', '1924', '虞城县', 'hn,sq,ycx', '411425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市虞城县', '0370');
INSERT INTO `t_area` VALUES ('1933', '1924', '夏邑县', 'hn,sq,xyx', '411426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市夏邑县', '0370');
INSERT INTO `t_area` VALUES ('1934', '1924', '永城市', 'hn,sq,yc', '411481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省商丘市永城市', '0370');
INSERT INTO `t_area` VALUES ('1935', '1777', '信阳市', 'hn,xy', '411500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市', '0376');
INSERT INTO `t_area` VALUES ('1936', '1935', '市辖区', 'hn,xy,sxq', '411501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市市辖区', '0376');
INSERT INTO `t_area` VALUES ('1937', '1935', '浉河区', 'hn,xy,hq', '411502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市浉河区', '0376');
INSERT INTO `t_area` VALUES ('1938', '1935', '平桥区', 'hn,xy,pqq', '411503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市平桥区', '0376');
INSERT INTO `t_area` VALUES ('1939', '1935', '罗山县', 'hn,xy,lsx', '411521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市罗山县', '0376');
INSERT INTO `t_area` VALUES ('194', '143', '邯郸市', 'hb,hd', '130400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市', '0310');
INSERT INTO `t_area` VALUES ('1940', '1935', '光山县', 'hn,xy,gsx', '411522', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市光山县', '0376');
INSERT INTO `t_area` VALUES ('1941', '1935', '新县', 'hn,xy,xx', '411523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市新县', '0376');
INSERT INTO `t_area` VALUES ('1942', '1935', '商城县', 'hn,xy,scx', '411524', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市商城县', '0376');
INSERT INTO `t_area` VALUES ('1943', '1935', '固始县', 'hn,xy,gsx', '411525', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市固始县', '0376');
INSERT INTO `t_area` VALUES ('1944', '1935', '潢川县', 'hn,xy,hcx', '411526', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市潢川县', '0376');
INSERT INTO `t_area` VALUES ('1945', '1935', '淮滨县', 'hn,xy,hbx', '411527', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市淮滨县', '0376');
INSERT INTO `t_area` VALUES ('1946', '1935', '息县', 'hn,xy,xx', '411528', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省信阳市息县', '0376');
INSERT INTO `t_area` VALUES ('1947', '1777', '周口市', 'hn,zk', '411600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市', '0394');
INSERT INTO `t_area` VALUES ('1948', '1947', '市辖区', 'hn,zk,sxq', '411601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市市辖区', '0394');
INSERT INTO `t_area` VALUES ('1949', '1947', '川汇区', 'hn,zk,chq', '411602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市川汇区', '0394');
INSERT INTO `t_area` VALUES ('195', '194', '市辖区', 'hb,hd,sxq', '130401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市市辖区', '0310');
INSERT INTO `t_area` VALUES ('1950', '1947', '扶沟县', 'hn,zk,fgx', '411621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市扶沟县', '0394');
INSERT INTO `t_area` VALUES ('1951', '1947', '西华县', 'hn,zk,xhx', '411622', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市西华县', '0394');
INSERT INTO `t_area` VALUES ('1952', '1947', '商水县', 'hn,zk,ssx', '411623', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市商水县', '0394');
INSERT INTO `t_area` VALUES ('1953', '1947', '沈丘县', 'hn,zk,sqx', '411624', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市沈丘县', '0394');
INSERT INTO `t_area` VALUES ('1954', '1947', '郸城县', 'hn,zk,dcx', '411625', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市郸城县', '0394');
INSERT INTO `t_area` VALUES ('1955', '1947', '淮阳县', 'hn,zk,hyx', '411626', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市淮阳县', '0394');
INSERT INTO `t_area` VALUES ('1956', '1947', '太康县', 'hn,zk,tkx', '411627', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市太康县', '0394');
INSERT INTO `t_area` VALUES ('1957', '1947', '鹿邑县', 'hn,zk,lyx', '411628', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市鹿邑县', '0394');
INSERT INTO `t_area` VALUES ('1958', '1947', '项城市', 'hn,zk,xc', '411681', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省周口市项城市', '0394');
INSERT INTO `t_area` VALUES ('1959', '1777', '驻马店市', 'hn,zmd', '411700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市', '0396');
INSERT INTO `t_area` VALUES ('196', '194', '邯山区', 'hb,hd,hsq', '130402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市邯山区', '0310');
INSERT INTO `t_area` VALUES ('1960', '1959', '市辖区', 'hn,zmd,sxq', '411701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市市辖区', '0396');
INSERT INTO `t_area` VALUES ('1961', '1959', '驿城区', 'hn,zmd,ycq', '411702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市驿城区', '0396');
INSERT INTO `t_area` VALUES ('1962', '1959', '西平县', 'hn,zmd,xpx', '411721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市西平县', '0396');
INSERT INTO `t_area` VALUES ('1963', '1959', '上蔡县', 'hn,zmd,scx', '411722', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市上蔡县', '0396');
INSERT INTO `t_area` VALUES ('1964', '1959', '平舆县', 'hn,zmd,pyx', '411723', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市平舆县', '0396');
INSERT INTO `t_area` VALUES ('1965', '1959', '正阳县', 'hn,zmd,zyx', '411724', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市正阳县', '0396');
INSERT INTO `t_area` VALUES ('1966', '1959', '确山县', 'hn,zmd,qsx', '411725', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市确山县', '0396');
INSERT INTO `t_area` VALUES ('1967', '1959', '泌阳县', 'hn,zmd,myx', '411726', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市泌阳县', '0396');
INSERT INTO `t_area` VALUES ('1968', '1959', '汝南县', 'hn,zmd,rnx', '411727', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市汝南县', '0396');
INSERT INTO `t_area` VALUES ('1969', '1959', '遂平县', 'hn,zmd,spx', '411728', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市遂平县', '0396');
INSERT INTO `t_area` VALUES ('197', '194', '丛台区', 'hb,hd,ctq', '130403', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市丛台区', '0310');
INSERT INTO `t_area` VALUES ('1970', '1959', '新蔡县', 'hn,zmd,xcx', '411729', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河南省驻马店市新蔡县', '0396');
INSERT INTO `t_area` VALUES ('1971', '100', '湖北省', 'hb', '420000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省', '027');
INSERT INTO `t_area` VALUES ('1972', '1971', '武汉市', 'hb,wh', '420100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市', '027');
INSERT INTO `t_area` VALUES ('1973', '1972', '市辖区', 'hb,wh,sxq', '420101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市市辖区', '027');
INSERT INTO `t_area` VALUES ('1974', '1972', '江岸区', 'hb,wh,jaq', '420102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市江岸区', '027');
INSERT INTO `t_area` VALUES ('1975', '1972', '江汉区', 'hb,wh,jhq', '420103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市江汉区', '027');
INSERT INTO `t_area` VALUES ('1976', '1972', '硚口区', 'hb,wh,ckq', '420104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市硚口区', '027');
INSERT INTO `t_area` VALUES ('1977', '1972', '汉阳区', 'hb,wh,hyq', '420105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市汉阳区', '027');
INSERT INTO `t_area` VALUES ('1978', '1972', '武昌区', 'hb,wh,wcq', '420106', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市武昌区', '027');
INSERT INTO `t_area` VALUES ('1979', '1972', '青山区', 'hb,wh,qsq', '420107', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市青山区', '027');
INSERT INTO `t_area` VALUES ('198', '194', '复兴区', 'hb,hd,fxq', '130404', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市复兴区', '0310');
INSERT INTO `t_area` VALUES ('1980', '1972', '洪山区', 'hb,wh,hsq', '420111', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市洪山区', '027');
INSERT INTO `t_area` VALUES ('1981', '1972', '东西湖区', 'hb,wh,dxhq', '420112', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市东西湖区', '027');
INSERT INTO `t_area` VALUES ('1982', '1972', '汉南区', 'hb,wh,hnq', '420113', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市汉南区', '027');
INSERT INTO `t_area` VALUES ('1983', '1972', '蔡甸区', 'hb,wh,cdq', '420114', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市蔡甸区', '027');
INSERT INTO `t_area` VALUES ('1984', '1972', '江夏区', 'hb,wh,jxq', '420115', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市江夏区', '027');
INSERT INTO `t_area` VALUES ('1985', '1972', '黄陂区', 'hb,wh,hbq', '420116', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市黄陂区', '027');
INSERT INTO `t_area` VALUES ('1986', '1972', '新洲区', 'hb,wh,xzq', '420117', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省武汉市新洲区', '027');
INSERT INTO `t_area` VALUES ('1987', '1971', '黄石市', 'hb,hs', '420200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄石市', '0714');
INSERT INTO `t_area` VALUES ('1988', '1987', '市辖区', 'hb,hs,sxq', '420201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄石市市辖区', '0714');
INSERT INTO `t_area` VALUES ('1989', '1987', '黄石港区', 'hb,hs,hsgq', '420202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄石市黄石港区', '0714');
INSERT INTO `t_area` VALUES ('199', '194', '峰峰矿区', 'hb,hd,ffkq', '130406', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市峰峰矿区', '0310');
INSERT INTO `t_area` VALUES ('1990', '1987', '西塞山区', 'hb,hs,xssq', '420203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄石市西塞山区', '0714');
INSERT INTO `t_area` VALUES ('1991', '1987', '下陆区', 'hb,hs,xlq', '420204', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄石市下陆区', '0714');
INSERT INTO `t_area` VALUES ('1992', '1987', '铁山区', 'hb,hs,tsq', '420205', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄石市铁山区', '0714');
INSERT INTO `t_area` VALUES ('1993', '1987', '阳新县', 'hb,hs,yxx', '420222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄石市阳新县', '0714');
INSERT INTO `t_area` VALUES ('1994', '1987', '大冶市', 'hb,hs,dy', '420281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄石市大冶市', '0714');
INSERT INTO `t_area` VALUES ('1995', '1971', '十堰市', 'hb,sy', '420300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省十堰市', '0719');
INSERT INTO `t_area` VALUES ('1996', '1995', '市辖区', 'hb,sy,sxq', '420301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省十堰市市辖区', '0719');
INSERT INTO `t_area` VALUES ('1997', '1995', '茅箭区', 'hb,sy,mjq', '420302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省十堰市茅箭区', '0719');
INSERT INTO `t_area` VALUES ('1998', '1995', '张湾区', 'hb,sy,zwq', '420303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省十堰市张湾区', '0719');
INSERT INTO `t_area` VALUES ('1999', '1995', '郧县', 'hb,sy,yx', '420321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省十堰市郧县', '0719');
INSERT INTO `t_area` VALUES ('200', '194', '邯郸县', 'hb,hd,hdx', '130421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市邯郸县', '0310');
INSERT INTO `t_area` VALUES ('2000', '1995', '郧西县', 'hb,sy,yxx', '420322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省十堰市郧西县', '0719');
INSERT INTO `t_area` VALUES ('2001', '1995', '竹山县', 'hb,sy,zsx', '420323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省十堰市竹山县', '0719');
INSERT INTO `t_area` VALUES ('2002', '1995', '竹溪县', 'hb,sy,zxx', '420324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省十堰市竹溪县', '0719');
INSERT INTO `t_area` VALUES ('2003', '1995', '房县', 'hb,sy,fx', '420325', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省十堰市房县', '0719');
INSERT INTO `t_area` VALUES ('2004', '1995', '丹江口市', 'hb,sy,djk', '420381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省十堰市丹江口市', '0719');
INSERT INTO `t_area` VALUES ('2005', '1971', '宜昌市', 'hb,yc', '420500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市', '0717');
INSERT INTO `t_area` VALUES ('2006', '2005', '市辖区', 'hb,yc,sxq', '420501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市市辖区', '0717');
INSERT INTO `t_area` VALUES ('2007', '2005', '西陵区', 'hb,yc,xlq', '420502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市西陵区', '0717');
INSERT INTO `t_area` VALUES ('2008', '2005', '伍家岗区', 'hb,yc,wjgq', '420503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市伍家岗区', '0717');
INSERT INTO `t_area` VALUES ('2009', '2005', '点军区', 'hb,yc,djq', '420504', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市点军区', '0717');
INSERT INTO `t_area` VALUES ('201', '194', '临漳县', 'hb,hd,lzx', '130423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市临漳县', '0310');
INSERT INTO `t_area` VALUES ('2010', '2005', '猇亭区', 'hb,yc,tq', '420505', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市猇亭区', '0717');
INSERT INTO `t_area` VALUES ('2011', '2005', '夷陵区', 'hb,yc,ylq', '420506', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市夷陵区', '0717');
INSERT INTO `t_area` VALUES ('2012', '2005', '远安县', 'hb,yc,yax', '420525', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市远安县', '0717');
INSERT INTO `t_area` VALUES ('2013', '2005', '兴山县', 'hb,yc,xsx', '420526', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市兴山县', '0717');
INSERT INTO `t_area` VALUES ('2014', '2005', '秭归县', 'hb,yc,zgx', '420527', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市秭归县', '0717');
INSERT INTO `t_area` VALUES ('2015', '2005', '长阳土家族自治县', 'hb,yc,cytjzzzx', '420528', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市长阳土家族自治县', '0717');
INSERT INTO `t_area` VALUES ('2016', '2005', '五峰土家族自治县', 'hb,yc,wftjzzzx', '420529', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市五峰土家族自治县', '0717');
INSERT INTO `t_area` VALUES ('2017', '2005', '宜都市', 'hb,yc,yd', '420581', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市宜都市', '0717');
INSERT INTO `t_area` VALUES ('2018', '2005', '当阳市', 'hb,yc,dy', '420582', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市当阳市', '0717');
INSERT INTO `t_area` VALUES ('2019', '2005', '枝江市', 'hb,yc,zj', '420583', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省宜昌市枝江市', '0717');
INSERT INTO `t_area` VALUES ('202', '194', '成安县', 'hb,hd,cax', '130424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市成安县', '0310');
INSERT INTO `t_area` VALUES ('2020', '1971', '襄樊市', 'hb,xf', '420600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市', '0710');
INSERT INTO `t_area` VALUES ('2021', '2020', '市辖区', 'hb,xf,sxq', '420601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市市辖区', '0710');
INSERT INTO `t_area` VALUES ('2022', '2020', '襄城区', 'hb,xf,xcq', '420602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市襄城区', '0710');
INSERT INTO `t_area` VALUES ('2023', '2020', '樊城区', 'hb,xf,fcq', '420606', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市樊城区', '0710');
INSERT INTO `t_area` VALUES ('2024', '2020', '襄阳区', 'hb,xf,xyq', '420607', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市襄阳区', '0710');
INSERT INTO `t_area` VALUES ('2025', '2020', '南漳县', 'hb,xf,nzx', '420624', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市南漳县', '0710');
INSERT INTO `t_area` VALUES ('2026', '2020', '谷城县', 'hb,xf,gcx', '420625', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市谷城县', '0710');
INSERT INTO `t_area` VALUES ('2027', '2020', '保康县', 'hb,xf,bkx', '420626', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市保康县', '0710');
INSERT INTO `t_area` VALUES ('2028', '2020', '老河口市', 'hb,xf,lhk', '420682', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市老河口市', '0710');
INSERT INTO `t_area` VALUES ('2029', '2020', '枣阳市', 'hb,xf,zy', '420683', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市枣阳市', '0710');
INSERT INTO `t_area` VALUES ('203', '194', '大名县', 'hb,hd,dmx', '130425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市大名县', '0310');
INSERT INTO `t_area` VALUES ('2030', '2020', '宜城市', 'hb,xf,yc', '420684', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省襄樊市宜城市', '0710');
INSERT INTO `t_area` VALUES ('2031', '1971', '鄂州市', 'hb,ez', '420700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省鄂州市', '0711');
INSERT INTO `t_area` VALUES ('2032', '2031', '市辖区', 'hb,ez,sxq', '420701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省鄂州市市辖区', '0711');
INSERT INTO `t_area` VALUES ('2033', '2031', '梁子湖区', 'hb,ez,lzhq', '420702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省鄂州市梁子湖区', '0711');
INSERT INTO `t_area` VALUES ('2034', '2031', '华容区', 'hb,ez,hrq', '420703', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省鄂州市华容区', '0711');
INSERT INTO `t_area` VALUES ('2035', '2031', '鄂城区', 'hb,ez,ecq', '420704', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省鄂州市鄂城区', '0711');
INSERT INTO `t_area` VALUES ('2036', '1971', '荆门市', 'hb,jm', '420800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆门市', '0724');
INSERT INTO `t_area` VALUES ('2037', '2036', '市辖区', 'hb,jm,sxq', '420801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆门市市辖区', '0724');
INSERT INTO `t_area` VALUES ('2038', '2036', '东宝区', 'hb,jm,dbq', '420802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆门市东宝区', '0724');
INSERT INTO `t_area` VALUES ('2039', '2036', '掇刀区', 'hb,jm,ddq', '420804', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆门市掇刀区', '0724');
INSERT INTO `t_area` VALUES ('204', '194', '涉县', 'hb,hd,sx', '130426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市涉县', '0310');
INSERT INTO `t_area` VALUES ('2040', '2036', '京山县', 'hb,jm,jsx', '420821', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆门市京山县', '0724');
INSERT INTO `t_area` VALUES ('2041', '2036', '沙洋县', 'hb,jm,syx', '420822', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆门市沙洋县', '0724');
INSERT INTO `t_area` VALUES ('2042', '2036', '钟祥市', 'hb,jm,zx', '420881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆门市钟祥市', '0724');
INSERT INTO `t_area` VALUES ('2043', '1971', '孝感市', 'hb,xg', '420900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省孝感市', '0712');
INSERT INTO `t_area` VALUES ('2044', '2043', '市辖区', 'hb,xg,sxq', '420901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省孝感市市辖区', '0712');
INSERT INTO `t_area` VALUES ('2045', '2043', '孝南区', 'hb,xg,xnq', '420902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省孝感市孝南区', '0712');
INSERT INTO `t_area` VALUES ('2046', '2043', '孝昌县', 'hb,xg,xcx', '420921', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省孝感市孝昌县', '0712');
INSERT INTO `t_area` VALUES ('2047', '2043', '大悟县', 'hb,xg,dwx', '420922', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省孝感市大悟县', '0712');
INSERT INTO `t_area` VALUES ('2048', '2043', '云梦县', 'hb,xg,ymx', '420923', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省孝感市云梦县', '0712');
INSERT INTO `t_area` VALUES ('2049', '2043', '应城市', 'hb,xg,yc', '420981', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省孝感市应城市', '0712');
INSERT INTO `t_area` VALUES ('205', '194', '磁县', 'hb,hd,cx', '130427', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市磁县', '0310');
INSERT INTO `t_area` VALUES ('2050', '2043', '安陆市', 'hb,xg,al', '420982', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省孝感市安陆市', '0712');
INSERT INTO `t_area` VALUES ('2051', '2043', '汉川市', 'hb,xg,hc', '420984', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省孝感市汉川市', '0712');
INSERT INTO `t_area` VALUES ('2052', '1971', '荆州市', 'hb,jz', '421000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆州市', '0716');
INSERT INTO `t_area` VALUES ('2053', '2052', '市辖区', 'hb,jz,sxq', '421001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆州市市辖区', '0716');
INSERT INTO `t_area` VALUES ('2054', '2052', '沙市区', 'hb,jz,ssq', '421002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆州市沙市区', '0716');
INSERT INTO `t_area` VALUES ('2055', '2052', '荆州区', 'hb,jz,jzq', '421003', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆州市荆州区', '0716');
INSERT INTO `t_area` VALUES ('2056', '2052', '公安县', 'hb,jz,gax', '421022', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆州市公安县', '0716');
INSERT INTO `t_area` VALUES ('2057', '2052', '监利县', 'hb,jz,jlx', '421023', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆州市监利县', '0716');
INSERT INTO `t_area` VALUES ('2058', '2052', '江陵县', 'hb,jz,jlx', '421024', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆州市江陵县', '0716');
INSERT INTO `t_area` VALUES ('2059', '2052', '石首市', 'hb,jz,ss', '421081', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆州市石首市', '0716');
INSERT INTO `t_area` VALUES ('206', '194', '肥乡县', 'hb,hd,fxx', '130428', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市肥乡县', '0310');
INSERT INTO `t_area` VALUES ('2060', '2052', '洪湖市', 'hb,jz,hh', '421083', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆州市洪湖市', '0716');
INSERT INTO `t_area` VALUES ('2061', '2052', '松滋市', 'hb,jz,sz', '421087', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省荆州市松滋市', '0716');
INSERT INTO `t_area` VALUES ('2062', '1971', '黄冈市', 'hb,hg', '421100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市', '0713');
INSERT INTO `t_area` VALUES ('2063', '2062', '市辖区', 'hb,hg,sxq', '421101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市市辖区', '0713');
INSERT INTO `t_area` VALUES ('2064', '2062', '黄州区', 'hb,hg,hzq', '421102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市黄州区', '0713');
INSERT INTO `t_area` VALUES ('2065', '2062', '团风县', 'hb,hg,tfx', '421121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市团风县', '0713');
INSERT INTO `t_area` VALUES ('2066', '2062', '红安县', 'hb,hg,hax', '421122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市红安县', '0713');
INSERT INTO `t_area` VALUES ('2067', '2062', '罗田县', 'hb,hg,ltx', '421123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市罗田县', '0713');
INSERT INTO `t_area` VALUES ('2068', '2062', '英山县', 'hb,hg,ysx', '421124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市英山县', '0713');
INSERT INTO `t_area` VALUES ('2069', '2062', '浠水县', 'hb,hg,xsx', '421125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市浠水县', '0713');
INSERT INTO `t_area` VALUES ('207', '194', '永年县', 'hb,hd,ynx', '130429', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市永年县', '0310');
INSERT INTO `t_area` VALUES ('2070', '2062', '蕲春县', 'hb,hg,qcx', '421126', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市蕲春县', '0713');
INSERT INTO `t_area` VALUES ('2071', '2062', '黄梅县', 'hb,hg,hmx', '421127', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市黄梅县', '0713');
INSERT INTO `t_area` VALUES ('2072', '2062', '麻城市', 'hb,hg,mc', '421181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市麻城市', '0713');
INSERT INTO `t_area` VALUES ('2073', '2062', '武穴市', 'hb,hg,wx', '421182', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省黄冈市武穴市', '0713');
INSERT INTO `t_area` VALUES ('2074', '1971', '咸宁市', 'hb,xn', '421200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省咸宁市', '0715');
INSERT INTO `t_area` VALUES ('2075', '2074', '市辖区', 'hb,xn,sxq', '421201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省咸宁市市辖区', '0715');
INSERT INTO `t_area` VALUES ('2076', '2074', '咸安区', 'hb,xn,xaq', '421202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省咸宁市咸安区', '0715');
INSERT INTO `t_area` VALUES ('2077', '2074', '嘉鱼县', 'hb,xn,jyx', '421221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省咸宁市嘉鱼县', '0715');
INSERT INTO `t_area` VALUES ('2078', '2074', '通城县', 'hb,xn,tcx', '421222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省咸宁市通城县', '0715');
INSERT INTO `t_area` VALUES ('2079', '2074', '崇阳县', 'hb,xn,cyx', '421223', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省咸宁市崇阳县', '0715');
INSERT INTO `t_area` VALUES ('208', '194', '邱县', 'hb,hd,qx', '130430', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市邱县', '0310');
INSERT INTO `t_area` VALUES ('2080', '2074', '通山县', 'hb,xn,tsx', '421224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省咸宁市通山县', '0715');
INSERT INTO `t_area` VALUES ('2081', '2074', '赤壁市', 'hb,xn,cb', '421281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省咸宁市赤壁市', '0715');
INSERT INTO `t_area` VALUES ('2082', '1971', '随州市', 'hb,sz', '421300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省随州市', '027');
INSERT INTO `t_area` VALUES ('2083', '2082', '市辖区', 'hb,sz,sxq', '421301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省随州市市辖区', '027');
INSERT INTO `t_area` VALUES ('2084', '2082', '曾都区', 'hb,sz,zdq', '421302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省随州市曾都区', '027');
INSERT INTO `t_area` VALUES ('2085', '2082', '广水市', 'hb,sz,gs', '421381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省随州市广水市', '027');
INSERT INTO `t_area` VALUES ('2086', '1971', '恩施土家族苗族自治州', 'hb,estjzmzzzz', '422800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省恩施土家族苗族自治州', '0718');
INSERT INTO `t_area` VALUES ('2087', '2086', '恩施市', 'hb,estjzmzzzz,es', '422801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省恩施土家族苗族自治州恩施市', '0718');
INSERT INTO `t_area` VALUES ('2088', '2086', '利川市', 'hb,estjzmzzzz,lc', '422802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省恩施土家族苗族自治州利川市', '0718');
INSERT INTO `t_area` VALUES ('2089', '2086', '建始县', 'hb,estjzmzzzz,jsx', '422822', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省恩施土家族苗族自治州建始县', '0718');
INSERT INTO `t_area` VALUES ('209', '194', '鸡泽县', 'hb,hd,jzx', '130431', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市鸡泽县', '0310');
INSERT INTO `t_area` VALUES ('2090', '2086', '巴东县', 'hb,estjzmzzzz,bdx', '422823', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省恩施土家族苗族自治州巴东县', '0718');
INSERT INTO `t_area` VALUES ('2091', '2086', '宣恩县', 'hb,estjzmzzzz,xex', '422825', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省恩施土家族苗族自治州宣恩县', '0718');
INSERT INTO `t_area` VALUES ('2092', '2086', '咸丰县', 'hb,estjzmzzzz,xfx', '422826', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省恩施土家族苗族自治州咸丰县', '0718');
INSERT INTO `t_area` VALUES ('2093', '2086', '来凤县', 'hb,estjzmzzzz,lfx', '422827', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省恩施土家族苗族自治州来凤县', '0718');
INSERT INTO `t_area` VALUES ('2094', '2086', '鹤峰县', 'hb,estjzmzzzz,hfx', '422828', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省恩施土家族苗族自治州鹤峰县', '0718');
INSERT INTO `t_area` VALUES ('2095', '1971', '省直辖县级行政单位(**)', 'hb,szxxjxzdw(**)', '429000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省省直辖县级行政单位(**)', '027');
INSERT INTO `t_area` VALUES ('2096', '2095', '仙桃市', 'hb,szxxjxzdw(**),xt', '429004', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省省直辖县级行政单位(**)仙桃市', '027');
INSERT INTO `t_area` VALUES ('2097', '2095', '潜江市', 'hb,szxxjxzdw(**),qj', '429005', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省省直辖县级行政单位(**)潜江市', '027');
INSERT INTO `t_area` VALUES ('2098', '2095', '天门市', 'hb,szxxjxzdw(**),tm', '429006', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省省直辖县级行政单位(**)天门市', '027');
INSERT INTO `t_area` VALUES ('2099', '2095', '神农架林区', 'hb,szxxjxzdw(**),snjlq', '429021', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖北省省直辖县级行政单位(**)神农架林区', '027');
INSERT INTO `t_area` VALUES ('210', '194', '广平县', 'hb,hd,gpx', '130432', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市广平县', '0310');
INSERT INTO `t_area` VALUES ('2100', '100', '湖南省', 'hn', '430000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省', '0736');
INSERT INTO `t_area` VALUES ('2101', '2100', '长沙市', 'hn,cs', '430100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市', '0731');
INSERT INTO `t_area` VALUES ('2102', '2101', '市辖区', 'hn,cs,sxq', '430101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市市辖区', '0731');
INSERT INTO `t_area` VALUES ('2103', '2101', '芙蓉区', 'hn,cs,frq', '430102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市芙蓉区', '0731');
INSERT INTO `t_area` VALUES ('2104', '2101', '天心区', 'hn,cs,txq', '430103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市天心区', '0731');
INSERT INTO `t_area` VALUES ('2105', '2101', '岳麓区', 'hn,cs,ylq', '430104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市岳麓区', '0731');
INSERT INTO `t_area` VALUES ('2106', '2101', '开福区', 'hn,cs,kfq', '430105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市开福区', '0731');
INSERT INTO `t_area` VALUES ('2107', '2101', '雨花区', 'hn,cs,yhq', '430111', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市雨花区', '0731');
INSERT INTO `t_area` VALUES ('2108', '2101', '长沙县', 'hn,cs,csx', '430121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市长沙县', '0731');
INSERT INTO `t_area` VALUES ('2109', '2101', '望城县', 'hn,cs,wcx', '430122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市望城县', '0731');
INSERT INTO `t_area` VALUES ('211', '194', '馆陶县', 'hb,hd,gtx', '130433', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市馆陶县', '0310');
INSERT INTO `t_area` VALUES ('2110', '2101', '宁乡县', 'hn,cs,nxx', '430124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市宁乡县', '0731');
INSERT INTO `t_area` VALUES ('2111', '2101', '浏阳市', 'hn,cs,ly', '430181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省长沙市浏阳市', '0731');
INSERT INTO `t_area` VALUES ('2112', '2100', '株洲市', 'hn,zz', '430200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市', '0733');
INSERT INTO `t_area` VALUES ('2113', '2112', '市辖区', 'hn,zz,sxq', '430201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市市辖区', '0733');
INSERT INTO `t_area` VALUES ('2114', '2112', '荷塘区', 'hn,zz,htq', '430202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市荷塘区', '0733');
INSERT INTO `t_area` VALUES ('2115', '2112', '芦淞区', 'hn,zz,lsq', '430203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市芦淞区', '0733');
INSERT INTO `t_area` VALUES ('2116', '2112', '石峰区', 'hn,zz,sfq', '430204', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市石峰区', '0733');
INSERT INTO `t_area` VALUES ('2117', '2112', '天元区', 'hn,zz,tyq', '430211', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市天元区', '0733');
INSERT INTO `t_area` VALUES ('2118', '2112', '株洲县', 'hn,zz,zzx', '430221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市株洲县', '0733');
INSERT INTO `t_area` VALUES ('2119', '2112', '攸县', 'hn,zz,yx', '430223', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市攸县', '0733');
INSERT INTO `t_area` VALUES ('212', '194', '魏县', 'hb,hd,wx', '130434', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市魏县', '0310');
INSERT INTO `t_area` VALUES ('2120', '2112', '茶陵县', 'hn,zz,clx', '430224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市茶陵县', '0733');
INSERT INTO `t_area` VALUES ('2121', '2112', '炎陵县', 'hn,zz,ylx', '430225', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市炎陵县', '0733');
INSERT INTO `t_area` VALUES ('2122', '2112', '醴陵市', 'hn,zz,ll', '430281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省株洲市醴陵市', '0733');
INSERT INTO `t_area` VALUES ('2123', '2100', '湘潭市', 'hn,xt', '430300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘潭市', '0732');
INSERT INTO `t_area` VALUES ('2124', '2123', '市辖区', 'hn,xt,sxq', '430301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘潭市市辖区', '0732');
INSERT INTO `t_area` VALUES ('2125', '2123', '雨湖区', 'hn,xt,yhq', '430302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘潭市雨湖区', '0732');
INSERT INTO `t_area` VALUES ('2126', '2123', '岳塘区', 'hn,xt,ytq', '430304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘潭市岳塘区', '0732');
INSERT INTO `t_area` VALUES ('2127', '2123', '湘潭县', 'hn,xt,xtx', '430321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘潭市湘潭县', '0732');
INSERT INTO `t_area` VALUES ('2128', '2123', '湘乡市', 'hn,xt,xx', '430381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘潭市湘乡市', '0732');
INSERT INTO `t_area` VALUES ('2129', '2123', '韶山市', 'hn,xt,ss', '430382', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘潭市韶山市', '0732');
INSERT INTO `t_area` VALUES ('213', '194', '曲周县', 'hb,hd,qzx', '130435', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市曲周县', '0310');
INSERT INTO `t_area` VALUES ('2130', '2100', '衡阳市', 'hn,hy', '430400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市', '0734');
INSERT INTO `t_area` VALUES ('2131', '2130', '市辖区', 'hn,hy,sxq', '430401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市市辖区', '0734');
INSERT INTO `t_area` VALUES ('2132', '2130', '珠晖区', 'hn,hy,zhq', '430405', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市珠晖区', '0734');
INSERT INTO `t_area` VALUES ('2133', '2130', '雁峰区', 'hn,hy,yfq', '430406', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市雁峰区', '0734');
INSERT INTO `t_area` VALUES ('2134', '2130', '石鼓区', 'hn,hy,sgq', '430407', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市石鼓区', '0734');
INSERT INTO `t_area` VALUES ('2135', '2130', '蒸湘区', 'hn,hy,zxq', '430408', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市蒸湘区', '0734');
INSERT INTO `t_area` VALUES ('2136', '2130', '南岳区', 'hn,hy,nyq', '430412', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市南岳区', '0734');
INSERT INTO `t_area` VALUES ('2137', '2130', '衡阳县', 'hn,hy,hyx', '430421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市衡阳县', '0734');
INSERT INTO `t_area` VALUES ('2138', '2130', '衡南县', 'hn,hy,hnx', '430422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市衡南县', '0734');
INSERT INTO `t_area` VALUES ('2139', '2130', '衡山县', 'hn,hy,hsx', '430423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市衡山县', '0734');
INSERT INTO `t_area` VALUES ('214', '194', '武安市', 'hb,hd,wa', '130481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邯郸市武安市', '0310');
INSERT INTO `t_area` VALUES ('2140', '2130', '衡东县', 'hn,hy,hdx', '430424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市衡东县', '0734');
INSERT INTO `t_area` VALUES ('2141', '2130', '祁东县', 'hn,hy,qdx', '430426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市祁东县', '0734');
INSERT INTO `t_area` VALUES ('2142', '2130', '耒阳市', 'hn,hy,ly', '430481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市耒阳市', '0734');
INSERT INTO `t_area` VALUES ('2143', '2130', '常宁市', 'hn,hy,cn', '430482', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省衡阳市常宁市', '0734');
INSERT INTO `t_area` VALUES ('2144', '2100', '邵阳市', 'hn,sy', '430500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市', '0739');
INSERT INTO `t_area` VALUES ('2145', '2144', '市辖区', 'hn,sy,sxq', '430501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市市辖区', '0739');
INSERT INTO `t_area` VALUES ('2146', '2144', '双清区', 'hn,sy,sqq', '430502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市双清区', '0739');
INSERT INTO `t_area` VALUES ('2147', '2144', '大祥区', 'hn,sy,dxq', '430503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市大祥区', '0739');
INSERT INTO `t_area` VALUES ('2148', '2144', '北塔区', 'hn,sy,btq', '430511', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市北塔区', '0739');
INSERT INTO `t_area` VALUES ('2149', '2144', '邵东县', 'hn,sy,sdx', '430521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市邵东县', '0739');
INSERT INTO `t_area` VALUES ('215', '143', '邢台市', 'hb,xt', '130500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市', '0319');
INSERT INTO `t_area` VALUES ('2150', '2144', '新邵县', 'hn,sy,xsx', '430522', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市新邵县', '0739');
INSERT INTO `t_area` VALUES ('2151', '2144', '邵阳县', 'hn,sy,syx', '430523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市邵阳县', '0739');
INSERT INTO `t_area` VALUES ('2152', '2144', '隆回县', 'hn,sy,lhx', '430524', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市隆回县', '0739');
INSERT INTO `t_area` VALUES ('2153', '2144', '洞口县', 'hn,sy,dkx', '430525', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市洞口县', '0739');
INSERT INTO `t_area` VALUES ('2154', '2144', '绥宁县', 'hn,sy,snx', '430527', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市绥宁县', '0739');
INSERT INTO `t_area` VALUES ('2155', '2144', '新宁县', 'hn,sy,xnx', '430528', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市新宁县', '0739');
INSERT INTO `t_area` VALUES ('2156', '2144', '城步苗族自治县', 'hn,sy,cbmzzzx', '430529', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市城步苗族自治县', '0739');
INSERT INTO `t_area` VALUES ('2157', '2144', '武冈市', 'hn,sy,wg', '430581', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省邵阳市武冈市', '0739');
INSERT INTO `t_area` VALUES ('2158', '2100', '岳阳市', 'hn,yy', '430600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市', '0730');
INSERT INTO `t_area` VALUES ('2159', '2158', '市辖区', 'hn,yy,sxq', '430601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市市辖区', '0730');
INSERT INTO `t_area` VALUES ('216', '215', '市辖区', 'hb,xt,sxq', '130501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市市辖区', '0319');
INSERT INTO `t_area` VALUES ('2160', '2158', '岳阳楼区', 'hn,yy,yylq', '430602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市岳阳楼区', '0730');
INSERT INTO `t_area` VALUES ('2161', '2158', '云溪区', 'hn,yy,yxq', '430603', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市云溪区', '0730');
INSERT INTO `t_area` VALUES ('2162', '2158', '君山区', 'hn,yy,jsq', '430611', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市君山区', '0730');
INSERT INTO `t_area` VALUES ('2163', '2158', '岳阳县', 'hn,yy,yyx', '430621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市岳阳县', '0730');
INSERT INTO `t_area` VALUES ('2164', '2158', '华容县', 'hn,yy,hrx', '430623', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市华容县', '0730');
INSERT INTO `t_area` VALUES ('2165', '2158', '湘阴县', 'hn,yy,xyx', '430624', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市湘阴县', '0730');
INSERT INTO `t_area` VALUES ('2166', '2158', '平江县', 'hn,yy,pjx', '430626', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市平江县', '0730');
INSERT INTO `t_area` VALUES ('2167', '2158', '汨罗市', 'hn,yy,ml', '430681', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市汨罗市', '0730');
INSERT INTO `t_area` VALUES ('2168', '2158', '临湘市', 'hn,yy,lx', '430682', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省岳阳市临湘市', '0730');
INSERT INTO `t_area` VALUES ('2169', '2100', '常德市', 'hn,cd', '430700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市', '0736');
INSERT INTO `t_area` VALUES ('217', '215', '桥东区', 'hb,xt,qdq', '130502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市桥东区', '0319');
INSERT INTO `t_area` VALUES ('2170', '2169', '市辖区', 'hn,cd,sxq', '430701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市市辖区', '0736');
INSERT INTO `t_area` VALUES ('2171', '2169', '武陵区', 'hn,cd,wlq', '430702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市武陵区', '0736');
INSERT INTO `t_area` VALUES ('2172', '2169', '鼎城区', 'hn,cd,dcq', '430703', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市鼎城区', '0736');
INSERT INTO `t_area` VALUES ('2173', '2169', '安乡县', 'hn,cd,axx', '430721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市安乡县', '0736');
INSERT INTO `t_area` VALUES ('2174', '2169', '汉寿县', 'hn,cd,hsx', '430722', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市汉寿县', '0736');
INSERT INTO `t_area` VALUES ('2175', '2169', '澧县', 'hn,cd,lx', '430723', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市澧县', '0736');
INSERT INTO `t_area` VALUES ('2176', '2169', '临澧县', 'hn,cd,llx', '430724', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市临澧县', '0736');
INSERT INTO `t_area` VALUES ('2177', '2169', '桃源县', 'hn,cd,tyx', '430725', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市桃源县', '0736');
INSERT INTO `t_area` VALUES ('2178', '2169', '石门县', 'hn,cd,smx', '430726', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市石门县', '0736');
INSERT INTO `t_area` VALUES ('2179', '2169', '津市市', 'hn,cd,js', '430781', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省常德市津市市', '0736');
INSERT INTO `t_area` VALUES ('218', '215', '桥西区', 'hb,xt,qxq', '130503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市桥西区', '0319');
INSERT INTO `t_area` VALUES ('2180', '2100', '张家界市', 'hn,zjj', '430800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省张家界市', '0744');
INSERT INTO `t_area` VALUES ('2181', '2180', '市辖区', 'hn,zjj,sxq', '430801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省张家界市市辖区', '0744');
INSERT INTO `t_area` VALUES ('2182', '2180', '永定区', 'hn,zjj,ydq', '430802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省张家界市永定区', '0744');
INSERT INTO `t_area` VALUES ('2183', '2180', '武陵源区', 'hn,zjj,wlyq', '430811', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省张家界市武陵源区', '0744');
INSERT INTO `t_area` VALUES ('2184', '2180', '慈利县', 'hn,zjj,clx', '430821', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省张家界市慈利县', '0744');
INSERT INTO `t_area` VALUES ('2185', '2180', '桑植县', 'hn,zjj,szx', '430822', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省张家界市桑植县', '0744');
INSERT INTO `t_area` VALUES ('2186', '2100', '益阳市', 'hn,yy', '430900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省益阳市', '0737');
INSERT INTO `t_area` VALUES ('2187', '2186', '市辖区', 'hn,yy,sxq', '430901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省益阳市市辖区', '0737');
INSERT INTO `t_area` VALUES ('2188', '2186', '资阳区', 'hn,yy,zyq', '430902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省益阳市资阳区', '0737');
INSERT INTO `t_area` VALUES ('2189', '2186', '赫山区', 'hn,yy,hsq', '430903', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省益阳市赫山区', '0737');
INSERT INTO `t_area` VALUES ('219', '215', '邢台县', 'hb,xt,xtx', '130521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市邢台县', '0319');
INSERT INTO `t_area` VALUES ('2190', '2186', '南县', 'hn,yy,nx', '430921', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省益阳市南县', '0737');
INSERT INTO `t_area` VALUES ('2191', '2186', '桃江县', 'hn,yy,tjx', '430922', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省益阳市桃江县', '0737');
INSERT INTO `t_area` VALUES ('2192', '2186', '安化县', 'hn,yy,ahx', '430923', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省益阳市安化县', '0737');
INSERT INTO `t_area` VALUES ('2193', '2186', '沅江市', 'hn,yy,yj', '430981', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省益阳市沅江市', '0737');
INSERT INTO `t_area` VALUES ('2194', '2100', '郴州市', 'hn,cz', '431000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市', '0735');
INSERT INTO `t_area` VALUES ('2195', '2194', '市辖区', 'hn,cz,sxq', '431001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市市辖区', '0735');
INSERT INTO `t_area` VALUES ('2196', '2194', '北湖区', 'hn,cz,bhq', '431002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市北湖区', '0735');
INSERT INTO `t_area` VALUES ('2197', '2194', '苏仙区', 'hn,cz,sxq', '431003', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市苏仙区', '0735');
INSERT INTO `t_area` VALUES ('2198', '2194', '桂阳县', 'hn,cz,gyx', '431021', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市桂阳县', '0735');
INSERT INTO `t_area` VALUES ('2199', '2194', '宜章县', 'hn,cz,yzx', '431022', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市宜章县', '0735');
INSERT INTO `t_area` VALUES ('220', '215', '临城县', 'hb,xt,lcx', '130522', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市临城县', '0319');
INSERT INTO `t_area` VALUES ('2200', '2194', '永兴县', 'hn,cz,yxx', '431023', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市永兴县', '0735');
INSERT INTO `t_area` VALUES ('2201', '2194', '嘉禾县', 'hn,cz,jhx', '431024', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市嘉禾县', '0735');
INSERT INTO `t_area` VALUES ('2202', '2194', '临武县', 'hn,cz,lwx', '431025', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市临武县', '0735');
INSERT INTO `t_area` VALUES ('2203', '2194', '汝城县', 'hn,cz,rcx', '431026', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市汝城县', '0735');
INSERT INTO `t_area` VALUES ('2204', '2194', '桂东县', 'hn,cz,gdx', '431027', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市桂东县', '0735');
INSERT INTO `t_area` VALUES ('2205', '2194', '安仁县', 'hn,cz,arx', '431028', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市安仁县', '0735');
INSERT INTO `t_area` VALUES ('2206', '2194', '资兴市', 'hn,cz,zx', '431081', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省郴州市资兴市', '0735');
INSERT INTO `t_area` VALUES ('2207', '21000', '永州市', 'hn,yz', '431100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市', '0746');
INSERT INTO `t_area` VALUES ('2208', '2207', '市辖区', 'hn,yz,sxq', '431101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市市辖区', '0746');
INSERT INTO `t_area` VALUES ('2209', '2207', '零陵区', 'hn,yz,llq', '431102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市零陵区', '0746');
INSERT INTO `t_area` VALUES ('221', '215', '内丘县', 'hb,xt,nqx', '130523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市内丘县', '0319');
INSERT INTO `t_area` VALUES ('2210', '2207', '冷水滩区', 'hn,yz,lstq', '431103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市冷水滩区', '0746');
INSERT INTO `t_area` VALUES ('2211', '2207', '祁阳县', 'hn,yz,qyx', '431121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市祁阳县', '0746');
INSERT INTO `t_area` VALUES ('2212', '2207', '东安县', 'hn,yz,dax', '431122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市东安县', '0746');
INSERT INTO `t_area` VALUES ('2213', '2207', '双牌县', 'hn,yz,spx', '431123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市双牌县', '0746');
INSERT INTO `t_area` VALUES ('2214', '2207', '道县', 'hn,yz,dx', '431124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市道县', '0746');
INSERT INTO `t_area` VALUES ('2215', '2207', '江永县', 'hn,yz,jyx', '431125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市江永县', '0746');
INSERT INTO `t_area` VALUES ('2216', '2207', '宁远县', 'hn,yz,nyx', '431126', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市宁远县', '0746');
INSERT INTO `t_area` VALUES ('2217', '2207', '蓝山县', 'hn,yz,lsx', '431127', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市蓝山县', '0746');
INSERT INTO `t_area` VALUES ('2218', '2207', '新田县', 'hn,yz,xtx', '431128', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市新田县', '0746');
INSERT INTO `t_area` VALUES ('2219', '2207', '江华瑶族自治县', 'hn,yz,jhyzzzx', '431129', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省永州市江华瑶族自治县', '0746');
INSERT INTO `t_area` VALUES ('222', '215', '柏乡县', 'hb,xt,bxx', '130524', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市柏乡县', '0319');
INSERT INTO `t_area` VALUES ('2220', '2100', '怀化市', 'hn,hh', '431200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市', '0745');
INSERT INTO `t_area` VALUES ('2221', '2220', '市辖区', 'hn,hh,sxq', '431201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市市辖区', '0745');
INSERT INTO `t_area` VALUES ('2222', '2220', '鹤城区', 'hn,hh,hcq', '431202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市鹤城区', '0745');
INSERT INTO `t_area` VALUES ('2223', '2220', '中方县', 'hn,hh,zfx', '431221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市中方县', '0745');
INSERT INTO `t_area` VALUES ('2224', '2220', '沅陵县', 'hn,hh,ylx', '431222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市沅陵县', '0745');
INSERT INTO `t_area` VALUES ('2225', '2220', '辰溪县', 'hn,hh,cxx', '431223', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市辰溪县', '0745');
INSERT INTO `t_area` VALUES ('2226', '2220', '溆浦县', 'hn,hh,xpx', '431224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市溆浦县', '0745');
INSERT INTO `t_area` VALUES ('2227', '2220', '会同县', 'hn,hh,htx', '431225', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市会同县', '0745');
INSERT INTO `t_area` VALUES ('2228', '2220', '麻阳苗族自治县', 'hn,hh,mymzzzx', '431226', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市麻阳苗族自治县', '0745');
INSERT INTO `t_area` VALUES ('2229', '2220', '新晃侗族自治县', 'hn,hh,xhdzzzx', '431227', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市新晃侗族自治县', '0745');
INSERT INTO `t_area` VALUES ('223', '215', '隆尧县', 'hb,xt,lyx', '130525', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市隆尧县', '0319');
INSERT INTO `t_area` VALUES ('2230', '2220', '芷江侗族自治县', 'hn,hh,zjdzzzx', '431228', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市芷江侗族自治县', '0745');
INSERT INTO `t_area` VALUES ('2231', '2220', '靖州苗族侗族自治县', 'hn,hh,jzmzdzzzx', '431229', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市靖州苗族侗族自治县', '0745');
INSERT INTO `t_area` VALUES ('2232', '2220', '通道侗族自治县', 'hn,hh,tddzzzx', '431230', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市通道侗族自治县', '0745');
INSERT INTO `t_area` VALUES ('2233', '2220', '洪江市', 'hn,hh,hj', '431281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省怀化市洪江市', '0745');
INSERT INTO `t_area` VALUES ('2234', '2100', '娄底市', 'hn,ld', '431300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省娄底市', '0738');
INSERT INTO `t_area` VALUES ('2235', '2234', '市辖区', 'hn,ld,sxq', '431301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省娄底市市辖区', '0738');
INSERT INTO `t_area` VALUES ('2236', '2234', '娄星区', 'hn,ld,lxq', '431302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省娄底市娄星区', '0738');
INSERT INTO `t_area` VALUES ('2237', '2234', '双峰县', 'hn,ld,sfx', '431321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省娄底市双峰县', '0738');
INSERT INTO `t_area` VALUES ('2238', '2234', '新化县', 'hn,ld,xhx', '431322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省娄底市新化县', '0738');
INSERT INTO `t_area` VALUES ('2239', '2234', '冷水江市', 'hn,ld,lsj', '431381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省娄底市冷水江市', '0738');
INSERT INTO `t_area` VALUES ('224', '215', '任县', 'hb,xt,rx', '130526', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市任县', '0319');
INSERT INTO `t_area` VALUES ('2240', '2234', '涟源市', 'hn,ld,ly', '431382', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省娄底市涟源市', '0738');
INSERT INTO `t_area` VALUES ('2241', '2100', '湘西土家族苗族自治州', 'hn,xxtjzmzzzz', '433100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘西土家族苗族自治州', '0743');
INSERT INTO `t_area` VALUES ('2242', '2241', '吉首市', 'hn,xxtjzmzzzz,js', '433101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘西土家族苗族自治州吉首市', '0743');
INSERT INTO `t_area` VALUES ('2243', '2241', '泸溪县', 'hn,xxtjzmzzzz,lxx', '433122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘西土家族苗族自治州泸溪县', '0736');
INSERT INTO `t_area` VALUES ('2244', '2241', '凤凰县', 'hn,xxtjzmzzzz,fhx', '433123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘西土家族苗族自治州凤凰县', '0736');
INSERT INTO `t_area` VALUES ('2245', '2241', '花垣县', 'hn,xxtjzmzzzz,hyx', '433124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘西土家族苗族自治州花垣县', '0736');
INSERT INTO `t_area` VALUES ('2246', '2241', '保靖县', 'hn,xxtjzmzzzz,bjx', '433125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘西土家族苗族自治州保靖县', '0736');
INSERT INTO `t_area` VALUES ('2247', '2241', '古丈县', 'hn,xxtjzmzzzz,gzx', '433126', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘西土家族苗族自治州古丈县', '0736');
INSERT INTO `t_area` VALUES ('2248', '2241', '永顺县', 'hn,xxtjzmzzzz,ysx', '433127', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘西土家族苗族自治州永顺县', '0736');
INSERT INTO `t_area` VALUES ('2249', '2241', '龙山县', 'hn,xxtjzmzzzz,lsx', '433130', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '湖南省湘西土家族苗族自治州龙山县', '0736');
INSERT INTO `t_area` VALUES ('225', '215', '南和县', 'hb,xt,nhx', '130527', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市南和县', '0319');
INSERT INTO `t_area` VALUES ('2250', '100', '广东省', 'gd', '440000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省', '0763');
INSERT INTO `t_area` VALUES ('2251', '2250', '广州市', 'gd,gz', '440100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市', '020');
INSERT INTO `t_area` VALUES ('2252', '2251', '市辖区', 'gd,gz,sxq', '440101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市市辖区', '020');
INSERT INTO `t_area` VALUES ('2253', '2251', '荔湾区', 'gd,gz,lwq', '440103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市荔湾区', '020');
INSERT INTO `t_area` VALUES ('2254', '2251', '越秀区', 'gd,gz,yxq', '440104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市越秀区', '020');
INSERT INTO `t_area` VALUES ('2255', '2251', '海珠区', 'gd,gz,hzq', '440105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市海珠区', '020');
INSERT INTO `t_area` VALUES ('2256', '2251', '天河区', 'gd,gz,thq', '440106', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市天河区', '020');
INSERT INTO `t_area` VALUES ('2257', '2251', '白云区', 'gd,gz,byq', '440111', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市白云区', '020');
INSERT INTO `t_area` VALUES ('2258', '2251', '黄埔区', 'gd,gz,hpq', '440112', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市黄埔区', '020');
INSERT INTO `t_area` VALUES ('2259', '2251', '番禺区', 'gd,gz,pyq', '440113', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市番禺区', '020');
INSERT INTO `t_area` VALUES ('226', '215', '宁晋县', 'hb,xt,njx', '130528', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市宁晋县', '0319');
INSERT INTO `t_area` VALUES ('2260', '2251', '花都区', 'gd,gz,hdq', '440114', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市花都区', '020');
INSERT INTO `t_area` VALUES ('2261', '2251', '南沙区', 'gd,gz,nsq', '440115', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市南沙区', '020');
INSERT INTO `t_area` VALUES ('2262', '2251', '萝岗区', 'gd,gz,lgq', '440116', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市萝岗区', '020');
INSERT INTO `t_area` VALUES ('2263', '2251', '增城市', 'gd,gz,zc', '440183', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市增城市', '020');
INSERT INTO `t_area` VALUES ('2264', '2251', '从化市', 'gd,gz,ch', '440184', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省广州市从化市', '020');
INSERT INTO `t_area` VALUES ('2265', '2250', '韶关市', 'gd,sg', '440200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市', '0751');
INSERT INTO `t_area` VALUES ('2266', '2265', '市辖区', 'gd,sg,sxq', '440201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市市辖区', '0751');
INSERT INTO `t_area` VALUES ('2267', '2265', '武江区', 'gd,sg,wjq', '440203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市武江区', '0751');
INSERT INTO `t_area` VALUES ('2268', '2265', '浈江区', 'gd,sg,zjq', '440204', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市浈江区', '0751');
INSERT INTO `t_area` VALUES ('2269', '2265', '曲江区', 'gd,sg,qjq', '440205', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市曲江区', '0751');
INSERT INTO `t_area` VALUES ('227', '215', '巨鹿县', 'hb,xt,jlx', '130529', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市巨鹿县', '0319');
INSERT INTO `t_area` VALUES ('2270', '2265', '始兴县', 'gd,sg,sxx', '440222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市始兴县', '0751');
INSERT INTO `t_area` VALUES ('2271', '2265', '仁化县', 'gd,sg,rhx', '440224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市仁化县', '0751');
INSERT INTO `t_area` VALUES ('2272', '2265', '翁源县', 'gd,sg,wyx', '440229', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市翁源县', '0751');
INSERT INTO `t_area` VALUES ('2273', '2265', '乳源瑶族自治县', 'gd,sg,ryyzzzx', '440232', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市乳源瑶族自治县', '0751');
INSERT INTO `t_area` VALUES ('2274', '2265', '新丰县', 'gd,sg,xfx', '440233', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市新丰县', '0751');
INSERT INTO `t_area` VALUES ('2275', '2265', '乐昌市', 'gd,sg,lc', '440281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市乐昌市', '0751');
INSERT INTO `t_area` VALUES ('2276', '2265', '南雄市', 'gd,sg,nx', '440282', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省韶关市南雄市', '0751');
INSERT INTO `t_area` VALUES ('2277', '2250', '深圳市', 'gd,sz', '440300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省深圳市', '0755');
INSERT INTO `t_area` VALUES ('2278', '2277', '市辖区', 'gd,sz,sxq', '440301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省深圳市市辖区', '0755');
INSERT INTO `t_area` VALUES ('2279', '2277', '罗湖区', 'gd,sz,lhq', '440303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省深圳市罗湖区', '0755');
INSERT INTO `t_area` VALUES ('228', '215', '新河县', 'hb,xt,xhx', '130530', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市新河县', '0319');
INSERT INTO `t_area` VALUES ('2280', '2277', '福田区', 'gd,sz,ftq', '440304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省深圳市福田区', '0755');
INSERT INTO `t_area` VALUES ('2281', '2277', '南山区', 'gd,sz,nsq', '440305', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省深圳市南山区', '0755');
INSERT INTO `t_area` VALUES ('2282', '2277', '宝安区', 'gd,sz,baq', '440306', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省深圳市宝安区', '0755');
INSERT INTO `t_area` VALUES ('2283', '2277', '龙岗区', 'gd,sz,lgq', '440307', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省深圳市龙岗区', '0755');
INSERT INTO `t_area` VALUES ('2284', '2277', '盐田区', 'gd,sz,ytq', '440308', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省深圳市盐田区', '0755');
INSERT INTO `t_area` VALUES ('2285', '2250', '珠海市', 'gd,zh', '440400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省珠海市', '0756');
INSERT INTO `t_area` VALUES ('2286', '2285', '市辖区', 'gd,zh,sxq', '440401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省珠海市市辖区', '0756');
INSERT INTO `t_area` VALUES ('2287', '2285', '香洲区', 'gd,zh,xzq', '440402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省珠海市香洲区', '0756');
INSERT INTO `t_area` VALUES ('2288', '2285', '斗门区', 'gd,zh,dmq', '440403', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省珠海市斗门区', '0756');
INSERT INTO `t_area` VALUES ('2289', '2285', '金湾区', 'gd,zh,jwq', '440404', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省珠海市金湾区', '0756');
INSERT INTO `t_area` VALUES ('229', '215', '广宗县', 'hb,xt,gzx', '130531', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市广宗县', '0319');
INSERT INTO `t_area` VALUES ('2290', '2250', '汕头市', 'gd,st', '440500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕头市', '0754');
INSERT INTO `t_area` VALUES ('2291', '2290', '市辖区', 'gd,st,sxq', '440501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕头市市辖区', '0754');
INSERT INTO `t_area` VALUES ('2292', '2290', '龙湖区', 'gd,st,lhq', '440507', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕头市龙湖区', '0754');
INSERT INTO `t_area` VALUES ('2293', '2290', '金平区', 'gd,st,jpq', '440511', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕头市金平区', '0754');
INSERT INTO `t_area` VALUES ('2294', '2290', '濠江区', 'gd,st,hjq', '440512', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕头市濠江区', '0754');
INSERT INTO `t_area` VALUES ('2295', '2290', '潮阳区', 'gd,st,cyq', '440513', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕头市潮阳区', '0754');
INSERT INTO `t_area` VALUES ('2296', '2290', '潮南区', 'gd,st,cnq', '440514', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕头市潮南区', '0754');
INSERT INTO `t_area` VALUES ('2297', '2290', '澄海区', 'gd,st,chq', '440515', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕头市澄海区', '0754');
INSERT INTO `t_area` VALUES ('2298', '2290', '南澳县', 'gd,st,nax', '440523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕头市南澳县', '0754');
INSERT INTO `t_area` VALUES ('2299', '2250', '佛山市', 'gd,fs', '440600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省佛山市', '0757');
INSERT INTO `t_area` VALUES ('230', '215', '平乡县', 'hb,xt,pxx', '130532', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市平乡县', '0319');
INSERT INTO `t_area` VALUES ('2300', '2299', '市辖区', 'gd,fs,sxq', '440601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省佛山市市辖区', '0757');
INSERT INTO `t_area` VALUES ('2301', '2299', '禅城区', 'gd,fs,ccq', '440604', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省佛山市禅城区', '0757');
INSERT INTO `t_area` VALUES ('2302', '2299', '南海区', 'gd,fs,nhq', '440605', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省佛山市南海区', '0757');
INSERT INTO `t_area` VALUES ('2303', '2299', '顺德区', 'gd,fs,sdq', '440606', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省佛山市顺德区', '0757');
INSERT INTO `t_area` VALUES ('2304', '2299', '三水区', 'gd,fs,ssq', '440607', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省佛山市三水区', '0757');
INSERT INTO `t_area` VALUES ('2305', '2299', '高明区', 'gd,fs,gmq', '440608', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省佛山市高明区', '0757');
INSERT INTO `t_area` VALUES ('2306', '2250', '江门市', 'gd,jm', '440700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省江门市', '0750');
INSERT INTO `t_area` VALUES ('2307', '2306', '市辖区', 'gd,jm,sxq', '440701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省江门市市辖区', '0750');
INSERT INTO `t_area` VALUES ('2308', '2306', '蓬江区', 'gd,jm,pjq', '440703', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省江门市蓬江区', '0750');
INSERT INTO `t_area` VALUES ('2309', '2306', '江海区', 'gd,jm,jhq', '440704', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省江门市江海区', '0750');
INSERT INTO `t_area` VALUES ('231', '215', '威县', 'hb,xt,wx', '130533', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市威县', '0319');
INSERT INTO `t_area` VALUES ('2310', '2306', '新会区', 'gd,jm,xhq', '440705', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省江门市新会区', '0750');
INSERT INTO `t_area` VALUES ('2311', '2306', '台山市', 'gd,jm,ts', '440781', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省江门市台山市', '0750');
INSERT INTO `t_area` VALUES ('2312', '2306', '开平市', 'gd,jm,kp', '440783', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省江门市开平市', '0750');
INSERT INTO `t_area` VALUES ('2313', '2306', '鹤山市', 'gd,jm,hs', '440784', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省江门市鹤山市', '0750');
INSERT INTO `t_area` VALUES ('2314', '2306', '恩平市', 'gd,jm,ep', '440785', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省江门市恩平市', '0750');
INSERT INTO `t_area` VALUES ('2315', '2250', '湛江市', 'gd,zj', '440800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市', '0759');
INSERT INTO `t_area` VALUES ('2316', '2315', '市辖区', 'gd,zj,sxq', '440801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市市辖区', '0759');
INSERT INTO `t_area` VALUES ('2317', '2315', '赤坎区', 'gd,zj,ckq', '440802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市赤坎区', '0759');
INSERT INTO `t_area` VALUES ('2318', '2315', '霞山区', 'gd,zj,xsq', '440803', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市霞山区', '0759');
INSERT INTO `t_area` VALUES ('2319', '2315', '坡头区', 'gd,zj,ptq', '440804', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市坡头区', '0759');
INSERT INTO `t_area` VALUES ('232', '215', '清河县', 'hb,xt,qhx', '130534', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市清河县', '0319');
INSERT INTO `t_area` VALUES ('2320', '2315', '麻章区', 'gd,zj,mzq', '440811', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市麻章区', '0759');
INSERT INTO `t_area` VALUES ('2321', '2315', '遂溪县', 'gd,zj,sxx', '440823', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市遂溪县', '0759');
INSERT INTO `t_area` VALUES ('2322', '2315', '徐闻县', 'gd,zj,xwx', '440825', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市徐闻县', '0759');
INSERT INTO `t_area` VALUES ('2323', '2315', '廉江市', 'gd,zj,lj', '440881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市廉江市', '0759');
INSERT INTO `t_area` VALUES ('2324', '2315', '雷州市', 'gd,zj,lz', '440882', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市雷州市', '0759');
INSERT INTO `t_area` VALUES ('2325', '2315', '吴川市', 'gd,zj,wc', '440883', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省湛江市吴川市', '0759');
INSERT INTO `t_area` VALUES ('2326', '2250', '茂名市', 'gd,mm', '440900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省茂名市', '0668');
INSERT INTO `t_area` VALUES ('2327', '2326', '市辖区', 'gd,mm,sxq', '440901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省茂名市市辖区', '0668');
INSERT INTO `t_area` VALUES ('2328', '2326', '茂南区', 'gd,mm,mnq', '440902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省茂名市茂南区', '0668');
INSERT INTO `t_area` VALUES ('2329', '2326', '茂港区', 'gd,mm,mgq', '440903', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省茂名市茂港区', '0668');
INSERT INTO `t_area` VALUES ('233', '215', '临西县', 'hb,xt,lxx', '130535', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市临西县', '0319');
INSERT INTO `t_area` VALUES ('2330', '2326', '电白县', 'gd,mm,dbx', '440923', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省茂名市电白县', '0668');
INSERT INTO `t_area` VALUES ('2331', '2326', '高州市', 'gd,mm,gz', '440981', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省茂名市高州市', '0668');
INSERT INTO `t_area` VALUES ('2332', '2326', '化州市', 'gd,mm,hz', '440982', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省茂名市化州市', '0668');
INSERT INTO `t_area` VALUES ('2333', '2326', '信宜市', 'gd,mm,xy', '440983', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省茂名市信宜市', '0668');
INSERT INTO `t_area` VALUES ('2334', '2250', '肇庆市', 'gd,zq', '441200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省肇庆市', '0758');
INSERT INTO `t_area` VALUES ('2335', '2334', '市辖区', 'gd,zq,sxq', '441201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省肇庆市市辖区', '0758');
INSERT INTO `t_area` VALUES ('2336', '2334', '端州区', 'gd,zq,dzq', '441202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省肇庆市端州区', '0758');
INSERT INTO `t_area` VALUES ('2337', '2334', '鼎湖区', 'gd,zq,dhq', '441203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省肇庆市鼎湖区', '0758');
INSERT INTO `t_area` VALUES ('2338', '2334', '广宁县', 'gd,zq,gnx', '441223', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省肇庆市广宁县', '0758');
INSERT INTO `t_area` VALUES ('2339', '2334', '怀集县', 'gd,zq,hjx', '441224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省肇庆市怀集县', '0758');
INSERT INTO `t_area` VALUES ('234', '215', '南宫市', 'hb,xt,ng', '130581', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市南宫市', '0319');
INSERT INTO `t_area` VALUES ('2340', '2334', '封开县', 'gd,zq,fkx', '441225', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省肇庆市封开县', '0758');
INSERT INTO `t_area` VALUES ('2341', '2334', '德庆县', 'gd,zq,dqx', '441226', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省肇庆市德庆县', '0758');
INSERT INTO `t_area` VALUES ('2342', '2334', '高要市', 'gd,zq,gy', '441283', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省肇庆市高要市', '0758');
INSERT INTO `t_area` VALUES ('2343', '2334', '四会市', 'gd,zq,sh', '441284', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省肇庆市四会市', '0758');
INSERT INTO `t_area` VALUES ('2344', '2250', '惠州市', 'gd,hz', '441300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省惠州市', '0752');
INSERT INTO `t_area` VALUES ('2345', '2344', '市辖区', 'gd,hz,sxq', '441301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省惠州市市辖区', '0752');
INSERT INTO `t_area` VALUES ('2346', '2344', '惠城区', 'gd,hz,hcq', '441302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省惠州市惠城区', '0752');
INSERT INTO `t_area` VALUES ('2347', '2344', '惠阳区', 'gd,hz,hyq', '441303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省惠州市惠阳区', '0752');
INSERT INTO `t_area` VALUES ('2348', '2344', '博罗县', 'gd,hz,blx', '441322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省惠州市博罗县', '0752');
INSERT INTO `t_area` VALUES ('2349', '2344', '惠东县', 'gd,hz,hdx', '441323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省惠州市惠东县', '0752');
INSERT INTO `t_area` VALUES ('235', '215', '沙河市', 'hb,xt,sh', '130582', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省邢台市沙河市', '0319');
INSERT INTO `t_area` VALUES ('2350', '2344', '龙门县', 'gd,hz,lmx', '441324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省惠州市龙门县', '0752');
INSERT INTO `t_area` VALUES ('2351', '2250', '梅州市', 'gd,mz', '441400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省梅州市', '0753');
INSERT INTO `t_area` VALUES ('2352', '2351', '市辖区', 'gd,mz,sxq', '441401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省梅州市市辖区', '0753');
INSERT INTO `t_area` VALUES ('2353', '2351', '梅江区', 'gd,mz,mjq', '441402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省梅州市梅江区', '0753');
INSERT INTO `t_area` VALUES ('2354', '2351', '梅县', 'gd,mz,mx', '441421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省梅州市梅县', '0753');
INSERT INTO `t_area` VALUES ('2355', '2351', '大埔县', 'gd,mz,dpx', '441422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省梅州市大埔县', '0753');
INSERT INTO `t_area` VALUES ('2356', '2351', '丰顺县', 'gd,mz,fsx', '441423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省梅州市丰顺县', '0753');
INSERT INTO `t_area` VALUES ('2357', '2351', '五华县', 'gd,mz,whx', '441424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省梅州市五华县', '0753');
INSERT INTO `t_area` VALUES ('2358', '2351', '平远县', 'gd,mz,pyx', '441426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省梅州市平远县', '0753');
INSERT INTO `t_area` VALUES ('2359', '2351', '蕉岭县', 'gd,mz,jlx', '441427', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省梅州市蕉岭县', '0753');
INSERT INTO `t_area` VALUES ('236', '143', '保定市', 'hb,bd', '130600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市', '0312');
INSERT INTO `t_area` VALUES ('2360', '2351', '兴宁市', 'gd,mz,xn', '441481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省梅州市兴宁市', '0753');
INSERT INTO `t_area` VALUES ('2361', '2250', '汕尾市', 'gd,sw', '441500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕尾市', '0660');
INSERT INTO `t_area` VALUES ('2362', '2361', '市辖区', 'gd,sw,sxq', '441501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕尾市市辖区', '0660');
INSERT INTO `t_area` VALUES ('2363', '2361', '城区', 'gd,sw,cq', '441502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕尾市城区', '0660');
INSERT INTO `t_area` VALUES ('2364', '2361', '海丰县', 'gd,sw,hfx', '441521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕尾市海丰县', '0660');
INSERT INTO `t_area` VALUES ('2365', '2361', '陆河县', 'gd,sw,lhx', '441523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕尾市陆河县', '0660');
INSERT INTO `t_area` VALUES ('2366', '2361', '陆丰市', 'gd,sw,lf', '441581', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省汕尾市陆丰市', '0660');
INSERT INTO `t_area` VALUES ('2367', '2250', '河源市', 'gd,hy', '441600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省河源市', '0762');
INSERT INTO `t_area` VALUES ('23670', '2367', ' ', 'gd,hy', '441625', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省河源市', '0762');
INSERT INTO `t_area` VALUES ('2368', '2367', '市辖区', 'gd,hy,sxq', '441601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省河源市市辖区', '0762');
INSERT INTO `t_area` VALUES ('2369', '2367', '源城区', 'gd,hy,ycq', '441602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省河源市源城区', '0762');
INSERT INTO `t_area` VALUES ('237', '236', '市辖区', 'hb,bd,sxq', '130601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市市辖区', '0312');
INSERT INTO `t_area` VALUES ('2370', '2367', '紫金县', 'gd,hy,zjx', '441621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省河源市紫金县', '0762');
INSERT INTO `t_area` VALUES ('2371', '2367', '龙川县', 'gd,hy,lcx', '441622', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省河源市龙川县', '0762');
INSERT INTO `t_area` VALUES ('2372', '2367', '连平县', 'gd,hy,lpx', '441623', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省河源市连平县', '0762');
INSERT INTO `t_area` VALUES ('2373', '2367', '和平县', 'gd,hy,hpx', '441624', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省河源市和平县', '0762');
INSERT INTO `t_area` VALUES ('2374', '2367', '东源县', 'gd,hy,dyx', '441625', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省河源市东源县', '0762');
INSERT INTO `t_area` VALUES ('2375', '2250', '阳江市', 'gd,yj', '441700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省阳江市', '0662');
INSERT INTO `t_area` VALUES ('2376', '2375', '市辖区', 'gd,yj,sxq', '441701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省阳江市市辖区', '0662');
INSERT INTO `t_area` VALUES ('2377', '2375', '江城区', 'gd,yj,jcq', '441702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省阳江市江城区', '0662');
INSERT INTO `t_area` VALUES ('2378', '2375', '阳西县', 'gd,yj,yxx', '441721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省阳江市阳西县', '0662');
INSERT INTO `t_area` VALUES ('2379', '2375', '阳东县', 'gd,yj,ydx', '441723', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省阳江市阳东县', '0662');
INSERT INTO `t_area` VALUES ('238', '236', '新市区', 'hb,bd,xsq', '130602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市新市区', '0312');
INSERT INTO `t_area` VALUES ('2380', '2375', '阳春市', 'gd,yj,yc', '441781', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省阳江市阳春市', '0662');
INSERT INTO `t_area` VALUES ('2381', '2250', '清远市', 'gd,qy', '441800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省清远市', '0763');
INSERT INTO `t_area` VALUES ('2382', '2381', '市辖区', 'gd,qy,sxq', '441801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省清远市市辖区', '0763');
INSERT INTO `t_area` VALUES ('2383', '2381', '清城区', 'gd,qy,qcq', '441802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省清远市清城区', '0763');
INSERT INTO `t_area` VALUES ('2384', '2381', '佛冈县', 'gd,qy,fgx', '441821', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省清远市佛冈县', '0763');
INSERT INTO `t_area` VALUES ('2385', '2381', '阳山县', 'gd,qy,ysx', '441823', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省清远市阳山县', '0763');
INSERT INTO `t_area` VALUES ('2386', '2381', '连山壮族瑶族自治县', 'gd,qy,lszzyzzzx', '441825', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省清远市连山壮族瑶族自治县', '0763');
INSERT INTO `t_area` VALUES ('2387', '2381', '连南瑶族自治县', 'gd,qy,lnyzzzx', '441826', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省清远市连南瑶族自治县', '0763');
INSERT INTO `t_area` VALUES ('2388', '2381', '清新县', 'gd,qy,qxx', '441827', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省清远市清新县', '0763');
INSERT INTO `t_area` VALUES ('2389', '2381', '英德市', 'gd,qy,yd', '441881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省清远市英德市', '0763');
INSERT INTO `t_area` VALUES ('239', '236', '北市区', 'hb,bd,bsq', '130603', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市北市区', '0312');
INSERT INTO `t_area` VALUES ('2390', '2381', '连州市', 'gd,qy,lz', '441882', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省清远市连州市', '0763');
INSERT INTO `t_area` VALUES ('2391', '2250', '东莞市', 'gd,dg', '441900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省东莞市', '0769');
INSERT INTO `t_area` VALUES ('2392', '2250', '中山市', 'gd,zs', '442000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市', '0760');
INSERT INTO `t_area` VALUES ('2393', '2250', '潮州市', 'gd,cz', '445100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省潮州市', '0768');
INSERT INTO `t_area` VALUES ('2394', '2393', '市辖区', 'gd,cz,sxq', '445101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省潮州市市辖区', '0768');
INSERT INTO `t_area` VALUES ('2395', '2393', '湘桥区', 'gd,cz,xqq', '445102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省潮州市湘桥区', '0768');
INSERT INTO `t_area` VALUES ('2396', '2393', '潮安县', 'gd,cz,cax', '445121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省潮州市潮安县', '0768');
INSERT INTO `t_area` VALUES ('2397', '2393', '饶平县', 'gd,cz,rpx', '445122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省潮州市饶平县', '0768');
INSERT INTO `t_area` VALUES ('2398', '2250', '揭阳市', 'gd,jy', '445200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省揭阳市', '0663');
INSERT INTO `t_area` VALUES ('2399', '2398', '市辖区', 'gd,jy,sxq', '445201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省揭阳市市辖区', '0663');
INSERT INTO `t_area` VALUES ('240', '236', '南市区', 'hb,bd,nsq', '130604', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市南市区', '0312');
INSERT INTO `t_area` VALUES ('2400', '2398', '榕城区', 'gd,jy,rcq', '445202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省揭阳市榕城区', '0663');
INSERT INTO `t_area` VALUES ('2401', '2398', '揭东县', 'gd,jy,jdx', '445221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省揭阳市揭东县', '0663');
INSERT INTO `t_area` VALUES ('2402', '2398', '揭西县', 'gd,jy,jxx', '445222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省揭阳市揭西县', '0663');
INSERT INTO `t_area` VALUES ('2403', '2398', '惠来县', 'gd,jy,hlx', '445224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省揭阳市惠来县', '0663');
INSERT INTO `t_area` VALUES ('2404', '2398', '普宁市', 'gd,jy,pn', '445281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省揭阳市普宁市', '0663');
INSERT INTO `t_area` VALUES ('2405', '2250', '云浮市', 'gd,yf', '445300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省云浮市', '0766');
INSERT INTO `t_area` VALUES ('2406', '2405', '市辖区', 'gd,yf,sxq', '445301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省云浮市市辖区', '0766');
INSERT INTO `t_area` VALUES ('2407', '2405', '云城区', 'gd,yf,ycq', '445302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省云浮市云城区', '0766');
INSERT INTO `t_area` VALUES ('2408', '2405', '新兴县', 'gd,yf,xxx', '445321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省云浮市新兴县', '0766');
INSERT INTO `t_area` VALUES ('2409', '2405', '郁南县', 'gd,yf,ynx', '445322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省云浮市郁南县', '0766');
INSERT INTO `t_area` VALUES ('241', '236', '满城县', 'hb,bd,mcx', '130621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市满城县', '0312');
INSERT INTO `t_area` VALUES ('2410', '2405', '云安县', 'gd,yf,yax', '445323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省云浮市云安县', '0766');
INSERT INTO `t_area` VALUES ('2411', '2405', '罗定市', 'gd,yf,ld', '445381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省云浮市罗定市', '0766');
INSERT INTO `t_area` VALUES ('2412', '100', '广西壮族自治区', 'gxzzzzq', '450000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区', '0771');
INSERT INTO `t_area` VALUES ('2413', '2412', '南宁市', 'gxzzzzq,nn', '450100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市', '0771');
INSERT INTO `t_area` VALUES ('2414', '2413', '市辖区', 'gxzzzzq,nn,sxq', '450101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市市辖区', '0771');
INSERT INTO `t_area` VALUES ('2415', '2413', '兴宁区', 'gxzzzzq,nn,xnq', '450102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市兴宁区', '0771');
INSERT INTO `t_area` VALUES ('2416', '2413', '青秀区', 'gxzzzzq,nn,qxq', '450103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市青秀区', '0771');
INSERT INTO `t_area` VALUES ('2417', '2413', '江南区', 'gxzzzzq,nn,jnq', '450105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市江南区', '0771');
INSERT INTO `t_area` VALUES ('2418', '2413', '西乡塘区', 'gxzzzzq,nn,xxtq', '450107', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市西乡塘区', '0771');
INSERT INTO `t_area` VALUES ('2419', '2413', '良庆区', 'gxzzzzq,nn,lqq', '450108', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市良庆区', '0771');
INSERT INTO `t_area` VALUES ('242', '236', '清苑县', 'hb,bd,qyx', '130622', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市清苑县', '0312');
INSERT INTO `t_area` VALUES ('2420', '2413', '邕宁区', 'gxzzzzq,nn,ynq', '450109', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市邕宁区', '0771');
INSERT INTO `t_area` VALUES ('2421', '2413', '武鸣县', 'gxzzzzq,nn,wmx', '450122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市武鸣县', '0771');
INSERT INTO `t_area` VALUES ('2422', '2413', '隆安县', 'gxzzzzq,nn,lax', '450123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市隆安县', '0771');
INSERT INTO `t_area` VALUES ('2423', '2413', '马山县', 'gxzzzzq,nn,msx', '450124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市马山县', '0771');
INSERT INTO `t_area` VALUES ('2424', '2413', '上林县', 'gxzzzzq,nn,slx', '450125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市上林县', '0771');
INSERT INTO `t_area` VALUES ('2425', '2413', '宾阳县', 'gxzzzzq,nn,byx', '450126', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市宾阳县', '0771');
INSERT INTO `t_area` VALUES ('2426', '2413', '横县', 'gxzzzzq,nn,hx', '450127', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区南宁市横县', '0771');
INSERT INTO `t_area` VALUES ('2427', '2412', '柳州市', 'gxzzzzq,lz', '450200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市', '0772');
INSERT INTO `t_area` VALUES ('2428', '2427', '市辖区', 'gxzzzzq,lz,sxq', '450201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市市辖区', '0772');
INSERT INTO `t_area` VALUES ('2429', '2427', '城中区', 'gxzzzzq,lz,czq', '450202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市城中区', '0772');
INSERT INTO `t_area` VALUES ('243', '236', '涞水县', 'hb,bd,lsx', '130623', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市涞水县', '0312');
INSERT INTO `t_area` VALUES ('2430', '2427', '鱼峰区', 'gxzzzzq,lz,yfq', '450203', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市鱼峰区', '0772');
INSERT INTO `t_area` VALUES ('2431', '2427', '柳南区', 'gxzzzzq,lz,lnq', '450204', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市柳南区', '0772');
INSERT INTO `t_area` VALUES ('2432', '2427', '柳北区', 'gxzzzzq,lz,lbq', '450205', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市柳北区', '0772');
INSERT INTO `t_area` VALUES ('2433', '2427', '柳江县', 'gxzzzzq,lz,ljx', '450221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市柳江县', '0772');
INSERT INTO `t_area` VALUES ('2434', '2427', '柳城县', 'gxzzzzq,lz,lcx', '450222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市柳城县', '0772');
INSERT INTO `t_area` VALUES ('2435', '2427', '鹿寨县', 'gxzzzzq,lz,lzx', '450223', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市鹿寨县', '0772');
INSERT INTO `t_area` VALUES ('2436', '2427', '融安县', 'gxzzzzq,lz,rax', '450224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市融安县', '0772');
INSERT INTO `t_area` VALUES ('2437', '2427', '融水苗族自治县', 'gxzzzzq,lz,rsmzzzx', '450225', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市融水苗族自治县', '0772');
INSERT INTO `t_area` VALUES ('2438', '2427', '三江侗族自治县', 'gxzzzzq,lz,sjdzzzx', '450226', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区柳州市三江侗族自治县', '0772');
INSERT INTO `t_area` VALUES ('2439', '2412', '桂林市', 'gxzzzzq,gl', '450300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市', '0773');
INSERT INTO `t_area` VALUES ('244', '236', '阜平县', 'hb,bd,fpx', '130624', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市阜平县', '0312');
INSERT INTO `t_area` VALUES ('2440', '2439', '市辖区', 'gxzzzzq,gl,sxq', '450301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市市辖区', '0773');
INSERT INTO `t_area` VALUES ('2441', '2439', '秀峰区', 'gxzzzzq,gl,xfq', '450302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市秀峰区', '0773');
INSERT INTO `t_area` VALUES ('2442', '2439', '叠彩区', 'gxzzzzq,gl,dcq', '450303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市叠彩区', '0773');
INSERT INTO `t_area` VALUES ('2443', '2439', '象山区', 'gxzzzzq,gl,xsq', '450304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市象山区', '0773');
INSERT INTO `t_area` VALUES ('2444', '2439', '七星区', 'gxzzzzq,gl,qxq', '450305', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市七星区', '0773');
INSERT INTO `t_area` VALUES ('2445', '2439', '雁山区', 'gxzzzzq,gl,ysq', '450311', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市雁山区', '0773');
INSERT INTO `t_area` VALUES ('2446', '2439', '阳朔县', 'gxzzzzq,gl,ysx', '450321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市阳朔县', '0773');
INSERT INTO `t_area` VALUES ('2447', '2439', '临桂县', 'gxzzzzq,gl,lgx', '450322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市临桂县', '0773');
INSERT INTO `t_area` VALUES ('2448', '2439', '灵川县', 'gxzzzzq,gl,lcx', '450323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市灵川县', '0773');
INSERT INTO `t_area` VALUES ('2449', '2439', '全州县', 'gxzzzzq,gl,qzx', '450324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市全州县', '0773');
INSERT INTO `t_area` VALUES ('245', '236', '徐水县', 'hb,bd,xsx', '130625', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市徐水县', '0312');
INSERT INTO `t_area` VALUES ('2450', '2439', '兴安县', 'gxzzzzq,gl,xax', '450325', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市兴安县', '0773');
INSERT INTO `t_area` VALUES ('2451', '2439', '永福县', 'gxzzzzq,gl,yfx', '450326', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市永福县', '0773');
INSERT INTO `t_area` VALUES ('2452', '2439', '灌阳县', 'gxzzzzq,gl,gyx', '450327', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市灌阳县', '0773');
INSERT INTO `t_area` VALUES ('2453', '2439', '龙胜各族自治县', 'gxzzzzq,gl,lsgzzzx', '450328', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市龙胜各族自治县', '0773');
INSERT INTO `t_area` VALUES ('2454', '2439', '资源县', 'gxzzzzq,gl,zyx', '450329', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市资源县', '0773');
INSERT INTO `t_area` VALUES ('2455', '2439', '平乐县', 'gxzzzzq,gl,plx', '450330', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市平乐县', '0773');
INSERT INTO `t_area` VALUES ('2456', '2439', '荔蒲县', 'gxzzzzq,gl,lpx', '450331', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市荔蒲县', '0773');
INSERT INTO `t_area` VALUES ('2457', '2439', '恭城瑶族自治县', 'gxzzzzq,gl,gcyzzzx', '450332', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区桂林市恭城瑶族自治县', '0773');
INSERT INTO `t_area` VALUES ('2458', '2412', '梧州市', 'gxzzzzq,wz', '450400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区梧州市', '0774');
INSERT INTO `t_area` VALUES ('2459', '2458', '市辖区', 'gxzzzzq,wz,sxq', '450401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区梧州市市辖区', '0774');
INSERT INTO `t_area` VALUES ('246', '236', '定兴县', 'hb,bd,dxx', '130626', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市定兴县', '0312');
INSERT INTO `t_area` VALUES ('2460', '2458', '万秀区', 'gxzzzzq,wz,wxq', '450403', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区梧州市万秀区', '0774');
INSERT INTO `t_area` VALUES ('2461', '2458', '蝶山区', 'gxzzzzq,wz,dsq', '450404', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区梧州市蝶山区', '0774');
INSERT INTO `t_area` VALUES ('2462', '2458', '长洲区', 'gxzzzzq,wz,czq', '450405', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区梧州市长洲区', '0774');
INSERT INTO `t_area` VALUES ('2463', '2458', '苍梧县', 'gxzzzzq,wz,cwx', '450421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区梧州市苍梧县', '0774');
INSERT INTO `t_area` VALUES ('2464', '2458', '藤县', 'gxzzzzq,wz,tx', '450422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区梧州市藤县', '0774');
INSERT INTO `t_area` VALUES ('2465', '2458', '蒙山县', 'gxzzzzq,wz,msx', '450423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区梧州市蒙山县', '0774');
INSERT INTO `t_area` VALUES ('2466', '2458', '岑溪市', 'gxzzzzq,wz,cx', '450481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区梧州市岑溪市', '0774');
INSERT INTO `t_area` VALUES ('2467', '2412', '北海市', 'gxzzzzq,bh', '450500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区北海市', '0779');
INSERT INTO `t_area` VALUES ('2468', '2467', '市辖区', 'gxzzzzq,bh,sxq', '450501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区北海市市辖区', '0779');
INSERT INTO `t_area` VALUES ('2469', '2467', '海城区', 'gxzzzzq,bh,hcq', '450502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区北海市海城区', '0779');
INSERT INTO `t_area` VALUES ('247', '236', '唐县', 'hb,bd,tx', '130627', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市唐县', '0312');
INSERT INTO `t_area` VALUES ('2470', '2467', '银海区', 'gxzzzzq,bh,yhq', '450503', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区北海市银海区', '0779');
INSERT INTO `t_area` VALUES ('2471', '2467', '铁山港区', 'gxzzzzq,bh,tsgq', '450512', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区北海市铁山港区', '0779');
INSERT INTO `t_area` VALUES ('2472', '2467', '合浦县', 'gxzzzzq,bh,hpx', '450521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区北海市合浦县', '0779');
INSERT INTO `t_area` VALUES ('2473', '2412', '防城港市', 'gxzzzzq,fcg', '450600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区防城港市', '0770');
INSERT INTO `t_area` VALUES ('2474', '2473', '市辖区', 'gxzzzzq,fcg,sxq', '450601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区防城港市市辖区', '0770');
INSERT INTO `t_area` VALUES ('2475', '2473', '港口区', 'gxzzzzq,fcg,gkq', '450602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区防城港市港口区', '0770');
INSERT INTO `t_area` VALUES ('2476', '2473', '防城区', 'gxzzzzq,fcg,fcq', '450603', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区防城港市防城区', '0770');
INSERT INTO `t_area` VALUES ('2477', '2473', '上思县', 'gxzzzzq,fcg,ssx', '450621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区防城港市上思县', '0770');
INSERT INTO `t_area` VALUES ('2478', '2473', '东兴市', 'gxzzzzq,fcg,dx', '450681', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区防城港市东兴市', '0770');
INSERT INTO `t_area` VALUES ('2479', '2412', '钦州市', 'gxzzzzq,qz', '450700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区钦州市', '0777');
INSERT INTO `t_area` VALUES ('248', '236', '高阳县', 'hb,bd,gyx', '130628', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市高阳县', '0312');
INSERT INTO `t_area` VALUES ('2480', '2479', '市辖区', 'gxzzzzq,qz,sxq', '450701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区钦州市市辖区', '0777');
INSERT INTO `t_area` VALUES ('2481', '2479', '钦南区', 'gxzzzzq,qz,qnq', '450702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区钦州市钦南区', '0777');
INSERT INTO `t_area` VALUES ('2482', '2479', '钦北区', 'gxzzzzq,qz,qbq', '450703', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区钦州市钦北区', '0777');
INSERT INTO `t_area` VALUES ('2483', '2479', '灵山县', 'gxzzzzq,qz,lsx', '450721', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区钦州市灵山县', '0777');
INSERT INTO `t_area` VALUES ('2484', '2479', '浦北县', 'gxzzzzq,qz,pbx', '450722', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区钦州市浦北县', '0777');
INSERT INTO `t_area` VALUES ('2485', '2412', '贵港市', 'gxzzzzq,gg', '450800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贵港市', '0775');
INSERT INTO `t_area` VALUES ('2486', '2485', '市辖区', 'gxzzzzq,gg,sxq', '450801', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贵港市市辖区', '0775');
INSERT INTO `t_area` VALUES ('2487', '2485', '港北区', 'gxzzzzq,gg,gbq', '450802', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贵港市港北区', '0775');
INSERT INTO `t_area` VALUES ('2488', '2485', '港南区', 'gxzzzzq,gg,gnq', '450803', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贵港市港南区', '0775');
INSERT INTO `t_area` VALUES ('2489', '2485', '覃塘区', 'gxzzzzq,gg,qtq', '450804', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贵港市覃塘区', '0775');
INSERT INTO `t_area` VALUES ('249', '236', '容城县', 'hb,bd,rcx', '130629', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市容城县', '0312');
INSERT INTO `t_area` VALUES ('2490', '2485', '平南县', 'gxzzzzq,gg,pnx', '450821', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贵港市平南县', '0775');
INSERT INTO `t_area` VALUES ('2491', '2485', '桂平市', 'gxzzzzq,gg,gp', '450881', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贵港市桂平市', '0775');
INSERT INTO `t_area` VALUES ('2492', '2412', '玉林市', 'gxzzzzq,yl', '450900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区玉林市', '0775');
INSERT INTO `t_area` VALUES ('2493', '2492', '市辖区', 'gxzzzzq,yl,sxq', '450901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区玉林市市辖区', '0775');
INSERT INTO `t_area` VALUES ('2494', '2492', '玉州区', 'gxzzzzq,yl,yzq', '450902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区玉林市玉州区', '0775');
INSERT INTO `t_area` VALUES ('2495', '2492', '容县', 'gxzzzzq,yl,rx', '450921', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区玉林市容县', '0775');
INSERT INTO `t_area` VALUES ('2496', '2492', '陆川县', 'gxzzzzq,yl,lcx', '450922', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区玉林市陆川县', '0775');
INSERT INTO `t_area` VALUES ('2497', '2492', '博白县', 'gxzzzzq,yl,bbx', '450923', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区玉林市博白县', '0775');
INSERT INTO `t_area` VALUES ('2498', '2492', '兴业县', 'gxzzzzq,yl,xyx', '450924', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区玉林市兴业县', '0775');
INSERT INTO `t_area` VALUES ('2499', '2492', '北流市', 'gxzzzzq,yl,bl', '450981', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区玉林市北流市', '0775');
INSERT INTO `t_area` VALUES ('250', '236', '涞源县', 'hb,bd,lyx', '130630', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市涞源县', '0312');
INSERT INTO `t_area` VALUES ('2500', '2412', '百色市', 'gxzzzzq,bs', '451000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市', '0776');
INSERT INTO `t_area` VALUES ('2501', '2500', '市辖区', 'gxzzzzq,bs,sxq', '451001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市市辖区', '0776');
INSERT INTO `t_area` VALUES ('2502', '2500', '右江区', 'gxzzzzq,bs,yjq', '451002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市右江区', '0776');
INSERT INTO `t_area` VALUES ('2503', '2500', '田阳县', 'gxzzzzq,bs,tyx', '451021', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市田阳县', '0776');
INSERT INTO `t_area` VALUES ('2504', '2500', '田东县', 'gxzzzzq,bs,tdx', '451022', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市田东县', '0776');
INSERT INTO `t_area` VALUES ('2505', '2500', '平果县', 'gxzzzzq,bs,pgx', '451023', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市平果县', '0776');
INSERT INTO `t_area` VALUES ('2506', '2500', '德保县', 'gxzzzzq,bs,dbx', '451024', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市德保县', '0776');
INSERT INTO `t_area` VALUES ('2507', '2500', '靖西县', 'gxzzzzq,bs,jxx', '451025', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市靖西县', '0776');
INSERT INTO `t_area` VALUES ('2508', '2500', '那坡县', 'gxzzzzq,bs,npx', '451026', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市那坡县', '0776');
INSERT INTO `t_area` VALUES ('2509', '2500', '凌云县', 'gxzzzzq,bs,lyx', '451027', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市凌云县', '0776');
INSERT INTO `t_area` VALUES ('251', '236', '望都县', 'hb,bd,wdx', '130631', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市望都县', '0312');
INSERT INTO `t_area` VALUES ('2510', '2500', '乐业县', 'gxzzzzq,bs,lyx', '451028', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市乐业县', '0776');
INSERT INTO `t_area` VALUES ('2511', '2500', '田林县', 'gxzzzzq,bs,tlx', '451029', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市田林县', '0776');
INSERT INTO `t_area` VALUES ('2512', '2500', '西林县', 'gxzzzzq,bs,xlx', '451030', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市西林县', '0776');
INSERT INTO `t_area` VALUES ('2513', '2500', '隆林各族自治县', 'gxzzzzq,bs,llgzzzx', '451031', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区百色市隆林各族自治县', '0776');
INSERT INTO `t_area` VALUES ('2514', '2412', '贺州市', 'gxzzzzq,hz', '451100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贺州市', '0774');
INSERT INTO `t_area` VALUES ('2515', '2514', '市辖区', 'gxzzzzq,hz,sxq', '451101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贺州市市辖区', '0774');
INSERT INTO `t_area` VALUES ('2516', '2514', '八步区', 'gxzzzzq,hz,bbq', '451102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贺州市八步区', '0774');
INSERT INTO `t_area` VALUES ('2517', '2514', '昭平县', 'gxzzzzq,hz,zpx', '451121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贺州市昭平县', '0774');
INSERT INTO `t_area` VALUES ('2518', '2514', '钟山县', 'gxzzzzq,hz,zsx', '451122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贺州市钟山县', '0774');
INSERT INTO `t_area` VALUES ('2519', '2514', '富川瑶族自治县', 'gxzzzzq,hz,fcyzzzx', '451123', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区贺州市富川瑶族自治县', '0774');
INSERT INTO `t_area` VALUES ('252', '236', '安新县', 'hb,bd,axx', '130632', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市安新县', '0312');
INSERT INTO `t_area` VALUES ('2520', '2412', '河池市', 'gxzzzzq,hc', '451200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市', '0778');
INSERT INTO `t_area` VALUES ('2521', '2520', '市辖区', 'gxzzzzq,hc,sxq', '451201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市市辖区', '0778');
INSERT INTO `t_area` VALUES ('2522', '2520', '金城江区', 'gxzzzzq,hc,jcjq', '451202', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市金城江区', '0778');
INSERT INTO `t_area` VALUES ('2523', '2520', '南丹县', 'gxzzzzq,hc,ndx', '451221', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市南丹县', '0778');
INSERT INTO `t_area` VALUES ('2524', '2520', '天峨县', 'gxzzzzq,hc,tex', '451222', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市天峨县', '0778');
INSERT INTO `t_area` VALUES ('2525', '2520', '凤山县', 'gxzzzzq,hc,fsx', '451223', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市凤山县', '0778');
INSERT INTO `t_area` VALUES ('2526', '2520', '东兰县', 'gxzzzzq,hc,dlx', '451224', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市东兰县', '0778');
INSERT INTO `t_area` VALUES ('2527', '2520', '罗城仫佬族自治县', 'gxzzzzq,hc,lcmlzzzx', '451225', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市罗城仫佬族自治县', '0778');
INSERT INTO `t_area` VALUES ('2528', '2520', '环江毛南族自治县', 'gxzzzzq,hc,hjmnzzzx', '451226', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市环江毛南族自治县', '0778');
INSERT INTO `t_area` VALUES ('2529', '2520', '巴马瑶族自治县', 'gxzzzzq,hc,bmyzzzx', '451227', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市巴马瑶族自治县', '0778');
INSERT INTO `t_area` VALUES ('253', '236', '易县', 'hb,bd,yx', '130633', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市易县', '0312');
INSERT INTO `t_area` VALUES ('2530', '2520', '都安瑶族自治县', 'gxzzzzq,hc,dayzzzx', '451228', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市都安瑶族自治县', '0778');
INSERT INTO `t_area` VALUES ('2531', '2520', '大化瑶族自治县', 'gxzzzzq,hc,dhyzzzx', '451229', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市大化瑶族自治县', '0778');
INSERT INTO `t_area` VALUES ('2532', '2520', '宜州市', 'gxzzzzq,hc,yz', '451281', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区河池市宜州市', '0778');
INSERT INTO `t_area` VALUES ('2533', '2412', '来宾市', 'gxzzzzq,lb', '451300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区来宾市', '0772');
INSERT INTO `t_area` VALUES ('2534', '2533', '市辖区', 'gxzzzzq,lb,sxq', '451301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区来宾市市辖区', '0772');
INSERT INTO `t_area` VALUES ('2535', '2533', '兴宾区', 'gxzzzzq,lb,xbq', '451302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区来宾市兴宾区', '0772');
INSERT INTO `t_area` VALUES ('2536', '2533', '忻城县', 'gxzzzzq,lb,xcx', '451321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区来宾市忻城县', '0772');
INSERT INTO `t_area` VALUES ('2537', '2533', '象州县', 'gxzzzzq,lb,xzx', '451322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区来宾市象州县', '0772');
INSERT INTO `t_area` VALUES ('2538', '2533', '武宣县', 'gxzzzzq,lb,wxx', '451323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区来宾市武宣县', '0772');
INSERT INTO `t_area` VALUES ('2539', '2533', '金秀瑶族自治县', 'gxzzzzq,lb,jxyzzzx', '451324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区来宾市金秀瑶族自治县', '0772');
INSERT INTO `t_area` VALUES ('254', '236', '曲阳县', 'hb,bd,qyx', '130634', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市曲阳县', '0312');
INSERT INTO `t_area` VALUES ('2540', '2533', '合山市', 'gxzzzzq,lb,hs', '451381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区来宾市合山市', '0772');
INSERT INTO `t_area` VALUES ('2541', '2412', '崇左市', 'gxzzzzq,cz', '451400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区崇左市', '0771');
INSERT INTO `t_area` VALUES ('2542', '2541', '市辖区', 'gxzzzzq,cz,sxq', '451401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区崇左市市辖区', '0771');
INSERT INTO `t_area` VALUES ('2543', '2541', '江洲区', 'gxzzzzq,cz,jzq', '451402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区崇左市江洲区', '0771');
INSERT INTO `t_area` VALUES ('2544', '2541', '扶绥县', 'gxzzzzq,cz,fsx', '451421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区崇左市扶绥县', '0771');
INSERT INTO `t_area` VALUES ('2545', '2541', '宁明县', 'gxzzzzq,cz,nmx', '451422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区崇左市宁明县', '0771');
INSERT INTO `t_area` VALUES ('2546', '2541', '龙州县', 'gxzzzzq,cz,lzx', '451423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区崇左市龙州县', '0771');
INSERT INTO `t_area` VALUES ('2547', '2541', '大新县', 'gxzzzzq,cz,dxx', '451424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区崇左市大新县', '0771');
INSERT INTO `t_area` VALUES ('2548', '2541', '天等县', 'gxzzzzq,cz,tdx', '451425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区崇左市天等县', '0771');
INSERT INTO `t_area` VALUES ('2549', '2541', '凭祥市', 'gxzzzzq,cz,px', '451481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广西壮族自治区崇左市凭祥市', '0771');
INSERT INTO `t_area` VALUES ('255', '236', '蠡县', 'hb,bd,lx', '130635', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市蠡县', '0312');
INSERT INTO `t_area` VALUES ('2550', '100', '海南省', 'hn', '460000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省', '0898');
INSERT INTO `t_area` VALUES ('2551', '2550', '海口市', 'hn,hk', '460100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省海口市', '0898');
INSERT INTO `t_area` VALUES ('2552', '2551', '市辖区', 'hn,hk,sxq', '460101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省海口市市辖区', '0898');
INSERT INTO `t_area` VALUES ('2553', '2551', '秀英区', 'hn,hk,xyq', '460105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省海口市秀英区', '0898');
INSERT INTO `t_area` VALUES ('2554', '2551', '龙华区', 'hn,hk,lhq', '460106', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省海口市龙华区', '0898');
INSERT INTO `t_area` VALUES ('2555', '2551', '琼山区', 'hn,hk,qsq', '460107', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省海口市琼山区', '0898');
INSERT INTO `t_area` VALUES ('2556', '2551', '美兰区', 'hn,hk,mlq', '460108', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省海口市美兰区', '0898');
INSERT INTO `t_area` VALUES ('2557', '2550', '三亚市', 'hn,sy', '460200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省三亚市', '0899');
INSERT INTO `t_area` VALUES ('2558', '2557', '市辖区', 'hn,sy,sxq', '460201', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省三亚市市辖区', '0899');
INSERT INTO `t_area` VALUES ('2559', '2550', '省直辖县级行政单位', 'hn,szxxjxzdw', '469000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位', '0898');
INSERT INTO `t_area` VALUES ('256', '236', '顺平县', 'hb,bd,spx', '130636', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市顺平县', '0312');
INSERT INTO `t_area` VALUES ('2560', '2559', '五指山市', 'hn,szxxjxzdw,wzs', '469001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位五指山市', '0898');
INSERT INTO `t_area` VALUES ('2561', '2559', '琼海市', 'hn,szxxjxzdw,qh', '469002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位琼海市', '0898');
INSERT INTO `t_area` VALUES ('2562', '2559', '儋州市', 'hn,szxxjxzdw,dz', '469003', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位儋州市', '0890');
INSERT INTO `t_area` VALUES ('2563', '2559', '文昌市', 'hn,szxxjxzdw,wc', '469005', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位文昌市', '0898');
INSERT INTO `t_area` VALUES ('2564', '2559', '万宁市', 'hn,szxxjxzdw,wn', '469006', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位万宁市', '0898');
INSERT INTO `t_area` VALUES ('2565', '2559', '东方市', 'hn,szxxjxzdw,df', '469007', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位东方市', '0890');
INSERT INTO `t_area` VALUES ('2566', '2559', '定安县(**)', 'hn,szxxjxzdw,dax(**)', '469021', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位定安县(**)', '0898');
INSERT INTO `t_area` VALUES ('2567', '2559', '屯昌县(**)', 'hn,szxxjxzdw,tcx(**)', '469022', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位屯昌县(**)', '0898');
INSERT INTO `t_area` VALUES ('2568', '2559', '澄迈县(**)', 'hn,szxxjxzdw,cmx(**)', '469023', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位澄迈县(**)', '0898');
INSERT INTO `t_area` VALUES ('2569', '2559', '临高县(**)', 'hn,szxxjxzdw,lgx(**)', '469024', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位临高县(**)', '0898');
INSERT INTO `t_area` VALUES ('257', '236', '博野县', 'hb,bd,byx', '130637', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市博野县', '0312');
INSERT INTO `t_area` VALUES ('2570', '2559', '白沙黎族自治县(**)', 'hn,szxxjxzdw,bslzzzx(**)', '469025', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位白沙黎族自治县(**)', '0898');
INSERT INTO `t_area` VALUES ('2571', '2559', '昌江黎族自治县(**)', 'hn,szxxjxzdw,cjlzzzx(**)', '469026', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位昌江黎族自治县(**)', '0898');
INSERT INTO `t_area` VALUES ('2572', '2559', '乐东黎族自治县(**)', 'hn,szxxjxzdw,ldlzzzx(**)', '469027', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位乐东黎族自治县(**)', '0898');
INSERT INTO `t_area` VALUES ('2573', '2559', '陵水黎族自治县(**)', 'hn,szxxjxzdw,lslzzzx(**)', '469028', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位陵水黎族自治县(**)', '0898');
INSERT INTO `t_area` VALUES ('2574', '2559', '保亭黎族苗族自治县(**)', 'hn,szxxjxzdw,btlzmzzzx(**)', '469029', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位保亭黎族苗族自治县(**)', '0898');
INSERT INTO `t_area` VALUES ('2575', '2559', '琼中黎族苗族自治县(**)', 'hn,szxxjxzdw,qzlzmzzzx(**)', '469030', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位琼中黎族苗族自治县(**)', '0898');
INSERT INTO `t_area` VALUES ('2576', '2559', '西沙群岛(**)', 'hn,szxxjxzdw,xsqd(**)', '469031', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位西沙群岛(**)', '0898');
INSERT INTO `t_area` VALUES ('2577', '2559', '南沙群岛(**)', 'hn,szxxjxzdw,nsqd(**)', '469032', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位南沙群岛(**)', '0898');
INSERT INTO `t_area` VALUES ('2578', '2559', '中沙群岛的岛礁及其海域(**)', 'hn,szxxjxzdw,zsqdddjjqhy(**)', '469033', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '海南省省直辖县级行政单位中沙群岛的岛礁及其海域(**)', '0898');
INSERT INTO `t_area` VALUES ('2579', '100', '重庆', 'cq', '500000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市', '023');
INSERT INTO `t_area` VALUES ('258', '236', '雄县', 'hb,bd,xx', '130638', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市雄县', '0312');
INSERT INTO `t_area` VALUES ('2580', '2579', '重庆市', 'cq,sxq', '500100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区', '023');
INSERT INTO `t_area` VALUES ('2581', '2580', '万州区', 'cq,wzq', '500101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区万州区', '023');
INSERT INTO `t_area` VALUES ('2582', '2580', '涪陵区', 'cq,flq', '500102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区涪陵区', '023');
INSERT INTO `t_area` VALUES ('2583', '2580', '渝中区', 'cq,yzq', '500103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区渝中区', '023');
INSERT INTO `t_area` VALUES ('2584', '2580', '大渡口区', 'cq,ddkq', '500104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区大渡口区', '023');
INSERT INTO `t_area` VALUES ('2585', '2580', '江北区', 'cq,jbq', '500105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区江北区', '023');
INSERT INTO `t_area` VALUES ('2586', '2580', '沙坪坝区', 'cq,spbq', '500106', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区沙坪坝区', '023');
INSERT INTO `t_area` VALUES ('2587', '2580', '九龙坡区', 'cq,jlpq', '500107', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区九龙坡区', '023');
INSERT INTO `t_area` VALUES ('2588', '2580', '南岸区', 'cq,naq', '500108', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区南岸区', '023');
INSERT INTO `t_area` VALUES ('2589', '2580', '北碚区', 'cq,bbq', '500109', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区北碚区', '023');
INSERT INTO `t_area` VALUES ('259', '236', '涿州市', 'hb,bd,zz', '130681', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市涿州市', '0312');
INSERT INTO `t_area` VALUES ('2590', '2580', '万盛区', 'cq,wsq', '500110', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区万盛区', '023');
INSERT INTO `t_area` VALUES ('2591', '2559', '洋浦经济开发区', 'hn,szxxjxzdw,ypjjkfq', '469025', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '海南省省直辖县级行政单位洋浦经济开发区', '0898');
INSERT INTO `t_area` VALUES ('2592', '2580', '渝北区', 'cq,ybq', '500112', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区渝北区', '023');
INSERT INTO `t_area` VALUES ('2593', '2580', '巴南区', 'cq,bnq', '500113', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区巴南区', '023');
INSERT INTO `t_area` VALUES ('2594', '2580', '黔江区', 'cq,qjq', '500114', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区黔江区', '8299');
INSERT INTO `t_area` VALUES ('2595', '2580', '长寿区', 'cq,csq', '500115', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区长寿区', '023');
INSERT INTO `t_area` VALUES ('2596', '2580', '江津区', 'cq,jjq', '500116', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区江津区', '023');
INSERT INTO `t_area` VALUES ('2597', '2580', '合川区', 'cq,hcq', '500117', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区合川区', '023');
INSERT INTO `t_area` VALUES ('2598', '2580', '永川区', 'cq,ycq', '500118', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区永川区', '023');
INSERT INTO `t_area` VALUES ('2599', '2580', '南川区', 'cq,ncq', '500119', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市市辖区南川区', '023');
INSERT INTO `t_area` VALUES ('260', '236', '定州市', 'hb,bd,dz', '130682', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市定州市', '0312');
INSERT INTO `t_area` VALUES ('2601', '2580', '綦江区', 'cq,qjx', '500222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县綦江县', '023');
INSERT INTO `t_area` VALUES ('2602', '2580', '潼南区', 'cq,tnx', '500223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县潼南县', '023');
INSERT INTO `t_area` VALUES ('2603', '2580', '铜梁区', 'cq,tlx', '500224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县铜梁县', '023');
INSERT INTO `t_area` VALUES ('2604', '2580', '大足区', 'cq,dzx', '500225', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县大足县', '023');
INSERT INTO `t_area` VALUES ('2605', '2580', '荣昌区', 'cq,rcx', '500226', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县荣昌县', '023');
INSERT INTO `t_area` VALUES ('2606', '2580', '璧山区', 'cq,bsx', '500227', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县璧山县', '023');
INSERT INTO `t_area` VALUES ('2607', '2580', '梁平县', 'cq,lpx', '500228', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县梁平县', '023');
INSERT INTO `t_area` VALUES ('2608', '2580', '城口县', 'cq,ckx', '500229', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县城口县', '023');
INSERT INTO `t_area` VALUES ('2609', '2580', '丰都县', 'cq,fdx', '500230', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县丰都县', '023');
INSERT INTO `t_area` VALUES ('261', '236', '安国市', 'hb,bd,ag', '130683', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市安国市', '0312');
INSERT INTO `t_area` VALUES ('2610', '2580', '垫江县', 'cq,djx', '500231', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县垫江县', '023');
INSERT INTO `t_area` VALUES ('2611', '2580', '武隆县', 'cq,wlx', '500232', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县武隆县', '023');
INSERT INTO `t_area` VALUES ('2612', '2580', '忠县', 'cq,zx', '500233', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县忠县', '023');
INSERT INTO `t_area` VALUES ('2613', '2580', '开县', 'cq,kx', '500234', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县开县', '023');
INSERT INTO `t_area` VALUES ('2614', '2580', '云阳县', 'cq,yyx', '500235', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县云阳县', '023');
INSERT INTO `t_area` VALUES ('2615', '2580', '奉节县', 'cq,fjx', '500236', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县奉节县', '023');
INSERT INTO `t_area` VALUES ('2616', '2580', '巫山县', 'cq,wsx', '500237', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县巫山县', '023');
INSERT INTO `t_area` VALUES ('2617', '2580', '巫溪县', 'cq,wxx', '500238', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县巫溪县', '023');
INSERT INTO `t_area` VALUES ('2618', '2580', '石柱县', 'cq,sztjzzzx', '500240', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县石柱土家族自治县', '023');
INSERT INTO `t_area` VALUES ('2619', '2580', '秀山县', 'cq,xstjzmzzzx', '500241', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县秀山土家族苗族自治县', '023');
INSERT INTO `t_area` VALUES ('262', '236', '高碑店市', 'hb,bd,gbd', '130684', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省保定市高碑店市', '0312');
INSERT INTO `t_area` VALUES ('2620', '2580', '酉阳县', 'cq,yytjzmzzzx', '500242', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县酉阳土家族苗族自治县', '023');
INSERT INTO `t_area` VALUES ('2621', '2580', '彭水县', 'cq,psmztjzzzx', '500243', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '重庆市县彭水苗族土家族自治县', '023');
INSERT INTO `t_area` VALUES ('2622', '100', '四川省', 'sc', '510000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省', '0816');
INSERT INTO `t_area` VALUES ('2623', '2622', '成都市', 'sc,cd', '510100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市', '028');
INSERT INTO `t_area` VALUES ('2624', '2623', '市辖区', 'sc,cd,sxq', '510101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市市辖区', '028');
INSERT INTO `t_area` VALUES ('2625', '2623', '锦江区', 'sc,cd,jjq', '510104', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市锦江区', '028');
INSERT INTO `t_area` VALUES ('2626', '2623', '青羊区', 'sc,cd,qyq', '510105', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市青羊区', '028');
INSERT INTO `t_area` VALUES ('2627', '2623', '金牛区', 'sc,cd,jnq', '510106', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市金牛区', '028');
INSERT INTO `t_area` VALUES ('2628', '2623', '武侯区', 'sc,cd,whq', '510107', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市武侯区', '028');
INSERT INTO `t_area` VALUES ('2629', '2623', '成华区', 'sc,cd,chq', '510108', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市成华区', '028');
INSERT INTO `t_area` VALUES ('263', '143', '张家口市', 'hb,zjk', '130700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省张家口市', '0313');
INSERT INTO `t_area` VALUES ('2630', '2623', '龙泉驿区', 'sc,cd,lqyq', '510112', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市龙泉驿区', '028');
INSERT INTO `t_area` VALUES ('2631', '2623', '青白江区', 'sc,cd,qbjq', '510113', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市青白江区', '028');
INSERT INTO `t_area` VALUES ('2632', '2623', '新都区', 'sc,cd,xdq', '510114', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市新都区', '028');
INSERT INTO `t_area` VALUES ('2633', '2623', '温江区', 'sc,cd,wjq', '510115', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市温江区', '028');
INSERT INTO `t_area` VALUES ('2634', '2623', '金堂县', 'sc,cd,jtx', '510121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市金堂县', '028');
INSERT INTO `t_area` VALUES ('2635', '2623', '双流县', 'sc,cd,slx', '510122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市双流县', '028');
INSERT INTO `t_area` VALUES ('2636', '2623', '郫县', 'sc,cd,px', '510124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市郫县', '028');
INSERT INTO `t_area` VALUES ('2637', '2623', '大邑县', 'sc,cd,dyx', '510129', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市大邑县', '028');
INSERT INTO `t_area` VALUES ('2638', '2623', '蒲江县', 'sc,cd,pjx', '510131', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市蒲江县', '028');
INSERT INTO `t_area` VALUES ('2639', '2623', '新津县', 'sc,cd,xjx', '510132', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市新津县', '028');
INSERT INTO `t_area` VALUES ('264', '263', '市辖区', 'hb,zjk,sxq', '130701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省张家口市市辖区', '0313');
INSERT INTO `t_area` VALUES ('2640', '2623', '都江堰市', 'sc,cd,djy', '510181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市都江堰市', '028');
INSERT INTO `t_area` VALUES ('2641', '2623', '彭州市', 'sc,cd,pz', '510182', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市彭州市', '028');
INSERT INTO `t_area` VALUES ('2642', '2623', '邛崃市', 'sc,cd,ql', '510183', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市邛崃市', '028');
INSERT INTO `t_area` VALUES ('2643', '2623', '崇州市', 'sc,cd,cz', '510184', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省成都市崇州市', '028');
INSERT INTO `t_area` VALUES ('2644', '2622', '自贡市', 'sc,zg', '510300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省自贡市', '0813');
INSERT INTO `t_area` VALUES ('2645', '2644', '市辖区', 'sc,zg,sxq', '510301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省自贡市市辖区', '0813');
INSERT INTO `t_area` VALUES ('2646', '2644', '自流井区', 'sc,zg,zljq', '510302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省自贡市自流井区', '0813');
INSERT INTO `t_area` VALUES ('2647', '2644', '贡井区', 'sc,zg,gjq', '510303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省自贡市贡井区', '0813');
INSERT INTO `t_area` VALUES ('2648', '2644', '大安区', 'sc,zg,daq', '510304', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省自贡市大安区', '0813');
INSERT INTO `t_area` VALUES ('2649', '2644', '沿滩区', 'sc,zg,ytq', '510311', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '四川省自贡市沿滩区', '0813');
INSERT INTO `t_area` VALUES ('265', '263', '桥东区', 'hb,zjk,qdq', '130702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省张家口市桥东区', '0313');
INSERT INTO `t_area` VALUES ('2650', '2644', '荣县', 'sc,zg,rx', '510321', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省自贡市荣县', '0813');
INSERT INTO `t_area` VALUES ('2651', '2644', '富顺县', 'sc,zg,fsx', '510322', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省自贡市富顺县', '0813');
INSERT INTO `t_area` VALUES ('2652', '2622', '攀枝花市', 'sc,pzh', '510400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省攀枝花市', '0812');
INSERT INTO `t_area` VALUES ('2653', '2652', '市辖区', 'sc,pzh,sxq', '510401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省攀枝花市市辖区', '0812');
INSERT INTO `t_area` VALUES ('2654', '2652', '东区', 'sc,pzh,dq', '510402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省攀枝花市东区', '0812');
INSERT INTO `t_area` VALUES ('2655', '2652', '西区', 'sc,pzh,xq', '510403', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省攀枝花市西区', '0812');
INSERT INTO `t_area` VALUES ('2656', '2652', '仁和区', 'sc,pzh,rhq', '510411', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省攀枝花市仁和区', '0812');
INSERT INTO `t_area` VALUES ('2657', '2652', '米易县', 'sc,pzh,myx', '510421', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省攀枝花市米易县', '0812');
INSERT INTO `t_area` VALUES ('2658', '2652', '盐边县', 'sc,pzh,ybx', '510422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省攀枝花市盐边县', '0812');
INSERT INTO `t_area` VALUES ('2659', '2622', '泸州市', 'sc,lz', '510500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省泸州市', '0830');
INSERT INTO `t_area` VALUES ('266', '263', '桥西区', 'hb,zjk,qxq', '130703', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市桥西区', '0313');
INSERT INTO `t_area` VALUES ('2660', '2659', '市辖区', 'sc,lz,sxq', '510501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省泸州市市辖区', '0830');
INSERT INTO `t_area` VALUES ('2661', '2659', '江阳区', 'sc,lz,jyq', '510502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省泸州市江阳区', '0830');
INSERT INTO `t_area` VALUES ('2662', '2659', '纳溪区', 'sc,lz,nxq', '510503', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省泸州市纳溪区', '0830');
INSERT INTO `t_area` VALUES ('2663', '2659', '龙马潭区', 'sc,lz,lmtq', '510504', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省泸州市龙马潭区', '0830');
INSERT INTO `t_area` VALUES ('2664', '2659', '泸县', 'sc,lz,lx', '510521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省泸州市泸县', '0830');
INSERT INTO `t_area` VALUES ('2665', '2659', '合江县', 'sc,lz,hjx', '510522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省泸州市合江县', '0830');
INSERT INTO `t_area` VALUES ('2666', '2659', '叙永县', 'sc,lz,xyx', '510524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省泸州市叙永县', '0830');
INSERT INTO `t_area` VALUES ('2667', '2659', '古蔺县', 'sc,lz,glx', '510525', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省泸州市古蔺县', '0830');
INSERT INTO `t_area` VALUES ('2668', '2622', '德阳市', 'sc,dy', '510600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省德阳市', '0838');
INSERT INTO `t_area` VALUES ('2669', '2668', '市辖区', 'sc,dy,sxq', '510601', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省德阳市市辖区', '0838');
INSERT INTO `t_area` VALUES ('267', '263', '宣化区', 'hb,zjk,xhq', '130705', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市宣化区', '0313');
INSERT INTO `t_area` VALUES ('2670', '2668', '旌阳区', 'sc,dy,jyq', '510603', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省德阳市旌阳区', '0838');
INSERT INTO `t_area` VALUES ('2671', '2668', '中江县', 'sc,dy,zjx', '510623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省德阳市中江县', '0838');
INSERT INTO `t_area` VALUES ('2672', '2668', '罗江县', 'sc,dy,ljx', '510626', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省德阳市罗江县', '0838');
INSERT INTO `t_area` VALUES ('2673', '2668', '广汉市', 'sc,dy,gh', '510681', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省德阳市广汉市', '0838');
INSERT INTO `t_area` VALUES ('2674', '2668', '什邡市', 'sc,dy,sf', '510682', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省德阳市什邡市', '0838');
INSERT INTO `t_area` VALUES ('2675', '2668', '绵竹市', 'sc,dy,mz', '510683', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省德阳市绵竹市', '0838');
INSERT INTO `t_area` VALUES ('2676', '2622', '绵阳市', 'sc,my', '510700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市', '0816');
INSERT INTO `t_area` VALUES ('2677', '2676', '市辖区', 'sc,my,sxq', '510701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市市辖区', '0816');
INSERT INTO `t_area` VALUES ('2678', '2676', '涪城区', 'sc,my,fcq', '510703', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市涪城区', '0816');
INSERT INTO `t_area` VALUES ('2679', '2676', '游仙区', 'sc,my,yxq', '510704', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市游仙区', '0816');
INSERT INTO `t_area` VALUES ('268', '263', '下花园区', 'hb,zjk,xhyq', '130706', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市下花园区', '0313');
INSERT INTO `t_area` VALUES ('2680', '2676', '三台县', 'sc,my,stx', '510722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市三台县', '0816');
INSERT INTO `t_area` VALUES ('2681', '2676', '盐亭县', 'sc,my,ytx', '510723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市盐亭县', '0816');
INSERT INTO `t_area` VALUES ('2682', '2676', '安县', 'sc,my,ax', '510724', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市安县', '0816');
INSERT INTO `t_area` VALUES ('2683', '2676', '梓潼县', 'sc,my,ztx', '510725', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市梓潼县', '0816');
INSERT INTO `t_area` VALUES ('2684', '2676', '北川羌族自治县', 'sc,my,bcqzzzx', '510726', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市北川羌族自治县', '0816');
INSERT INTO `t_area` VALUES ('2685', '2676', '平武县', 'sc,my,pwx', '510727', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市平武县', '0816');
INSERT INTO `t_area` VALUES ('2686', '2676', '江油市', 'sc,my,jy', '510781', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省绵阳市江油市', '0816');
INSERT INTO `t_area` VALUES ('2687', '2622', '广元市', 'sc,gy', '510800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广元市', '0839');
INSERT INTO `t_area` VALUES ('2688', '2687', '市辖区', 'sc,gy,sxq', '510801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广元市市辖区', '0839');
INSERT INTO `t_area` VALUES ('2689', '2687', '市中区', 'sc,gy,szq', '510802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广元市市中区', '0839');
INSERT INTO `t_area` VALUES ('269', '263', '宣化县', 'hb,zjk,xhx', '130721', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市宣化县', '0313');
INSERT INTO `t_area` VALUES ('2690', '2687', '元坝区', 'sc,gy,ybq', '510811', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广元市元坝区', '0839');
INSERT INTO `t_area` VALUES ('2691', '2687', '朝天区', 'sc,gy,ctq', '510812', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广元市朝天区', '0839');
INSERT INTO `t_area` VALUES ('2692', '2687', '旺苍县', 'sc,gy,wcx', '510821', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广元市旺苍县', '0839');
INSERT INTO `t_area` VALUES ('2693', '2687', '青川县', 'sc,gy,qcx', '510822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广元市青川县', '0839');
INSERT INTO `t_area` VALUES ('2694', '2687', '剑阁县', 'sc,gy,jgx', '510823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广元市剑阁县', '0839');
INSERT INTO `t_area` VALUES ('2695', '2687', '苍溪县', 'sc,gy,cxx', '510824', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广元市苍溪县', '0839');
INSERT INTO `t_area` VALUES ('2696', '2622', '遂宁市', 'sc,sn', '510900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省遂宁市', '0825');
INSERT INTO `t_area` VALUES ('2697', '2696', '市辖区', 'sc,sn,sxq', '510901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省遂宁市市辖区', '0825');
INSERT INTO `t_area` VALUES ('2698', '2696', '船山区', 'sc,sn,csq', '510903', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省遂宁市船山区', '0825');
INSERT INTO `t_area` VALUES ('2699', '2696', '安居区', 'sc,sn,ajq', '510904', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省遂宁市安居区', '0825');
INSERT INTO `t_area` VALUES ('270', '263', '张北县', 'hb,zjk,zbx', '130722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市张北县', '0313');
INSERT INTO `t_area` VALUES ('2700', '2696', '蓬溪县', 'sc,sn,pxx', '510921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省遂宁市蓬溪县', '0825');
INSERT INTO `t_area` VALUES ('2701', '2696', '射洪县', 'sc,sn,shx', '510922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省遂宁市射洪县', '0825');
INSERT INTO `t_area` VALUES ('2702', '2696', '大英县', 'sc,sn,dyx', '510923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省遂宁市大英县', '0825');
INSERT INTO `t_area` VALUES ('2703', '2622', '内江市', 'sc,nj', '511000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省内江市', '0832');
INSERT INTO `t_area` VALUES ('2704', '2703', '市辖区', 'sc,nj,sxq', '511001', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省内江市市辖区', '0832');
INSERT INTO `t_area` VALUES ('2705', '2703', '市中区', 'sc,nj,szq', '511002', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省内江市市中区', '0832');
INSERT INTO `t_area` VALUES ('2706', '2703', '东兴区', 'sc,nj,dxq', '511011', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省内江市东兴区', '0832');
INSERT INTO `t_area` VALUES ('2707', '2703', '威远县', 'sc,nj,wyx', '511024', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省内江市威远县', '0832');
INSERT INTO `t_area` VALUES ('2708', '2703', '资中县', 'sc,nj,zzx', '511025', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省内江市资中县', '0832');
INSERT INTO `t_area` VALUES ('2709', '2703', '隆昌县', 'sc,nj,lcx', '511028', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省内江市隆昌县', '0832');
INSERT INTO `t_area` VALUES ('271', '263', '康保县', 'hb,zjk,kbx', '130723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市康保县', '0313');
INSERT INTO `t_area` VALUES ('2710', '2622', '乐山市', 'sc,ls', '511100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市', '0833');
INSERT INTO `t_area` VALUES ('2711', '2710', '市辖区', 'sc,ls,sxq', '511101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市市辖区', '0833');
INSERT INTO `t_area` VALUES ('2712', '2710', '市中区', 'sc,ls,szq', '511102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市市中区', '0833');
INSERT INTO `t_area` VALUES ('2713', '2710', '沙湾区', 'sc,ls,swq', '511111', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市沙湾区', '0833');
INSERT INTO `t_area` VALUES ('2714', '2710', '五通桥区', 'sc,ls,wtqq', '511112', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市五通桥区', '0833');
INSERT INTO `t_area` VALUES ('2715', '2710', '金口河区', 'sc,ls,jkhq', '511113', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市金口河区', '0833');
INSERT INTO `t_area` VALUES ('2716', '2710', '犍为县', 'sc,ls,jwx', '511123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市犍为县', '0833');
INSERT INTO `t_area` VALUES ('2717', '2710', '井研县', 'sc,ls,jyx', '511124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市井研县', '0833');
INSERT INTO `t_area` VALUES ('2718', '2710', '夹江县', 'sc,ls,jjx', '511126', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市夹江县', '0833');
INSERT INTO `t_area` VALUES ('2719', '2710', '沐川县', 'sc,ls,mcx', '511129', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市沐川县', '0833');
INSERT INTO `t_area` VALUES ('272', '263', '沽源县', 'hb,zjk,gyx', '130724', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市沽源县', '0313');
INSERT INTO `t_area` VALUES ('2720', '2710', '峨边彝族自治县', 'sc,ls,ebyzzzx', '511132', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市峨边彝族自治县', '0833');
INSERT INTO `t_area` VALUES ('2721', '2710', '马边彝族自治县', 'sc,ls,mbyzzzx', '511133', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市马边彝族自治县', '0833');
INSERT INTO `t_area` VALUES ('2722', '2710', '峨眉山市', 'sc,ls,ems', '511181', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省乐山市峨眉山市', '0833');
INSERT INTO `t_area` VALUES ('2723', '2622', '南充市', 'sc,nc', '511300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市', '0817');
INSERT INTO `t_area` VALUES ('2724', '2723', '市辖区', 'sc,nc,sxq', '511301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市市辖区', '0817');
INSERT INTO `t_area` VALUES ('2725', '2723', '顺庆区', 'sc,nc,sqq', '511302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市顺庆区', '0817');
INSERT INTO `t_area` VALUES ('2726', '2723', '高坪区', 'sc,nc,gpq', '511303', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市高坪区', '0817');
INSERT INTO `t_area` VALUES ('2727', '2723', '嘉陵区', 'sc,nc,jlq', '511304', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市嘉陵区', '0817');
INSERT INTO `t_area` VALUES ('2728', '2723', '南部县', 'sc,nc,nbx', '511321', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市南部县', '0817');
INSERT INTO `t_area` VALUES ('2729', '2723', '营山县', 'sc,nc,ysx', '511322', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市营山县', '0817');
INSERT INTO `t_area` VALUES ('273', '263', '尚义县', 'hb,zjk,syx', '130725', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市尚义县', '0313');
INSERT INTO `t_area` VALUES ('2730', '2723', '蓬安县', 'sc,nc,pax', '511323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市蓬安县', '0817');
INSERT INTO `t_area` VALUES ('2731', '2723', '仪陇县', 'sc,nc,ylx', '511324', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市仪陇县', '0817');
INSERT INTO `t_area` VALUES ('2732', '2723', '西充县', 'sc,nc,xcx', '511325', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市西充县', '0817');
INSERT INTO `t_area` VALUES ('2733', '2723', '阆中市', 'sc,nc,lz', '511381', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省南充市阆中市', '0817');
INSERT INTO `t_area` VALUES ('2734', '2622', '眉山市', 'sc,ms', '511400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省眉山市', '0833');
INSERT INTO `t_area` VALUES ('2735', '2734', '市辖区', 'sc,ms,sxq', '511401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省眉山市市辖区', '0833');
INSERT INTO `t_area` VALUES ('2736', '2734', '东坡区', 'sc,ms,dpq', '511402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省眉山市东坡区', '0833');
INSERT INTO `t_area` VALUES ('2737', '2734', '仁寿县', 'sc,ms,rsx', '511421', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省眉山市仁寿县', '0833');
INSERT INTO `t_area` VALUES ('2738', '2734', '彭山县', 'sc,ms,psx', '511422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省眉山市彭山县', '0833');
INSERT INTO `t_area` VALUES ('2739', '2734', '洪雅县', 'sc,ms,hyx', '511423', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省眉山市洪雅县', '0833');
INSERT INTO `t_area` VALUES ('274', '263', '蔚县', 'hb,zjk,wx', '130726', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市蔚县', '0313');
INSERT INTO `t_area` VALUES ('2740', '2734', '丹棱县', 'sc,ms,dlx', '511424', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省眉山市丹棱县', '0833');
INSERT INTO `t_area` VALUES ('2741', '2734', '青神县', 'sc,ms,qsx', '511425', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省眉山市青神县', '0833');
INSERT INTO `t_area` VALUES ('2742', '2622', '宜宾市', 'sc,yb', '511500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市', '0831');
INSERT INTO `t_area` VALUES ('2743', '2742', '市辖区', 'sc,yb,sxq', '511501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市市辖区', '0831');
INSERT INTO `t_area` VALUES ('2744', '2742', '翠屏区', 'sc,yb,cpq', '511502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市翠屏区', '0831');
INSERT INTO `t_area` VALUES ('2745', '2742', '宜宾县', 'sc,yb,ybx', '511521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市宜宾县', '0831');
INSERT INTO `t_area` VALUES ('2746', '2742', '南溪县', 'sc,yb,nxx', '511522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市南溪县', '0831');
INSERT INTO `t_area` VALUES ('2747', '2742', '江安县', 'sc,yb,jax', '511523', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市江安县', '0831');
INSERT INTO `t_area` VALUES ('2748', '2742', '长宁县', 'sc,yb,cnx', '511524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市长宁县', '0831');
INSERT INTO `t_area` VALUES ('2749', '2742', '高县', 'sc,yb,gx', '511525', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市高县', '0831');
INSERT INTO `t_area` VALUES ('275', '263', '阳原县', 'hb,zjk,yyx', '130727', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市阳原县', '0313');
INSERT INTO `t_area` VALUES ('2750', '2742', '珙县', 'sc,yb,gx', '511526', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市珙县', '0831');
INSERT INTO `t_area` VALUES ('2751', '2742', '筠连县', 'sc,yb,jlx', '511527', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市筠连县', '0831');
INSERT INTO `t_area` VALUES ('2752', '2742', '兴文县', 'sc,yb,xwx', '511528', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市兴文县', '0831');
INSERT INTO `t_area` VALUES ('2753', '2742', '屏山县', 'sc,yb,psx', '511529', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省宜宾市屏山县', '0831');
INSERT INTO `t_area` VALUES ('2754', '2622', '广安市', 'sc,ga', '511600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广安市', '0826');
INSERT INTO `t_area` VALUES ('2755', '2754', '市辖区', 'sc,ga,sxq', '511601', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广安市市辖区', '0826');
INSERT INTO `t_area` VALUES ('2756', '2754', '广安区', 'sc,ga,gaq', '511602', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广安市广安区', '0826');
INSERT INTO `t_area` VALUES ('2757', '2754', '岳池县', 'sc,ga,ycx', '511621', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广安市岳池县', '0826');
INSERT INTO `t_area` VALUES ('2758', '2754', '武胜县', 'sc,ga,wsx', '511622', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广安市武胜县', '0826');
INSERT INTO `t_area` VALUES ('2759', '2754', '邻水县', 'sc,ga,lsx', '511623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广安市邻水县', '0826');
INSERT INTO `t_area` VALUES ('276', '263', '怀安县', 'hb,zjk,hax', '130728', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市怀安县', '0313');
INSERT INTO `t_area` VALUES ('2760', '2754', '华蓥市', 'sc,ga,hy', '511681', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省广安市华蓥市', '0826');
INSERT INTO `t_area` VALUES ('2761', '2622', '达州市', 'sc,dz', '511700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省达州市', '0816');
INSERT INTO `t_area` VALUES ('2762', '2761', '市辖区', 'sc,dz,sxq', '511701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省达州市市辖区', '0816');
INSERT INTO `t_area` VALUES ('2763', '2761', '通川区', 'sc,dz,tcq', '511702', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省达州市通川区', '0816');
INSERT INTO `t_area` VALUES ('2764', '2761', '达县', 'sc,dz,dx', '511721', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省达州市达县', '0816');
INSERT INTO `t_area` VALUES ('2765', '2761', '宣汉县', 'sc,dz,xhx', '511722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省达州市宣汉县', '0816');
INSERT INTO `t_area` VALUES ('2766', '2761', '开江县', 'sc,dz,kjx', '511723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省达州市开江县', '0816');
INSERT INTO `t_area` VALUES ('2767', '2761', '大竹县', 'sc,dz,dzx', '511724', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省达州市大竹县', '0816');
INSERT INTO `t_area` VALUES ('2768', '2761', '渠县', 'sc,dz,qx', '511725', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省达州市渠县', '0816');
INSERT INTO `t_area` VALUES ('2769', '2761', '万源市', 'sc,dz,wy', '511781', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省达州市万源市', '0816');
INSERT INTO `t_area` VALUES ('277', '263', '万全县', 'hb,zjk,wqx', '130729', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市万全县', '0313');
INSERT INTO `t_area` VALUES ('2770', '2622', '雅安市', 'sc,ya', '511800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省雅安市', '0835');
INSERT INTO `t_area` VALUES ('2771', '2770', '市辖区', 'sc,ya,sxq', '511801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省雅安市市辖区', '0835');
INSERT INTO `t_area` VALUES ('2772', '2770', '雨城区', 'sc,ya,ycq', '511802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省雅安市雨城区', '0835');
INSERT INTO `t_area` VALUES ('2773', '2770', '名山县', 'sc,ya,msx', '511821', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省雅安市名山县', '0835');
INSERT INTO `t_area` VALUES ('2774', '2770', '荥经县', 'sc,ya,xjx', '511822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省雅安市荥经县', '0835');
INSERT INTO `t_area` VALUES ('2775', '2770', '汉源县', 'sc,ya,hyx', '511823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省雅安市汉源县', '0835');
INSERT INTO `t_area` VALUES ('2776', '2770', '石棉县', 'sc,ya,smx', '511824', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省雅安市石棉县', '0835');
INSERT INTO `t_area` VALUES ('2777', '2770', '天全县', 'sc,ya,tqx', '511825', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省雅安市天全县', '0835');
INSERT INTO `t_area` VALUES ('2778', '2770', '芦山县', 'sc,ya,lsx', '511826', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省雅安市芦山县', '0835');
INSERT INTO `t_area` VALUES ('2779', '2770', '宝兴县', 'sc,ya,bxx', '511827', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省雅安市宝兴县', '0835');
INSERT INTO `t_area` VALUES ('278', '263', '怀来县', 'hb,zjk,hlx', '130730', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市怀来县', '0313');
INSERT INTO `t_area` VALUES ('2780', '2622', '巴中市', 'sc,bz', '511900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省巴中市', '0827');
INSERT INTO `t_area` VALUES ('2781', '2780', '市辖区', 'sc,bz,sxq', '511901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省巴中市市辖区', '0827');
INSERT INTO `t_area` VALUES ('2782', '2780', '巴州区', 'sc,bz,bzq', '511902', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省巴中市巴州区', '0827');
INSERT INTO `t_area` VALUES ('2783', '2780', '通江县', 'sc,bz,tjx', '511921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省巴中市通江县', '0827');
INSERT INTO `t_area` VALUES ('2784', '2780', '南江县', 'sc,bz,njx', '511922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省巴中市南江县', '0827');
INSERT INTO `t_area` VALUES ('2785', '2780', '平昌县', 'sc,bz,pcx', '511923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省巴中市平昌县', '0827');
INSERT INTO `t_area` VALUES ('2786', '2622', '资阳市', 'sc,zy', '512000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省资阳市', '0832');
INSERT INTO `t_area` VALUES ('2787', '2786', '市辖区', 'sc,zy,sxq', '512001', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省资阳市市辖区', '0832');
INSERT INTO `t_area` VALUES ('2788', '2786', '雁江区', 'sc,zy,yjq', '512002', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省资阳市雁江区', '0832');
INSERT INTO `t_area` VALUES ('2789', '2786', '安岳县', 'sc,zy,ayx', '512021', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省资阳市安岳县', '0832');
INSERT INTO `t_area` VALUES ('279', '263', '涿鹿县', 'hb,zjk,zlx', '130731', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市涿鹿县', '0313');
INSERT INTO `t_area` VALUES ('2790', '2786', '乐至县', 'sc,zy,lzx', '512022', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省资阳市乐至县', '0832');
INSERT INTO `t_area` VALUES ('2791', '2786', '简阳市', 'sc,zy,jy', '512081', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省资阳市简阳市', '0832');
INSERT INTO `t_area` VALUES ('2792', '2622', '阿坝藏族羌族自治州', 'sc,abczqzzzz', '513200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州', '0816');
INSERT INTO `t_area` VALUES ('2793', '2792', '汶川县', 'sc,abczqzzzz,wcx', '513221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州汶川县', '0816');
INSERT INTO `t_area` VALUES ('2794', '2792', '理县', 'sc,abczqzzzz,lx', '513222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州理县', '0816');
INSERT INTO `t_area` VALUES ('2795', '2792', '茂县', 'sc,abczqzzzz,mx', '513223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州茂县', '0816');
INSERT INTO `t_area` VALUES ('2796', '2792', '松潘县', 'sc,abczqzzzz,spx', '513224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州松潘县', '0816');
INSERT INTO `t_area` VALUES ('2797', '2792', '九寨沟县', 'sc,abczqzzzz,jzgx', '513225', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州九寨沟县', '0816');
INSERT INTO `t_area` VALUES ('2798', '2792', '金川县', 'sc,abczqzzzz,jcx', '513226', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州金川县', '0816');
INSERT INTO `t_area` VALUES ('2799', '2792', '小金县', 'sc,abczqzzzz,xjx', '513227', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州小金县', '0816');
INSERT INTO `t_area` VALUES ('280', '263', '赤城县', 'hb,zjk,ccx', '130732', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市赤城县', '0313');
INSERT INTO `t_area` VALUES ('2800', '2792', '黑水县', 'sc,abczqzzzz,hsx', '513228', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州黑水县', '0816');
INSERT INTO `t_area` VALUES ('2801', '2792', '马尔康县', 'sc,abczqzzzz,mekx', '513229', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州马尔康县', '8489');
INSERT INTO `t_area` VALUES ('2802', '2792', '壤塘县', 'sc,abczqzzzz,rtx', '513230', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州壤塘县', '0816');
INSERT INTO `t_area` VALUES ('2803', '2792', '阿坝县', 'sc,abczqzzzz,abx', '513231', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州阿坝县', '0816');
INSERT INTO `t_area` VALUES ('2804', '2792', '若尔盖县', 'sc,abczqzzzz,regx', '513232', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州若尔盖县', '0816');
INSERT INTO `t_area` VALUES ('2805', '2792', '红原县', 'sc,abczqzzzz,hyx', '513233', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省阿坝藏族羌族自治州红原县', '0816');
INSERT INTO `t_area` VALUES ('2806', '2622', '甘孜藏族自治州', 'sc,gzczzzz', '513300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州', '0816');
INSERT INTO `t_area` VALUES ('2807', '2806', '康定县', 'sc,gzczzzz,kdx', '513321', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州康定县', '0836');
INSERT INTO `t_area` VALUES ('2808', '2806', '泸定县', 'sc,gzczzzz,ldx', '513322', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州泸定县', '0816');
INSERT INTO `t_area` VALUES ('2809', '2806', '丹巴县', 'sc,gzczzzz,dbx', '513323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州丹巴县', '0816');
INSERT INTO `t_area` VALUES ('281', '263', '崇礼县', 'hb,zjk,clx', '130733', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省张家口市崇礼县', '0313');
INSERT INTO `t_area` VALUES ('2810', '2806', '九龙县', 'sc,gzczzzz,jlx', '513324', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州九龙县', '0816');
INSERT INTO `t_area` VALUES ('2811', '2806', '雅江县', 'sc,gzczzzz,yjx', '513325', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州雅江县', '0816');
INSERT INTO `t_area` VALUES ('2812', '2806', '道孚县', 'sc,gzczzzz,dfx', '513326', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州道孚县', '0816');
INSERT INTO `t_area` VALUES ('2813', '2806', '炉霍县', 'sc,gzczzzz,lhx', '513327', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州炉霍县', '0816');
INSERT INTO `t_area` VALUES ('2814', '2806', '甘孜县', 'sc,gzczzzz,gzx', '513328', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州甘孜县', '0816');
INSERT INTO `t_area` VALUES ('2815', '2806', '新龙县', 'sc,gzczzzz,xlx', '513329', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州新龙县', '0816');
INSERT INTO `t_area` VALUES ('2816', '2806', '德格县', 'sc,gzczzzz,dgx', '513330', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州德格县', '0816');
INSERT INTO `t_area` VALUES ('2817', '2806', '白玉县', 'sc,gzczzzz,byx', '513331', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州白玉县', '0816');
INSERT INTO `t_area` VALUES ('2818', '2806', '石渠县', 'sc,gzczzzz,sqx', '513332', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州石渠县', '0816');
INSERT INTO `t_area` VALUES ('2819', '2806', '色达县', 'sc,gzczzzz,sdx', '513333', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州色达县', '0816');
INSERT INTO `t_area` VALUES ('282', '143', '承德市', 'hb,cd', '130800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省承德市', '0314');
INSERT INTO `t_area` VALUES ('2820', '2806', '理塘县', 'sc,gzczzzz,ltx', '513334', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州理塘县', '0816');
INSERT INTO `t_area` VALUES ('2821', '2806', '巴塘县', 'sc,gzczzzz,btx', '513335', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州巴塘县', '0816');
INSERT INTO `t_area` VALUES ('2822', '2806', '乡城县', 'sc,gzczzzz,xcx', '513336', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州乡城县', '0816');
INSERT INTO `t_area` VALUES ('2823', '2806', '稻城县', 'sc,gzczzzz,dcx', '513337', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州稻城县', '0816');
INSERT INTO `t_area` VALUES ('2824', '2806', '得荣县', 'sc,gzczzzz,drx', '513338', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省甘孜藏族自治州得荣县', '0816');
INSERT INTO `t_area` VALUES ('2825', '2622', '凉山彝族自治州', 'sc,lsyzzzz', '513400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州', '0816');
INSERT INTO `t_area` VALUES ('2826', '2825', '西昌市', 'sc,lsyzzzz,xc', '513401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州西昌市', '0834');
INSERT INTO `t_area` VALUES ('2827', '2825', '木里藏族自治县', 'sc,lsyzzzz,mlczzzx', '513422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州木里藏族自治县', '0816');
INSERT INTO `t_area` VALUES ('2828', '2825', '盐源县', 'sc,lsyzzzz,yyx', '513423', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州盐源县', '0816');
INSERT INTO `t_area` VALUES ('2829', '2825', '德昌县', 'sc,lsyzzzz,dcx', '513424', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州德昌县', '0816');
INSERT INTO `t_area` VALUES ('283', '282', '市辖区', 'hb,cd,sxq', '130801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省承德市市辖区', '0314');
INSERT INTO `t_area` VALUES ('2830', '2825', '会理县', 'sc,lsyzzzz,hlx', '513425', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州会理县', '0816');
INSERT INTO `t_area` VALUES ('2831', '2825', '会东县', 'sc,lsyzzzz,hdx', '513426', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州会东县', '0816');
INSERT INTO `t_area` VALUES ('2832', '2825', '宁南县', 'sc,lsyzzzz,nnx', '513427', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州宁南县', '0816');
INSERT INTO `t_area` VALUES ('2833', '2825', '普格县', 'sc,lsyzzzz,pgx', '513428', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州普格县', '0816');
INSERT INTO `t_area` VALUES ('2834', '2825', '布拖县', 'sc,lsyzzzz,btx', '513429', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州布拖县', '0816');
INSERT INTO `t_area` VALUES ('2835', '2825', '金阳县', 'sc,lsyzzzz,jyx', '513430', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州金阳县', '0816');
INSERT INTO `t_area` VALUES ('2836', '2825', '昭觉县', 'sc,lsyzzzz,zjx', '513431', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州昭觉县', '0816');
INSERT INTO `t_area` VALUES ('2837', '2825', '喜德县', 'sc,lsyzzzz,xdx', '513432', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州喜德县', '0816');
INSERT INTO `t_area` VALUES ('2838', '2825', '冕宁县', 'sc,lsyzzzz,mnx', '513433', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州冕宁县', '0816');
INSERT INTO `t_area` VALUES ('2839', '2825', '越西县', 'sc,lsyzzzz,yxx', '513434', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州越西县', '0816');
INSERT INTO `t_area` VALUES ('284', '282', '双桥区', 'hb,cd,sqq', '130802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省承德市双桥区', '0314');
INSERT INTO `t_area` VALUES ('2840', '2825', '甘洛县', 'sc,lsyzzzz,glx', '513435', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州甘洛县', '0816');
INSERT INTO `t_area` VALUES ('2841', '2825', '美姑县', 'sc,lsyzzzz,mgx', '513436', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州美姑县', '0816');
INSERT INTO `t_area` VALUES ('2842', '2825', '雷波县', 'sc,lsyzzzz,lbx', '513437', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '四川省凉山彝族自治州雷波县', '0816');
INSERT INTO `t_area` VALUES ('2843', '100', '贵州省', 'gz', '520000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省', '0852');
INSERT INTO `t_area` VALUES ('2844', '2843', '贵阳市', 'gz,gy', '520100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市', '0851');
INSERT INTO `t_area` VALUES ('2845', '2844', '市辖区', 'gz,gy,sxq', '520101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市市辖区', '0851');
INSERT INTO `t_area` VALUES ('2846', '2844', '南明区', 'gz,gy,nmq', '520102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市南明区', '0851');
INSERT INTO `t_area` VALUES ('2847', '2844', '云岩区', 'gz,gy,yyq', '520103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市云岩区', '0851');
INSERT INTO `t_area` VALUES ('2848', '2844', '花溪区', 'gz,gy,hxq', '520111', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市花溪区', '0851');
INSERT INTO `t_area` VALUES ('2849', '2844', '乌当区', 'gz,gy,wdq', '520112', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市乌当区', '0851');
INSERT INTO `t_area` VALUES ('285', '282', '双滦区', 'hb,cd,slq', '130803', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省承德市双滦区', '0314');
INSERT INTO `t_area` VALUES ('2850', '2844', '白云区', 'gz,gy,byq', '520113', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市白云区', '0851');
INSERT INTO `t_area` VALUES ('2851', '2844', '小河区', 'gz,gy,xhq', '520114', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市小河区', '0851');
INSERT INTO `t_area` VALUES ('2852', '2844', '开阳县', 'gz,gy,kyx', '520121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市开阳县', '0851');
INSERT INTO `t_area` VALUES ('2853', '2844', '息烽县', 'gz,gy,xfx', '520122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市息烽县', '0851');
INSERT INTO `t_area` VALUES ('2854', '2844', '修文县', 'gz,gy,xwx', '520123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市修文县', '0851');
INSERT INTO `t_area` VALUES ('2855', '2844', '清镇市', 'gz,gy,qz', '520181', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省贵阳市清镇市', '0851');
INSERT INTO `t_area` VALUES ('2856', '2843', '六盘水市', 'gz,lps', '520200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省六盘水市', '0858');
INSERT INTO `t_area` VALUES ('2857', '2856', '钟山区', 'gz,lps,zsq', '520201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省六盘水市钟山区', '0858');
INSERT INTO `t_area` VALUES ('2858', '2856', '六枝特区', 'gz,lps,lztq', '520203', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省六盘水市六枝特区', '0858');
INSERT INTO `t_area` VALUES ('2859', '2856', '水城县', 'gz,lps,scx', '520221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省六盘水市水城县', '0858');
INSERT INTO `t_area` VALUES ('286', '282', '鹰手营子矿区', 'hb,cd,ysyzkq', '130804', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省承德市鹰手营子矿区', '0314');
INSERT INTO `t_area` VALUES ('2860', '2856', '盘县', 'gz,lps,px', '520222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省六盘水市盘县', '0858');
INSERT INTO `t_area` VALUES ('2861', '2843', '遵义市', 'gz,zy', '520300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市', '0852');
INSERT INTO `t_area` VALUES ('2862', '2861', '市辖区', 'gz,zy,sxq', '520301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市市辖区', '0852');
INSERT INTO `t_area` VALUES ('2863', '2861', '红花岗区', 'gz,zy,hhgq', '520302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市红花岗区', '0852');
INSERT INTO `t_area` VALUES ('2864', '2861', '汇川区', 'gz,zy,hcq', '520303', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市汇川区', '0852');
INSERT INTO `t_area` VALUES ('2865', '2861', '遵义县', 'gz,zy,zyx', '520321', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市遵义县', '0852');
INSERT INTO `t_area` VALUES ('2866', '2861', '桐梓县', 'gz,zy,tzx', '520322', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市桐梓县', '0852');
INSERT INTO `t_area` VALUES ('2867', '2861', '绥阳县', 'gz,zy,syx', '520323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市绥阳县', '0852');
INSERT INTO `t_area` VALUES ('2868', '2861', '正安县', 'gz,zy,zax', '520324', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市正安县', '0852');
INSERT INTO `t_area` VALUES ('2869', '2861', '道真仡佬族苗族自治县', 'gz,zy,dzglzmzzzx', '520325', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市道真仡佬族苗族自治县', '0852');
INSERT INTO `t_area` VALUES ('287', '282', '承德县', 'hb,cd,cdx', '130821', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省承德市承德县', '0314');
INSERT INTO `t_area` VALUES ('2870', '2861', '务川仡佬族苗族自治县', 'gz,zy,wcglzmzzzx', '520326', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市务川仡佬族苗族自治县', '0852');
INSERT INTO `t_area` VALUES ('2871', '2861', '凤冈县', 'gz,zy,fgx', '520327', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市凤冈县', '0852');
INSERT INTO `t_area` VALUES ('2872', '2861', '湄潭县', 'gz,zy,mtx', '520328', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市湄潭县', '0852');
INSERT INTO `t_area` VALUES ('2873', '2861', '余庆县', 'gz,zy,yqx', '520329', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市余庆县', '0852');
INSERT INTO `t_area` VALUES ('2874', '2861', '习水县', 'gz,zy,xsx', '520330', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市习水县', '0852');
INSERT INTO `t_area` VALUES ('2875', '2861', '赤水市', 'gz,zy,cs', '520381', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市赤水市', '0852');
INSERT INTO `t_area` VALUES ('2876', '2861', '仁怀市', 'gz,zy,rh', '520382', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省遵义市仁怀市', '0852');
INSERT INTO `t_area` VALUES ('2877', '2843', '安顺市', 'gz,as', '520400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省安顺市', '0853');
INSERT INTO `t_area` VALUES ('2878', '2877', '市辖区', 'gz,as,sxq', '520401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省安顺市市辖区', '0853');
INSERT INTO `t_area` VALUES ('2879', '2877', '西秀区', 'gz,as,xxq', '520402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省安顺市西秀区', '0853');
INSERT INTO `t_area` VALUES ('288', '282', '兴隆县', 'hb,cd,xlx', '130822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省承德市兴隆县', '0314');
INSERT INTO `t_area` VALUES ('2880', '2877', '平坝县', 'gz,as,pbx', '520421', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省安顺市平坝县', '0853');
INSERT INTO `t_area` VALUES ('2881', '2877', '普定县', 'gz,as,pdx', '520422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省安顺市普定县', '0853');
INSERT INTO `t_area` VALUES ('2882', '2877', '镇宁布依族苗族自治县', 'gz,as,znbyzmzzzx', '520423', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省安顺市镇宁布依族苗族自治县', '0853');
INSERT INTO `t_area` VALUES ('2883', '2877', '关岭布依族苗族自治县', 'gz,as,glbyzmzzzx', '520424', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省安顺市关岭布依族苗族自治县', '0853');
INSERT INTO `t_area` VALUES ('2884', '2877', '紫云苗族布依族自治县', 'gz,as,zymzbyzzzx', '520425', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省安顺市紫云苗族布依族自治县', '0853');
INSERT INTO `t_area` VALUES ('2885', '2843', '铜仁地区', 'gz,trdq', '522200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省铜仁地区', '0856');
INSERT INTO `t_area` VALUES ('2886', '2885', '铜仁市', 'gz,trdq,tr', '522201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省铜仁地区铜仁市', '0856');
INSERT INTO `t_area` VALUES ('2887', '2885', '江口县', 'gz,trdq,jkx', '522222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省铜仁地区江口县', '0856');
INSERT INTO `t_area` VALUES ('2888', '2885', '玉屏侗族自治县', 'gz,trdq,ypdzzzx', '522223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省铜仁地区玉屏侗族自治县', '0856');
INSERT INTO `t_area` VALUES ('2889', '2885', '石阡县', 'gz,trdq,sqx', '522224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省铜仁地区石阡县', '0856');
INSERT INTO `t_area` VALUES ('289', '282', '平泉县', 'hb,cd,pqx', '130823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省承德市平泉县', '0314');
INSERT INTO `t_area` VALUES ('2890', '2885', '思南县', 'gz,trdq,snx', '522225', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '贵州省铜仁地区思南县', '0856');
INSERT INTO `t_area` VALUES ('2891', '2885', '印江土家族苗族自治县', 'gz,trdq,yjtjzmzzzx', '522226', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省铜仁地区印江土家族苗族自治县', '0856');
INSERT INTO `t_area` VALUES ('2892', '2885', '德江县', 'gz,trdq,djx', '522227', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省铜仁地区德江县', '0856');
INSERT INTO `t_area` VALUES ('2893', '2885', '沿河土家族自治县', 'gz,trdq,yhtjzzzx', '522228', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省铜仁地区沿河土家族自治县', '0856');
INSERT INTO `t_area` VALUES ('2894', '2885', '松桃苗族自治县', 'gz,trdq,stmzzzx', '522229', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省铜仁地区松桃苗族自治县', '0856');
INSERT INTO `t_area` VALUES ('2895', '2885', '万山特区', 'gz,trdq,wstq', '522230', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省铜仁地区万山特区', '0856');
INSERT INTO `t_area` VALUES ('2896', '2843', '黔西南布依族苗族自治州', 'gz,qxnbyzmzzzz', '522300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔西南布依族苗族自治州', '0852');
INSERT INTO `t_area` VALUES ('2897', '2896', '兴义市', 'gz,qxnbyzmzzzz,xy', '522301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔西南布依族苗族自治州兴义市', '0859');
INSERT INTO `t_area` VALUES ('2898', '2896', '兴仁县', 'gz,qxnbyzmzzzz,xrx', '522322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔西南布依族苗族自治州兴仁县', '0852');
INSERT INTO `t_area` VALUES ('2899', '2896', '普安县', 'gz,qxnbyzmzzzz,pax', '522323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔西南布依族苗族自治州普安县', '0852');
INSERT INTO `t_area` VALUES ('290', '282', '滦平县', 'hb,cd,lpx', '130824', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省承德市滦平县', '0314');
INSERT INTO `t_area` VALUES ('2900', '2896', '晴隆县', 'gz,qxnbyzmzzzz,qlx', '522324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔西南布依族苗族自治州晴隆县', '0852');
INSERT INTO `t_area` VALUES ('2901', '2896', '贞丰县', 'gz,qxnbyzmzzzz,zfx', '522325', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔西南布依族苗族自治州贞丰县', '0852');
INSERT INTO `t_area` VALUES ('2902', '2896', '望谟县', 'gz,qxnbyzmzzzz,wmx', '522326', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔西南布依族苗族自治州望谟县', '0852');
INSERT INTO `t_area` VALUES ('2903', '2896', '册亨县', 'gz,qxnbyzmzzzz,chx', '522327', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔西南布依族苗族自治州册亨县', '0852');
INSERT INTO `t_area` VALUES ('2904', '2896', '安龙县', 'gz,qxnbyzmzzzz,alx', '522328', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔西南布依族苗族自治州安龙县', '0852');
INSERT INTO `t_area` VALUES ('2905', '2843', '毕节地区', 'gz,bjdq', '522400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省毕节地区', '0857');
INSERT INTO `t_area` VALUES ('2906', '2905', '毕节市', 'gz,bjdq,bj', '522401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省毕节地区毕节市', '0857');
INSERT INTO `t_area` VALUES ('2907', '2905', '大方县', 'gz,bjdq,dfx', '522422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省毕节地区大方县', '0857');
INSERT INTO `t_area` VALUES ('2908', '2905', '黔西县', 'gz,bjdq,qxx', '522423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省毕节地区黔西县', '0857');
INSERT INTO `t_area` VALUES ('2909', '2905', '金沙县', 'gz,bjdq,jsx', '522424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省毕节地区金沙县', '0857');
INSERT INTO `t_area` VALUES ('291', '282', '隆化县', 'hb,cd,lhx', '130825', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省承德市隆化县', '0314');
INSERT INTO `t_area` VALUES ('2910', '2905', '织金县', 'gz,bjdq,zjx', '522425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省毕节地区织金县', '0857');
INSERT INTO `t_area` VALUES ('2911', '2905', '纳雍县', 'gz,bjdq,nyx', '522426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省毕节地区纳雍县', '0857');
INSERT INTO `t_area` VALUES ('2912', '2905', '威宁彝族回族苗族自治县', 'gz,bjdq,wnyzhzmzzzx', '522427', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省毕节地区威宁彝族回族苗族自治县', '0857');
INSERT INTO `t_area` VALUES ('2913', '2905', '赫章县', 'gz,bjdq,hzx', '522428', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省毕节地区赫章县', '0857');
INSERT INTO `t_area` VALUES ('2914', '2843', '黔东南苗族侗族自治州', 'gz,qdnmzdzzzz', '522600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州', '0852');
INSERT INTO `t_area` VALUES ('2915', '2914', '凯里市', 'gz,qdnmzdzzzz,kl', '522601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州凯里市', '0855');
INSERT INTO `t_area` VALUES ('2916', '2914', '黄平县', 'gz,qdnmzdzzzz,hpx', '522622', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州黄平县', '0852');
INSERT INTO `t_area` VALUES ('2917', '2914', '施秉县', 'gz,qdnmzdzzzz,sbx', '522623', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州施秉县', '0852');
INSERT INTO `t_area` VALUES ('2918', '2914', '三穗县', 'gz,qdnmzdzzzz,ssx', '522624', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州三穗县', '0852');
INSERT INTO `t_area` VALUES ('2919', '2914', '镇远县', 'gz,qdnmzdzzzz,zyx', '522625', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州镇远县', '0852');
INSERT INTO `t_area` VALUES ('292', '282', '丰宁满族自治县', 'hb,cd,fnmzzzx', '130826', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省承德市丰宁满族自治县', '0314');
INSERT INTO `t_area` VALUES ('2920', '2914', '岑巩县', 'gz,qdnmzdzzzz,cgx', '522626', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州岑巩县', '0852');
INSERT INTO `t_area` VALUES ('2921', '2914', '天柱县', 'gz,qdnmzdzzzz,tzx', '522627', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州天柱县', '0852');
INSERT INTO `t_area` VALUES ('2922', '2914', '锦屏县', 'gz,qdnmzdzzzz,jpx', '522628', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州锦屏县', '0852');
INSERT INTO `t_area` VALUES ('2923', '2914', '剑河县', 'gz,qdnmzdzzzz,jhx', '522629', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州剑河县', '0852');
INSERT INTO `t_area` VALUES ('2924', '2914', '台江县', 'gz,qdnmzdzzzz,tjx', '522630', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州台江县', '0852');
INSERT INTO `t_area` VALUES ('2925', '2914', '黎平县', 'gz,qdnmzdzzzz,lpx', '522631', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州黎平县', '0852');
INSERT INTO `t_area` VALUES ('2926', '2914', '榕江县', 'gz,qdnmzdzzzz,rjx', '522632', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州榕江县', '0852');
INSERT INTO `t_area` VALUES ('2927', '2914', '从江县', 'gz,qdnmzdzzzz,cjx', '522633', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州从江县', '0852');
INSERT INTO `t_area` VALUES ('2928', '2914', '雷山县', 'gz,qdnmzdzzzz,lsx', '522634', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州雷山县', '0852');
INSERT INTO `t_area` VALUES ('2929', '2914', '麻江县', 'gz,qdnmzdzzzz,mjx', '522635', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州麻江县', '0852');
INSERT INTO `t_area` VALUES ('293', '282', '宽城满族自治县', 'hb,cd,kcmzzzx', '130827', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省承德市宽城满族自治县', '0314');
INSERT INTO `t_area` VALUES ('2930', '2914', '丹寨县', 'gz,qdnmzdzzzz,dzx', '522636', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔东南苗族侗族自治州丹寨县', '0852');
INSERT INTO `t_area` VALUES ('2931', '2843', '黔南布依族苗族自治州', 'gz,qnbyzmzzzz', '522700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州', '0852');
INSERT INTO `t_area` VALUES ('2932', '2931', '都匀市', 'gz,qnbyzmzzzz,dy', '522701', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州都匀市', '0854');
INSERT INTO `t_area` VALUES ('2933', '2931', '福泉市', 'gz,qnbyzmzzzz,fq', '522702', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州福泉市', '0852');
INSERT INTO `t_area` VALUES ('2934', '2931', '荔波县', 'gz,qnbyzmzzzz,lbx', '522722', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州荔波县', '0852');
INSERT INTO `t_area` VALUES ('2935', '2931', '贵定县', 'gz,qnbyzmzzzz,gdx', '522723', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州贵定县', '0852');
INSERT INTO `t_area` VALUES ('2936', '2931', '瓮安县', 'gz,qnbyzmzzzz,wax', '522725', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州瓮安县', '0852');
INSERT INTO `t_area` VALUES ('2937', '2931', '独山县', 'gz,qnbyzmzzzz,dsx', '522726', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州独山县', '0852');
INSERT INTO `t_area` VALUES ('2938', '2931', '平塘县', 'gz,qnbyzmzzzz,ptx', '522727', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州平塘县', '0852');
INSERT INTO `t_area` VALUES ('2939', '2931', '罗甸县', 'gz,qnbyzmzzzz,ldx', '522728', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州罗甸县', '0852');
INSERT INTO `t_area` VALUES ('294', '282', '围场满族蒙古族自治县', 'hb,cd,wcmzmgzzzx', '130828', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省承德市围场满族蒙古族自治县', '0314');
INSERT INTO `t_area` VALUES ('2940', '2931', '长顺县', 'gz,qnbyzmzzzz,csx', '522729', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州长顺县', '0852');
INSERT INTO `t_area` VALUES ('2941', '2931', '龙里县', 'gz,qnbyzmzzzz,llx', '522730', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州龙里县', '0852');
INSERT INTO `t_area` VALUES ('2942', '2931', '惠水县', 'gz,qnbyzmzzzz,hsx', '522731', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州惠水县', '0852');
INSERT INTO `t_area` VALUES ('2943', '2931', '三都水族自治县', 'gz,qnbyzmzzzz,sdszzzx', '522732', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '贵州省黔南布依族苗族自治州三都水族自治县', '0852');
INSERT INTO `t_area` VALUES ('2944', '100', '云南省', 'yn', '530000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省', '0874');
INSERT INTO `t_area` VALUES ('2945', '2944', '昆明市', 'yn,km', '530100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市', '0871');
INSERT INTO `t_area` VALUES ('2946', '2945', '市辖区', 'yn,km,sxq', '530101', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市市辖区', '0871');
INSERT INTO `t_area` VALUES ('2947', '2945', '五华区', 'yn,km,whq', '530102', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市五华区', '0871');
INSERT INTO `t_area` VALUES ('2948', '2945', '盘龙区', 'yn,km,plq', '530103', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市盘龙区', '0871');
INSERT INTO `t_area` VALUES ('2949', '2945', '官渡区', 'yn,km,gdq', '530111', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市官渡区', '0871');
INSERT INTO `t_area` VALUES ('295', '143', '沧州市', 'hb,cz', '130900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省沧州市', '0317');
INSERT INTO `t_area` VALUES ('2950', '2945', '西山区', 'yn,km,xsq', '530112', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市西山区', '0871');
INSERT INTO `t_area` VALUES ('2951', '2945', '东川区', 'yn,km,dcq', '530113', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市东川区', '0871');
INSERT INTO `t_area` VALUES ('2952', '2945', '呈贡县', 'yn,km,cgx', '530121', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市呈贡县', '0871');
INSERT INTO `t_area` VALUES ('2953', '2945', '晋宁县', 'yn,km,jnx', '530122', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市晋宁县', '0871');
INSERT INTO `t_area` VALUES ('2954', '2945', '富民县', 'yn,km,fmx', '530124', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市富民县', '0871');
INSERT INTO `t_area` VALUES ('2955', '2945', '宜良县', 'yn,km,ylx', '530125', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市宜良县', '0871');
INSERT INTO `t_area` VALUES ('2956', '2945', '石林彝族自治县', 'yn,km,slyzzzx', '530126', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市石林彝族自治县', '0871');
INSERT INTO `t_area` VALUES ('2957', '2945', '嵩明县', 'yn,km,smx', '530127', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市嵩明县', '0871');
INSERT INTO `t_area` VALUES ('2958', '2945', '禄劝彝族苗族自治县', 'yn,km,lqyzmzzzx', '530128', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市禄劝彝族苗族自治县', '0871');
INSERT INTO `t_area` VALUES ('2959', '2945', '寻甸回族彝族自治县', 'yn,km,xdhzyzzzx', '530129', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市寻甸回族彝族自治县', '0871');
INSERT INTO `t_area` VALUES ('296', '295', '市辖区', 'hb,cz,sxq', '130901', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省沧州市市辖区', '0317');
INSERT INTO `t_area` VALUES ('2960', '2945', '安宁市', 'yn,km,an', '530181', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昆明市安宁市', '0871');
INSERT INTO `t_area` VALUES ('2961', '2944', '曲靖市', 'yn,qj', '530300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市', '0874');
INSERT INTO `t_area` VALUES ('2962', '2961', '市辖区', 'yn,qj,sxq', '530301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市市辖区', '0874');
INSERT INTO `t_area` VALUES ('2963', '2961', '麒麟区', 'yn,qj,qlq', '530302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市麒麟区', '0874');
INSERT INTO `t_area` VALUES ('2964', '2961', '马龙县', 'yn,qj,mlx', '530321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市马龙县', '0874');
INSERT INTO `t_area` VALUES ('2965', '2961', '陆良县', 'yn,qj,llx', '530322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市陆良县', '0874');
INSERT INTO `t_area` VALUES ('2966', '2961', '师宗县', 'yn,qj,szx', '530323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市师宗县', '0874');
INSERT INTO `t_area` VALUES ('2967', '2961', '罗平县', 'yn,qj,lpx', '530324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市罗平县', '0874');
INSERT INTO `t_area` VALUES ('2968', '2961', '富源县', 'yn,qj,fyx', '530325', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市富源县', '0874');
INSERT INTO `t_area` VALUES ('2969', '2961', '会泽县', 'yn,qj,hzx', '530326', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市会泽县', '0874');
INSERT INTO `t_area` VALUES ('297', '295', '新华区', 'hb,cz,xhq', '130902', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省沧州市新华区', '0317');
INSERT INTO `t_area` VALUES ('2970', '2961', '沾益县', 'yn,qj,zyx', '530328', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市沾益县', '0874');
INSERT INTO `t_area` VALUES ('2971', '2961', '宣威市', 'yn,qj,xw', '530381', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省曲靖市宣威市', '0874');
INSERT INTO `t_area` VALUES ('2972', '2944', '玉溪市', 'yn,yx', '530400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市', '0877');
INSERT INTO `t_area` VALUES ('2973', '2972', '市辖区', 'yn,yx,sxq', '530401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市市辖区', '0877');
INSERT INTO `t_area` VALUES ('2974', '2972', '红塔区', 'yn,yx,htq', '530402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市红塔区', '0877');
INSERT INTO `t_area` VALUES ('2975', '2972', '江川县', 'yn,yx,jcx', '530421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市江川县', '0877');
INSERT INTO `t_area` VALUES ('2976', '2972', '澄江县', 'yn,yx,cjx', '530422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市澄江县', '0877');
INSERT INTO `t_area` VALUES ('2977', '2972', '通海县', 'yn,yx,thx', '530423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市通海县', '0877');
INSERT INTO `t_area` VALUES ('2978', '2972', '华宁县', 'yn,yx,hnx', '530424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市华宁县', '0877');
INSERT INTO `t_area` VALUES ('2979', '2972', '易门县', 'yn,yx,ymx', '530425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市易门县', '0877');
INSERT INTO `t_area` VALUES ('298', '295', '运河区', 'hb,cz,yhq', '130903', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省沧州市运河区', '0317');
INSERT INTO `t_area` VALUES ('2980', '2972', '峨山彝族自治县', 'yn,yx,esyzzzx', '530426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市峨山彝族自治县', '0877');
INSERT INTO `t_area` VALUES ('2981', '2972', '新平彝族傣族自治县', 'yn,yx,xpyzdzzzx', '530427', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市新平彝族傣族自治县', '0877');
INSERT INTO `t_area` VALUES ('2982', '2972', '元江哈尼族彝族傣族自治县', 'yn,yx,yjhnzyzdzzzx', '530428', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省玉溪市元江哈尼族彝族傣族自治县', '0877');
INSERT INTO `t_area` VALUES ('2983', '2944', '保山市', 'yn,bs', '530500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省保山市', '0875');
INSERT INTO `t_area` VALUES ('2984', '2983', '市辖区', 'yn,bs,sxq', '530501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省保山市市辖区', '0875');
INSERT INTO `t_area` VALUES ('2985', '2983', '隆阳区', 'yn,bs,lyq', '530502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省保山市隆阳区', '0875');
INSERT INTO `t_area` VALUES ('2986', '2983', '施甸县', 'yn,bs,sdx', '530521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省保山市施甸县', '0875');
INSERT INTO `t_area` VALUES ('2987', '2983', '腾冲县', 'yn,bs,tcx', '530522', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省保山市腾冲县', '0875');
INSERT INTO `t_area` VALUES ('2988', '2983', '龙陵县', 'yn,bs,llx', '530523', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省保山市龙陵县', '0875');
INSERT INTO `t_area` VALUES ('2989', '2983', '昌宁县', 'yn,bs,cnx', '530524', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省保山市昌宁县', '0875');
INSERT INTO `t_area` VALUES ('299', '295', '沧县', 'hb,cz,cx', '130921', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省沧州市沧县', '0317');
INSERT INTO `t_area` VALUES ('2990', '2944', '昭通市', 'yn,zt', '530600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市', '0870');
INSERT INTO `t_area` VALUES ('2991', '2990', '市辖区', 'yn,zt,sxq', '530601', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市市辖区', '0870');
INSERT INTO `t_area` VALUES ('2992', '2990', '昭阳区', 'yn,zt,zyq', '530602', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市昭阳区', '0870');
INSERT INTO `t_area` VALUES ('2993', '2990', '鲁甸县', 'yn,zt,ldx', '530621', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市鲁甸县', '0870');
INSERT INTO `t_area` VALUES ('2994', '2990', '巧家县', 'yn,zt,qjx', '530622', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市巧家县', '0870');
INSERT INTO `t_area` VALUES ('2995', '2990', '盐津县', 'yn,zt,yjx', '530623', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市盐津县', '0870');
INSERT INTO `t_area` VALUES ('2996', '2990', '大关县', 'yn,zt,dgx', '530624', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市大关县', '0870');
INSERT INTO `t_area` VALUES ('2997', '2990', '永善县', 'yn,zt,ysx', '530625', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市永善县', '0870');
INSERT INTO `t_area` VALUES ('2998', '2990', '绥江县', 'yn,zt,sjx', '530626', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市绥江县', '0870');
INSERT INTO `t_area` VALUES ('2999', '2990', '镇雄县', 'yn,zt,zxx', '530627', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市镇雄县', '0870');
INSERT INTO `t_area` VALUES ('300', '295', '青县', 'hb,cz,qx', '130922', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省沧州市青县', '0317');
INSERT INTO `t_area` VALUES ('3000', '2990', '彝良县', 'yn,zt,ylx', '530628', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市彝良县', '0870');
INSERT INTO `t_area` VALUES ('30002', '2392', '板芙镇', 'gd,zs,bfz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市板芙镇', '0760');
INSERT INTO `t_area` VALUES ('30005', '2392', '大涌镇', 'gd,zs,dyz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市大涌镇', '0760');
INSERT INTO `t_area` VALUES ('30006', '2392', '东凤镇', 'gd,zs,dfz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市东凤镇', '0760');
INSERT INTO `t_area` VALUES ('30007', '2392', '东升镇', 'gd,zs,dsz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市东升镇', '0760');
INSERT INTO `t_area` VALUES ('30008', '2392', '阜沙镇', 'gd,zs,fsz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市阜沙镇', '0760');
INSERT INTO `t_area` VALUES ('30009', '2392', '港口镇', 'gd,zs,gkz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市港口镇', '0760');
INSERT INTO `t_area` VALUES ('3001', '2990', '威信县', 'yn,zt,wxx', '530629', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市威信县', '0870');
INSERT INTO `t_area` VALUES ('30010', '2392', '古镇', 'gd,zs,gz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市古镇', '0760');
INSERT INTO `t_area` VALUES ('30011', '2392', '横栏镇', 'gd,zs,hlz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市横栏镇', '0760');
INSERT INTO `t_area` VALUES ('30012', '2392', '黄圃镇', 'gd,zs,hpz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市黄圃镇', '0760');
INSERT INTO `t_area` VALUES ('30013', '2392', '火炬开发区', 'gd,zs,hjkfq', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市火炬开发区', '0760');
INSERT INTO `t_area` VALUES ('30014', '2392', '民众镇', 'gd,zs,mzz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市民众镇', '0760');
INSERT INTO `t_area` VALUES ('30015', '2392', '南朗镇', 'gd,zs,nlz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市南朗镇', '0760');
INSERT INTO `t_area` VALUES ('30016', '2392', '南区', 'gd,zs,nq', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市南区', '0760');
INSERT INTO `t_area` VALUES ('30017', '2392', '南头镇', 'gd,zs,ntz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市南头镇', '0760');
INSERT INTO `t_area` VALUES ('30018', '2392', '三角镇', 'gd,zs,sjz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市三角镇', '0760');
INSERT INTO `t_area` VALUES ('30019', '2392', '三乡镇', 'gd,zs,sxz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市三乡镇', '0760');
INSERT INTO `t_area` VALUES ('3002', '2990', '水富县', 'yn,zt,sfx', '530630', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '云南省昭通市水富县', '0870');
INSERT INTO `t_area` VALUES ('30020', '2392', '沙溪镇', 'gd,zs,sxz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市沙溪镇', '0760');
INSERT INTO `t_area` VALUES ('30021', '2392', '神湾镇', 'gd,zs,swz', null, '2017-03-02 13:22:01', '2017-03-02 13:22:01', '广东省中山市神湾镇', '0760');
INSERT INTO `t_area` VALUES ('30022', '2392', '坦洲镇', 'gd,zs,tzz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省中山市坦州镇', '0760');
INSERT INTO `t_area` VALUES ('30023', '2392', '五桂山', 'gd,zs,wgs', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省中山市五桂山镇', '0760');
INSERT INTO `t_area` VALUES ('30024', '2392', '小榄镇', 'gd,zs,xlz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省中山市小榄镇', '0760');
INSERT INTO `t_area` VALUES ('3003', '2944', '丽江市', 'yn,lj', '530700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省丽江市', '0888');
INSERT INTO `t_area` VALUES ('3004', '3003', '市辖区', 'yn,lj,sxq', '530701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省丽江市市辖区', '0888');
INSERT INTO `t_area` VALUES ('3005', '3003', '古城区', 'yn,lj,gcq', '530702', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省丽江市古城区', '0888');
INSERT INTO `t_area` VALUES ('3006', '3003', '玉龙纳西族自治县', 'yn,lj,ylnxzzzx', '530721', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省丽江市玉龙纳西族自治县', '0888');
INSERT INTO `t_area` VALUES ('3007', '3003', '永胜县', 'yn,lj,ysx', '530722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省丽江市永胜县', '0888');
INSERT INTO `t_area` VALUES ('3008', '3003', '华坪县', 'yn,lj,hpx', '530723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省丽江市华坪县', '0888');
INSERT INTO `t_area` VALUES ('3009', '3003', '宁蒗彝族自治县', 'yn,lj,nlyzzzx', '530724', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省丽江市宁蒗彝族自治县', '0888');
INSERT INTO `t_area` VALUES ('301', '295', '东光县', 'hb,cz,dgx', '130923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市东光县', '0317');
INSERT INTO `t_area` VALUES ('3010', '2944', '普洱市(*)', 'yn,pes(*)', '530800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)', '0874');
INSERT INTO `t_area` VALUES ('3011', '3010', '市辖区', 'yn,pes(*),sxq', '530801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)市辖区', '0874');
INSERT INTO `t_area` VALUES ('3012', '3010', '思茅区(*)', 'yn,pes(*),smq(*)', '530802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)思茅区(*)', '0879');
INSERT INTO `t_area` VALUES ('3013', '3010', '宁洱哈尼族彝族自治县(*)', 'yn,pes(*),nehnzyzzzx(*)', '530821', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)宁洱哈尼族彝族自治县(*)', '0874');
INSERT INTO `t_area` VALUES ('3014', '3010', '墨江哈尼族自治县', 'yn,pes(*),mjhnzzzx', '530822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)墨江哈尼族自治县', '0874');
INSERT INTO `t_area` VALUES ('3015', '3010', '景东彝族自治县', 'yn,pes(*),jdyzzzx', '530823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)景东彝族自治县', '0874');
INSERT INTO `t_area` VALUES ('3016', '3010', '景谷傣族彝族自治县', 'yn,pes(*),jgdzyzzzx', '530824', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)景谷傣族彝族自治县', '0874');
INSERT INTO `t_area` VALUES ('3017', '3010', '镇沅彝族哈尼族拉祜族自治县', 'yn,pes(*),zyyzhnzlhzzzx', '530825', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)镇沅彝族哈尼族拉祜族自治县', '0874');
INSERT INTO `t_area` VALUES ('3018', '3010', '江城哈尼族彝族自治县', 'yn,pes(*),jchnzyzzzx', '530826', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)江城哈尼族彝族自治县', '0874');
INSERT INTO `t_area` VALUES ('3019', '3010', '孟连傣族拉祜族佤族自治县', 'yn,pes(*),mldzlhzwzzzx', '530827', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)孟连傣族拉祜族佤族自治县', '0874');
INSERT INTO `t_area` VALUES ('302', '295', '海兴县', 'hb,cz,hxx', '130924', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市海兴县', '0317');
INSERT INTO `t_area` VALUES ('3020', '3010', '澜沧拉祜族自治县', 'yn,pes(*),lclhzzzx', '530828', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)澜沧拉祜族自治县', '0874');
INSERT INTO `t_area` VALUES ('3021', '3010', '西盟佤族自治县', 'yn,pes(*),xmwzzzx', '530829', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省普洱市(*)西盟佤族自治县', '0874');
INSERT INTO `t_area` VALUES ('3022', '2944', '临沧市', 'yn,lc', '530900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省临沧市', '0883');
INSERT INTO `t_area` VALUES ('3023', '3022', '市辖区', 'yn,lc,sxq', '530901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省临沧市市辖区', '0883');
INSERT INTO `t_area` VALUES ('3024', '3022', '临翔区', 'yn,lc,lxq', '530902', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省临沧市临翔区', '0883');
INSERT INTO `t_area` VALUES ('3025', '3022', '凤庆县', 'yn,lc,fqx', '530921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省临沧市凤庆县', '0883');
INSERT INTO `t_area` VALUES ('3026', '3022', '云县', 'yn,lc,yx', '530922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省临沧市云县', '0883');
INSERT INTO `t_area` VALUES ('3027', '3022', '永德县', 'yn,lc,ydx', '530923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省临沧市永德县', '0883');
INSERT INTO `t_area` VALUES ('3028', '3022', '镇康县', 'yn,lc,zkx', '530924', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省临沧市镇康县', '0883');
INSERT INTO `t_area` VALUES ('3029', '3022', '双江拉祜族佤族布朗族傣族自治县', 'yn,lc,sjlhzwzblzdzzzx', '530925', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省临沧市双江拉祜族佤族布朗族傣族自治县', '0883');
INSERT INTO `t_area` VALUES ('303', '295', '盐山县', 'hb,cz,ysx', '130925', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市盐山县', '0317');
INSERT INTO `t_area` VALUES ('3030', '3022', '耿马傣族佤族自治县', 'yn,lc,gmdzwzzzx', '530926', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省临沧市耿马傣族佤族自治县', '0883');
INSERT INTO `t_area` VALUES ('3031', '3022', '沧源佤族自治县', 'yn,lc,cywzzzx', '530927', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省临沧市沧源佤族自治县', '0883');
INSERT INTO `t_area` VALUES ('3032', '2944', '楚雄彝族自治州', 'yn,cxyzzzz', '532300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州', '0878');
INSERT INTO `t_area` VALUES ('3033', '3032', '楚雄市', 'yn,cxyzzzz,cx', '532301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州楚雄市', '0878');
INSERT INTO `t_area` VALUES ('3034', '3032', '双柏县', 'yn,cxyzzzz,sbx', '532322', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州双柏县', '0878');
INSERT INTO `t_area` VALUES ('3035', '3032', '牟定县', 'yn,cxyzzzz,mdx', '532323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州牟定县', '0878');
INSERT INTO `t_area` VALUES ('3036', '3032', '南华县', 'yn,cxyzzzz,nhx', '532324', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州南华县', '0878');
INSERT INTO `t_area` VALUES ('3037', '3032', '姚安县', 'yn,cxyzzzz,yax', '532325', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州姚安县', '0878');
INSERT INTO `t_area` VALUES ('3038', '3032', '大姚县', 'yn,cxyzzzz,dyx', '532326', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州大姚县', '0878');
INSERT INTO `t_area` VALUES ('3039', '3032', '永仁县', 'yn,cxyzzzz,yrx', '532327', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州永仁县', '0878');
INSERT INTO `t_area` VALUES ('304', '295', '肃宁县', 'hb,cz,snx', '130926', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市肃宁县', '0317');
INSERT INTO `t_area` VALUES ('3040', '3032', '元谋县', 'yn,cxyzzzz,ymx', '532328', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州元谋县', '0878');
INSERT INTO `t_area` VALUES ('3041', '3032', '武定县', 'yn,cxyzzzz,wdx', '532329', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州武定县', '0878');
INSERT INTO `t_area` VALUES ('3042', '3032', '禄丰县', 'yn,cxyzzzz,lfx', '532331', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省楚雄彝族自治州禄丰县', '0878');
INSERT INTO `t_area` VALUES ('3043', '2944', '红河哈尼族彝族自治州', 'yn,hhhnzyzzzz', '532500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州', '0874');
INSERT INTO `t_area` VALUES ('3044', '3043', '个旧市', 'yn,hhhnzyzzzz,gj', '532501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州个旧市', '0873');
INSERT INTO `t_area` VALUES ('3045', '3043', '开远市', 'yn,hhhnzyzzzz,ky', '532502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州开远市', '0874');
INSERT INTO `t_area` VALUES ('3046', '3043', '蒙自县', 'yn,hhhnzyzzzz,mzx', '532522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州蒙自县', '0874');
INSERT INTO `t_area` VALUES ('3047', '3043', '屏边苗族自治县', 'yn,hhhnzyzzzz,pbmzzzx', '532523', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州屏边苗族自治县', '0874');
INSERT INTO `t_area` VALUES ('3048', '3043', '建水县', 'yn,hhhnzyzzzz,jsx', '532524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州建水县', '0874');
INSERT INTO `t_area` VALUES ('3049', '3043', '石屏县', 'yn,hhhnzyzzzz,spx', '532525', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州石屏县', '0874');
INSERT INTO `t_area` VALUES ('305', '295', '南皮县', 'hb,cz,npx', '130927', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市南皮县', '0317');
INSERT INTO `t_area` VALUES ('3050', '3043', '弥勒县', 'yn,hhhnzyzzzz,mlx', '532526', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州弥勒县', '0874');
INSERT INTO `t_area` VALUES ('3051', '3043', '泸西县', 'yn,hhhnzyzzzz,lxx', '532527', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州泸西县', '0874');
INSERT INTO `t_area` VALUES ('3052', '3043', '元阳县', 'yn,hhhnzyzzzz,yyx', '532528', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州元阳县', '0874');
INSERT INTO `t_area` VALUES ('3053', '3043', '红河县', 'yn,hhhnzyzzzz,hhx', '532529', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州红河县', '0874');
INSERT INTO `t_area` VALUES ('3054', '3043', '金平苗族瑶族傣族自治县', 'yn,hhhnzyzzzz,jpmzyzdzzzx', '532530', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县', '0874');
INSERT INTO `t_area` VALUES ('3055', '3043', '绿春县', 'yn,hhhnzyzzzz,lcx', '532531', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州绿春县', '0874');
INSERT INTO `t_area` VALUES ('3056', '3043', '河口瑶族自治县', 'yn,hhhnzyzzzz,hkyzzzx', '532532', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省红河哈尼族彝族自治州河口瑶族自治县', '0874');
INSERT INTO `t_area` VALUES ('3057', '2944', '文山壮族苗族自治州', 'yn,wszzmzzzz', '532600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省文山壮族苗族自治州', '0876');
INSERT INTO `t_area` VALUES ('3058', '3057', '文山县', 'yn,wszzmzzzz,wsx', '532621', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省文山壮族苗族自治州文山县', '0876');
INSERT INTO `t_area` VALUES ('3059', '3057', '砚山县', 'yn,wszzmzzzz,ysx', '532622', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省文山壮族苗族自治州砚山县', '0876');
INSERT INTO `t_area` VALUES ('306', '295', '吴桥县', 'hb,cz,wqx', '130928', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市吴桥县', '0317');
INSERT INTO `t_area` VALUES ('3060', '3057', '西畴县', 'yn,wszzmzzzz,xcx', '532623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省文山壮族苗族自治州西畴县', '0876');
INSERT INTO `t_area` VALUES ('3061', '3057', '麻栗坡县', 'yn,wszzmzzzz,mlpx', '532624', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省文山壮族苗族自治州麻栗坡县', '0876');
INSERT INTO `t_area` VALUES ('3062', '3057', '马关县', 'yn,wszzmzzzz,mgx', '532625', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省文山壮族苗族自治州马关县', '0876');
INSERT INTO `t_area` VALUES ('3063', '3057', '丘北县', 'yn,wszzmzzzz,qbx', '532626', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省文山壮族苗族自治州丘北县', '0876');
INSERT INTO `t_area` VALUES ('3064', '3057', '广南县', 'yn,wszzmzzzz,gnx', '532627', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省文山壮族苗族自治州广南县', '0876');
INSERT INTO `t_area` VALUES ('3065', '3057', '富宁县', 'yn,wszzmzzzz,fnx', '532628', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省文山壮族苗族自治州富宁县', '0876');
INSERT INTO `t_area` VALUES ('3066', '2944', '西双版纳傣族自治州', 'yn,xsbndzzzz', '532800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省西双版纳傣族自治州', '0874');
INSERT INTO `t_area` VALUES ('3067', '3066', '景洪市', 'yn,xsbndzzzz,jh', '532801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省西双版纳傣族自治州景洪市', '0691');
INSERT INTO `t_area` VALUES ('3068', '3066', '勐海县', 'yn,xsbndzzzz,mhx', '532822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省西双版纳傣族自治州勐海县', '0874');
INSERT INTO `t_area` VALUES ('3069', '3066', '勐腊县', 'yn,xsbndzzzz,mlx', '532823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省西双版纳傣族自治州勐腊县', '0874');
INSERT INTO `t_area` VALUES ('307', '295', '献县', 'hb,cz,xx', '130929', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市献县', '0317');
INSERT INTO `t_area` VALUES ('3070', '2944', '大理白族自治州', 'yn,dlbzzzz', '532900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州', '0872');
INSERT INTO `t_area` VALUES ('3071', '3070', '大理市', 'yn,dlbzzzz,dl', '532901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州大理市', '0872');
INSERT INTO `t_area` VALUES ('3072', '3070', '漾濞彝族自治县', 'yn,dlbzzzz,ybyzzzx', '532922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州漾濞彝族自治县', '0872');
INSERT INTO `t_area` VALUES ('3073', '3070', '祥云县', 'yn,dlbzzzz,xyx', '532923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州祥云县', '0872');
INSERT INTO `t_area` VALUES ('3074', '3070', '宾川县', 'yn,dlbzzzz,bcx', '532924', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州宾川县', '0872');
INSERT INTO `t_area` VALUES ('3075', '3070', '弥渡县', 'yn,dlbzzzz,mdx', '532925', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州弥渡县', '0872');
INSERT INTO `t_area` VALUES ('3076', '3070', '南涧彝族自治县', 'yn,dlbzzzz,njyzzzx', '532926', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州南涧彝族自治县', '0872');
INSERT INTO `t_area` VALUES ('3077', '3070', '巍山彝族回族自治县', 'yn,dlbzzzz,wsyzhzzzx', '532927', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州巍山彝族回族自治县', '0872');
INSERT INTO `t_area` VALUES ('3078', '3070', '永平县', 'yn,dlbzzzz,ypx', '532928', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州永平县', '0872');
INSERT INTO `t_area` VALUES ('3079', '3070', '云龙县', 'yn,dlbzzzz,ylx', '532929', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州云龙县', '0872');
INSERT INTO `t_area` VALUES ('308', '295', '孟村回族自治县', 'hb,cz,mchzzzx', '130930', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市孟村回族自治县', '0317');
INSERT INTO `t_area` VALUES ('3080', '3070', '洱源县', 'yn,dlbzzzz,eyx', '532930', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州洱源县', '0872');
INSERT INTO `t_area` VALUES ('3081', '3070', '剑川县', 'yn,dlbzzzz,jcx', '532931', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州剑川县', '0872');
INSERT INTO `t_area` VALUES ('3082', '3070', '鹤庆县', 'yn,dlbzzzz,hqx', '532932', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省大理白族自治州鹤庆县', '0872');
INSERT INTO `t_area` VALUES ('3083', '2944', '德宏傣族景颇族自治州', 'yn,dhdzjpzzzz', '533100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省德宏傣族景颇族自治州', '0874');
INSERT INTO `t_area` VALUES ('3084', '3083', '瑞丽市', 'yn,dhdzjpzzzz,rl', '533102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省德宏傣族景颇族自治州瑞丽市', '0874');
INSERT INTO `t_area` VALUES ('3085', '3083', '潞西市', 'yn,dhdzjpzzzz,lx', '533103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省德宏傣族景颇族自治州潞西市', '0692');
INSERT INTO `t_area` VALUES ('3086', '3083', '梁河县', 'yn,dhdzjpzzzz,lhx', '533122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省德宏傣族景颇族自治州梁河县', '0874');
INSERT INTO `t_area` VALUES ('3087', '3083', '盈江县', 'yn,dhdzjpzzzz,yjx', '533123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省德宏傣族景颇族自治州盈江县', '0874');
INSERT INTO `t_area` VALUES ('3088', '3083', '陇川县', 'yn,dhdzjpzzzz,lcx', '533124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省德宏傣族景颇族自治州陇川县', '0874');
INSERT INTO `t_area` VALUES ('3089', '2944', '怒江傈僳族自治州', 'yn,njlszzzz', '533300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省怒江傈僳族自治州', '0874');
INSERT INTO `t_area` VALUES ('309', '295', '泊头市', 'hb,cz,bt', '130981', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市泊头市', '0317');
INSERT INTO `t_area` VALUES ('3090', '3089', '泸水县', 'yn,njlszzzz,lsx', '533321', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省怒江傈僳族自治州泸水县', '0886');
INSERT INTO `t_area` VALUES ('3091', '3089', '福贡县', 'yn,njlszzzz,fgx', '533323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省怒江傈僳族自治州福贡县', '0874');
INSERT INTO `t_area` VALUES ('3092', '3089', '贡山独龙族怒族自治县', 'yn,njlszzzz,gsdlznzzzx', '533324', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省怒江傈僳族自治州贡山独龙族怒族自治县', '0874');
INSERT INTO `t_area` VALUES ('3093', '3089', '兰坪白族普米族自治县', 'yn,njlszzzz,lpbzpmzzzx', '533325', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省怒江傈僳族自治州兰坪白族普米族自治县', '0874');
INSERT INTO `t_area` VALUES ('3094', '2944', '迪庆藏族自治州', 'yn,dqczzzz', '533400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省迪庆藏族自治州', '0874');
INSERT INTO `t_area` VALUES ('3095', '3094', '香格里拉县', 'yn,dqczzzz,xgllx', '533421', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省迪庆藏族自治州香格里拉县', '0874');
INSERT INTO `t_area` VALUES ('3096', '3094', '德钦县', 'yn,dqczzzz,dqx', '533422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省迪庆藏族自治州德钦县', '0874');
INSERT INTO `t_area` VALUES ('3097', '3094', '维西傈僳族自治县', 'yn,dqczzzz,wxlszzzx', '533423', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '云南省迪庆藏族自治州维西傈僳族自治县', '0874');
INSERT INTO `t_area` VALUES ('3098', '100', '西藏自治区', 'xzzzq', '540000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区', '0895');
INSERT INTO `t_area` VALUES ('3099', '3098', '拉萨市', 'xzzzq,ls', '540100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区拉萨市', '0891');
INSERT INTO `t_area` VALUES ('310', '295', '任丘市', 'hb,cz,rq', '130982', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市任丘市', '0317');
INSERT INTO `t_area` VALUES ('3100', '3099', '市辖区', 'xzzzq,ls,sxq', '540101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区拉萨市市辖区', '0891');
INSERT INTO `t_area` VALUES ('3101', '3099', '城关区', 'xzzzq,ls,cgq', '540102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区拉萨市城关区', '0891');
INSERT INTO `t_area` VALUES ('3102', '3099', '林周县', 'xzzzq,ls,lzx', '540121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区拉萨市林周县', '0891');
INSERT INTO `t_area` VALUES ('3103', '3099', '当雄县', 'xzzzq,ls,dxx', '540122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区拉萨市当雄县', '0891');
INSERT INTO `t_area` VALUES ('3104', '3099', '尼木县', 'xzzzq,ls,nmx', '540123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区拉萨市尼木县', '0891');
INSERT INTO `t_area` VALUES ('3105', '3099', '曲水县', 'xzzzq,ls,qsx', '540124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区拉萨市曲水县', '0891');
INSERT INTO `t_area` VALUES ('3106', '3099', '堆龙德庆县', 'xzzzq,ls,dldqx', '540125', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区拉萨市堆龙德庆县', '0891');
INSERT INTO `t_area` VALUES ('3107', '3099', '达孜县', 'xzzzq,ls,dzx', '540126', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区拉萨市达孜县', '0891');
INSERT INTO `t_area` VALUES ('3108', '3099', '墨竹工卡县', 'xzzzq,ls,mzgkx', '540127', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区拉萨市墨竹工卡县', '0891');
INSERT INTO `t_area` VALUES ('3109', '3098', '昌都地区', 'xzzzq,cddq', '542100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区', '0895');
INSERT INTO `t_area` VALUES ('311', '295', '黄骅市', 'hb,cz,hh', '130983', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市黄骅市', '0317');
INSERT INTO `t_area` VALUES ('3110', '3109', '昌都县', 'xzzzq,cddq,cdx', '542121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区昌都县', '0895');
INSERT INTO `t_area` VALUES ('3111', '3109', '江达县', 'xzzzq,cddq,jdx', '542122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区江达县', '0895');
INSERT INTO `t_area` VALUES ('3112', '3109', '贡觉县', 'xzzzq,cddq,gjx', '542123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区贡觉县', '0895');
INSERT INTO `t_area` VALUES ('3113', '3109', '类乌齐县', 'xzzzq,cddq,lwqx', '542124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区类乌齐县', '0895');
INSERT INTO `t_area` VALUES ('3114', '3109', '丁青县', 'xzzzq,cddq,dqx', '542125', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区丁青县', '0895');
INSERT INTO `t_area` VALUES ('3115', '3109', '察雅县', 'xzzzq,cddq,cyx', '542126', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区察雅县', '0895');
INSERT INTO `t_area` VALUES ('3116', '3109', '八宿县', 'xzzzq,cddq,bsx', '542127', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区八宿县', '0895');
INSERT INTO `t_area` VALUES ('3117', '3109', '左贡县', 'xzzzq,cddq,zgx', '542128', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区左贡县', '0895');
INSERT INTO `t_area` VALUES ('3118', '3109', '芒康县', 'xzzzq,cddq,mkx', '542129', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区芒康县', '0895');
INSERT INTO `t_area` VALUES ('3119', '3109', '洛隆县', 'xzzzq,cddq,llx', '542132', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区洛隆县', '0895');
INSERT INTO `t_area` VALUES ('312', '295', '河间市', 'hb,cz,hj', '130984', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省沧州市河间市', '0317');
INSERT INTO `t_area` VALUES ('3120', '3109', '边坝县', 'xzzzq,cddq,bbx', '542133', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区昌都地区边坝县', '0895');
INSERT INTO `t_area` VALUES ('3121', '3098', '山南地区', 'xzzzq,sndq', '542200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区', '0895');
INSERT INTO `t_area` VALUES ('3122', '3121', '乃东县', 'xzzzq,sndq,ndx', '542221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区乃东县', '0893');
INSERT INTO `t_area` VALUES ('3123', '3121', '扎囊县', 'xzzzq,sndq,znx', '542222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区扎囊县', '0895');
INSERT INTO `t_area` VALUES ('3124', '3121', '贡嘎县', 'xzzzq,sndq,ggx', '542223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区贡嘎县', '0895');
INSERT INTO `t_area` VALUES ('3125', '3121', '桑日县', 'xzzzq,sndq,srx', '542224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区桑日县', '0895');
INSERT INTO `t_area` VALUES ('3126', '3121', '琼结县', 'xzzzq,sndq,qjx', '542225', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区琼结县', '0895');
INSERT INTO `t_area` VALUES ('3127', '3121', '曲松县', 'xzzzq,sndq,qsx', '542226', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区曲松县', '0895');
INSERT INTO `t_area` VALUES ('3128', '3121', '措美县', 'xzzzq,sndq,cmx', '542227', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区措美县', '0895');
INSERT INTO `t_area` VALUES ('3129', '3121', '洛扎县', 'xzzzq,sndq,lzx', '542228', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区洛扎县', '0895');
INSERT INTO `t_area` VALUES ('313', '143', '廊坊市', 'hb,lf', '131000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省廊坊市', '0316');
INSERT INTO `t_area` VALUES ('3130', '3121', '加查县', 'xzzzq,sndq,jcx', '542229', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区加查县', '0895');
INSERT INTO `t_area` VALUES ('3131', '3121', '隆子县', 'xzzzq,sndq,lzx', '542231', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区隆子县', '0895');
INSERT INTO `t_area` VALUES ('3132', '3121', '错那县', 'xzzzq,sndq,cnx', '542232', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区错那县', '0895');
INSERT INTO `t_area` VALUES ('3133', '3121', '浪卡子县', 'xzzzq,sndq,lkzx', '542233', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区山南地区浪卡子县', '0895');
INSERT INTO `t_area` VALUES ('3134', '3098', '日喀则地区', 'xzzzq,rkzdq', '542300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区日喀则地区', '0892');
INSERT INTO `t_area` VALUES ('3135', '3134', '日喀则市', 'xzzzq,rkzdq,rkz', '542301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区日喀则地区日喀则市', '0892');
INSERT INTO `t_area` VALUES ('3136', '3134', '南木林县', 'xzzzq,rkzdq,nmlx', '542322', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区日喀则地区南木林县', '0892');
INSERT INTO `t_area` VALUES ('3137', '3134', '江孜县', 'xzzzq,rkzdq,jzx', '542323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区江孜县', '0892');
INSERT INTO `t_area` VALUES ('3138', '3134', '定日县', 'xzzzq,rkzdq,drx', '542324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区定日县', '0892');
INSERT INTO `t_area` VALUES ('3139', '3134', '萨迦县', 'xzzzq,rkzdq,sjx', '542325', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区萨迦县', '0892');
INSERT INTO `t_area` VALUES ('314', '313', '市辖区', 'hb,lf,sxq', '131001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省廊坊市市辖区', '0316');
INSERT INTO `t_area` VALUES ('3140', '3134', '拉孜县', 'xzzzq,rkzdq,lzx', '542326', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区拉孜县', '0892');
INSERT INTO `t_area` VALUES ('3141', '3134', '昂仁县', 'xzzzq,rkzdq,arx', '542327', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区昂仁县', '0892');
INSERT INTO `t_area` VALUES ('3142', '3134', '谢通门县', 'xzzzq,rkzdq,xtmx', '542328', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区谢通门县', '0892');
INSERT INTO `t_area` VALUES ('3143', '3134', '白朗县', 'xzzzq,rkzdq,blx', '542329', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区白朗县', '0892');
INSERT INTO `t_area` VALUES ('3144', '3134', '仁布县', 'xzzzq,rkzdq,rbx', '542330', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区仁布县', '0892');
INSERT INTO `t_area` VALUES ('3145', '3134', '康马县', 'xzzzq,rkzdq,kmx', '542331', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区康马县', '0892');
INSERT INTO `t_area` VALUES ('3146', '3134', '定结县', 'xzzzq,rkzdq,djx', '542332', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区定结县', '0892');
INSERT INTO `t_area` VALUES ('3147', '3134', '仲巴县', 'xzzzq,rkzdq,zbx', '542333', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区仲巴县', '0892');
INSERT INTO `t_area` VALUES ('3148', '3134', '亚东县', 'xzzzq,rkzdq,ydx', '542334', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区亚东县', '0892');
INSERT INTO `t_area` VALUES ('3149', '3134', '吉隆县', 'xzzzq,rkzdq,jlx', '542335', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区吉隆县', '0892');
INSERT INTO `t_area` VALUES ('315', '313', '安次区', 'hb,lf,acq', '131002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省廊坊市安次区', '0316');
INSERT INTO `t_area` VALUES ('3150', '3134', '聂拉木县', 'xzzzq,rkzdq,nlmx', '542336', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区聂拉木县', '0892');
INSERT INTO `t_area` VALUES ('3151', '3134', '萨嘎县', 'xzzzq,rkzdq,sgx', '542337', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区萨嘎县', '0892');
INSERT INTO `t_area` VALUES ('3152', '3134', '岗巴县', 'xzzzq,rkzdq,gbx', '542338', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区日喀则地区岗巴县', '0892');
INSERT INTO `t_area` VALUES ('3153', '3098', '那曲地区', 'xzzzq,nqdq', '542400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区那曲地区', '0896');
INSERT INTO `t_area` VALUES ('3154', '3153', '那曲县', 'xzzzq,nqdq,nqx', '542421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区那曲地区那曲县', '0896');
INSERT INTO `t_area` VALUES ('3155', '3153', '嘉黎县', 'xzzzq,nqdq,jlx', '542422', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区那曲地区嘉黎县', '0896');
INSERT INTO `t_area` VALUES ('3156', '3153', '比如县', 'xzzzq,nqdq,brx', '542423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区那曲地区比如县', '0896');
INSERT INTO `t_area` VALUES ('3157', '3153', '聂荣县', 'xzzzq,nqdq,nrx', '542424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区那曲地区聂荣县', '0896');
INSERT INTO `t_area` VALUES ('3158', '3153', '安多县', 'xzzzq,nqdq,adx', '542425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区那曲地区安多县', '0896');
INSERT INTO `t_area` VALUES ('3159', '3153', '申扎县', 'xzzzq,nqdq,szx', '542426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区那曲地区申扎县', '0896');
INSERT INTO `t_area` VALUES ('316', '313', '广阳区', 'hb,lf,gyq', '131003', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '河北省廊坊市广阳区', '0316');
INSERT INTO `t_area` VALUES ('3160', '3153', '索县', 'xzzzq,nqdq,sx', '542427', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '西藏自治区那曲地区索县', '0896');
INSERT INTO `t_area` VALUES ('3161', '3153', '班戈县', 'xzzzq,nqdq,bgx', '542428', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区那曲地区班戈县', '0896');
INSERT INTO `t_area` VALUES ('3162', '3153', '巴青县', 'xzzzq,nqdq,bqx', '542429', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区那曲地区巴青县', '0896');
INSERT INTO `t_area` VALUES ('3163', '3153', '尼玛县', 'xzzzq,nqdq,nmx', '542430', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区那曲地区尼玛县', '0896');
INSERT INTO `t_area` VALUES ('3164', '3098', '阿里地区', 'xzzzq,aldq', '542500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区阿里地区', '0895');
INSERT INTO `t_area` VALUES ('3165', '3164', '普兰县', 'xzzzq,aldq,plx', '542521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区阿里地区普兰县', '0895');
INSERT INTO `t_area` VALUES ('3166', '3164', '札达县', 'xzzzq,aldq,zdx', '542522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区阿里地区札达县', '0895');
INSERT INTO `t_area` VALUES ('3167', '3164', '噶尔县', 'xzzzq,aldq,gex', '542523', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区阿里地区噶尔县', '0897');
INSERT INTO `t_area` VALUES ('3168', '3164', '日土县', 'xzzzq,aldq,rtx', '542524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区阿里地区日土县', '0895');
INSERT INTO `t_area` VALUES ('3169', '3164', '革吉县', 'xzzzq,aldq,gjx', '542525', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区阿里地区革吉县', '0895');
INSERT INTO `t_area` VALUES ('317', '313', '固安县', 'hb,lf,gax', '131022', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省廊坊市固安县', '0316');
INSERT INTO `t_area` VALUES ('3170', '3164', '改则县', 'xzzzq,aldq,gzx', '542526', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区阿里地区改则县', '0895');
INSERT INTO `t_area` VALUES ('3171', '3164', '措勤县', 'xzzzq,aldq,cqx', '542527', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区阿里地区措勤县', '0895');
INSERT INTO `t_area` VALUES ('3172', '3098', '林芝地区', 'xzzzq,lzdq', '542600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区林芝地区', '0894');
INSERT INTO `t_area` VALUES ('3173', '3172', '林芝县', 'xzzzq,lzdq,lzx', '542621', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区林芝地区林芝县', '0894');
INSERT INTO `t_area` VALUES ('3174', '3172', '工布江达县', 'xzzzq,lzdq,gbjdx', '542622', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区林芝地区工布江达县', '0894');
INSERT INTO `t_area` VALUES ('3175', '3172', '米林县', 'xzzzq,lzdq,mlx', '542623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区林芝地区米林县', '0894');
INSERT INTO `t_area` VALUES ('3176', '3172', '墨脱县', 'xzzzq,lzdq,mtx', '542624', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区林芝地区墨脱县', '0894');
INSERT INTO `t_area` VALUES ('3177', '3172', '波密县', 'xzzzq,lzdq,bmx', '542625', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区林芝地区波密县', '0894');
INSERT INTO `t_area` VALUES ('3178', '3172', '察隅县', 'xzzzq,lzdq,cyx', '542626', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区林芝地区察隅县', '0894');
INSERT INTO `t_area` VALUES ('3179', '3172', '朗县', 'xzzzq,lzdq,lx', '542627', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '西藏自治区林芝地区朗县', '0894');
INSERT INTO `t_area` VALUES ('318', '313', '永清县', 'hb,lf,yqx', '131023', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省廊坊市永清县', '0316');
INSERT INTO `t_area` VALUES ('3180', '100', '陕西省', 'sx', '610000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省', '0911');
INSERT INTO `t_area` VALUES ('3181', '3180', '西安市', 'sx,xa', '610100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市', '029');
INSERT INTO `t_area` VALUES ('3182', '3181', '市辖区', 'sx,xa,sxq', '610101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市市辖区', '029');
INSERT INTO `t_area` VALUES ('3183', '3181', '新城区', 'sx,xa,xcq', '610102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市新城区', '029');
INSERT INTO `t_area` VALUES ('3184', '3181', '碑林区', 'sx,xa,blq', '610103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市碑林区', '029');
INSERT INTO `t_area` VALUES ('3185', '3181', '莲湖区', 'sx,xa,lhq', '610104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市莲湖区', '029');
INSERT INTO `t_area` VALUES ('3186', '3181', '灞桥区', 'sx,xa,bqq', '610111', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市灞桥区', '029');
INSERT INTO `t_area` VALUES ('3187', '3181', '未央区', 'sx,xa,wyq', '610112', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市未央区', '029');
INSERT INTO `t_area` VALUES ('3188', '3181', '雁塔区', 'sx,xa,ytq', '610113', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市雁塔区', '029');
INSERT INTO `t_area` VALUES ('3189', '3181', '阎良区', 'sx,xa,ylq', '610114', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市阎良区', '029');
INSERT INTO `t_area` VALUES ('319', '313', '香河县', 'hb,lf,xhx', '131024', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省廊坊市香河县', '0316');
INSERT INTO `t_area` VALUES ('3190', '3181', '临潼区', 'sx,xa,ltq', '610115', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市临潼区', '029');
INSERT INTO `t_area` VALUES ('3191', '3181', '长安区', 'sx,xa,caq', '610116', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市长安区', '029');
INSERT INTO `t_area` VALUES ('3192', '3181', '蓝田县', 'sx,xa,ltx', '610122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市蓝田县', '029');
INSERT INTO `t_area` VALUES ('3193', '3181', '周至县', 'sx,xa,zzx', '610124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市周至县', '029');
INSERT INTO `t_area` VALUES ('3194', '3181', '户县', 'sx,xa,hx', '610125', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市户县', '029');
INSERT INTO `t_area` VALUES ('3195', '3181', '高陵县', 'sx,xa,glx', '610126', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省西安市高陵县', '029');
INSERT INTO `t_area` VALUES ('3196', '3180', '铜川市', 'sx,tc', '610200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省铜川市', '0919');
INSERT INTO `t_area` VALUES ('3197', '3196', '市辖区', 'sx,tc,sxq', '610201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省铜川市市辖区', '0919');
INSERT INTO `t_area` VALUES ('3198', '3196', '王益区', 'sx,tc,wyq', '610202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省铜川市王益区', '0919');
INSERT INTO `t_area` VALUES ('3199', '3196', '印台区', 'sx,tc,ytq', '610203', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省铜川市印台区', '0919');
INSERT INTO `t_area` VALUES ('320', '313', '大城县', 'hb,lf,dcx', '131025', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省廊坊市大城县', '0316');
INSERT INTO `t_area` VALUES ('3200', '3196', '耀州区', 'sx,tc,yzq', '610204', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省铜川市耀州区', '0919');
INSERT INTO `t_area` VALUES ('3201', '3196', '宜君县', 'sx,tc,yjx', '610222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省铜川市宜君县', '0919');
INSERT INTO `t_area` VALUES ('3202', '3180', '宝鸡市', 'sx,bj', '610300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市', '0917');
INSERT INTO `t_area` VALUES ('3203', '3202', '市辖区', 'sx,bj,sxq', '610301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市市辖区', '0917');
INSERT INTO `t_area` VALUES ('3204', '3202', '渭滨区', 'sx,bj,wbq', '610302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市渭滨区', '0917');
INSERT INTO `t_area` VALUES ('3205', '3202', '金台区', 'sx,bj,jtq', '610303', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市金台区', '0917');
INSERT INTO `t_area` VALUES ('3206', '3202', '陈仓区', 'sx,bj,ccq', '610304', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市陈仓区', '0917');
INSERT INTO `t_area` VALUES ('3207', '3202', '凤翔县', 'sx,bj,fxx', '610322', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市凤翔县', '0917');
INSERT INTO `t_area` VALUES ('3208', '3202', '岐山县', 'sx,bj,qsx', '610323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市岐山县', '0917');
INSERT INTO `t_area` VALUES ('3209', '3202', '扶风县', 'sx,bj,ffx', '610324', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市扶风县', '0917');
INSERT INTO `t_area` VALUES ('321', '313', '文安县', 'hb,lf,wax', '131026', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省廊坊市文安县', '0316');
INSERT INTO `t_area` VALUES ('3210', '3202', '眉县', 'sx,bj,mx', '610326', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市眉县', '0917');
INSERT INTO `t_area` VALUES ('3211', '3202', '陇县', 'sx,bj,lx', '610327', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市陇县', '0917');
INSERT INTO `t_area` VALUES ('3212', '3202', '千阳县', 'sx,bj,qyx', '610328', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市千阳县', '0917');
INSERT INTO `t_area` VALUES ('3213', '3202', '麟游县', 'sx,bj,lyx', '610329', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市麟游县', '0917');
INSERT INTO `t_area` VALUES ('3214', '3202', '凤县', 'sx,bj,fx', '610330', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市凤县', '0917');
INSERT INTO `t_area` VALUES ('3215', '3202', '太白县', 'sx,bj,tbx', '610331', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省宝鸡市太白县', '0917');
INSERT INTO `t_area` VALUES ('3216', '3180', '咸阳市', 'sx,xy', '610400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市', '0910');
INSERT INTO `t_area` VALUES ('3217', '3216', '市辖区', 'sx,xy,sxq', '610401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市市辖区', '0910');
INSERT INTO `t_area` VALUES ('3218', '3216', '秦都区', 'sx,xy,qdq', '610402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市秦都区', '0910');
INSERT INTO `t_area` VALUES ('3219', '3216', '杨凌区', 'sx,xy,ylq', '610403', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市杨凌区', '0910');
INSERT INTO `t_area` VALUES ('322', '313', '大厂回族自治县', 'hb,lf,dchzzzx', '131028', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省廊坊市大厂回族自治县', '0316');
INSERT INTO `t_area` VALUES ('3220', '3216', '渭城区', 'sx,xy,wcq', '610404', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市渭城区', '0910');
INSERT INTO `t_area` VALUES ('3221', '3216', '三原县', 'sx,xy,syx', '610422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市三原县', '0910');
INSERT INTO `t_area` VALUES ('3222', '3216', '泾阳县', 'sx,xy,jyx', '610423', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市泾阳县', '0910');
INSERT INTO `t_area` VALUES ('3223', '3216', '乾县', 'sx,xy,qx', '610424', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市乾县', '0910');
INSERT INTO `t_area` VALUES ('3224', '3216', '礼泉县', 'sx,xy,lqx', '610425', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市礼泉县', '0910');
INSERT INTO `t_area` VALUES ('3225', '3216', '永寿县', 'sx,xy,ysx', '610426', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市永寿县', '0910');
INSERT INTO `t_area` VALUES ('3226', '3216', '彬县', 'sx,xy,bx', '610427', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市彬县', '0910');
INSERT INTO `t_area` VALUES ('3227', '3216', '长武县', 'sx,xy,cwx', '610428', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市长武县', '0910');
INSERT INTO `t_area` VALUES ('3228', '3216', '旬邑县', 'sx,xy,xyx', '610429', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市旬邑县', '0910');
INSERT INTO `t_area` VALUES ('3229', '3216', '淳化县', 'sx,xy,chx', '610430', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市淳化县', '0910');
INSERT INTO `t_area` VALUES ('323', '313', '霸州市', 'hb,lf,bz', '131081', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省廊坊市霸州市', '0316');
INSERT INTO `t_area` VALUES ('3230', '3216', '武功县', 'sx,xy,wgx', '610431', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市武功县', '0910');
INSERT INTO `t_area` VALUES ('3231', '3216', '兴平市', 'sx,xy,xp', '610481', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省咸阳市兴平市', '0910');
INSERT INTO `t_area` VALUES ('3232', '3180', '渭南市', 'sx,wn', '610500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市', '0913');
INSERT INTO `t_area` VALUES ('3233', '3232', '市辖区', 'sx,wn,sxq', '610501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市市辖区', '0913');
INSERT INTO `t_area` VALUES ('3234', '3232', '临渭区', 'sx,wn,lwq', '610502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市临渭区', '0913');
INSERT INTO `t_area` VALUES ('3235', '3232', '华县', 'sx,wn,hx', '610521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市华县', '0913');
INSERT INTO `t_area` VALUES ('3236', '3232', '潼关县', 'sx,wn,tgx', '610522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市潼关县', '0913');
INSERT INTO `t_area` VALUES ('3237', '3232', '大荔县', 'sx,wn,dlx', '610523', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市大荔县', '0913');
INSERT INTO `t_area` VALUES ('3238', '3232', '合阳县', 'sx,wn,hyx', '610524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市合阳县', '0913');
INSERT INTO `t_area` VALUES ('3239', '3232', '澄城县', 'sx,wn,ccx', '610525', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市澄城县', '0913');
INSERT INTO `t_area` VALUES ('324', '313', '三河市', 'hb,lf,sh', '131082', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省廊坊市三河市', '0316');
INSERT INTO `t_area` VALUES ('3240', '3232', '蒲城县', 'sx,wn,pcx', '610526', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市蒲城县', '0913');
INSERT INTO `t_area` VALUES ('3241', '3232', '白水县', 'sx,wn,bsx', '610527', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市白水县', '0913');
INSERT INTO `t_area` VALUES ('3242', '3232', '富平县', 'sx,wn,fpx', '610528', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市富平县', '0913');
INSERT INTO `t_area` VALUES ('3243', '3232', '韩城市', 'sx,wn,hc', '610581', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市韩城市', '0913');
INSERT INTO `t_area` VALUES ('3244', '3232', '华阴市', 'sx,wn,hy', '610582', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省渭南市华阴市', '0913');
INSERT INTO `t_area` VALUES ('3245', '3180', '延安市', 'sx,ya', '610600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市', '0911');
INSERT INTO `t_area` VALUES ('3246', '3245', '市辖区', 'sx,ya,sxq', '610601', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市市辖区', '0911');
INSERT INTO `t_area` VALUES ('3247', '3245', '宝塔区', 'sx,ya,btq', '610602', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市宝塔区', '0911');
INSERT INTO `t_area` VALUES ('3248', '3245', '延长县', 'sx,ya,ycx', '610621', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市延长县', '0911');
INSERT INTO `t_area` VALUES ('3249', '3245', '延川县', 'sx,ya,ycx', '610622', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市延川县', '0911');
INSERT INTO `t_area` VALUES ('325', '143', '衡水市', 'hb,hs', '131100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市', '0318');
INSERT INTO `t_area` VALUES ('3250', '3245', '子长县', 'sx,ya,zcx', '610623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市子长县', '0911');
INSERT INTO `t_area` VALUES ('3251', '3245', '安塞县', 'sx,ya,asx', '610624', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市安塞县', '0911');
INSERT INTO `t_area` VALUES ('3252', '3245', '志丹县', 'sx,ya,zdx', '610625', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市志丹县', '0911');
INSERT INTO `t_area` VALUES ('3253', '3245', '吴起县', 'sx,ya,wqx', '610626', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市吴起县', '0911');
INSERT INTO `t_area` VALUES ('3254', '3245', '甘泉县', 'sx,ya,gqx', '610627', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市甘泉县', '0911');
INSERT INTO `t_area` VALUES ('3255', '3245', '富县', 'sx,ya,fx', '610628', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市富县', '0911');
INSERT INTO `t_area` VALUES ('3256', '3245', '洛川县', 'sx,ya,lcx', '610629', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市洛川县', '0911');
INSERT INTO `t_area` VALUES ('3257', '3245', '宜川县', 'sx,ya,ycx', '610630', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市宜川县', '0911');
INSERT INTO `t_area` VALUES ('3258', '3245', '黄龙县', 'sx,ya,hlx', '610631', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市黄龙县', '0911');
INSERT INTO `t_area` VALUES ('3259', '3245', '黄陵县', 'sx,ya,hlx', '610632', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省延安市黄陵县', '0911');
INSERT INTO `t_area` VALUES ('326', '325', '市辖区', 'hb,hs,sxq', '131101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市市辖区', '0318');
INSERT INTO `t_area` VALUES ('3260', '3180', '汉中市', 'sx,hz', '610700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市', '0916');
INSERT INTO `t_area` VALUES ('3261', '3260', '市辖区', 'sx,hz,sxq', '610701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市市辖区', '0916');
INSERT INTO `t_area` VALUES ('3262', '3260', '汉台区', 'sx,hz,htq', '610702', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市汉台区', '0916');
INSERT INTO `t_area` VALUES ('3263', '3260', '南郑县', 'sx,hz,nzx', '610721', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市南郑县', '0916');
INSERT INTO `t_area` VALUES ('3264', '3260', '城固县', 'sx,hz,cgx', '610722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市城固县', '0916');
INSERT INTO `t_area` VALUES ('3265', '3260', '洋县', 'sx,hz,yx', '610723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市洋县', '0916');
INSERT INTO `t_area` VALUES ('3266', '3260', '西乡县', 'sx,hz,xxx', '610724', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市西乡县', '0916');
INSERT INTO `t_area` VALUES ('3267', '3260', '勉县', 'sx,hz,mx', '610725', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市勉县', '0916');
INSERT INTO `t_area` VALUES ('3268', '3260', '宁强县', 'sx,hz,nqx', '610726', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市宁强县', '0916');
INSERT INTO `t_area` VALUES ('3269', '3260', '略阳县', 'sx,hz,lyx', '610727', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市略阳县', '0916');
INSERT INTO `t_area` VALUES ('327', '325', '桃城区', 'hb,hs,tcq', '131102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市桃城区', '0318');
INSERT INTO `t_area` VALUES ('3270', '3260', '镇巴县', 'sx,hz,zbx', '610728', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市镇巴县', '0916');
INSERT INTO `t_area` VALUES ('3271', '3260', '留坝县', 'sx,hz,lbx', '610729', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市留坝县', '0916');
INSERT INTO `t_area` VALUES ('3272', '3260', '佛坪县', 'sx,hz,fpx', '610730', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省汉中市佛坪县', '0916');
INSERT INTO `t_area` VALUES ('3273', '3180', '榆林市', 'sx,yl', '610800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市', '0912');
INSERT INTO `t_area` VALUES ('3274', '3273', '市辖区', 'sx,yl,sxq', '610801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市市辖区', '0912');
INSERT INTO `t_area` VALUES ('3275', '3273', '榆阳区', 'sx,yl,yyq', '610802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市榆阳区', '0912');
INSERT INTO `t_area` VALUES ('3276', '3273', '神木县', 'sx,yl,smx', '610821', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市神木县', '0912');
INSERT INTO `t_area` VALUES ('3277', '3273', '府谷县', 'sx,yl,fgx', '610822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市府谷县', '0912');
INSERT INTO `t_area` VALUES ('3278', '3273', '横山县', 'sx,yl,hsx', '610823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市横山县', '0912');
INSERT INTO `t_area` VALUES ('3279', '3273', '靖边县', 'sx,yl,jbx', '610824', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市靖边县', '0912');
INSERT INTO `t_area` VALUES ('328', '325', '枣强县', 'hb,hs,zqx', '131121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市枣强县', '0318');
INSERT INTO `t_area` VALUES ('3280', '3273', '定边县', 'sx,yl,dbx', '610825', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市定边县', '0912');
INSERT INTO `t_area` VALUES ('3281', '3273', '绥德县', 'sx,yl,sdx', '610826', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市绥德县', '0912');
INSERT INTO `t_area` VALUES ('3282', '3273', '米脂县', 'sx,yl,mzx', '610827', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市米脂县', '0912');
INSERT INTO `t_area` VALUES ('3283', '3273', '佳县', 'sx,yl,jx', '610828', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市佳县', '0912');
INSERT INTO `t_area` VALUES ('3284', '3273', '吴堡县', 'sx,yl,wbx', '610829', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市吴堡县', '0912');
INSERT INTO `t_area` VALUES ('3285', '3273', '清涧县', 'sx,yl,qjx', '610830', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市清涧县', '0912');
INSERT INTO `t_area` VALUES ('3286', '3273', '子洲县', 'sx,yl,zzx', '610831', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省榆林市子洲县', '0912');
INSERT INTO `t_area` VALUES ('3287', '3180', '安康市', 'sx,ak', '610900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市', '0915');
INSERT INTO `t_area` VALUES ('3288', '3287', '市辖区', 'sx,ak,sxq', '610901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市市辖区', '0915');
INSERT INTO `t_area` VALUES ('3289', '3287', '汉滨区', 'sx,ak,hbq', '610902', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市汉滨区', '0915');
INSERT INTO `t_area` VALUES ('329', '325', '武邑县', 'hb,hs,wyx', '131122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市武邑县', '0318');
INSERT INTO `t_area` VALUES ('3290', '3287', '汉阴县', 'sx,ak,hyx', '610921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市汉阴县', '0915');
INSERT INTO `t_area` VALUES ('3291', '3287', '石泉县', 'sx,ak,sqx', '610922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市石泉县', '0915');
INSERT INTO `t_area` VALUES ('3292', '3287', '宁陕县', 'sx,ak,nsx', '610923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市宁陕县', '0915');
INSERT INTO `t_area` VALUES ('3293', '3287', '紫阳县', 'sx,ak,zyx', '610924', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市紫阳县', '0915');
INSERT INTO `t_area` VALUES ('3294', '3287', '岚皋县', 'sx,ak,lgx', '610925', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市岚皋县', '0915');
INSERT INTO `t_area` VALUES ('3295', '3287', '平利县', 'sx,ak,plx', '610926', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市平利县', '0915');
INSERT INTO `t_area` VALUES ('3296', '3287', '镇坪县', 'sx,ak,zpx', '610927', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市镇坪县', '0915');
INSERT INTO `t_area` VALUES ('3297', '3287', '旬阳县', 'sx,ak,xyx', '610928', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市旬阳县', '0915');
INSERT INTO `t_area` VALUES ('3298', '3287', '白河县', 'sx,ak,bhx', '610929', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省安康市白河县', '0915');
INSERT INTO `t_area` VALUES ('3299', '3180', '商洛市', 'sx,sl', '611000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省商洛市', '0911');
INSERT INTO `t_area` VALUES ('330', '325', '武强县', 'hb,hs,wqx', '131123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市武强县', '0318');
INSERT INTO `t_area` VALUES ('3300', '3299', '市辖区', 'sx,sl,sxq', '611001', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省商洛市市辖区', '0911');
INSERT INTO `t_area` VALUES ('3301', '3299', '商州区', 'sx,sl,szq', '611002', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省商洛市商州区', '0914');
INSERT INTO `t_area` VALUES ('3302', '3299', '洛南县', 'sx,sl,lnx', '611021', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省商洛市洛南县', '0911');
INSERT INTO `t_area` VALUES ('3303', '3299', '丹凤县', 'sx,sl,dfx', '611022', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省商洛市丹凤县', '0911');
INSERT INTO `t_area` VALUES ('3304', '3299', '商南县', 'sx,sl,snx', '611023', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省商洛市商南县', '0911');
INSERT INTO `t_area` VALUES ('3305', '3299', '山阳县', 'sx,sl,syx', '611024', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省商洛市山阳县', '0911');
INSERT INTO `t_area` VALUES ('3306', '3299', '镇安县', 'sx,sl,zax', '611025', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省商洛市镇安县', '0911');
INSERT INTO `t_area` VALUES ('3307', '3299', '柞水县', 'sx,sl,zsx', '611026', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '陕西省商洛市柞水县', '0911');
INSERT INTO `t_area` VALUES ('3308', '100', '甘肃省', 'gs', '620000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省', '0931');
INSERT INTO `t_area` VALUES ('3309', '3308', '兰州市', 'gs,lz', '620100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省兰州市', '0931');
INSERT INTO `t_area` VALUES ('331', '325', '饶阳县', 'hb,hs,ryx', '131124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市饶阳县', '0318');
INSERT INTO `t_area` VALUES ('3310', '3309', '市辖区', 'gs,lz,sxq', '620101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省兰州市市辖区', '0931');
INSERT INTO `t_area` VALUES ('3311', '3309', '城关区', 'gs,lz,cgq', '620102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省兰州市城关区', '0931');
INSERT INTO `t_area` VALUES ('3312', '3309', '七里河区', 'gs,lz,qlhq', '620103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省兰州市七里河区', '0931');
INSERT INTO `t_area` VALUES ('3313', '3309', '西固区', 'gs,lz,xgq', '620104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省兰州市西固区', '0931');
INSERT INTO `t_area` VALUES ('3314', '3309', '安宁区', 'gs,lz,anq', '620105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省兰州市安宁区', '0931');
INSERT INTO `t_area` VALUES ('3315', '3309', '红古区', 'gs,lz,hgq', '620111', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省兰州市红古区', '0931');
INSERT INTO `t_area` VALUES ('3316', '3309', '永登县', 'gs,lz,ydx', '620121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省兰州市永登县', '0931');
INSERT INTO `t_area` VALUES ('3317', '3309', '皋兰县', 'gs,lz,glx', '620122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省兰州市皋兰县', '0931');
INSERT INTO `t_area` VALUES ('3318', '3309', '榆中县', 'gs,lz,yzx', '620123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省兰州市榆中县', '0931');
INSERT INTO `t_area` VALUES ('3319', '3308', '嘉峪关市', 'gs,jyg', '620200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省嘉峪关市', '0937');
INSERT INTO `t_area` VALUES ('332', '325', '安平县', 'hb,hs,apx', '131125', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市安平县', '0318');
INSERT INTO `t_area` VALUES ('3320', '3319', '市辖区', 'gs,jyg,sxq', '620201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省嘉峪关市市辖区', '0937');
INSERT INTO `t_area` VALUES ('3321', '3308', '金昌市', 'gs,jc', '620300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省金昌市', '0937');
INSERT INTO `t_area` VALUES ('3322', '3321', '市辖区', 'gs,jc,sxq', '620301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省金昌市市辖区', '0937');
INSERT INTO `t_area` VALUES ('3323', '3321', '金川区', 'gs,jc,jcq', '620302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省金昌市金川区', '0937');
INSERT INTO `t_area` VALUES ('3324', '3321', '永昌县', 'gs,jc,ycx', '620321', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省金昌市永昌县', '0937');
INSERT INTO `t_area` VALUES ('3325', '3308', '白银市', 'gs,by', '620400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省白银市', '0943');
INSERT INTO `t_area` VALUES ('3326', '3325', '市辖区', 'gs,by,sxq', '620401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省白银市市辖区', '0943');
INSERT INTO `t_area` VALUES ('3327', '3325', '白银区', 'gs,by,byq', '620402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省白银市白银区', '0943');
INSERT INTO `t_area` VALUES ('3328', '3325', '平川区', 'gs,by,pcq', '620403', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省白银市平川区', '0943');
INSERT INTO `t_area` VALUES ('3329', '3325', '靖远县', 'gs,by,jyx', '620421', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省白银市靖远县', '0943');
INSERT INTO `t_area` VALUES ('333', '325', '故城县', 'hb,hs,gcx', '131126', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市故城县', '0318');
INSERT INTO `t_area` VALUES ('3330', '3325', '会宁县', 'gs,by,hnx', '620422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省白银市会宁县', '0943');
INSERT INTO `t_area` VALUES ('3331', '3325', '景泰县', 'gs,by,jtx', '620423', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省白银市景泰县', '0943');
INSERT INTO `t_area` VALUES ('3332', '3308', '天水市', 'gs,ts', '620500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省天水市', '0938');
INSERT INTO `t_area` VALUES ('3333', '3332', '市辖区', 'gs,ts,sxq', '620501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省天水市市辖区', '0938');
INSERT INTO `t_area` VALUES ('3334', '3332', '秦州区(**)', 'gs,ts,qzq(**)', '620502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省天水市秦州区(**)', '0938');
INSERT INTO `t_area` VALUES ('3335', '3332', '麦积区(**)', 'gs,ts,mjq(**)', '620503', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省天水市麦积区(**)', '0938');
INSERT INTO `t_area` VALUES ('3336', '3332', '清水县', 'gs,ts,qsx', '620521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省天水市清水县', '0938');
INSERT INTO `t_area` VALUES ('3337', '3332', '秦安县', 'gs,ts,qax', '620522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省天水市秦安县', '0938');
INSERT INTO `t_area` VALUES ('3338', '3332', '甘谷县', 'gs,ts,ggx', '620523', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省天水市甘谷县', '0938');
INSERT INTO `t_area` VALUES ('3339', '3332', '武山县', 'gs,ts,wsx', '620524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省天水市武山县', '0938');
INSERT INTO `t_area` VALUES ('334', '325', '景县', 'hb,hs,jx', '131127', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市景县', '0318');
INSERT INTO `t_area` VALUES ('3340', '3332', '张家川回族自治县', 'gs,ts,zjchzzzx', '620525', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省天水市张家川回族自治县', '0938');
INSERT INTO `t_area` VALUES ('3341', '3308', '武威市', 'gs,ww', '620600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省武威市', '0935');
INSERT INTO `t_area` VALUES ('3342', '3341', '市辖区', 'gs,ww,sxq', '620601', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省武威市市辖区', '0935');
INSERT INTO `t_area` VALUES ('3343', '3341', '凉州区', 'gs,ww,lzq', '620602', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省武威市凉州区', '0935');
INSERT INTO `t_area` VALUES ('3344', '3341', '民勤县', 'gs,ww,mqx', '620621', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省武威市民勤县', '0935');
INSERT INTO `t_area` VALUES ('3345', '3341', '古浪县', 'gs,ww,glx', '620622', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省武威市古浪县', '0935');
INSERT INTO `t_area` VALUES ('3346', '3341', '天祝藏族自治县', 'gs,ww,tzczzzx', '620623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省武威市天祝藏族自治县', '0935');
INSERT INTO `t_area` VALUES ('3347', '3308', '张掖市', 'gs,zy', '620700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省张掖市', '0936');
INSERT INTO `t_area` VALUES ('3348', '3347', '市辖区', 'gs,zy,sxq', '620701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省张掖市市辖区', '0936');
INSERT INTO `t_area` VALUES ('3349', '3347', '甘州区', 'gs,zy,gzq', '620702', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省张掖市甘州区', '0936');
INSERT INTO `t_area` VALUES ('335', '325', '阜城县', 'hb,hs,fcx', '131128', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市阜城县', '0318');
INSERT INTO `t_area` VALUES ('3350', '3347', '肃南裕固族自治县', 'gs,zy,snygzzzx', '620721', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省张掖市肃南裕固族自治县', '0936');
INSERT INTO `t_area` VALUES ('3351', '3347', '民乐县', 'gs,zy,mlx', '620722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省张掖市民乐县', '0936');
INSERT INTO `t_area` VALUES ('3352', '3347', '临泽县', 'gs,zy,lzx', '620723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省张掖市临泽县', '0936');
INSERT INTO `t_area` VALUES ('3353', '3347', '高台县', 'gs,zy,gtx', '620724', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省张掖市高台县', '0936');
INSERT INTO `t_area` VALUES ('3354', '3347', '山丹县', 'gs,zy,sdx', '620725', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省张掖市山丹县', '0936');
INSERT INTO `t_area` VALUES ('3355', '3308', '平凉市', 'gs,pl', '620800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省平凉市', '0933');
INSERT INTO `t_area` VALUES ('3356', '3355', '市辖区', 'gs,pl,sxq', '620801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省平凉市市辖区', '0933');
INSERT INTO `t_area` VALUES ('3357', '3355', '崆峒区', 'gs,pl,kdq', '620802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省平凉市崆峒区', '0933');
INSERT INTO `t_area` VALUES ('3358', '3355', '泾川县', 'gs,pl,jcx', '620821', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省平凉市泾川县', '0933');
INSERT INTO `t_area` VALUES ('3359', '3355', '灵台县', 'gs,pl,ltx', '620822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省平凉市灵台县', '0933');
INSERT INTO `t_area` VALUES ('336', '325', '冀州市', 'hb,hs,jz', '131181', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市冀州市', '0318');
INSERT INTO `t_area` VALUES ('3360', '3355', '崇信县', 'gs,pl,cxx', '620823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省平凉市崇信县', '0933');
INSERT INTO `t_area` VALUES ('3361', '3355', '华亭县', 'gs,pl,htx', '620824', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省平凉市华亭县', '0933');
INSERT INTO `t_area` VALUES ('3362', '3355', '庄浪县', 'gs,pl,zlx', '620825', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省平凉市庄浪县', '0933');
INSERT INTO `t_area` VALUES ('3363', '3355', '静宁县', 'gs,pl,jnx', '620826', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省平凉市静宁县', '0933');
INSERT INTO `t_area` VALUES ('3364', '3308', '酒泉市', 'gs,jq', '620900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省酒泉市', '0937');
INSERT INTO `t_area` VALUES ('3365', '3364', '市辖区', 'gs,jq,sxq', '620901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省酒泉市市辖区', '0937');
INSERT INTO `t_area` VALUES ('3366', '3364', '肃州区', 'gs,jq,szq', '620902', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省酒泉市肃州区', '0937');
INSERT INTO `t_area` VALUES ('3367', '3364', '金塔县', 'gs,jq,jtx', '620921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省酒泉市金塔县', '0937');
INSERT INTO `t_area` VALUES ('3368', '3364', '瓜州县', 'gs,jq,gzx', '620922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省酒泉市瓜州县', '0937');
INSERT INTO `t_area` VALUES ('3369', '3364', '肃北蒙古族自治县', 'gs,jq,sbmgzzzx', '620923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省酒泉市肃北蒙古族自治县', '0937');
INSERT INTO `t_area` VALUES ('337', '325', '深州市', 'hb,hs,sz', '131182', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '河北省衡水市深州市', '0318');
INSERT INTO `t_area` VALUES ('3370', '3364', '阿克塞哈萨克族自治县', 'gs,jq,akshskzzzx', '620924', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省酒泉市阿克塞哈萨克族自治县', '0937');
INSERT INTO `t_area` VALUES ('3371', '3364', '玉门市', 'gs,jq,ym', '620981', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省酒泉市玉门市', '0937');
INSERT INTO `t_area` VALUES ('3372', '3364', '敦煌市', 'gs,jq,dh', '620982', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省酒泉市敦煌市', '0937');
INSERT INTO `t_area` VALUES ('3373', '3308', '庆阳市', 'gs,qy', '621000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省庆阳市', '0931');
INSERT INTO `t_area` VALUES ('3374', '3373', '市辖区', 'gs,qy,sxq', '621001', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省庆阳市市辖区', '0931');
INSERT INTO `t_area` VALUES ('3375', '3373', '西峰区', 'gs,qy,xfq', '621002', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省庆阳市西峰区', '0934');
INSERT INTO `t_area` VALUES ('3376', '3373', '庆城县', 'gs,qy,qcx', '621021', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省庆阳市庆城县', '0931');
INSERT INTO `t_area` VALUES ('3377', '3373', '环县', 'gs,qy,hx', '621022', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省庆阳市环县', '0931');
INSERT INTO `t_area` VALUES ('3378', '3373', '华池县', 'gs,qy,hcx', '621023', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省庆阳市华池县', '0931');
INSERT INTO `t_area` VALUES ('3379', '3373', '合水县', 'gs,qy,hsx', '621024', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省庆阳市合水县', '0931');
INSERT INTO `t_area` VALUES ('338', '100', '山西省', 'sx', '140000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省', '0351');
INSERT INTO `t_area` VALUES ('3380', '3373', '正宁县', 'gs,qy,znx', '621025', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省庆阳市正宁县', '0931');
INSERT INTO `t_area` VALUES ('3381', '3373', '宁县', 'gs,qy,nx', '621026', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省庆阳市宁县', '0931');
INSERT INTO `t_area` VALUES ('3382', '3373', '镇原县', 'gs,qy,zyx', '621027', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省庆阳市镇原县', '0931');
INSERT INTO `t_area` VALUES ('3383', '3308', '定西市', 'gs,dx', '621100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省定西市', '0932');
INSERT INTO `t_area` VALUES ('3384', '3383', '市辖区', 'gs,dx,sxq', '621101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省定西市市辖区', '0932');
INSERT INTO `t_area` VALUES ('3385', '3383', '安定区', 'gs,dx,adq', '621102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省定西市安定区', '0932');
INSERT INTO `t_area` VALUES ('3386', '3383', '通渭县', 'gs,dx,twx', '621121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省定西市通渭县', '0932');
INSERT INTO `t_area` VALUES ('3387', '3383', '陇西县', 'gs,dx,lxx', '621122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省定西市陇西县', '0932');
INSERT INTO `t_area` VALUES ('3388', '3383', '渭源县', 'gs,dx,wyx', '621123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省定西市渭源县', '0932');
INSERT INTO `t_area` VALUES ('3389', '3383', '临洮县', 'gs,dx,ltx', '621124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省定西市临洮县', '0932');
INSERT INTO `t_area` VALUES ('339', '338', '太原市', 'sx,ty', '140100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市', '0351');
INSERT INTO `t_area` VALUES ('3390', '3383', '漳县', 'gs,dx,zx', '621125', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省定西市漳县', '0932');
INSERT INTO `t_area` VALUES ('3391', '3383', '岷县', 'gs,dx,mx', '621126', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省定西市岷县', '0932');
INSERT INTO `t_area` VALUES ('3392', '3308', '陇南市', 'gs,ln', '621200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市', '0939');
INSERT INTO `t_area` VALUES ('3393', '3392', '市辖区', 'gs,ln,sxq', '621201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市市辖区', '0939');
INSERT INTO `t_area` VALUES ('3394', '3392', '武都区', 'gs,ln,wdq', '621202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市武都区', '0939');
INSERT INTO `t_area` VALUES ('3395', '3392', '成县', 'gs,ln,cx', '621221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市成县', '0939');
INSERT INTO `t_area` VALUES ('3396', '3392', '文县', 'gs,ln,wx', '621222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市文县', '0939');
INSERT INTO `t_area` VALUES ('3397', '3392', '宕昌县', 'gs,ln,dcx', '621223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市宕昌县', '0939');
INSERT INTO `t_area` VALUES ('3398', '3392', '康县', 'gs,ln,kx', '621224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市康县', '0939');
INSERT INTO `t_area` VALUES ('3399', '3392', '西和县', 'gs,ln,xhx', '621225', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市西和县', '0939');
INSERT INTO `t_area` VALUES ('340', '339', '市辖区', 'sx,ty,sxq', '140101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市市辖区', '0351');
INSERT INTO `t_area` VALUES ('3400', '3392', '礼县', 'gs,ln,lx', '621226', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市礼县', '0939');
INSERT INTO `t_area` VALUES ('3401', '3392', '徽县', 'gs,ln,hx', '621227', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市徽县', '0939');
INSERT INTO `t_area` VALUES ('3402', '3392', '两当县', 'gs,ln,ldx', '621228', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省陇南市两当县', '0939');
INSERT INTO `t_area` VALUES ('3403', '3308', '临夏回族自治州', 'gs,lxhzzzz', '622900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省临夏回族自治州', '0930');
INSERT INTO `t_area` VALUES ('3404', '3403', '临夏市', 'gs,lxhzzzz,lx', '622901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省临夏回族自治州临夏市', '0930');
INSERT INTO `t_area` VALUES ('3405', '3403', '临夏县', 'gs,lxhzzzz,lxx', '622921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省临夏回族自治州临夏县', '0930');
INSERT INTO `t_area` VALUES ('3406', '3403', '康乐县', 'gs,lxhzzzz,klx', '622922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省临夏回族自治州康乐县', '0930');
INSERT INTO `t_area` VALUES ('3407', '3403', '永靖县', 'gs,lxhzzzz,yjx', '622923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省临夏回族自治州永靖县', '0930');
INSERT INTO `t_area` VALUES ('3408', '3403', '广河县', 'gs,lxhzzzz,ghx', '622924', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省临夏回族自治州广河县', '0930');
INSERT INTO `t_area` VALUES ('3409', '3403', '和政县', 'gs,lxhzzzz,hzx', '622925', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省临夏回族自治州和政县', '0930');
INSERT INTO `t_area` VALUES ('341', '339', '小店区', 'sx,ty,xdq', '140105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市小店区', '0351');
INSERT INTO `t_area` VALUES ('3410', '3403', '东乡族自治县', 'gs,lxhzzzz,dxzzzx', '622926', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省临夏回族自治州东乡族自治县', '0930');
INSERT INTO `t_area` VALUES ('3411', '3403', '积石山保安族东乡族撒拉族自治县', 'gs,lxhzzzz,jssbazdxzslzzzx', '622927', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县', '0930');
INSERT INTO `t_area` VALUES ('3412', '3308', '甘南藏族自治州', 'gs,gnczzzz', '623000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省甘南藏族自治州', '0931');
INSERT INTO `t_area` VALUES ('3413', '3412', '合作市', 'gs,gnczzzz,hz', '623001', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省甘南藏族自治州合作市', '0941');
INSERT INTO `t_area` VALUES ('3414', '3412', '临潭县', 'gs,gnczzzz,ltx', '623021', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省甘南藏族自治州临潭县', '0931');
INSERT INTO `t_area` VALUES ('3415', '3412', '卓尼县', 'gs,gnczzzz,znx', '623022', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省甘南藏族自治州卓尼县', '0931');
INSERT INTO `t_area` VALUES ('3416', '3412', '舟曲县', 'gs,gnczzzz,zqx', '623023', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省甘南藏族自治州舟曲县', '0931');
INSERT INTO `t_area` VALUES ('3417', '3412', '迭部县', 'gs,gnczzzz,dbx', '623024', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省甘南藏族自治州迭部县', '0931');
INSERT INTO `t_area` VALUES ('3418', '3412', '玛曲县', 'gs,gnczzzz,mqx', '623025', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省甘南藏族自治州玛曲县', '0931');
INSERT INTO `t_area` VALUES ('3419', '3412', '碌曲县', 'gs,gnczzzz,lqx', '623026', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省甘南藏族自治州碌曲县', '0931');
INSERT INTO `t_area` VALUES ('342', '339', '迎泽区', 'sx,ty,yzq', '140106', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市迎泽区', '0351');
INSERT INTO `t_area` VALUES ('3420', '3412', '夏河县', 'gs,gnczzzz,xhx', '623027', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '甘肃省甘南藏族自治州夏河县', '0931');
INSERT INTO `t_area` VALUES ('3421', '100', '青海省', 'qh', '630000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省', '0972');
INSERT INTO `t_area` VALUES ('3422', '3421', '西宁市', 'qh,xn', '630100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省西宁市', '0971');
INSERT INTO `t_area` VALUES ('3423', '3422', '市辖区', 'qh,xn,sxq', '630101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省西宁市市辖区', '0971');
INSERT INTO `t_area` VALUES ('3424', '3422', '城东区', 'qh,xn,cdq', '630102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省西宁市城东区', '0971');
INSERT INTO `t_area` VALUES ('3425', '3422', '城中区', 'qh,xn,czq', '630103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省西宁市城中区', '0971');
INSERT INTO `t_area` VALUES ('3426', '3422', '城西区', 'qh,xn,cxq', '630104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省西宁市城西区', '0971');
INSERT INTO `t_area` VALUES ('3427', '3422', '城北区', 'qh,xn,cbq', '630105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省西宁市城北区', '0971');
INSERT INTO `t_area` VALUES ('3428', '3422', '大通回族土族自治县', 'qh,xn,dthztzzzx', '630121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省西宁市大通回族土族自治县', '0971');
INSERT INTO `t_area` VALUES ('3429', '3422', '湟中县', 'qh,xn,hzx', '630122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省西宁市湟中县', '0971');
INSERT INTO `t_area` VALUES ('343', '339', '杏花岭区', 'sx,ty,xhlq', '140107', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市杏花岭区', '0351');
INSERT INTO `t_area` VALUES ('3430', '3422', '湟源县', 'qh,xn,hyx', '630123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省西宁市湟源县', '0971');
INSERT INTO `t_area` VALUES ('3431', '3421', '海东地区', 'qh,hddq', '632100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海东地区', '0972');
INSERT INTO `t_area` VALUES ('3432', '3431', '平安县', 'qh,hddq,pax', '632121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海东地区平安县', '0972');
INSERT INTO `t_area` VALUES ('3433', '3431', '民和回族土族自治县', 'qh,hddq,mhhztzzzx', '632122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海东地区民和回族土族自治县', '0972');
INSERT INTO `t_area` VALUES ('3434', '3431', '乐都县', 'qh,hddq,ldx', '632123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海东地区乐都县', '0972');
INSERT INTO `t_area` VALUES ('3435', '3431', '互助土族自治县', 'qh,hddq,hztzzzx', '632126', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海东地区互助土族自治县', '0972');
INSERT INTO `t_area` VALUES ('3436', '3431', '化隆回族自治县', 'qh,hddq,hlhzzzx', '632127', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海东地区化隆回族自治县', '0972');
INSERT INTO `t_area` VALUES ('3437', '3431', '循化撒拉族自治县', 'qh,hddq,xhslzzzx', '632128', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海东地区循化撒拉族自治县', '0972');
INSERT INTO `t_area` VALUES ('3438', '3421', '海北藏族自治州', 'qh,hbczzzz', '632200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海北藏族自治州', '0972');
INSERT INTO `t_area` VALUES ('3439', '3438', '门源回族自治县', 'qh,hbczzzz,myhzzzx', '632221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海北藏族自治州门源回族自治县', '0972');
INSERT INTO `t_area` VALUES ('344', '339', '尖草坪区', 'sx,ty,jcpq', '140108', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市尖草坪区', '0351');
INSERT INTO `t_area` VALUES ('3440', '3438', '祁连县', 'qh,hbczzzz,qlx', '632222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海北藏族自治州祁连县', '0972');
INSERT INTO `t_area` VALUES ('3441', '3438', '海晏县', 'qh,hbczzzz,hyx', '632223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海北藏族自治州海晏县', '0970');
INSERT INTO `t_area` VALUES ('3442', '3438', '刚察县', 'qh,hbczzzz,gcx', '632224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海北藏族自治州刚察县', '0972');
INSERT INTO `t_area` VALUES ('3443', '3421', '黄南藏族自治州', 'qh,hnczzzz', '632300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省黄南藏族自治州', '0972');
INSERT INTO `t_area` VALUES ('3444', '3443', '同仁县', 'qh,hnczzzz,trx', '632321', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省黄南藏族自治州同仁县', '0973');
INSERT INTO `t_area` VALUES ('3445', '3443', '尖扎县', 'qh,hnczzzz,jzx', '632322', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省黄南藏族自治州尖扎县', '0972');
INSERT INTO `t_area` VALUES ('3446', '3443', '泽库县', 'qh,hnczzzz,zkx', '632323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省黄南藏族自治州泽库县', '0972');
INSERT INTO `t_area` VALUES ('3447', '3443', '河南蒙古族自治县', 'qh,hnczzzz,hnmgzzzx', '632324', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省黄南藏族自治州河南蒙古族自治县', '0972');
INSERT INTO `t_area` VALUES ('3448', '3421', '海南藏族自治州', 'qh,hnczzzz', '632500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海南藏族自治州', '0972');
INSERT INTO `t_area` VALUES ('3449', '3448', '共和县', 'qh,hnczzzz,ghx', '632521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海南藏族自治州共和县', '0974');
INSERT INTO `t_area` VALUES ('345', '339', '万柏林区', 'sx,ty,wblq', '140109', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市万柏林区', '0351');
INSERT INTO `t_area` VALUES ('3450', '3448', '同德县', 'qh,hnczzzz,tdx', '632522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海南藏族自治州同德县', '0972');
INSERT INTO `t_area` VALUES ('3451', '3448', '贵德县', 'qh,hnczzzz,gdx', '632523', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海南藏族自治州贵德县', '0972');
INSERT INTO `t_area` VALUES ('3452', '3448', '兴海县', 'qh,hnczzzz,xhx', '632524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海南藏族自治州兴海县', '0972');
INSERT INTO `t_area` VALUES ('3453', '3448', '贵南县', 'qh,hnczzzz,gnx', '632525', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海南藏族自治州贵南县', '0972');
INSERT INTO `t_area` VALUES ('3454', '3421', '果洛藏族自治州', 'qh,glczzzz', '632600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省果洛藏族自治州', '0972');
INSERT INTO `t_area` VALUES ('3455', '3454', '玛沁县', 'qh,glczzzz,mqx', '632621', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省果洛藏族自治州玛沁县', '0975');
INSERT INTO `t_area` VALUES ('3456', '3454', '班玛县', 'qh,glczzzz,bmx', '632622', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省果洛藏族自治州班玛县', '0972');
INSERT INTO `t_area` VALUES ('3457', '3454', '甘德县', 'qh,glczzzz,gdx', '632623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省果洛藏族自治州甘德县', '0972');
INSERT INTO `t_area` VALUES ('3458', '3454', '达日县', 'qh,glczzzz,drx', '632624', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省果洛藏族自治州达日县', '0972');
INSERT INTO `t_area` VALUES ('3459', '3454', '久治县', 'qh,glczzzz,jzx', '632625', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省果洛藏族自治州久治县', '0972');
INSERT INTO `t_area` VALUES ('346', '339', '晋源区', 'sx,ty,jyq', '140110', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市晋源区', '0351');
INSERT INTO `t_area` VALUES ('3460', '3454', '玛多县', 'qh,glczzzz,mdx', '632626', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省果洛藏族自治州玛多县', '0972');
INSERT INTO `t_area` VALUES ('3461', '3421', '玉树藏族自治州', 'qh,ysczzzz', '632700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省玉树藏族自治州', '0976');
INSERT INTO `t_area` VALUES ('3462', '3461', '玉树县', 'qh,ysczzzz,ysx', '632721', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省玉树藏族自治州玉树县', '0976');
INSERT INTO `t_area` VALUES ('3463', '3461', '杂多县', 'qh,ysczzzz,zdx', '632722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省玉树藏族自治州杂多县', '0976');
INSERT INTO `t_area` VALUES ('3464', '3461', '称多县', 'qh,ysczzzz,cdx', '632723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省玉树藏族自治州称多县', '0976');
INSERT INTO `t_area` VALUES ('3465', '3461', '治多县', 'qh,ysczzzz,zdx', '632724', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省玉树藏族自治州治多县', '0976');
INSERT INTO `t_area` VALUES ('3466', '3461', '囊谦县', 'qh,ysczzzz,nqx', '632725', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省玉树藏族自治州囊谦县', '0976');
INSERT INTO `t_area` VALUES ('3467', '3461', '曲麻莱县', 'qh,ysczzzz,qmlx', '632726', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省玉树藏族自治州曲麻莱县', '0976');
INSERT INTO `t_area` VALUES ('3468', '3421', '海西蒙古族藏族自治州', 'qh,hxmgzczzzz', '632800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海西蒙古族藏族自治州', '0972');
INSERT INTO `t_area` VALUES ('3469', '3468', '格尔木市', 'qh,hxmgzczzzz,gem', '632801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海西蒙古族藏族自治州格尔木市', '0972');
INSERT INTO `t_area` VALUES ('347', '339', '清徐县', 'sx,ty,qxx', '140121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市清徐县', '0351');
INSERT INTO `t_area` VALUES ('3470', '3468', '德令哈市', 'qh,hxmgzczzzz,dlh', '632802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海西蒙古族藏族自治州德令哈市', '0977');
INSERT INTO `t_area` VALUES ('3471', '3468', '乌兰县', 'qh,hxmgzczzzz,wlx', '632821', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海西蒙古族藏族自治州乌兰县', '0972');
INSERT INTO `t_area` VALUES ('3472', '3468', '都兰县', 'qh,hxmgzczzzz,dlx', '632822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海西蒙古族藏族自治州都兰县', '0972');
INSERT INTO `t_area` VALUES ('3473', '3468', '天峻县', 'qh,hxmgzczzzz,tjx', '632823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '青海省海西蒙古族藏族自治州天峻县', '0972');
INSERT INTO `t_area` VALUES ('3474', '100', '宁夏回族自治区', 'nxhzzzq', '640000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区', '0953');
INSERT INTO `t_area` VALUES ('3475', '3474', '银川市', 'nxhzzzq,yc', '640100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区银川市', '0951');
INSERT INTO `t_area` VALUES ('3476', '3475', '市辖区', 'nxhzzzq,yc,sxq', '640101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区银川市市辖区', '0951');
INSERT INTO `t_area` VALUES ('3477', '3475', '兴庆区', 'nxhzzzq,yc,xqq', '640104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区银川市兴庆区', '0951');
INSERT INTO `t_area` VALUES ('3478', '3475', '西夏区', 'nxhzzzq,yc,xxq', '640105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区银川市西夏区', '0951');
INSERT INTO `t_area` VALUES ('3479', '3475', '金凤区', 'nxhzzzq,yc,jfq', '640106', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区银川市金凤区', '0951');
INSERT INTO `t_area` VALUES ('348', '339', '阳曲县', 'sx,ty,yqx', '140122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市阳曲县', '0351');
INSERT INTO `t_area` VALUES ('3480', '3475', '永宁县', 'nxhzzzq,yc,ynx', '640121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区银川市永宁县', '0951');
INSERT INTO `t_area` VALUES ('3481', '3475', '贺兰县', 'nxhzzzq,yc,hlx', '640122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区银川市贺兰县', '0951');
INSERT INTO `t_area` VALUES ('3482', '3475', '灵武市', 'nxhzzzq,yc,lw', '640181', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区银川市灵武市', '0951');
INSERT INTO `t_area` VALUES ('3483', '3474', '石嘴山市', 'nxhzzzq,szs', '640200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区石嘴山市', '0953');
INSERT INTO `t_area` VALUES ('3484', '3483', '市辖区', 'nxhzzzq,szs,sxq', '640201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区石嘴山市市辖区', '0953');
INSERT INTO `t_area` VALUES ('3485', '3483', '大武口区', 'nxhzzzq,szs,dwkq', '640202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区石嘴山市大武口区', '0952');
INSERT INTO `t_area` VALUES ('3486', '3483', '惠农区', 'nxhzzzq,szs,hnq', '640205', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区石嘴山市惠农区', '0953');
INSERT INTO `t_area` VALUES ('3487', '3483', '平罗县', 'nxhzzzq,szs,plx', '640221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区石嘴山市平罗县', '0953');
INSERT INTO `t_area` VALUES ('3488', '3474', '吴忠市', 'nxhzzzq,wz', '640300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区吴忠市', '0953');
INSERT INTO `t_area` VALUES ('3489', '3488', '市辖区', 'nxhzzzq,wz,sxq', '640301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区吴忠市市辖区', '0953');
INSERT INTO `t_area` VALUES ('349', '339', '娄烦县', 'sx,ty,lfx', '140123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市娄烦县', '0351');
INSERT INTO `t_area` VALUES ('3490', '3488', '利通区', 'nxhzzzq,wz,ltq', '640302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区吴忠市利通区', '0953');
INSERT INTO `t_area` VALUES ('3491', '3488', '盐池县', 'nxhzzzq,wz,ycx', '640323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区吴忠市盐池县', '0953');
INSERT INTO `t_area` VALUES ('3492', '3488', '同心县', 'nxhzzzq,wz,txx', '640324', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区吴忠市同心县', '0953');
INSERT INTO `t_area` VALUES ('3493', '3488', '青铜峡市', 'nxhzzzq,wz,qtx', '640381', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区吴忠市青铜峡市', '0953');
INSERT INTO `t_area` VALUES ('3494', '3474', '固原市', 'nxhzzzq,gy', '640400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区固原市', '0954');
INSERT INTO `t_area` VALUES ('3495', '3494', '市辖区', 'nxhzzzq,gy,sxq', '640401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区固原市市辖区', '0954');
INSERT INTO `t_area` VALUES ('3496', '3494', '原州区', 'nxhzzzq,gy,yzq', '640402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区固原市原州区', '0954');
INSERT INTO `t_area` VALUES ('3497', '3494', '西吉县', 'nxhzzzq,gy,xjx', '640422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区固原市西吉县', '0954');
INSERT INTO `t_area` VALUES ('3498', '3494', '隆德县', 'nxhzzzq,gy,ldx', '640423', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区固原市隆德县', '0954');
INSERT INTO `t_area` VALUES ('3499', '3494', '泾源县', 'nxhzzzq,gy,jyx', '640424', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区固原市泾源县', '0954');
INSERT INTO `t_area` VALUES ('350', '339', '古交市', 'sx,ty,gj', '140181', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省太原市古交市', '0351');
INSERT INTO `t_area` VALUES ('3500', '3494', '彭阳县', 'nxhzzzq,gy,pyx', '640425', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区固原市彭阳县', '0954');
INSERT INTO `t_area` VALUES ('3501', '3474', '中卫市', 'nxhzzzq,zw', '640500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区中卫市', '0953');
INSERT INTO `t_area` VALUES ('3502', '3501', '市辖区', 'nxhzzzq,zw,sxq', '640501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区中卫市市辖区', '0953');
INSERT INTO `t_area` VALUES ('3503', '3501', '沙坡头区', 'nxhzzzq,zw,sptq', '640502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区中卫市沙坡头区', '0953');
INSERT INTO `t_area` VALUES ('3504', '3501', '中宁县', 'nxhzzzq,zw,znx', '640521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区中卫市中宁县', '0953');
INSERT INTO `t_area` VALUES ('3505', '3501', '海原县', 'nxhzzzq,zw,hyx', '640522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '宁夏回族自治区中卫市海原县', '0953');
INSERT INTO `t_area` VALUES ('3506', '100', '新疆维吾尔自治区', 'xjwwezzq', '650000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区', '0993');
INSERT INTO `t_area` VALUES ('3507', '3506', '乌鲁木齐市', 'xjwwezzq,wlmq', '650100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区乌鲁木齐市', '0991');
INSERT INTO `t_area` VALUES ('3508', '3507', '市辖区', 'xjwwezzq,wlmq,sxq', '650101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区乌鲁木齐市市辖区', '0991');
INSERT INTO `t_area` VALUES ('3509', '3507', '天山区', 'xjwwezzq,wlmq,tsq', '650102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区乌鲁木齐市天山区', '0991');
INSERT INTO `t_area` VALUES ('351', '338', '大同市', 'sx,dt', '140200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市', '0352');
INSERT INTO `t_area` VALUES ('3510', '3507', '沙依巴克区', 'xjwwezzq,wlmq,sybkq', '650103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区乌鲁木齐市沙依巴克区', '0991');
INSERT INTO `t_area` VALUES ('3511', '3507', '新市区', 'xjwwezzq,wlmq,xsq', '650104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区乌鲁木齐市新市区', '0991');
INSERT INTO `t_area` VALUES ('3512', '3507', '水磨沟区', 'xjwwezzq,wlmq,smgq', '650105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区乌鲁木齐市水磨沟区', '0991');
INSERT INTO `t_area` VALUES ('3513', '3507', '头屯河区', 'xjwwezzq,wlmq,tthq', '650106', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区乌鲁木齐市头屯河区', '0991');
INSERT INTO `t_area` VALUES ('3514', '3507', '达坂城区', 'xjwwezzq,wlmq,dbcq', '650107', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区乌鲁木齐市达坂城区', '0991');
INSERT INTO `t_area` VALUES ('3515', '3507', '米东区(*)', 'xjwwezzq,wlmq,mdq(*)', '650109', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区乌鲁木齐市米东区(*)', '0991');
INSERT INTO `t_area` VALUES ('3516', '3507', '乌鲁木齐县', 'xjwwezzq,wlmq,wlmqx', '650121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区乌鲁木齐市乌鲁木齐县', '0991');
INSERT INTO `t_area` VALUES ('3517', '3506', '克拉玛依市', 'xjwwezzq,klmy', '650200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克拉玛依市', '0990');
INSERT INTO `t_area` VALUES ('3518', '3517', '市辖区', 'xjwwezzq,klmy,sxq', '650201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克拉玛依市市辖区', '0990');
INSERT INTO `t_area` VALUES ('3519', '3517', '独山子区', 'xjwwezzq,klmy,dszq', '650202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克拉玛依市独山子区', '0990');
INSERT INTO `t_area` VALUES ('352', '351', '市辖区', 'sx,dt,sxq', '140201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市市辖区', '0352');
INSERT INTO `t_area` VALUES ('3520', '3517', '克拉玛依区', 'xjwwezzq,klmy,klmyq', '650203', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克拉玛依市克拉玛依区', '0990');
INSERT INTO `t_area` VALUES ('3521', '3517', '白碱滩区', 'xjwwezzq,klmy,bjtq', '650204', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克拉玛依市白碱滩区', '0990');
INSERT INTO `t_area` VALUES ('3522', '3517', '乌尔禾区', 'xjwwezzq,klmy,wehq', '650205', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克拉玛依市乌尔禾区', '0990');
INSERT INTO `t_area` VALUES ('3523', '3506', '吐鲁番地区', 'xjwwezzq,tlfdq', '652100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区吐鲁番地区', '0995');
INSERT INTO `t_area` VALUES ('3524', '3523', '吐鲁番市', 'xjwwezzq,tlfdq,tlf', '652101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区吐鲁番地区吐鲁番市', '0995');
INSERT INTO `t_area` VALUES ('3525', '3523', '鄯善县', 'xjwwezzq,tlfdq,ssx', '652122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区吐鲁番地区鄯善县', '0995');
INSERT INTO `t_area` VALUES ('3526', '3523', '托克逊县', 'xjwwezzq,tlfdq,tkxx', '652123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区吐鲁番地区托克逊县', '0995');
INSERT INTO `t_area` VALUES ('3527', '3506', '哈密地区', 'xjwwezzq,hmdq', '652200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区哈密地区', '0902');
INSERT INTO `t_area` VALUES ('3528', '3527', '哈密市', 'xjwwezzq,hmdq,hm', '652201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区哈密地区哈密市', '0902');
INSERT INTO `t_area` VALUES ('3529', '3527', '巴里坤哈萨克自治县', 'xjwwezzq,hmdq,blkhskzzx', '652222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区哈密地区巴里坤哈萨克自治县', '0902');
INSERT INTO `t_area` VALUES ('353', '351', '城区', 'sx,dt,cq', '140202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市城区', '0352');
INSERT INTO `t_area` VALUES ('3530', '3527', '伊吾县', 'xjwwezzq,hmdq,ywx', '652223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区哈密地区伊吾县', '0902');
INSERT INTO `t_area` VALUES ('3531', '3506', '昌吉回族自治州', 'xjwwezzq,cjhzzzz', '652300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区昌吉回族自治州', '0994');
INSERT INTO `t_area` VALUES ('3532', '3531', '昌吉市', 'xjwwezzq,cjhzzzz,cj', '652301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区昌吉回族自治州昌吉市', '0994');
INSERT INTO `t_area` VALUES ('3533', '3531', '阜康市', 'xjwwezzq,cjhzzzz,fk', '652302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区昌吉回族自治州阜康市', '0994');
INSERT INTO `t_area` VALUES ('3534', '3531', '呼图壁县', 'xjwwezzq,cjhzzzz,htbx', '652323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区昌吉回族自治州呼图壁县', '0994');
INSERT INTO `t_area` VALUES ('3535', '3531', '玛纳斯县', 'xjwwezzq,cjhzzzz,mnsx', '652324', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区昌吉回族自治州玛纳斯县', '0994');
INSERT INTO `t_area` VALUES ('3536', '3531', '奇台县', 'xjwwezzq,cjhzzzz,qtx', '652325', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区昌吉回族自治州奇台县', '0994');
INSERT INTO `t_area` VALUES ('3537', '3531', '吉木萨尔县', 'xjwwezzq,cjhzzzz,jmsex', '652327', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区昌吉回族自治州吉木萨尔县', '0994');
INSERT INTO `t_area` VALUES ('3538', '3531', '木垒哈萨克自治县', 'xjwwezzq,cjhzzzz,mlhskzzx', '652328', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区昌吉回族自治州木垒哈萨克自治县', '0994');
INSERT INTO `t_area` VALUES ('3539', '3506', '博尔塔拉蒙古自治州', 'xjwwezzq,betlmgzzz', '652700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区博尔塔拉蒙古自治州', '0993');
INSERT INTO `t_area` VALUES ('354', '351', '矿区', 'sx,dt,kq', '140203', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市矿区', '0352');
INSERT INTO `t_area` VALUES ('3540', '3539', '博乐市', 'xjwwezzq,betlmgzzz,bl', '652701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区博尔塔拉蒙古自治州博乐市', '0909');
INSERT INTO `t_area` VALUES ('3541', '3539', '精河县', 'xjwwezzq,betlmgzzz,jhx', '652722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区博尔塔拉蒙古自治州精河县', '0993');
INSERT INTO `t_area` VALUES ('3542', '3539', '温泉县', 'xjwwezzq,betlmgzzz,wqx', '652723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区博尔塔拉蒙古自治州温泉县', '0993');
INSERT INTO `t_area` VALUES ('3543', '3506', '巴音郭楞蒙古自治州', 'xjwwezzq,byglmgzzz', '652800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区巴音郭楞蒙古自治州', '0993');
INSERT INTO `t_area` VALUES ('3544', '3543', '库尔勒市', 'xjwwezzq,byglmgzzz,kel', '652801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区巴音郭楞蒙古自治州库尔勒市', '0996');
INSERT INTO `t_area` VALUES ('3545', '3543', '轮台县', 'xjwwezzq,byglmgzzz,ltx', '652822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区巴音郭楞蒙古自治州轮台县', '0993');
INSERT INTO `t_area` VALUES ('3546', '3543', '尉犁县', 'xjwwezzq,byglmgzzz,wlx', '652823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区巴音郭楞蒙古自治州尉犁县', '0993');
INSERT INTO `t_area` VALUES ('3547', '3543', '若羌县', 'xjwwezzq,byglmgzzz,rqx', '652824', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区巴音郭楞蒙古自治州若羌县', '0993');
INSERT INTO `t_area` VALUES ('3548', '3543', '且末县', 'xjwwezzq,byglmgzzz,qmx', '652825', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区巴音郭楞蒙古自治州且末县', '0993');
INSERT INTO `t_area` VALUES ('3549', '3543', '焉耆回族自治县', 'xjwwezzq,byglmgzzz,yqhzzzx', '652826', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区巴音郭楞蒙古自治州焉耆回族自治县', '0993');
INSERT INTO `t_area` VALUES ('355', '351', '南郊区', 'sx,dt,njq', '140211', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市南郊区', '0352');
INSERT INTO `t_area` VALUES ('3550', '3543', '和静县', 'xjwwezzq,byglmgzzz,hjx', '652827', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区巴音郭楞蒙古自治州和静县', '0993');
INSERT INTO `t_area` VALUES ('3551', '3543', '和硕县', 'xjwwezzq,byglmgzzz,hsx', '652828', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区巴音郭楞蒙古自治州和硕县', '0993');
INSERT INTO `t_area` VALUES ('3552', '3543', '博湖县', 'xjwwezzq,byglmgzzz,bhx', '652829', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区巴音郭楞蒙古自治州博湖县', '0993');
INSERT INTO `t_area` VALUES ('3553', '3506', '阿克苏地区', 'xjwwezzq,aksdq', '652900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿克苏地区', '0997');
INSERT INTO `t_area` VALUES ('3554', '3553', '阿克苏市', 'xjwwezzq,aksdq,aks', '652901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿克苏地区阿克苏市', '0997');
INSERT INTO `t_area` VALUES ('3555', '3553', '温宿县', 'xjwwezzq,aksdq,wsx', '652922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿克苏地区温宿县', '0997');
INSERT INTO `t_area` VALUES ('3556', '3553', '库车县', 'xjwwezzq,aksdq,kcx', '652923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿克苏地区库车县', '0997');
INSERT INTO `t_area` VALUES ('3557', '3553', '沙雅县', 'xjwwezzq,aksdq,syx', '652924', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿克苏地区沙雅县', '0997');
INSERT INTO `t_area` VALUES ('3558', '3553', '新和县', 'xjwwezzq,aksdq,xhx', '652925', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿克苏地区新和县', '0997');
INSERT INTO `t_area` VALUES ('3559', '3553', '拜城县', 'xjwwezzq,aksdq,bcx', '652926', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿克苏地区拜城县', '0997');
INSERT INTO `t_area` VALUES ('356', '351', '新荣区', 'sx,dt,xrq', '140212', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市新荣区', '0352');
INSERT INTO `t_area` VALUES ('3560', '3553', '乌什县', 'xjwwezzq,aksdq,wsx', '652927', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿克苏地区乌什县', '0997');
INSERT INTO `t_area` VALUES ('3561', '3553', '阿瓦提县', 'xjwwezzq,aksdq,awtx', '652928', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿克苏地区阿瓦提县', '0997');
INSERT INTO `t_area` VALUES ('3562', '3553', '柯坪县', 'xjwwezzq,aksdq,kpx', '652929', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿克苏地区柯坪县', '0997');
INSERT INTO `t_area` VALUES ('3563', '3506', '克孜勒苏柯尔克孜自治州', 'xjwwezzq,kzlskekzzzz', '653000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州', '0993');
INSERT INTO `t_area` VALUES ('3564', '3563', '阿图什市', 'xjwwezzq,kzlskekzzzz,ats', '653001', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿图什市', '0908');
INSERT INTO `t_area` VALUES ('3565', '3563', '阿克陶县', 'xjwwezzq,kzlskekzzzz,aktx', '653022', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿克陶县', '0993');
INSERT INTO `t_area` VALUES ('3566', '3563', '阿合奇县', 'xjwwezzq,kzlskekzzzz,ahqx', '653023', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿合奇县', '0993');
INSERT INTO `t_area` VALUES ('3567', '3563', '乌恰县', 'xjwwezzq,kzlskekzzzz,wqx', '653024', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州乌恰县', '0993');
INSERT INTO `t_area` VALUES ('3568', '3506', '喀什地区', 'xjwwezzq,ksdq', '653100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区', '0998');
INSERT INTO `t_area` VALUES ('3569', '3568', '喀什市', 'xjwwezzq,ksdq,ks', '653101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区喀什市', '0998');
INSERT INTO `t_area` VALUES ('357', '351', '阳高县', 'sx,dt,ygx', '140221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市阳高县', '0352');
INSERT INTO `t_area` VALUES ('3570', '3568', '疏附县', 'xjwwezzq,ksdq,sfx', '653121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区疏附县', '0998');
INSERT INTO `t_area` VALUES ('3571', '3568', '疏勒县', 'xjwwezzq,ksdq,slx', '653122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区疏勒县', '0998');
INSERT INTO `t_area` VALUES ('3572', '3568', '英吉沙县', 'xjwwezzq,ksdq,yjsx', '653123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区英吉沙县', '0998');
INSERT INTO `t_area` VALUES ('3573', '3568', '泽普县', 'xjwwezzq,ksdq,zpx', '653124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区泽普县', '0998');
INSERT INTO `t_area` VALUES ('3574', '3568', '莎车县', 'xjwwezzq,ksdq,scx', '653125', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区莎车县', '0998');
INSERT INTO `t_area` VALUES ('3575', '3568', '叶城县', 'xjwwezzq,ksdq,ycx', '653126', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区叶城县', '0998');
INSERT INTO `t_area` VALUES ('3576', '3568', '麦盖提县', 'xjwwezzq,ksdq,mgtx', '653127', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区麦盖提县', '0998');
INSERT INTO `t_area` VALUES ('3577', '3568', '岳普湖县', 'xjwwezzq,ksdq,yphx', '653128', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区岳普湖县', '0998');
INSERT INTO `t_area` VALUES ('3578', '3568', '伽师县', 'xjwwezzq,ksdq,jsx', '653129', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区伽师县', '0998');
INSERT INTO `t_area` VALUES ('3579', '3568', '巴楚县', 'xjwwezzq,ksdq,bcx', '653130', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区巴楚县', '0998');
INSERT INTO `t_area` VALUES ('358', '351', '天镇县', 'sx,dt,tzx', '140222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市天镇县', '0352');
INSERT INTO `t_area` VALUES ('3580', '3568', '塔什库尔干塔吉克自治县', 'xjwwezzq,ksdq,tskegtjkzzx', '653131', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区喀什地区塔什库尔干塔吉克自治县', '0998');
INSERT INTO `t_area` VALUES ('3581', '3506', '和田地区', 'xjwwezzq,htdq', '653200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区和田地区', '0903');
INSERT INTO `t_area` VALUES ('3582', '3581', '和田市', 'xjwwezzq,htdq,ht', '653201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区和田地区和田市', '0903');
INSERT INTO `t_area` VALUES ('3583', '3581', '和田县', 'xjwwezzq,htdq,htx', '653221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区和田地区和田县', '0903');
INSERT INTO `t_area` VALUES ('3584', '3581', '墨玉县', 'xjwwezzq,htdq,myx', '653222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区和田地区墨玉县', '0903');
INSERT INTO `t_area` VALUES ('3585', '3581', '皮山县', 'xjwwezzq,htdq,psx', '653223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区和田地区皮山县', '0903');
INSERT INTO `t_area` VALUES ('3586', '3581', '洛浦县', 'xjwwezzq,htdq,lpx', '653224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区和田地区洛浦县', '0903');
INSERT INTO `t_area` VALUES ('3587', '3581', '策勒县', 'xjwwezzq,htdq,clx', '653225', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区和田地区策勒县', '0903');
INSERT INTO `t_area` VALUES ('3588', '3581', '于田县', 'xjwwezzq,htdq,ytx', '653226', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区和田地区于田县', '0903');
INSERT INTO `t_area` VALUES ('3589', '3581', '民丰县', 'xjwwezzq,htdq,mfx', '653227', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区和田地区民丰县', '0903');
INSERT INTO `t_area` VALUES ('359', '351', '广灵县', 'sx,dt,glx', '140223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市广灵县', '0352');
INSERT INTO `t_area` VALUES ('3590', '3506', '伊犁哈萨克自治州', 'xjwwezzq,ylhskzzz', '654000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州', '0993');
INSERT INTO `t_area` VALUES ('3591', '3590', '伊宁市', 'xjwwezzq,ylhskzzz,yn', '654002', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州伊宁市', '0999');
INSERT INTO `t_area` VALUES ('3592', '3590', '奎屯市', 'xjwwezzq,ylhskzzz,kt', '654003', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州奎屯市', '0992');
INSERT INTO `t_area` VALUES ('3593', '3590', '伊宁县', 'xjwwezzq,ylhskzzz,ynx', '654021', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州伊宁县', '0999');
INSERT INTO `t_area` VALUES ('3594', '3590', '察布查尔锡伯自治县', 'xjwwezzq,ylhskzzz,cbcexbzzx', '654022', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州察布查尔锡伯自治县', '0993');
INSERT INTO `t_area` VALUES ('3595', '3590', '霍城县', 'xjwwezzq,ylhskzzz,hcx', '654023', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州霍城县', '0993');
INSERT INTO `t_area` VALUES ('3596', '3590', '巩留县', 'xjwwezzq,ylhskzzz,glx', '654024', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州巩留县', '0993');
INSERT INTO `t_area` VALUES ('3597', '3590', '新源县', 'xjwwezzq,ylhskzzz,xyx', '654025', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州新源县', '0993');
INSERT INTO `t_area` VALUES ('3598', '3590', '昭苏县', 'xjwwezzq,ylhskzzz,zsx', '654026', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州昭苏县', '0993');
INSERT INTO `t_area` VALUES ('3599', '3590', '特克斯县', 'xjwwezzq,ylhskzzz,tksx', '654027', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州特克斯县', '0993');
INSERT INTO `t_area` VALUES ('360', '351', '灵丘县', 'sx,dt,lqx', '140224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市灵丘县', '0352');
INSERT INTO `t_area` VALUES ('3600', '3590', '尼勒克县', 'xjwwezzq,ylhskzzz,nlkx', '654028', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区伊犁哈萨克自治州尼勒克县', '0993');
INSERT INTO `t_area` VALUES ('3601', '3506', '塔城地区', 'xjwwezzq,tcdq', '654200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区塔城地区', '0901');
INSERT INTO `t_area` VALUES ('3602', '3601', '塔城市', 'xjwwezzq,tcdq,tc', '654201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区塔城地区塔城市', '0901');
INSERT INTO `t_area` VALUES ('3603', '3601', '乌苏市', 'xjwwezzq,tcdq,ws', '654202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区塔城地区乌苏市', '0901');
INSERT INTO `t_area` VALUES ('3604', '3601', '额敏县', 'xjwwezzq,tcdq,emx', '654221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区塔城地区额敏县', '0901');
INSERT INTO `t_area` VALUES ('3605', '3601', '沙湾县', 'xjwwezzq,tcdq,swx', '654223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区塔城地区沙湾县', '0901');
INSERT INTO `t_area` VALUES ('3606', '3601', '托里县', 'xjwwezzq,tcdq,tlx', '654224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区塔城地区托里县', '0901');
INSERT INTO `t_area` VALUES ('3607', '3601', '裕民县', 'xjwwezzq,tcdq,ymx', '654225', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区塔城地区裕民县', '0901');
INSERT INTO `t_area` VALUES ('3608', '3601', '和布克赛尔蒙古自治县', 'xjwwezzq,tcdq,hbksemgzzx', '654226', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区塔城地区和布克赛尔蒙古自治县', '0901');
INSERT INTO `t_area` VALUES ('3609', '3506', '阿勒泰地区', 'xjwwezzq,altdq', '654300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿勒泰地区', '0906');
INSERT INTO `t_area` VALUES ('361', '351', '浑源县', 'sx,dt,hyx', '140225', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省大同市浑源县', '0352');
INSERT INTO `t_area` VALUES ('3610', '3609', '阿勒泰市', 'xjwwezzq,altdq,alt', '654301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '新疆维吾尔自治区阿勒泰地区阿勒泰市', '0906');
INSERT INTO `t_area` VALUES ('3611', '3609', '布尔津县', 'xjwwezzq,altdq,bejx', '654321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区阿勒泰地区布尔津县', '0906');
INSERT INTO `t_area` VALUES ('3612', '3609', '富蕴县', 'xjwwezzq,altdq,fyx', '654322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区阿勒泰地区富蕴县', '0906');
INSERT INTO `t_area` VALUES ('3613', '3609', '福海县', 'xjwwezzq,altdq,fhx', '654323', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区阿勒泰地区福海县', '0906');
INSERT INTO `t_area` VALUES ('3614', '3609', '哈巴河县', 'xjwwezzq,altdq,hbhx', '654324', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区阿勒泰地区哈巴河县', '0906');
INSERT INTO `t_area` VALUES ('3615', '3609', '青河县', 'xjwwezzq,altdq,qhx', '654325', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区阿勒泰地区青河县', '0906');
INSERT INTO `t_area` VALUES ('3616', '3609', '吉木乃县', 'xjwwezzq,altdq,jmnx', '654326', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区阿勒泰地区吉木乃县', '0906');
INSERT INTO `t_area` VALUES ('3617', '3506', '自治区直辖县级行政单位(**)', 'xjwwezzq,zzqzxxjxzdw(**)', '659000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区自治区直辖县级行政单位(**)', '0993');
INSERT INTO `t_area` VALUES ('3618', '3617', '石河子市', 'xjwwezzq,zzqzxxjxzdw(**),shz', '659001', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区自治区直辖县级行政单位(**)石河子市', '0993');
INSERT INTO `t_area` VALUES ('3619', '3617', '阿拉尔市', 'xjwwezzq,zzqzxxjxzdw(**),ale', '659002', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区自治区直辖县级行政单位(**)阿拉尔市', '0993');
INSERT INTO `t_area` VALUES ('362', '351', '左云县', 'sx,dt,zyx', '140226', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省大同市左云县', '0352');
INSERT INTO `t_area` VALUES ('3620', '3617', '图木舒克市', 'xjwwezzq,zzqzxxjxzdw(**),tmsk', '659003', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区自治区直辖县级行政单位(**)图木舒克市', '0993');
INSERT INTO `t_area` VALUES ('3621', '3617', '五家渠市', 'xjwwezzq,zzqzxxjxzdw(**),wjq', '659004', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新疆维吾尔自治区自治区直辖县级行政单位(**)五家渠市', '0993');
INSERT INTO `t_area` VALUES ('3622', '100', '台湾省', 'tw', '710000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '台湾省', null);
INSERT INTO `t_area` VALUES ('3623', '100', '香港特别行政区', 'xgtbxzq', '810000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '香港特别行政区', '00852');
INSERT INTO `t_area` VALUES ('3624', '100', '澳门特别行政区', 'amtbxzq', '820000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '澳门特别行政区', '00853');
INSERT INTO `t_area` VALUES ('3625', '3623', '香港', 'xg', '810100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '香港特别行政区', '00852');
INSERT INTO `t_area` VALUES ('3626', '3624', '澳门', 'am', '820100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '澳门特别行政区', '00853');
INSERT INTO `t_area` VALUES ('3627', '0', '新西兰', 'xxl', '0000400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新西兰', null);
INSERT INTO `t_area` VALUES ('3628', '0', '印度尼西亚', 'ydnxy', '0000300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '印度尼西亚', null);
INSERT INTO `t_area` VALUES ('3629', '0', '新加坡', 'xjp', '0000500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '新加坡', null);
INSERT INTO `t_area` VALUES ('363', '351', '大同县', 'sx,dt,dtx', '140227', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省大同市大同县', '0352');
INSERT INTO `t_area` VALUES ('3631', '0', '泰国', 'tg', '0000600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '泰国', null);
INSERT INTO `t_area` VALUES ('3632', '0', '美国', 'mg', '0000700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '美国', null);
INSERT INTO `t_area` VALUES ('3634', '0', '日本', 'rb', '0000900', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '日本', null);
INSERT INTO `t_area` VALUES ('3635', '0', '朝鲜', 'cx', '0001000', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '朝鲜', null);
INSERT INTO `t_area` VALUES ('3636', '0', '菲律宾', 'flb', '0001100', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '菲律宾', null);
INSERT INTO `t_area` VALUES ('3637', '0', '韩国', 'hg', '0001200', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '韩国', null);
INSERT INTO `t_area` VALUES ('3638', '0', '法国', 'fgcs', '0001300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '法国', null);
INSERT INTO `t_area` VALUES ('3639', '0', '苏丹', 'sd(cs)', '0001400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '苏丹', null);
INSERT INTO `t_area` VALUES ('364', '338', '阳泉市', 'sx,yq', '140300', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省阳泉市', '0353');
INSERT INTO `t_area` VALUES ('3640', '0', '意大利', 'ydlcs', '0001500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '意大利', null);
INSERT INTO `t_area` VALUES ('3641', '0', '澳大利亚', 'adly', '0001600', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '澳大利亚', null);
INSERT INTO `t_area` VALUES ('3642', '0', '加拿大', 'jnd', '0001700', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '加拿大', null);
INSERT INTO `t_area` VALUES ('3643', '0', '马来西亚', 'mlxy', '0001800', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '马来西亚', null);
INSERT INTO `t_area` VALUES ('365', '364', '市辖区', 'sx,yq,sxq', '140301', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省阳泉市市辖区', '0353');
INSERT INTO `t_area` VALUES ('366', '364', '城区', 'sx,yq,cq', '140302', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省阳泉市城区', '0353');
INSERT INTO `t_area` VALUES ('367', '364', '矿区', 'sx,yq,kq', '140303', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省阳泉市矿区', '0353');
INSERT INTO `t_area` VALUES ('368', '364', '郊区', 'sx,yq,jq', '140311', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省阳泉市郊区', '0353');
INSERT INTO `t_area` VALUES ('369', '364', '平定县', 'sx,yq,pdx', '140321', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省阳泉市平定县', '0353');
INSERT INTO `t_area` VALUES ('370', '364', '盂县', 'sx,yq,yx', '140322', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省阳泉市盂县', '0353');
INSERT INTO `t_area` VALUES ('371', '338', '长治市', 'sx,cz', '140400', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市', '0355');
INSERT INTO `t_area` VALUES ('372', '371', '市辖区', 'sx,cz,sxq', '140401', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市市辖区', '0355');
INSERT INTO `t_area` VALUES ('373', '371', '城区', 'sx,cz,cq', '140402', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市城区', '0355');
INSERT INTO `t_area` VALUES ('374', '371', '郊区', 'sx,cz,jq', '140411', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市郊区', '0355');
INSERT INTO `t_area` VALUES ('375', '371', '长治县', 'sx,cz,czx', '140421', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市长治县', '0355');
INSERT INTO `t_area` VALUES ('376', '371', '襄垣县', 'sx,cz,xyx', '140423', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市襄垣县', '0355');
INSERT INTO `t_area` VALUES ('377', '371', '屯留县', 'sx,cz,tlx', '140424', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市屯留县', '0355');
INSERT INTO `t_area` VALUES ('378', '371', '平顺县', 'sx,cz,psx', '140425', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市平顺县', '0355');
INSERT INTO `t_area` VALUES ('379', '371', '黎城县', 'sx,cz,lcx', '140426', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市黎城县', '0355');
INSERT INTO `t_area` VALUES ('380', '371', '壶关县', 'sx,cz,hgx', '140427', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市壶关县', '0355');
INSERT INTO `t_area` VALUES ('381', '371', '长子县', 'sx,cz,czx', '140428', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市长子县', '0355');
INSERT INTO `t_area` VALUES ('382', '371', '武乡县', 'sx,cz,wxx', '140429', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市武乡县', '0355');
INSERT INTO `t_area` VALUES ('383', '371', '沁县', 'sx,cz,qx', '140430', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市沁县', '0355');
INSERT INTO `t_area` VALUES ('384', '371', '沁源县', 'sx,cz,qyx', '140431', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市沁源县', '0355');
INSERT INTO `t_area` VALUES ('385', '371', '潞城市', 'sx,cz,lc', '140481', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省长治市潞城市', '0355');
INSERT INTO `t_area` VALUES ('386', '338', '晋城市', 'sx,jc', '140500', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省晋城市', '0356');
INSERT INTO `t_area` VALUES ('387', '386', '市辖区', 'sx,jc,sxq', '140501', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省晋城市市辖区', '0356');
INSERT INTO `t_area` VALUES ('388', '386', '城区', 'sx,jc,cq', '140502', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省晋城市城区', '0356');
INSERT INTO `t_area` VALUES ('389', '386', '沁水县', 'sx,jc,qsx', '140521', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省晋城市沁水县', '0356');
INSERT INTO `t_area` VALUES ('390', '386', '阳城县', 'sx,jc,ycx', '140522', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省晋城市阳城县', '0356');
INSERT INTO `t_area` VALUES ('391', '386', '陵川县', 'sx,jc,lcx', '140524', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省晋城市陵川县', '0356');
INSERT INTO `t_area` VALUES ('392', '386', '泽州县', 'sx,jc,zzx', '140525', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省晋城市泽州县', '0356');
INSERT INTO `t_area` VALUES ('393', '386', '高平市', 'sx,jc,gp', '140581', '2017-03-02 13:22:01', '2017-03-02 13:22:01', '山西省晋城市高平市', '0356');
INSERT INTO `t_area` VALUES ('394', '338', '朔州市', 'sx,sz', '140600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省朔州市', '0349');
INSERT INTO `t_area` VALUES ('395', '394', '市辖区', 'sx,sz,sxq', '140601', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省朔州市市辖区', '0349');
INSERT INTO `t_area` VALUES ('396', '394', '朔城区', 'sx,sz,scq', '140602', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省朔州市朔城区', '0349');
INSERT INTO `t_area` VALUES ('397', '394', '平鲁区', 'sx,sz,plq', '140603', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省朔州市平鲁区', '0349');
INSERT INTO `t_area` VALUES ('398', '394', '山阴县', 'sx,sz,syx', '140621', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省朔州市山阴县', '0349');
INSERT INTO `t_area` VALUES ('399', '394', '应县', 'sx,sz,yx', '140622', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省朔州市应县', '0349');
INSERT INTO `t_area` VALUES ('400', '394', '右玉县', 'sx,sz,yyx', '140623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省朔州市右玉县', '0349');
INSERT INTO `t_area` VALUES ('4000', '2391', '东城区', 'gd,dg,dc', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市东城', '769');
INSERT INTO `t_area` VALUES ('4002', '2392', '西区', 'gd,zs,xq', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省中山市西区', '0760');
INSERT INTO `t_area` VALUES ('4004', '2392', '东区', 'gd,zs,dq', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省中山市东区', '0760');
INSERT INTO `t_area` VALUES ('4006', '2392', '城区', 'gd,zs,cq', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省中山市城区', '0760');
INSERT INTO `t_area` VALUES ('4007', '2392', '石岐区', 'gd,zs,sqq', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省中山市石岐区', '0760');
INSERT INTO `t_area` VALUES ('401', '394', '怀仁县', 'sx,sz,hrx', '140624', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省朔州市怀仁县', '0349');
INSERT INTO `t_area` VALUES ('402', '338', '晋中市', 'sx,jz', '140700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市', '0351');
INSERT INTO `t_area` VALUES ('403', '402', '市辖区', 'sx,jz,sxq', '140701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市市辖区', '0351');
INSERT INTO `t_area` VALUES ('404', '402', '榆次区', 'sx,jz,ycq', '140702', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市榆次区', '0354');
INSERT INTO `t_area` VALUES ('4044', '2391', '南城区', 'gd,dg,ncq', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市南城区', '769');
INSERT INTO `t_area` VALUES ('4045', '2391', '莞城区', 'gd,dg,gcq', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市莞城区', '769');
INSERT INTO `t_area` VALUES ('4046', '2391', '万江区', 'gd,dg,wjq', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市万江区', '769');
INSERT INTO `t_area` VALUES ('4047', '2391', '石碣镇', 'gd,dg,sjz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市石碣镇', '769');
INSERT INTO `t_area` VALUES ('4048', '2391', '中堂镇', 'gd,dg,ztz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市中堂镇', '769');
INSERT INTO `t_area` VALUES ('4049', '2391', '望牛墩镇', 'gd,dg,wndz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市望牛墩镇', '769');
INSERT INTO `t_area` VALUES ('405', '402', '榆社县', 'sx,jz,ysx', '140721', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市榆社县', '0351');
INSERT INTO `t_area` VALUES ('4050', '2391', '麻涌镇', 'gd,dg,myz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市麻涌镇', '769');
INSERT INTO `t_area` VALUES ('4051', '2391', '道滘镇', 'gd,dg,dz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市道滘镇', '769');
INSERT INTO `t_area` VALUES ('4052', '2391', '高埗镇', 'gd,dg,gz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市高埗镇', '769');
INSERT INTO `t_area` VALUES ('4053', '2391', '虎门镇', 'gd,dg,hmz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市虎门镇', '769');
INSERT INTO `t_area` VALUES ('4054', '2391', '黄江镇', 'gd,dg,hjz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市黄江镇', '769');
INSERT INTO `t_area` VALUES ('4055', '2391', '桥头镇', 'gd,dg,qtz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市桥头镇', '769');
INSERT INTO `t_area` VALUES ('4056', '2391', '长安镇', 'gd,dg,caz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市长安镇', '769');
INSERT INTO `t_area` VALUES ('4057', '2391', '常平镇', 'gd,dg,cpz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市常平镇', '769');
INSERT INTO `t_area` VALUES ('4058', '2391', '塘厦镇', 'gd,dg,txz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市塘厦镇', '769');
INSERT INTO `t_area` VALUES ('4059', '2391', '厚街镇', 'gd,dg,hjz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市厚街镇', '769');
INSERT INTO `t_area` VALUES ('406', '402', '左权县', 'sx,jz,zqx', '140722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市左权县', '0351');
INSERT INTO `t_area` VALUES ('4060', '2391', '清溪镇', 'gd,dg,qxz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市清溪镇', '769');
INSERT INTO `t_area` VALUES ('4061', '2391', '大朗镇', 'gd,dg,dlz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市大朗镇', '769');
INSERT INTO `t_area` VALUES ('4062', '2391', '洪梅镇', 'gd,dg,hmz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市洪梅镇', '769');
INSERT INTO `t_area` VALUES ('4063', '2391', '凤岗镇', 'gd,dg,fgz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市凤岗镇', '769');
INSERT INTO `t_area` VALUES ('4064', '2391', '石龙镇', 'gd,dg,slz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市石龙镇', '769');
INSERT INTO `t_area` VALUES ('4065', '2391', '沙田镇', 'gd,dg,stz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市沙田镇', '769');
INSERT INTO `t_area` VALUES ('4066', '2391', '大岭山镇', 'gd,dg,dlsz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市大岭山镇', '769');
INSERT INTO `t_area` VALUES ('407', '402', '和顺县', 'sx,jz,hsx', '140723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市和顺县', '0351');
INSERT INTO `t_area` VALUES ('408', '402', '昔阳县', 'sx,jz,xyx', '140724', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市昔阳县', '0351');
INSERT INTO `t_area` VALUES ('409', '402', '寿阳县', 'sx,jz,syx', '140725', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市寿阳县', '0351');
INSERT INTO `t_area` VALUES ('410', '402', '太谷县', 'sx,jz,tgx', '140726', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市太谷县', '0351');
INSERT INTO `t_area` VALUES ('411', '402', '祁县', 'sx,jz,qx', '140727', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市祁县', '0351');
INSERT INTO `t_area` VALUES ('412', '402', '平遥县', 'sx,jz,pyx', '140728', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市平遥县', '0351');
INSERT INTO `t_area` VALUES ('413', '402', '灵石县', 'sx,jz,lsx', '140729', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市灵石县', '0351');
INSERT INTO `t_area` VALUES ('414', '402', '介休市', 'sx,jz,jx', '140781', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省晋中市介休市', '0351');
INSERT INTO `t_area` VALUES ('415', '338', '运城市', 'sx,yc', '140800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市', '0359');
INSERT INTO `t_area` VALUES ('416', '415', '市辖区', 'sx,yc,sxq', '140801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市市辖区', '0359');
INSERT INTO `t_area` VALUES ('417', '415', '盐湖区', 'sx,yc,yhq', '140802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市盐湖区', '0359');
INSERT INTO `t_area` VALUES ('418', '415', '临猗县', 'sx,yc,lyx', '140821', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市临猗县', '0359');
INSERT INTO `t_area` VALUES ('419', '415', '万荣县', 'sx,yc,wrx', '140822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市万荣县', '0359');
INSERT INTO `t_area` VALUES ('420', '415', '闻喜县', 'sx,yc,wxx', '140823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市闻喜县', '0359');
INSERT INTO `t_area` VALUES ('421', '415', '稷山县', 'sx,yc,jsx', '140824', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市稷山县', '0359');
INSERT INTO `t_area` VALUES ('422', '415', '新绛县', 'sx,yc,xjx', '140825', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市新绛县', '0359');
INSERT INTO `t_area` VALUES ('423', '415', '绛县', 'sx,yc,jx', '140826', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市绛县', '0359');
INSERT INTO `t_area` VALUES ('424', '415', '垣曲县', 'sx,yc,yqx', '140827', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市垣曲县', '0359');
INSERT INTO `t_area` VALUES ('425', '415', '夏县', 'sx,yc,xx', '140828', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市夏县', '0359');
INSERT INTO `t_area` VALUES ('426', '415', '平陆县', 'sx,yc,plx', '140829', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市平陆县', '0359');
INSERT INTO `t_area` VALUES ('427', '415', '芮城县', 'sx,yc,rcx', '140830', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市芮城县', '0359');
INSERT INTO `t_area` VALUES ('428', '415', '永济市', 'sx,yc,yj', '140881', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市永济市', '0359');
INSERT INTO `t_area` VALUES ('429', '415', '河津市', 'sx,yc,hj', '140882', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省运城市河津市', '0359');
INSERT INTO `t_area` VALUES ('430', '338', '忻州市', 'sx,xz', '140900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市', '0350');
INSERT INTO `t_area` VALUES ('431', '430', '市辖区', 'sx,xz,sxq', '140901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市市辖区', '0350');
INSERT INTO `t_area` VALUES ('432', '430', '忻府区', 'sx,xz,xfq', '140902', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市忻府区', '0350');
INSERT INTO `t_area` VALUES ('433', '430', '定襄县', 'sx,xz,dxx', '140921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市定襄县', '0350');
INSERT INTO `t_area` VALUES ('434', '430', '五台县', 'sx,xz,wtx', '140922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市五台县', '0350');
INSERT INTO `t_area` VALUES ('435', '430', '代县', 'sx,xz,dx', '140923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市代县', '0350');
INSERT INTO `t_area` VALUES ('436', '430', '繁峙县', 'sx,xz,fzx', '140924', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市繁峙县', '0350');
INSERT INTO `t_area` VALUES ('437', '430', '宁武县', 'sx,xz,nwx', '140925', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市宁武县', '0350');
INSERT INTO `t_area` VALUES ('438', '430', '静乐县', 'sx,xz,jlx', '140926', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市静乐县', '0350');
INSERT INTO `t_area` VALUES ('439', '430', '神池县', 'sx,xz,scx', '140927', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市神池县', '0350');
INSERT INTO `t_area` VALUES ('440', '430', '五寨县', 'sx,xz,wzx', '140928', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市五寨县', '0350');
INSERT INTO `t_area` VALUES ('441', '430', '岢岚县', 'sx,xz,klx', '140929', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市岢岚县', '0350');
INSERT INTO `t_area` VALUES ('442', '430', '河曲县', 'sx,xz,hqx', '140930', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市河曲县', '0350');
INSERT INTO `t_area` VALUES ('443', '430', '保德县', 'sx,xz,bdx', '140931', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市保德县', '0350');
INSERT INTO `t_area` VALUES ('444', '430', '偏关县', 'sx,xz,pgx', '140932', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市偏关县', '0350');
INSERT INTO `t_area` VALUES ('445', '430', '原平市', 'sx,xz,yp', '140981', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省忻州市原平市', '0350');
INSERT INTO `t_area` VALUES ('446', '338', '临汾市', 'sx,lf', '141000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市', '0357');
INSERT INTO `t_area` VALUES ('447', '446', '市辖区', 'sx,lf,sxq', '141001', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市市辖区', '0357');
INSERT INTO `t_area` VALUES ('448', '446', '尧都区', 'sx,lf,ydq', '141002', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市尧都区', '0357');
INSERT INTO `t_area` VALUES ('449', '446', '曲沃县', 'sx,lf,qwx', '141021', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市曲沃县', '0357');
INSERT INTO `t_area` VALUES ('450', '446', '翼城县', 'sx,lf,ycx', '141022', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市翼城县', '0357');
INSERT INTO `t_area` VALUES ('4502', '2391', '松山湖', 'gd,dg,ssh', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市松山湖', '769');
INSERT INTO `t_area` VALUES ('4503', '2391', '寮步镇', 'gd,dg,lbz', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市寮步镇', '769');
INSERT INTO `t_area` VALUES ('451', '446', '襄汾县', 'sx,lf,xfx', '141023', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市襄汾县', '0357');
INSERT INTO `t_area` VALUES ('4510', '2277', '光明新区', 'gd,sz,gmxq', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省深圳市光明新区', '0755');
INSERT INTO `t_area` VALUES ('4511', '2277', '坪山新区', 'gd,sz,psxq', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省深圳市坪山新区', '0755');
INSERT INTO `t_area` VALUES ('4512', '2277', '龙华新区', 'gd,sz,lhxq', '440311', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省深圳市龙华新区', '0755');
INSERT INTO `t_area` VALUES ('452', '446', '洪洞县', 'sx,lf,hdx', '141024', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市洪洞县', '0357');
INSERT INTO `t_area` VALUES ('453', '446', '古县', 'sx,lf,gx', '141025', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市古县', '0357');
INSERT INTO `t_area` VALUES ('454', '446', '安泽县', 'sx,lf,azx', '141026', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市安泽县', '0357');
INSERT INTO `t_area` VALUES ('455', '446', '浮山县', 'sx,lf,fsx', '141027', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市浮山县', '0357');
INSERT INTO `t_area` VALUES ('456', '446', '吉县', 'sx,lf,jx', '141028', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市吉县', '0357');
INSERT INTO `t_area` VALUES ('457', '446', '乡宁县', 'sx,lf,xnx', '141029', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市乡宁县', '0357');
INSERT INTO `t_area` VALUES ('458', '446', '大宁县', 'sx,lf,dnx', '141030', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市大宁县', '0357');
INSERT INTO `t_area` VALUES ('459', '446', '隰县', 'sx,lf,xx', '141031', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市隰县', '0357');
INSERT INTO `t_area` VALUES ('460', '446', '永和县', 'sx,lf,yhx', '141032', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市永和县', '0357');
INSERT INTO `t_area` VALUES ('4604', '2391', '樟木头', 'gd,dg,zmt', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市樟木头', '769');
INSERT INTO `t_area` VALUES ('4605', '2391', '横沥', 'gd,dg,hl', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市横沥', '769');
INSERT INTO `t_area` VALUES ('4606', '2391', '东坑', 'gd,dg,dk', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市东坑', '769');
INSERT INTO `t_area` VALUES ('4607', '2391', '企石', 'gd,dg,qs', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市企石', '769');
INSERT INTO `t_area` VALUES ('4608', '2391', '茶山', 'gd,dg,cs', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市茶山', '769');
INSERT INTO `t_area` VALUES ('4609', '2391', '石排', 'gd,dg,sp', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市石排', '769');
INSERT INTO `t_area` VALUES ('461', '446', '蒲县', 'sx,lf,px', '141033', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市蒲县', '0357');
INSERT INTO `t_area` VALUES ('4610', '2391', '谢岗', 'gd,dg,xg', null, '2017-03-02 13:22:02', '2017-03-02 13:22:02', '广东省东莞市谢岗', '769');
INSERT INTO `t_area` VALUES ('462', '446', '汾西县', 'sx,lf,fxx', '141034', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市汾西县', '0357');
INSERT INTO `t_area` VALUES ('463', '446', '侯马市', 'sx,lf,hm', '141081', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市侯马市', '0357');
INSERT INTO `t_area` VALUES ('464', '446', '霍州市', 'sx,lf,hz', '141082', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省临汾市霍州市', '0357');
INSERT INTO `t_area` VALUES ('465', '338', '吕梁市', 'sx,ll', '141100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市', '0351');
INSERT INTO `t_area` VALUES ('466', '465', '市辖区', 'sx,ll,sxq', '141101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市市辖区', '0351');
INSERT INTO `t_area` VALUES ('467', '465', '离石区', 'sx,ll,lsq', '141102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市离石区', '0358');
INSERT INTO `t_area` VALUES ('468', '465', '文水县', 'sx,ll,wsx', '141121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市文水县', '0351');
INSERT INTO `t_area` VALUES ('469', '465', '交城县', 'sx,ll,jcx', '141122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市交城县', '0351');
INSERT INTO `t_area` VALUES ('470', '465', '兴县', 'sx,ll,xx', '141123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市兴县', '0351');
INSERT INTO `t_area` VALUES ('471', '465', '临县', 'sx,ll,lx', '141124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市临县', '0351');
INSERT INTO `t_area` VALUES ('472', '465', '柳林县', 'sx,ll,llx', '141125', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市柳林县', '0351');
INSERT INTO `t_area` VALUES ('473', '465', '石楼县', 'sx,ll,slx', '141126', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市石楼县', '0351');
INSERT INTO `t_area` VALUES ('474', '465', '岚县', 'sx,ll,lx', '141127', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市岚县', '0351');
INSERT INTO `t_area` VALUES ('475', '465', '方山县', 'sx,ll,fsx', '141128', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市方山县', '0351');
INSERT INTO `t_area` VALUES ('476', '465', '中阳县', 'sx,ll,zyx', '141129', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市中阳县', '0351');
INSERT INTO `t_area` VALUES ('477', '465', '交口县', 'sx,ll,jkx', '141130', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市交口县', '0351');
INSERT INTO `t_area` VALUES ('478', '465', '孝义市', 'sx,ll,xy', '141181', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市孝义市', '0351');
INSERT INTO `t_area` VALUES ('479', '465', '汾阳市', 'sx,ll,fy', '141182', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '山西省吕梁市汾阳市', '0351');
INSERT INTO `t_area` VALUES ('480', '100', '内蒙古自治区', 'nmgzzq', '150000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区', '0471');
INSERT INTO `t_area` VALUES ('481', '480', '呼和浩特市', 'nmgzzq,hhht', '150100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市', '0471');
INSERT INTO `t_area` VALUES ('482', '481', '市辖区', 'nmgzzq,hhht,sxq', '150101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市市辖区', '0471');
INSERT INTO `t_area` VALUES ('483', '481', '新城区', 'nmgzzq,hhht,xcq', '150102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市新城区', '0471');
INSERT INTO `t_area` VALUES ('484', '481', '回民区', 'nmgzzq,hhht,hmq', '150103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市回民区', '0471');
INSERT INTO `t_area` VALUES ('485', '481', '玉泉区', 'nmgzzq,hhht,yqq', '150104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市玉泉区', '0471');
INSERT INTO `t_area` VALUES ('486', '481', '赛罕区', 'nmgzzq,hhht,shq', '150105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市赛罕区', '0471');
INSERT INTO `t_area` VALUES ('487', '481', '土默特左旗', 'nmgzzq,hhht,tmtzq', '150121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市土默特左旗', '0471');
INSERT INTO `t_area` VALUES ('488', '481', '托克托县', 'nmgzzq,hhht,tktx', '150122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市托克托县', '0471');
INSERT INTO `t_area` VALUES ('489', '481', '和林格尔县', 'nmgzzq,hhht,hlgex', '150123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市和林格尔县', '0471');
INSERT INTO `t_area` VALUES ('490', '481', '清水河县', 'nmgzzq,hhht,qshx', '150124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市清水河县', '0471');
INSERT INTO `t_area` VALUES ('491', '481', '武川县', 'nmgzzq,hhht,wcx', '150125', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼和浩特市武川县', '0471');
INSERT INTO `t_area` VALUES ('492', '480', '包头市', 'nmgzzq,bt', '150200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市', '0472');
INSERT INTO `t_area` VALUES ('493', '492', '市辖区', 'nmgzzq,bt,sxq', '150201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市市辖区', '0472');
INSERT INTO `t_area` VALUES ('494', '492', '东河区', 'nmgzzq,bt,dhq', '150202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市东河区', '0472');
INSERT INTO `t_area` VALUES ('495', '492', '昆都仑区', 'nmgzzq,bt,kdlq', '150203', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市昆都仑区', '0472');
INSERT INTO `t_area` VALUES ('496', '492', '青山区', 'nmgzzq,bt,qsq', '150204', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市青山区', '0472');
INSERT INTO `t_area` VALUES ('497', '492', '石拐区', 'nmgzzq,bt,sgq', '150205', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市石拐区', '0472');
INSERT INTO `t_area` VALUES ('498', '492', '白云矿区', 'nmgzzq,bt,bykq', '150206', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市白云矿区', '0472');
INSERT INTO `t_area` VALUES ('499', '492', '九原区', 'nmgzzq,bt,jyq', '150207', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市九原区', '0472');
INSERT INTO `t_area` VALUES ('500', '492', '土默特右旗', 'nmgzzq,bt,tmtyq', '150221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市土默特右旗', '0472');
INSERT INTO `t_area` VALUES ('501', '492', '固阳县', 'nmgzzq,bt,gyx', '150222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市固阳县', '0472');
INSERT INTO `t_area` VALUES ('502', '492', '达尔罕茂明安联合旗', 'nmgzzq,bt,dehmmalhq', '150223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区包头市达尔罕茂明安联合旗', '0472');
INSERT INTO `t_area` VALUES ('503', '480', '乌海市', 'nmgzzq,wh', '150300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌海市', '0473');
INSERT INTO `t_area` VALUES ('504', '503', '市辖区', 'nmgzzq,wh,sxq', '150301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌海市市辖区', '0473');
INSERT INTO `t_area` VALUES ('505', '503', '海勃湾区', 'nmgzzq,wh,hbwq', '150302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌海市海勃湾区', '0473');
INSERT INTO `t_area` VALUES ('506', '503', '海南区', 'nmgzzq,wh,hnq', '150303', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌海市海南区', '0473');
INSERT INTO `t_area` VALUES ('507', '503', '乌达区', 'nmgzzq,wh,wdq', '150304', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌海市乌达区', '0473');
INSERT INTO `t_area` VALUES ('508', '480', '赤峰市', 'nmgzzq,cf', '150400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市', '0476');
INSERT INTO `t_area` VALUES ('509', '508', '市辖区', 'nmgzzq,cf,sxq', '150401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市市辖区', '0476');
INSERT INTO `t_area` VALUES ('510', '508', '红山区', 'nmgzzq,cf,hsq', '150402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市红山区', '0476');
INSERT INTO `t_area` VALUES ('511', '508', '元宝山区', 'nmgzzq,cf,ybsq', '150403', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市元宝山区', '0476');
INSERT INTO `t_area` VALUES ('512', '508', '松山区', 'nmgzzq,cf,ssq', '150404', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市松山区', '0476');
INSERT INTO `t_area` VALUES ('513', '508', '阿鲁科尔沁旗', 'nmgzzq,cf,alkeqq', '150421', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市阿鲁科尔沁旗', '0476');
INSERT INTO `t_area` VALUES ('514', '508', '巴林左旗', 'nmgzzq,cf,blzq', '150422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市巴林左旗', '0476');
INSERT INTO `t_area` VALUES ('5143', '123', '保税区', 'tj,sxq,bsq', '120226', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '天津市市辖区保税区', '022');
INSERT INTO `t_area` VALUES ('515', '508', '巴林右旗', 'nmgzzq,cf,blyq', '150423', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市巴林右旗', '0476');
INSERT INTO `t_area` VALUES ('516', '508', '林西县', 'nmgzzq,cf,lxx', '150424', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市林西县', '0476');
INSERT INTO `t_area` VALUES ('517', '508', '克什克腾旗', 'nmgzzq,cf,ksktq', '150425', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市克什克腾旗', '0476');
INSERT INTO `t_area` VALUES ('518', '508', '翁牛特旗', 'nmgzzq,cf,wntq', '150426', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市翁牛特旗', '0476');
INSERT INTO `t_area` VALUES ('519', '508', '喀喇沁旗', 'nmgzzq,cf,klqq', '150428', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市喀喇沁旗', '0476');
INSERT INTO `t_area` VALUES ('520', '508', '宁城县', 'nmgzzq,cf,ncx', '150429', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市宁城县', '0476');
INSERT INTO `t_area` VALUES ('521', '508', '敖汉旗', 'nmgzzq,cf,ahq', '150430', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区赤峰市敖汉旗', '0476');
INSERT INTO `t_area` VALUES ('522', '480', '通辽市', 'nmgzzq,tl', '150500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区通辽市', '0475');
INSERT INTO `t_area` VALUES ('523', '522', '市辖区', 'nmgzzq,tl,sxq', '150501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区通辽市市辖区', '0475');
INSERT INTO `t_area` VALUES ('524', '522', '科尔沁区', 'nmgzzq,tl,keqq', '150502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区通辽市科尔沁区', '0475');
INSERT INTO `t_area` VALUES ('525', '522', '科尔沁左翼中旗', 'nmgzzq,tl,keqzyzq', '150521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区通辽市科尔沁左翼中旗', '0475');
INSERT INTO `t_area` VALUES ('526', '522', '科尔沁左翼后旗', 'nmgzzq,tl,keqzyhq', '150522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区通辽市科尔沁左翼后旗', '0475');
INSERT INTO `t_area` VALUES ('527', '522', '开鲁县', 'nmgzzq,tl,klx', '150523', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区通辽市开鲁县', '0475');
INSERT INTO `t_area` VALUES ('528', '522', '库伦旗', 'nmgzzq,tl,klq', '150524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区通辽市库伦旗', '0475');
INSERT INTO `t_area` VALUES ('529', '522', '奈曼旗', 'nmgzzq,tl,nmq', '150525', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区通辽市奈曼旗', '0475');
INSERT INTO `t_area` VALUES ('530', '522', '扎鲁特旗', 'nmgzzq,tl,zltq', '150526', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区通辽市扎鲁特旗', '0475');
INSERT INTO `t_area` VALUES ('531', '522', '霍林郭勒市', 'nmgzzq,tl,hlgl', '150581', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区通辽市霍林郭勒市', '0475');
INSERT INTO `t_area` VALUES ('532', '480', '鄂尔多斯市', 'nmgzzq,eeds', '150600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区鄂尔多斯市', '0471');
INSERT INTO `t_area` VALUES ('533', '532', '市辖区(**)', 'nmgzzq,eeds,sxq(**)', '150601', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区鄂尔多斯市市辖区(**)', '0471');
INSERT INTO `t_area` VALUES ('534', '532', '  东胜区', 'nmgzzq,eeds,dsq', '150602', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区鄂尔多斯市  东胜区', '0477');
INSERT INTO `t_area` VALUES ('535', '532', '达拉特旗', 'nmgzzq,eeds,dltq', '150621', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区鄂尔多斯市达拉特旗', '0471');
INSERT INTO `t_area` VALUES ('536', '532', '准格尔旗', 'nmgzzq,eeds,zgeq', '150622', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区鄂尔多斯市准格尔旗', '0471');
INSERT INTO `t_area` VALUES ('537', '532', '鄂托克前旗', 'nmgzzq,eeds,etkqq', '150623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区鄂尔多斯市鄂托克前旗', '0471');
INSERT INTO `t_area` VALUES ('538', '532', '鄂托克旗', 'nmgzzq,eeds,etkq', '150624', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区鄂尔多斯市鄂托克旗', '0471');
INSERT INTO `t_area` VALUES ('539', '532', '杭锦旗', 'nmgzzq,eeds,hjq', '150625', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区鄂尔多斯市杭锦旗', '0471');
INSERT INTO `t_area` VALUES ('540', '532', '乌审旗', 'nmgzzq,eeds,wsq', '150626', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区鄂尔多斯市乌审旗', '0471');
INSERT INTO `t_area` VALUES ('541', '532', '伊金霍洛旗', 'nmgzzq,eeds,yjhlq', '150627', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区鄂尔多斯市伊金霍洛旗', '0471');
INSERT INTO `t_area` VALUES ('542', '480', '呼伦贝尔市', 'nmgzzq,hlbe', '150700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市', '0471');
INSERT INTO `t_area` VALUES ('543', '542', '市辖区', 'nmgzzq,hlbe,sxq', '150701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市市辖区', '0471');
INSERT INTO `t_area` VALUES ('544', '542', '海拉尔区', 'nmgzzq,hlbe,hleq', '150702', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市海拉尔区', '0470');
INSERT INTO `t_area` VALUES ('545', '542', '阿荣旗', 'nmgzzq,hlbe,arq', '150721', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市阿荣旗', '0471');
INSERT INTO `t_area` VALUES ('546', '542', '莫力达瓦达斡尔族自治旗', 'nmgzzq,hlbe,mldwdwezzzq', '150722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市莫力达瓦达斡尔族自治旗', '0471');
INSERT INTO `t_area` VALUES ('547', '542', '鄂伦春自治旗', 'nmgzzq,hlbe,elczzq', '150723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市鄂伦春自治旗', '0471');
INSERT INTO `t_area` VALUES ('548', '542', '鄂温克族自治旗', 'nmgzzq,hlbe,ewkzzzq', '150724', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市鄂温克族自治旗', '0471');
INSERT INTO `t_area` VALUES ('549', '542', '陈巴尔虎旗', 'nmgzzq,hlbe,cbehq', '150725', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市陈巴尔虎旗', '0471');
INSERT INTO `t_area` VALUES ('550', '542', '新巴尔虎左旗', 'nmgzzq,hlbe,xbehzq', '150726', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市新巴尔虎左旗', '0471');
INSERT INTO `t_area` VALUES ('551', '542', '新巴尔虎右旗', 'nmgzzq,hlbe,xbehyq', '150727', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市新巴尔虎右旗', '0471');
INSERT INTO `t_area` VALUES ('552', '542', '满洲里市', 'nmgzzq,hlbe,mzl', '150781', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市满洲里市', '0471');
INSERT INTO `t_area` VALUES ('553', '542', '牙克石市', 'nmgzzq,hlbe,yks', '150782', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市牙克石市', '0471');
INSERT INTO `t_area` VALUES ('554', '542', '扎兰屯市', 'nmgzzq,hlbe,zlt', '150783', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市扎兰屯市', '0471');
INSERT INTO `t_area` VALUES ('555', '542', '额尔古纳市', 'nmgzzq,hlbe,eegn', '150784', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市额尔古纳市', '0471');
INSERT INTO `t_area` VALUES ('556', '542', '根河市', 'nmgzzq,hlbe,gh', '150785', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区呼伦贝尔市根河市', '0471');
INSERT INTO `t_area` VALUES ('557', '480', '巴彦淖尔市', 'nmgzzq,byne', '150800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区巴彦淖尔市', '0471');
INSERT INTO `t_area` VALUES ('558', '557', '市辖区', 'nmgzzq,byne,sxq', '150801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区巴彦淖尔市市辖区', '0471');
INSERT INTO `t_area` VALUES ('559', '557', '临河区', 'nmgzzq,byne,lhq', '150802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区巴彦淖尔市临河区', '0478');
INSERT INTO `t_area` VALUES ('560', '557', '五原县', 'nmgzzq,byne,wyx', '150821', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区巴彦淖尔市五原县', '0471');
INSERT INTO `t_area` VALUES ('561', '557', '磴口县', 'nmgzzq,byne,dkx', '150822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区巴彦淖尔市磴口县', '0471');
INSERT INTO `t_area` VALUES ('562', '557', '乌拉特前旗', 'nmgzzq,byne,wltqq', '150823', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区巴彦淖尔市乌拉特前旗', '0471');
INSERT INTO `t_area` VALUES ('563', '557', '乌拉特中旗', 'nmgzzq,byne,wltzq', '150824', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区巴彦淖尔市乌拉特中旗', '0471');
INSERT INTO `t_area` VALUES ('564', '557', '乌拉特后旗', 'nmgzzq,byne,wlthq', '150825', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区巴彦淖尔市乌拉特后旗', '0471');
INSERT INTO `t_area` VALUES ('565', '557', '杭锦后旗', 'nmgzzq,byne,hjhq', '150826', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区巴彦淖尔市杭锦后旗', '0471');
INSERT INTO `t_area` VALUES ('566', '480', '乌兰察布市', 'nmgzzq,wlcb', '150900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市', '0471');
INSERT INTO `t_area` VALUES ('567', '566', '市辖区', 'nmgzzq,wlcb,sxq', '150901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市市辖区', '0471');
INSERT INTO `t_area` VALUES ('568', '566', '集宁区', 'nmgzzq,wlcb,jnq', '150902', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市集宁区', '0474');
INSERT INTO `t_area` VALUES ('569', '566', '卓资县', 'nmgzzq,wlcb,zzx', '150921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市卓资县', '0471');
INSERT INTO `t_area` VALUES ('570', '566', '化德县', 'nmgzzq,wlcb,hdx', '150922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市化德县', '0471');
INSERT INTO `t_area` VALUES ('571', '566', '商都县', 'nmgzzq,wlcb,sdx', '150923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市商都县', '0471');
INSERT INTO `t_area` VALUES ('572', '566', '兴和县', 'nmgzzq,wlcb,xhx', '150924', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市兴和县', '0471');
INSERT INTO `t_area` VALUES ('573', '566', '凉城县', 'nmgzzq,wlcb,lcx', '150925', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市凉城县', '0471');
INSERT INTO `t_area` VALUES ('574', '566', '察哈尔右翼前旗', 'nmgzzq,wlcb,cheyyqq', '150926', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市察哈尔右翼前旗', '0471');
INSERT INTO `t_area` VALUES ('575', '566', '察哈尔右翼中旗', 'nmgzzq,wlcb,cheyyzq', '150927', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市察哈尔右翼中旗', '0471');
INSERT INTO `t_area` VALUES ('576', '566', '察哈尔右翼后旗', 'nmgzzq,wlcb,cheyyhq', '150928', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市察哈尔右翼后旗', '0471');
INSERT INTO `t_area` VALUES ('577', '566', '四子王旗', 'nmgzzq,wlcb,szwq', '150929', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市四子王旗', '0471');
INSERT INTO `t_area` VALUES ('578', '566', '丰镇市', 'nmgzzq,wlcb,fz', '150981', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区乌兰察布市丰镇市', '0471');
INSERT INTO `t_area` VALUES ('579', '480', '兴安盟', 'nmgzzq,xam', '152200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区兴安盟', '0471');
INSERT INTO `t_area` VALUES ('580', '579', '乌兰浩特市', 'nmgzzq,xam,wlht', '152201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区兴安盟乌兰浩特市', '0482');
INSERT INTO `t_area` VALUES ('581', '579', '阿尔山市', 'nmgzzq,xam,aes', '152202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区兴安盟阿尔山市', '0471');
INSERT INTO `t_area` VALUES ('582', '579', '科尔沁右翼前旗', 'nmgzzq,xam,keqyyqq', '152221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区兴安盟科尔沁右翼前旗', '0471');
INSERT INTO `t_area` VALUES ('583', '579', '科尔沁右翼中旗', 'nmgzzq,xam,keqyyzq', '152222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区兴安盟科尔沁右翼中旗', '0471');
INSERT INTO `t_area` VALUES ('584', '579', '扎赉特旗', 'nmgzzq,xam,zltq', '152223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区兴安盟扎赉特旗', '0471');
INSERT INTO `t_area` VALUES ('585', '579', '突泉县', 'nmgzzq,xam,tqx', '152224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区兴安盟突泉县', '0471');
INSERT INTO `t_area` VALUES ('586', '480', '锡林郭勒盟', 'nmgzzq,xlglm', '152500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟', '0471');
INSERT INTO `t_area` VALUES ('587', '586', '二连浩特市', 'nmgzzq,xlglm,elht', '152501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟二连浩特市', '0471');
INSERT INTO `t_area` VALUES ('588', '586', '锡林浩特市', 'nmgzzq,xlglm,xlht', '152502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟锡林浩特市', '0479');
INSERT INTO `t_area` VALUES ('589', '586', '阿巴嘎旗', 'nmgzzq,xlglm,abgq', '152522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟阿巴嘎旗', '0471');
INSERT INTO `t_area` VALUES ('590', '586', '苏尼特左旗', 'nmgzzq,xlglm,sntzq', '152523', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟苏尼特左旗', '0471');
INSERT INTO `t_area` VALUES ('591', '586', '苏尼特右旗', 'nmgzzq,xlglm,sntyq', '152524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟苏尼特右旗', '0471');
INSERT INTO `t_area` VALUES ('592', '586', '东乌珠穆沁旗', 'nmgzzq,xlglm,dwzmqq', '152525', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟东乌珠穆沁旗', '0471');
INSERT INTO `t_area` VALUES ('593', '586', '西乌珠穆沁旗', 'nmgzzq,xlglm,xwzmqq', '152526', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟西乌珠穆沁旗', '0471');
INSERT INTO `t_area` VALUES ('594', '586', '太仆寺旗', 'nmgzzq,xlglm,tpsq', '152527', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟太仆寺旗', '0471');
INSERT INTO `t_area` VALUES ('595', '586', '镶黄旗', 'nmgzzq,xlglm,xhq', '152528', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟镶黄旗', '0471');
INSERT INTO `t_area` VALUES ('596', '586', '正镶白旗', 'nmgzzq,xlglm,zxbq', '152529', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟正镶白旗', '0471');
INSERT INTO `t_area` VALUES ('597', '586', '正蓝旗', 'nmgzzq,xlglm,zlq', '152530', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟正蓝旗', '0471');
INSERT INTO `t_area` VALUES ('598', '586', '多伦县', 'nmgzzq,xlglm,dlx', '152531', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区锡林郭勒盟多伦县', '0471');
INSERT INTO `t_area` VALUES ('599', '480', '阿拉善盟', 'nmgzzq,alsm', '152900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区阿拉善盟', '0471');
INSERT INTO `t_area` VALUES ('600', '599', '阿拉善左旗', 'nmgzzq,alsm,alszq', '152921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区阿拉善盟阿拉善左旗', '0483');
INSERT INTO `t_area` VALUES ('601', '599', '阿拉善右旗', 'nmgzzq,alsm,alsyq', '152922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区阿拉善盟阿拉善右旗', '0471');
INSERT INTO `t_area` VALUES ('602', '599', '额济纳旗', 'nmgzzq,alsm,ejnq', '152923', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '内蒙古自治区阿拉善盟额济纳旗', '0471');
INSERT INTO `t_area` VALUES ('603', '100', '辽宁省', 'ln', '210000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省', '024');
INSERT INTO `t_area` VALUES ('604', '603', '沈阳市', 'ln,sy', '210100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市', '024');
INSERT INTO `t_area` VALUES ('605', '604', '市辖区', 'ln,sy,sxq', '210101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市市辖区', '024');
INSERT INTO `t_area` VALUES ('606', '604', '和平区', 'ln,sy,hpq', '210102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市和平区', '024');
INSERT INTO `t_area` VALUES ('607', '604', '沈河区', 'ln,sy,shq', '210103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市沈河区', '024');
INSERT INTO `t_area` VALUES ('608', '604', '大东区', 'ln,sy,ddq', '210104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市大东区', '024');
INSERT INTO `t_area` VALUES ('609', '604', '皇姑区', 'ln,sy,hgq', '210105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市皇姑区', '024');
INSERT INTO `t_area` VALUES ('610', '604', '铁西区', 'ln,sy,txq', '210106', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市铁西区', '024');
INSERT INTO `t_area` VALUES ('611', '604', '苏家屯区', 'ln,sy,sjtq', '210111', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市苏家屯区', '024');
INSERT INTO `t_area` VALUES ('612', '604', '东陵区', 'ln,sy,dlq', '210112', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市东陵区', '024');
INSERT INTO `t_area` VALUES ('613', '604', '沈北新区', 'ln,sy,sbxq', '210113', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市沈北新区', '024');
INSERT INTO `t_area` VALUES ('614', '604', '于洪区', 'ln,sy,yhq', '210114', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市于洪区', '024');
INSERT INTO `t_area` VALUES ('615', '604', '辽中县', 'ln,sy,lzx', '210122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市辽中县', '024');
INSERT INTO `t_area` VALUES ('616', '604', '康平县', 'ln,sy,kpx', '210123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市康平县', '024');
INSERT INTO `t_area` VALUES ('617', '604', '法库县', 'ln,sy,fkx', '210124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市法库县', '024');
INSERT INTO `t_area` VALUES ('618', '604', '新民市', 'ln,sy,xm', '210181', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省沈阳市新民市', '024');
INSERT INTO `t_area` VALUES ('619', '603', '大连市', 'ln,dl', '210200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市', '0411');
INSERT INTO `t_area` VALUES ('620', '619', '市辖区', 'ln,dl,sxq', '210201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市市辖区', '0411');
INSERT INTO `t_area` VALUES ('621', '619', '中山区', 'ln,dl,zsq', '210202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市中山区', '0760');
INSERT INTO `t_area` VALUES ('622', '619', '西岗区', 'ln,dl,xgq', '210203', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市西岗区', '0411');
INSERT INTO `t_area` VALUES ('623', '619', '沙河口区', 'ln,dl,shkq', '210204', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市沙河口区', '0411');
INSERT INTO `t_area` VALUES ('624', '619', '甘井子区', 'ln,dl,gjzq', '210211', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市甘井子区', '0411');
INSERT INTO `t_area` VALUES ('625', '619', '旅顺口区', 'ln,dl,lskq', '210212', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市旅顺口区', '0411');
INSERT INTO `t_area` VALUES ('626', '619', '金州区', 'ln,dl,jzq', '210213', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市金州区', '0411');
INSERT INTO `t_area` VALUES ('627', '619', '长海县', 'ln,dl,chx', '210224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市长海县', '0411');
INSERT INTO `t_area` VALUES ('628', '619', '瓦房店市', 'ln,dl,wfd', '210281', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市瓦房店市', '0411');
INSERT INTO `t_area` VALUES ('629', '619', '普兰店市', 'ln,dl,pld', '210282', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市普兰店市', '0411');
INSERT INTO `t_area` VALUES ('630', '619', '庄河市', 'ln,dl,zh', '210283', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省大连市庄河市', '0411');
INSERT INTO `t_area` VALUES ('631', '603', '鞍山市', 'ln,as', '210300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省鞍山市', '0412');
INSERT INTO `t_area` VALUES ('632', '631', '市辖区', 'ln,as,sxq', '210301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省鞍山市市辖区', '0412');
INSERT INTO `t_area` VALUES ('633', '631', '铁东区', 'ln,as,tdq', '210302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省鞍山市铁东区', '0412');
INSERT INTO `t_area` VALUES ('634', '631', '铁西区', 'ln,as,txq', '210303', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省鞍山市铁西区', '0412');
INSERT INTO `t_area` VALUES ('635', '631', '立山区', 'ln,as,lsq', '210304', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省鞍山市立山区', '0412');
INSERT INTO `t_area` VALUES ('636', '631', '千山区', 'ln,as,qsq', '210311', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省鞍山市千山区', '0412');
INSERT INTO `t_area` VALUES ('637', '631', '台安县', 'ln,as,tax', '210321', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省鞍山市台安县', '0412');
INSERT INTO `t_area` VALUES ('638', '631', '岫岩满族自治县', 'ln,as,xymzzzx', '210323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省鞍山市岫岩满族自治县', '0412');
INSERT INTO `t_area` VALUES ('639', '631', '海城市', 'ln,as,hc', '210381', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省鞍山市海城市', '0412');
INSERT INTO `t_area` VALUES ('640', '603', '抚顺市', 'ln,fs', '210400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省抚顺市', '0413');
INSERT INTO `t_area` VALUES ('641', '640', '市辖区', 'ln,fs,sxq', '210401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省抚顺市市辖区', '0413');
INSERT INTO `t_area` VALUES ('642', '640', '新抚区', 'ln,fs,xfq', '210402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省抚顺市新抚区', '0413');
INSERT INTO `t_area` VALUES ('643', '640', '东洲区', 'ln,fs,dzq', '210403', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省抚顺市东洲区', '0413');
INSERT INTO `t_area` VALUES ('644', '640', '望花区', 'ln,fs,whq', '210404', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省抚顺市望花区', '0413');
INSERT INTO `t_area` VALUES ('645', '640', '顺城区', 'ln,fs,scq', '210411', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省抚顺市顺城区', '0413');
INSERT INTO `t_area` VALUES ('646', '640', '抚顺县', 'ln,fs,fsx', '210421', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省抚顺市抚顺县', '0413');
INSERT INTO `t_area` VALUES ('647', '640', '新宾满族自治县', 'ln,fs,xbmzzzx', '210422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省抚顺市新宾满族自治县', '0413');
INSERT INTO `t_area` VALUES ('648', '640', '清原满族自治县', 'ln,fs,qymzzzx', '210423', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省抚顺市清原满族自治县', '0413');
INSERT INTO `t_area` VALUES ('649', '603', '本溪市', 'ln,bx', '210500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省本溪市', '0414');
INSERT INTO `t_area` VALUES ('650', '649', '市辖区', 'ln,bx,sxq', '210501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省本溪市市辖区', '0414');
INSERT INTO `t_area` VALUES ('651', '649', '平山区', 'ln,bx,psq', '210502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省本溪市平山区', '0414');
INSERT INTO `t_area` VALUES ('652', '649', '溪湖区', 'ln,bx,xhq', '210503', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省本溪市溪湖区', '0414');
INSERT INTO `t_area` VALUES ('653', '649', '明山区', 'ln,bx,msq', '210504', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省本溪市明山区', '0414');
INSERT INTO `t_area` VALUES ('654', '649', '南芬区', 'ln,bx,nfq', '210505', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省本溪市南芬区', '0414');
INSERT INTO `t_area` VALUES ('655', '649', '本溪满族自治县', 'ln,bx,bxmzzzx', '210521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省本溪市本溪满族自治县', '0414');
INSERT INTO `t_area` VALUES ('656', '649', '桓仁满族自治县', 'ln,bx,hrmzzzx', '210522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省本溪市桓仁满族自治县', '0414');
INSERT INTO `t_area` VALUES ('657', '603', '丹东市', 'ln,dd', '210600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省丹东市', '0415');
INSERT INTO `t_area` VALUES ('658', '657', '市辖区', 'ln,dd,sxq', '210601', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省丹东市市辖区', '0415');
INSERT INTO `t_area` VALUES ('659', '657', '元宝区', 'ln,dd,ybq', '210602', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省丹东市元宝区', '0415');
INSERT INTO `t_area` VALUES ('660', '657', '振兴区', 'ln,dd,zxq', '210603', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省丹东市振兴区', '0415');
INSERT INTO `t_area` VALUES ('661', '657', '振安区', 'ln,dd,zaq', '210604', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省丹东市振安区', '0415');
INSERT INTO `t_area` VALUES ('662', '657', '宽甸满族自治县', 'ln,dd,kdmzzzx', '210624', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省丹东市宽甸满族自治县', '0415');
INSERT INTO `t_area` VALUES ('663', '657', '东港市', 'ln,dd,dg', '210681', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省丹东市东港市', '0415');
INSERT INTO `t_area` VALUES ('664', '657', '凤城市', 'ln,dd,fc', '210682', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省丹东市凤城市', '0415');
INSERT INTO `t_area` VALUES ('665', '603', '锦州市', 'ln,jz', '210700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省锦州市', '0416');
INSERT INTO `t_area` VALUES ('666', '665', '市辖区', 'ln,jz,sxq', '210701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省锦州市市辖区', '0416');
INSERT INTO `t_area` VALUES ('667', '665', '古塔区', 'ln,jz,gtq', '210702', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省锦州市古塔区', '0416');
INSERT INTO `t_area` VALUES ('668', '665', '凌河区', 'ln,jz,lhq', '210703', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省锦州市凌河区', '0416');
INSERT INTO `t_area` VALUES ('669', '665', '太和区', 'ln,jz,thq', '210711', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省锦州市太和区', '0416');
INSERT INTO `t_area` VALUES ('670', '665', '黑山县', 'ln,jz,hsx', '210726', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省锦州市黑山县', '0416');
INSERT INTO `t_area` VALUES ('671', '665', '义县', 'ln,jz,yx', '210727', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省锦州市义县', '0416');
INSERT INTO `t_area` VALUES ('672', '665', '凌海市', 'ln,jz,lh', '210781', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省锦州市凌海市', '0416');
INSERT INTO `t_area` VALUES ('673', '665', '北镇市', 'ln,jz,bz', '210782', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省锦州市北镇市', '0416');
INSERT INTO `t_area` VALUES ('674', '603', '营口市', 'ln,yk', '210800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省营口市', '0417');
INSERT INTO `t_area` VALUES ('675', '674', '市辖区', 'ln,yk,sxq', '210801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省营口市市辖区', '0417');
INSERT INTO `t_area` VALUES ('676', '674', '站前区', 'ln,yk,zqq', '210802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省营口市站前区', '0417');
INSERT INTO `t_area` VALUES ('677', '674', '西市区', 'ln,yk,xsq', '210803', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省营口市西市区', '0417');
INSERT INTO `t_area` VALUES ('678', '674', '鲅鱼圈区', 'ln,yk,byqq', '210804', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省营口市鲅鱼圈区', '0417');
INSERT INTO `t_area` VALUES ('679', '674', '老边区', 'ln,yk,lbq', '210811', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省营口市老边区', '0417');
INSERT INTO `t_area` VALUES ('680', '674', '盖州市', 'ln,yk,gz', '210881', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省营口市盖州市', '0417');
INSERT INTO `t_area` VALUES ('681', '674', '大石桥市', 'ln,yk,dsq', '210882', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省营口市大石桥市', '0417');
INSERT INTO `t_area` VALUES ('682', '603', '阜新市', 'ln,fx', '210900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省阜新市', '0418');
INSERT INTO `t_area` VALUES ('683', '682', '市辖区', 'ln,fx,sxq', '210901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省阜新市市辖区', '0418');
INSERT INTO `t_area` VALUES ('684', '682', '海州区', 'ln,fx,hzq', '210902', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省阜新市海州区', '0418');
INSERT INTO `t_area` VALUES ('685', '682', '新邱区', 'ln,fx,xqq', '210903', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省阜新市新邱区', '0418');
INSERT INTO `t_area` VALUES ('686', '682', '太平区', 'ln,fx,tpq', '210904', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省阜新市太平区', '0418');
INSERT INTO `t_area` VALUES ('687', '682', '清河门区', 'ln,fx,qhmq', '210905', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省阜新市清河门区', '0418');
INSERT INTO `t_area` VALUES ('688', '682', '细河区', 'ln,fx,xhq', '210911', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省阜新市细河区', '0418');
INSERT INTO `t_area` VALUES ('689', '682', '阜新蒙古族自治县', 'ln,fx,fxmgzzzx', '210921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省阜新市阜新蒙古族自治县', '0418');
INSERT INTO `t_area` VALUES ('690', '682', '彰武县', 'ln,fx,zwx', '210922', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省阜新市彰武县', '0418');
INSERT INTO `t_area` VALUES ('691', '603', '辽阳市', 'ln,ly', '211000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省辽阳市', '0419');
INSERT INTO `t_area` VALUES ('692', '691', '市辖区', 'ln,ly,sxq', '211001', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省辽阳市市辖区', '0419');
INSERT INTO `t_area` VALUES ('693', '691', '白塔区', 'ln,ly,btq', '211002', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省辽阳市白塔区', '0419');
INSERT INTO `t_area` VALUES ('694', '691', '文圣区', 'ln,ly,wsq', '211003', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省辽阳市文圣区', '0419');
INSERT INTO `t_area` VALUES ('695', '691', '宏伟区', 'ln,ly,hwq', '211004', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省辽阳市宏伟区', '0419');
INSERT INTO `t_area` VALUES ('696', '691', '弓长岭区', 'ln,ly,gclq', '211005', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省辽阳市弓长岭区', '0419');
INSERT INTO `t_area` VALUES ('697', '691', '太子河区', 'ln,ly,tzhq', '211011', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省辽阳市太子河区', '0419');
INSERT INTO `t_area` VALUES ('698', '691', '辽阳县', 'ln,ly,lyx', '211021', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省辽阳市辽阳县', '0419');
INSERT INTO `t_area` VALUES ('699', '691', '灯塔市', 'ln,ly,dt', '211081', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省辽阳市灯塔市', '0419');
INSERT INTO `t_area` VALUES ('700', '603', '盘锦市', 'ln,pj', '211100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省盘锦市', '0427');
INSERT INTO `t_area` VALUES ('701', '700', '市辖区', 'ln,pj,sxq', '211101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省盘锦市市辖区', '0427');
INSERT INTO `t_area` VALUES ('702', '700', '双台子区', 'ln,pj,stzq', '211102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省盘锦市双台子区', '0427');
INSERT INTO `t_area` VALUES ('703', '700', '兴隆台区', 'ln,pj,xltq', '211103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省盘锦市兴隆台区', '0427');
INSERT INTO `t_area` VALUES ('704', '700', '大洼县', 'ln,pj,dwx', '211121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省盘锦市大洼县', '0427');
INSERT INTO `t_area` VALUES ('705', '700', '盘山县', 'ln,pj,psx', '211122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省盘锦市盘山县', '0427');
INSERT INTO `t_area` VALUES ('706', '603', '铁岭市', 'ln,tl', '211200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省铁岭市', '0410');
INSERT INTO `t_area` VALUES ('707', '706', '市辖区', 'ln,tl,sxq', '211201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省铁岭市市辖区', '0410');
INSERT INTO `t_area` VALUES ('708', '706', '银州区', 'ln,tl,yzq', '211202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省铁岭市银州区', '0410');
INSERT INTO `t_area` VALUES ('709', '706', '清河区', 'ln,tl,qhq', '211204', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省铁岭市清河区', '0410');
INSERT INTO `t_area` VALUES ('710', '706', '铁岭县', 'ln,tl,tlx', '211221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省铁岭市铁岭县', '0410');
INSERT INTO `t_area` VALUES ('711', '706', '西丰县', 'ln,tl,xfx', '211223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省铁岭市西丰县', '0410');
INSERT INTO `t_area` VALUES ('712', '706', '昌图县', 'ln,tl,ctx', '211224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省铁岭市昌图县', '0410');
INSERT INTO `t_area` VALUES ('713', '706', '调兵山市', 'ln,tl,dbs', '211281', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省铁岭市调兵山市', '0410');
INSERT INTO `t_area` VALUES ('714', '706', '开原市', 'ln,tl,ky', '211282', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省铁岭市开原市', '0410');
INSERT INTO `t_area` VALUES ('715', '603', '朝阳市', 'ln,cy', '211300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省朝阳市', '0421');
INSERT INTO `t_area` VALUES ('716', '715', '市辖区', 'ln,cy,sxq', '211301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省朝阳市市辖区', '0421');
INSERT INTO `t_area` VALUES ('717', '715', '双塔区', 'ln,cy,stq', '211302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省朝阳市双塔区', '0421');
INSERT INTO `t_area` VALUES ('718', '715', '龙城区', 'ln,cy,lcq', '211303', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省朝阳市龙城区', '0421');
INSERT INTO `t_area` VALUES ('719', '715', '朝阳县', 'ln,cy,cyx', '211321', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省朝阳市朝阳县', '0421');
INSERT INTO `t_area` VALUES ('720', '715', '建平县', 'ln,cy,jpx', '211322', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省朝阳市建平县', '0421');
INSERT INTO `t_area` VALUES ('721', '715', '喀喇沁左翼蒙古族自治县', 'ln,cy,klqzymgzzzx', '211324', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省朝阳市喀喇沁左翼蒙古族自治县', '0421');
INSERT INTO `t_area` VALUES ('722', '715', '北票市', 'ln,cy,bp', '211381', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省朝阳市北票市', '0421');
INSERT INTO `t_area` VALUES ('723', '715', '凌源市', 'ln,cy,ly', '211382', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省朝阳市凌源市', '0421');
INSERT INTO `t_area` VALUES ('724', '603', '葫芦岛市', 'ln,hld', '211400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省葫芦岛市', '0429');
INSERT INTO `t_area` VALUES ('725', '724', '市辖区', 'ln,hld,sxq', '211401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省葫芦岛市市辖区', '0429');
INSERT INTO `t_area` VALUES ('726', '724', '连山区', 'ln,hld,lsq', '211402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省葫芦岛市连山区', '0429');
INSERT INTO `t_area` VALUES ('727', '724', '龙港区', 'ln,hld,lgq', '211403', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省葫芦岛市龙港区', '0429');
INSERT INTO `t_area` VALUES ('728', '724', '南票区', 'ln,hld,npq', '211404', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省葫芦岛市南票区', '0429');
INSERT INTO `t_area` VALUES ('729', '724', '绥中县', 'ln,hld,szx', '211421', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省葫芦岛市绥中县', '0429');
INSERT INTO `t_area` VALUES ('730', '724', '建昌县', 'ln,hld,jcx', '211422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省葫芦岛市建昌县', '0429');
INSERT INTO `t_area` VALUES ('731', '724', '兴城市', 'ln,hld,xc', '211481', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '辽宁省葫芦岛市兴城市', '0429');
INSERT INTO `t_area` VALUES ('732', '100', '吉林省', 'jl', '220000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省', '0432');
INSERT INTO `t_area` VALUES ('733', '732', '长春市', 'jl,cc', '220100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市', '0432');
INSERT INTO `t_area` VALUES ('734', '733', '市辖区', 'jl,cc,sxq', '220101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市市辖区', '0432');
INSERT INTO `t_area` VALUES ('735', '733', '南关区', 'jl,cc,ngq', '220102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市南关区', '0432');
INSERT INTO `t_area` VALUES ('736', '733', '宽城区', 'jl,cc,kcq', '220103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市宽城区', '0432');
INSERT INTO `t_area` VALUES ('737', '733', '朝阳区', 'jl,cc,cyq', '220104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市朝阳区', '0432');
INSERT INTO `t_area` VALUES ('738', '733', '二道区', 'jl,cc,edq', '220105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市二道区', '0432');
INSERT INTO `t_area` VALUES ('739', '733', '绿园区', 'jl,cc,lyq', '220106', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市绿园区', '0432');
INSERT INTO `t_area` VALUES ('740', '733', '双阳区', 'jl,cc,syq', '220112', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市双阳区', '0432');
INSERT INTO `t_area` VALUES ('741', '733', '农安县', 'jl,cc,nax', '220122', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市农安县', '0432');
INSERT INTO `t_area` VALUES ('742', '733', '九台市', 'jl,cc,jt', '220181', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市九台市', '0432');
INSERT INTO `t_area` VALUES ('743', '733', '榆树市', 'jl,cc,ys', '220182', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市榆树市', '0432');
INSERT INTO `t_area` VALUES ('744', '733', '德惠市', 'jl,cc,dh', '220183', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省长春市德惠市', '0432');
INSERT INTO `t_area` VALUES ('745', '732', '吉林市', 'jl,jl', '220200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市', '0432');
INSERT INTO `t_area` VALUES ('746', '745', '市辖区', 'jl,jl,sxq', '220201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市市辖区', '0432');
INSERT INTO `t_area` VALUES ('747', '745', '昌邑区', 'jl,jl,cyq', '220202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市昌邑区', '0432');
INSERT INTO `t_area` VALUES ('748', '745', '龙潭区', 'jl,jl,ltq', '220203', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市龙潭区', '0432');
INSERT INTO `t_area` VALUES ('749', '745', '船营区', 'jl,jl,cyq', '220204', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市船营区', '0432');
INSERT INTO `t_area` VALUES ('750', '745', '丰满区', 'jl,jl,fmq', '220211', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市丰满区', '0432');
INSERT INTO `t_area` VALUES ('751', '745', '永吉县', 'jl,jl,yjx', '220221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市永吉县', '0432');
INSERT INTO `t_area` VALUES ('752', '745', '蛟河市', 'jl,jl,jh', '220281', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市蛟河市', '0432');
INSERT INTO `t_area` VALUES ('753', '745', '桦甸市', 'jl,jl,hd', '220282', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市桦甸市', '0432');
INSERT INTO `t_area` VALUES ('754', '745', '舒兰市', 'jl,jl,sl', '220283', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市舒兰市', '0432');
INSERT INTO `t_area` VALUES ('755', '745', '磐石市', 'jl,jl,ps', '220284', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省吉林市磐石市', '0432');
INSERT INTO `t_area` VALUES ('756', '732', '四平市', 'jl,sp', '220300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省四平市', '0434');
INSERT INTO `t_area` VALUES ('757', '756', '市辖区', 'jl,sp,sxq', '220301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省四平市市辖区', '0434');
INSERT INTO `t_area` VALUES ('758', '756', '铁西区', 'jl,sp,txq', '220302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省四平市铁西区', '0434');
INSERT INTO `t_area` VALUES ('759', '756', '铁东区', 'jl,sp,tdq', '220303', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省四平市铁东区', '0434');
INSERT INTO `t_area` VALUES ('760', '756', '梨树县', 'jl,sp,lsx', '220322', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省四平市梨树县', '0434');
INSERT INTO `t_area` VALUES ('761', '756', '伊通满族自治县', 'jl,sp,ytmzzzx', '220323', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省四平市伊通满族自治县', '0434');
INSERT INTO `t_area` VALUES ('762', '756', '公主岭市', 'jl,sp,gzl', '220381', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省四平市公主岭市', '0434');
INSERT INTO `t_area` VALUES ('763', '756', '双辽市', 'jl,sp,sl', '220382', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省四平市双辽市', '0434');
INSERT INTO `t_area` VALUES ('764', '732', '辽源市', 'jl,ly', '220400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省辽源市', '0437');
INSERT INTO `t_area` VALUES ('765', '764', '市辖区', 'jl,ly,sxq', '220401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省辽源市市辖区', '0437');
INSERT INTO `t_area` VALUES ('766', '764', '龙山区', 'jl,ly,lsq', '220402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省辽源市龙山区', '0437');
INSERT INTO `t_area` VALUES ('767', '764', '西安区', 'jl,ly,xaq', '220403', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省辽源市西安区', '029');
INSERT INTO `t_area` VALUES ('768', '764', '东丰县', 'jl,ly,dfx', '220421', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省辽源市东丰县', '0437');
INSERT INTO `t_area` VALUES ('769', '764', '东辽县', 'jl,ly,dlx', '220422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省辽源市东辽县', '0437');
INSERT INTO `t_area` VALUES ('770', '732', '通化市', 'jl,th', '220500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省通化市', '0435');
INSERT INTO `t_area` VALUES ('771', '770', '市辖区', 'jl,th,sxq', '220501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省通化市市辖区', '0435');
INSERT INTO `t_area` VALUES ('772', '770', '东昌区', 'jl,th,dcq', '220502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省通化市东昌区', '0435');
INSERT INTO `t_area` VALUES ('773', '770', '二道江区', 'jl,th,edjq', '220503', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省通化市二道江区', '0435');
INSERT INTO `t_area` VALUES ('774', '770', '通化县', 'jl,th,thx', '220521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省通化市通化县', '0435');
INSERT INTO `t_area` VALUES ('775', '770', '辉南县', 'jl,th,hnx', '220523', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省通化市辉南县', '0435');
INSERT INTO `t_area` VALUES ('776', '770', '柳河县', 'jl,th,lhx', '220524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省通化市柳河县', '0435');
INSERT INTO `t_area` VALUES ('777', '770', '梅河口市', 'jl,th,mhk', '220581', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省通化市梅河口市', '0435');
INSERT INTO `t_area` VALUES ('778', '770', '集安市', 'jl,th,ja', '220582', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省通化市集安市', '0435');
INSERT INTO `t_area` VALUES ('779', '732', '白山市', 'jl,bs', '220600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白山市', '0439');
INSERT INTO `t_area` VALUES ('780', '779', '市辖区', 'jl,bs,sxq', '220601', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白山市市辖区', '0439');
INSERT INTO `t_area` VALUES ('781', '779', '八道江区', 'jl,bs,bdjq', '220602', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白山市八道江区', '0439');
INSERT INTO `t_area` VALUES ('782', '779', '  江源区(**)', 'jl,bs,jyq(**)', '220605', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白山市  江源区(**)', '0439');
INSERT INTO `t_area` VALUES ('783', '779', '抚松县', 'jl,bs,fsx', '220621', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白山市抚松县', '0439');
INSERT INTO `t_area` VALUES ('784', '779', '靖宇县', 'jl,bs,jyx', '220622', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白山市靖宇县', '0439');
INSERT INTO `t_area` VALUES ('785', '779', '长白朝鲜族自治县', 'jl,bs,cbcxzzzx', '220623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白山市长白朝鲜族自治县', '0439');
INSERT INTO `t_area` VALUES ('786', '779', '临江市', 'jl,bs,lj', '220681', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白山市临江市', '0439');
INSERT INTO `t_area` VALUES ('787', '732', '松原市', 'jl,sy', '220700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省松原市', '0432');
INSERT INTO `t_area` VALUES ('788', '787', '市辖区', 'jl,sy,sxq', '220701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省松原市市辖区', '0432');
INSERT INTO `t_area` VALUES ('789', '787', '宁江区', 'jl,sy,njq', '220702', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省松原市宁江区', '0432');
INSERT INTO `t_area` VALUES ('790', '787', '前郭尔罗斯蒙古族自治县', 'jl,sy,qgelsmgzzzx', '220721', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省松原市前郭尔罗斯蒙古族自治县', '0432');
INSERT INTO `t_area` VALUES ('791', '787', '长岭县', 'jl,sy,clx', '220722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省松原市长岭县', '0432');
INSERT INTO `t_area` VALUES ('792', '787', '乾安县', 'jl,sy,qax', '220723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省松原市乾安县', '0432');
INSERT INTO `t_area` VALUES ('793', '787', '扶余县', 'jl,sy,fyx', '220724', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省松原市扶余县', '0432');
INSERT INTO `t_area` VALUES ('794', '732', '白城市', 'jl,bc', '220800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白城市', '0432');
INSERT INTO `t_area` VALUES ('795', '794', '市辖区', 'jl,bc,sxq', '220801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白城市市辖区', '0432');
INSERT INTO `t_area` VALUES ('796', '794', '洮北区', 'jl,bc,tbq', '220802', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白城市洮北区', '0432');
INSERT INTO `t_area` VALUES ('797', '794', '镇赉县', 'jl,bc,zlx', '220821', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白城市镇赉县', '0432');
INSERT INTO `t_area` VALUES ('798', '794', '通榆县', 'jl,bc,tyx', '220822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白城市通榆县', '0432');
INSERT INTO `t_area` VALUES ('799', '794', '洮南市', 'jl,bc,tn', '220881', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白城市洮南市', '0432');
INSERT INTO `t_area` VALUES ('800', '794', '大安市', 'jl,bc,da', '220882', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省白城市大安市', '0432');
INSERT INTO `t_area` VALUES ('801', '732', '延边朝鲜族自治州', 'jl,ybcxzzzz', '222400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省延边朝鲜族自治州', '0432');
INSERT INTO `t_area` VALUES ('802', '801', '延吉市', 'jl,ybcxzzzz,yj', '222401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省延边朝鲜族自治州延吉市', '0433');
INSERT INTO `t_area` VALUES ('803', '801', '图们市', 'jl,ybcxzzzz,tm', '222402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省延边朝鲜族自治州图们市', '0432');
INSERT INTO `t_area` VALUES ('804', '801', '敦化市', 'jl,ybcxzzzz,dh', '222403', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省延边朝鲜族自治州敦化市', '0432');
INSERT INTO `t_area` VALUES ('805', '801', '珲春市', 'jl,ybcxzzzz,hc', '222404', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省延边朝鲜族自治州珲春市', '0432');
INSERT INTO `t_area` VALUES ('806', '801', '龙井市', 'jl,ybcxzzzz,lj', '222405', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省延边朝鲜族自治州龙井市', '0432');
INSERT INTO `t_area` VALUES ('807', '801', '和龙市', 'jl,ybcxzzzz,hl', '222406', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省延边朝鲜族自治州和龙市', '0432');
INSERT INTO `t_area` VALUES ('808', '801', '汪清县', 'jl,ybcxzzzz,wqx', '222424', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省延边朝鲜族自治州汪清县', '0432');
INSERT INTO `t_area` VALUES ('809', '801', '安图县', 'jl,ybcxzzzz,atx', '222426', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '吉林省延边朝鲜族自治州安图县', '0432');
INSERT INTO `t_area` VALUES ('810', '100', '黑龙江省', 'hlj', '230000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省', '0451');
INSERT INTO `t_area` VALUES ('811', '810', '哈尔滨市', 'hlj,heb', '230100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市', '0451');
INSERT INTO `t_area` VALUES ('812', '811', '市辖区', 'hlj,heb,sxq', '230101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市市辖区', '0451');
INSERT INTO `t_area` VALUES ('813', '811', '道里区', 'hlj,heb,dlq', '230102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市道里区', '0451');
INSERT INTO `t_area` VALUES ('814', '811', '南岗区', 'hlj,heb,ngq', '230103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市南岗区', '0451');
INSERT INTO `t_area` VALUES ('815', '811', '道外区', 'hlj,heb,dwq', '230104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市道外区', '0451');
INSERT INTO `t_area` VALUES ('816', '811', '平房区', 'hlj,heb,pfq', '230108', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市平房区', '0451');
INSERT INTO `t_area` VALUES ('817', '811', '松北区', 'hlj,heb,sbq', '230109', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市松北区', '0451');
INSERT INTO `t_area` VALUES ('818', '811', '香坊区', 'hlj,heb,xfq', '230110', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市香坊区', '0451');
INSERT INTO `t_area` VALUES ('819', '811', '呼兰区', 'hlj,heb,hlq', '230111', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市呼兰区', '0451');
INSERT INTO `t_area` VALUES ('820', '811', '阿城区', 'hlj,heb,acq', '230112', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市阿城区', '0451');
INSERT INTO `t_area` VALUES ('821', '811', '依兰县', 'hlj,heb,ylx', '230123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市依兰县', '0451');
INSERT INTO `t_area` VALUES ('822', '811', '方正县', 'hlj,heb,fzx', '230124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市方正县', '0451');
INSERT INTO `t_area` VALUES ('823', '811', '宾县', 'hlj,heb,bx', '230125', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市宾县', '0451');
INSERT INTO `t_area` VALUES ('824', '811', '巴彦县', 'hlj,heb,byx', '230126', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市巴彦县', '0451');
INSERT INTO `t_area` VALUES ('825', '811', '木兰县', 'hlj,heb,mlx', '230127', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市木兰县', '0451');
INSERT INTO `t_area` VALUES ('826', '811', '通河县', 'hlj,heb,thx', '230128', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市通河县', '0451');
INSERT INTO `t_area` VALUES ('827', '811', '延寿县', 'hlj,heb,ysx', '230129', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市延寿县', '0451');
INSERT INTO `t_area` VALUES ('828', '811', '双城市', 'hlj,heb,sc', '230182', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市双城市', '0451');
INSERT INTO `t_area` VALUES ('829', '811', '尚志市', 'hlj,heb,sz', '230183', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市尚志市', '0451');
INSERT INTO `t_area` VALUES ('830', '811', '五常市', 'hlj,heb,wc', '230184', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省哈尔滨市五常市', '0451');
INSERT INTO `t_area` VALUES ('831', '810', '齐齐哈尔市', 'hlj,qqhe', '230200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市', '0452');
INSERT INTO `t_area` VALUES ('832', '831', '市辖区', 'hlj,qqhe,sxq', '230201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市市辖区', '0452');
INSERT INTO `t_area` VALUES ('833', '831', '龙沙区', 'hlj,qqhe,lsq', '230202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市龙沙区', '0452');
INSERT INTO `t_area` VALUES ('834', '831', '建华区', 'hlj,qqhe,jhq', '230203', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市建华区', '0452');
INSERT INTO `t_area` VALUES ('835', '831', '铁锋区', 'hlj,qqhe,tfq', '230204', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市铁锋区', '0452');
INSERT INTO `t_area` VALUES ('836', '831', '昂昂溪区', 'hlj,qqhe,aaxq', '230205', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市昂昂溪区', '0452');
INSERT INTO `t_area` VALUES ('837', '831', '富拉尔基区', 'hlj,qqhe,flejq', '230206', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市富拉尔基区', '0452');
INSERT INTO `t_area` VALUES ('838', '831', '碾子山区', 'hlj,qqhe,nzsq', '230207', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市碾子山区', '0452');
INSERT INTO `t_area` VALUES ('839', '831', '梅里斯达斡尔族区', 'hlj,qqhe,mlsdwezq', '230208', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市梅里斯达斡尔族区', '0452');
INSERT INTO `t_area` VALUES ('840', '831', '龙江县', 'hlj,qqhe,ljx', '230221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市龙江县', '0452');
INSERT INTO `t_area` VALUES ('841', '831', '依安县', 'hlj,qqhe,yax', '230223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市依安县', '0452');
INSERT INTO `t_area` VALUES ('842', '831', '泰来县', 'hlj,qqhe,tlx', '230224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市泰来县', '0452');
INSERT INTO `t_area` VALUES ('843', '831', '甘南县', 'hlj,qqhe,gnx', '230225', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市甘南县', '0452');
INSERT INTO `t_area` VALUES ('844', '831', '富裕县', 'hlj,qqhe,fyx', '230227', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市富裕县', '0452');
INSERT INTO `t_area` VALUES ('845', '831', '克山县', 'hlj,qqhe,ksx', '230229', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市克山县', '0452');
INSERT INTO `t_area` VALUES ('846', '831', '克东县', 'hlj,qqhe,kdx', '230230', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市克东县', '0452');
INSERT INTO `t_area` VALUES ('847', '831', '拜泉县', 'hlj,qqhe,bqx', '230231', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市拜泉县', '0452');
INSERT INTO `t_area` VALUES ('848', '831', '讷河市', 'hlj,qqhe,nh', '230281', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省齐齐哈尔市讷河市', '0452');
INSERT INTO `t_area` VALUES ('849', '810', '鸡西市', 'hlj,jx', '230300', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市', '0467');
INSERT INTO `t_area` VALUES ('850', '849', '市辖区', 'hlj,jx,sxq', '230301', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市市辖区', '0467');
INSERT INTO `t_area` VALUES ('851', '849', '鸡冠区', 'hlj,jx,jgq', '230302', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市鸡冠区', '0467');
INSERT INTO `t_area` VALUES ('852', '849', '恒山区', 'hlj,jx,hsq', '230303', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市恒山区', '0467');
INSERT INTO `t_area` VALUES ('853', '849', '滴道区', 'hlj,jx,ddq', '230304', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市滴道区', '0467');
INSERT INTO `t_area` VALUES ('854', '849', '梨树区', 'hlj,jx,lsq', '230305', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市梨树区', '0467');
INSERT INTO `t_area` VALUES ('855', '849', '城子河区', 'hlj,jx,czhq', '230306', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市城子河区', '0467');
INSERT INTO `t_area` VALUES ('856', '849', '麻山区', 'hlj,jx,msq', '230307', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市麻山区', '0467');
INSERT INTO `t_area` VALUES ('857', '849', '鸡东县', 'hlj,jx,jdx', '230321', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市鸡东县', '0467');
INSERT INTO `t_area` VALUES ('858', '849', '虎林市', 'hlj,jx,hl', '230381', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市虎林市', '0467');
INSERT INTO `t_area` VALUES ('859', '849', '密山市', 'hlj,jx,ms', '230382', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鸡西市密山市', '0467');
INSERT INTO `t_area` VALUES ('860', '810', '鹤岗市', 'hlj,hg', '230400', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鹤岗市', '0468');
INSERT INTO `t_area` VALUES ('861', '860', '市辖区', 'hlj,hg,sxq', '230401', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鹤岗市市辖区', '0468');
INSERT INTO `t_area` VALUES ('862', '860', '向阳区', 'hlj,hg,xyq', '230402', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鹤岗市向阳区', '0468');
INSERT INTO `t_area` VALUES ('863', '860', '工农区', 'hlj,hg,gnq', '230403', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鹤岗市工农区', '0468');
INSERT INTO `t_area` VALUES ('864', '860', '南山区', 'hlj,hg,nsq', '230404', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鹤岗市南山区', '0468');
INSERT INTO `t_area` VALUES ('865', '860', '兴安区', 'hlj,hg,xaq', '230405', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鹤岗市兴安区', '0468');
INSERT INTO `t_area` VALUES ('866', '860', '东山区', 'hlj,hg,dsq', '230406', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鹤岗市东山区', '0468');
INSERT INTO `t_area` VALUES ('867', '860', '兴山区', 'hlj,hg,xsq', '230407', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鹤岗市兴山区', '0468');
INSERT INTO `t_area` VALUES ('868', '860', '萝北县', 'hlj,hg,lbx', '230421', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鹤岗市萝北县', '0468');
INSERT INTO `t_area` VALUES ('869', '860', '绥滨县', 'hlj,hg,sbx', '230422', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省鹤岗市绥滨县', '0468');
INSERT INTO `t_area` VALUES ('870', '810', '双鸭山市', 'hlj,sys', '230500', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省双鸭山市', '0469');
INSERT INTO `t_area` VALUES ('871', '870', '市辖区', 'hlj,sys,sxq', '230501', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省双鸭山市市辖区', '0469');
INSERT INTO `t_area` VALUES ('872', '870', '尖山区', 'hlj,sys,jsq', '230502', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省双鸭山市尖山区', '0469');
INSERT INTO `t_area` VALUES ('873', '870', '岭东区', 'hlj,sys,ldq', '230503', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省双鸭山市岭东区', '0469');
INSERT INTO `t_area` VALUES ('874', '870', '四方台区', 'hlj,sys,sftq', '230505', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省双鸭山市四方台区', '0469');
INSERT INTO `t_area` VALUES ('875', '870', '宝山区', 'hlj,sys,bsq', '230506', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省双鸭山市宝山区', '0469');
INSERT INTO `t_area` VALUES ('876', '870', '集贤县', 'hlj,sys,jxx', '230521', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省双鸭山市集贤县', '0469');
INSERT INTO `t_area` VALUES ('877', '870', '友谊县', 'hlj,sys,yyx', '230522', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省双鸭山市友谊县', '0469');
INSERT INTO `t_area` VALUES ('878', '870', '宝清县', 'hlj,sys,bqx', '230523', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省双鸭山市宝清县', '0469');
INSERT INTO `t_area` VALUES ('879', '870', '饶河县', 'hlj,sys,rhx', '230524', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省双鸭山市饶河县', '0469');
INSERT INTO `t_area` VALUES ('880', '810', '大庆市', 'hlj,dq', '230600', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市', '0459');
INSERT INTO `t_area` VALUES ('881', '880', '市辖区', 'hlj,dq,sxq', '230601', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市市辖区', '0459');
INSERT INTO `t_area` VALUES ('882', '880', '萨尔图区', 'hlj,dq,setq', '230602', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市萨尔图区', '0459');
INSERT INTO `t_area` VALUES ('883', '880', '龙凤区', 'hlj,dq,lfq', '230603', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市龙凤区', '0459');
INSERT INTO `t_area` VALUES ('884', '880', '让胡路区', 'hlj,dq,rhlq', '230604', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市让胡路区', '0459');
INSERT INTO `t_area` VALUES ('885', '880', '红岗区', 'hlj,dq,hgq', '230605', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市红岗区', '0459');
INSERT INTO `t_area` VALUES ('886', '880', '大同区', 'hlj,dq,dtq', '230606', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市大同区', '0459');
INSERT INTO `t_area` VALUES ('887', '880', '肇州县', 'hlj,dq,zzx', '230621', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市肇州县', '0459');
INSERT INTO `t_area` VALUES ('888', '880', '肇源县', 'hlj,dq,zyx', '230622', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市肇源县', '0459');
INSERT INTO `t_area` VALUES ('889', '880', '林甸县', 'hlj,dq,ldx', '230623', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市林甸县', '0459');
INSERT INTO `t_area` VALUES ('890', '880', '杜尔伯特蒙古族自治县', 'hlj,dq,debtmgzzzx', '230624', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大庆市杜尔伯特蒙古族自治县', '0459');
INSERT INTO `t_area` VALUES ('891', '810', '伊春市', 'hlj,yc', '230700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市', '0458');
INSERT INTO `t_area` VALUES ('892', '891', '市辖区', 'hlj,yc,sxq', '230701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市市辖区', '0458');
INSERT INTO `t_area` VALUES ('893', '891', '伊春区', 'hlj,yc,ycq', '230702', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市伊春区', '0458');
INSERT INTO `t_area` VALUES ('894', '891', '南岔区', 'hlj,yc,ncq', '230703', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市南岔区', '0458');
INSERT INTO `t_area` VALUES ('895', '891', '友好区', 'hlj,yc,yhq', '230704', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市友好区', '0458');
INSERT INTO `t_area` VALUES ('896', '891', '西林区', 'hlj,yc,xlq', '230705', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市西林区', '0458');
INSERT INTO `t_area` VALUES ('897', '891', '翠峦区', 'hlj,yc,clq', '230706', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市翠峦区', '0458');
INSERT INTO `t_area` VALUES ('898', '891', '新青区', 'hlj,yc,xqq', '230707', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市新青区', '0458');
INSERT INTO `t_area` VALUES ('899', '891', '美溪区', 'hlj,yc,mxq', '230708', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市美溪区', '0458');
INSERT INTO `t_area` VALUES ('900', '891', '金山屯区', 'hlj,yc,jstq', '230709', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市金山屯区', '0458');
INSERT INTO `t_area` VALUES ('901', '891', '五营区', 'hlj,yc,wyq', '230710', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市五营区', '0458');
INSERT INTO `t_area` VALUES ('902', '891', '乌马河区', 'hlj,yc,wmhq', '230711', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市乌马河区', '0458');
INSERT INTO `t_area` VALUES ('903', '891', '汤旺河区', 'hlj,yc,twhq', '230712', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市汤旺河区', '0458');
INSERT INTO `t_area` VALUES ('904', '891', '带岭区', 'hlj,yc,dlq', '230713', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市带岭区', '0458');
INSERT INTO `t_area` VALUES ('905', '891', '乌伊岭区', 'hlj,yc,wylq', '230714', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市乌伊岭区', '0458');
INSERT INTO `t_area` VALUES ('906', '891', '红星区', 'hlj,yc,hxq', '230715', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市红星区', '0458');
INSERT INTO `t_area` VALUES ('907', '891', '上甘岭区', 'hlj,yc,sglq', '230716', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市上甘岭区', '0458');
INSERT INTO `t_area` VALUES ('908', '891', '嘉荫县', 'hlj,yc,jyx', '230722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市嘉荫县', '0458');
INSERT INTO `t_area` VALUES ('909', '891', '铁力市', 'hlj,yc,tl', '230781', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省伊春市铁力市', '0458');
INSERT INTO `t_area` VALUES ('910', '810', '佳木斯市', 'hlj,jms', '230800', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市', '0454');
INSERT INTO `t_area` VALUES ('911', '910', '市辖区', 'hlj,jms,sxq', '230801', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市市辖区', '0454');
INSERT INTO `t_area` VALUES ('912', '910', '向阳区', 'hlj,jms,xyq', '230803', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市向阳区', '0454');
INSERT INTO `t_area` VALUES ('913', '910', '前进区', 'hlj,jms,qjq', '230804', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市前进区', '0454');
INSERT INTO `t_area` VALUES ('914', '910', '东风区', 'hlj,jms,dfq', '230805', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市东风区', '0454');
INSERT INTO `t_area` VALUES ('915', '910', '郊区', 'hlj,jms,jq', '230811', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市郊区', '0454');
INSERT INTO `t_area` VALUES ('916', '910', '桦南县', 'hlj,jms,hnx', '230822', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市桦南县', '0454');
INSERT INTO `t_area` VALUES ('917', '910', '桦川县', 'hlj,jms,hcx', '230826', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市桦川县', '0454');
INSERT INTO `t_area` VALUES ('918', '910', '汤原县', 'hlj,jms,tyx', '230828', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市汤原县', '0454');
INSERT INTO `t_area` VALUES ('919', '910', '抚远县', 'hlj,jms,fyx', '230833', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市抚远县', '0454');
INSERT INTO `t_area` VALUES ('920', '910', '同江市', 'hlj,jms,tj', '230881', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市同江市', '0454');
INSERT INTO `t_area` VALUES ('921', '910', '富锦市', 'hlj,jms,fj', '230882', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省佳木斯市富锦市', '0454');
INSERT INTO `t_area` VALUES ('922', '810', '七台河市', 'hlj,qth', '230900', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省七台河市', '0464');
INSERT INTO `t_area` VALUES ('923', '922', '市辖区', 'hlj,qth,sxq', '230901', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省七台河市市辖区', '0464');
INSERT INTO `t_area` VALUES ('924', '922', '新兴区', 'hlj,qth,xxq', '230902', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省七台河市新兴区', '0464');
INSERT INTO `t_area` VALUES ('925', '922', '桃山区', 'hlj,qth,tsq', '230903', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省七台河市桃山区', '0464');
INSERT INTO `t_area` VALUES ('926', '922', '茄子河区', 'hlj,qth,qzhq', '230904', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省七台河市茄子河区', '0464');
INSERT INTO `t_area` VALUES ('927', '922', '勃利县', 'hlj,qth,blx', '230921', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省七台河市勃利县', '0464');
INSERT INTO `t_area` VALUES ('928', '810', '牡丹江市', 'hlj,mdj', '231000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市', '0453');
INSERT INTO `t_area` VALUES ('929', '928', '市辖区', 'hlj,mdj,sxq', '231001', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市市辖区', '0453');
INSERT INTO `t_area` VALUES ('930', '928', '东安区', 'hlj,mdj,daq', '231002', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市东安区', '0453');
INSERT INTO `t_area` VALUES ('931', '928', '阳明区', 'hlj,mdj,ymq', '231003', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市阳明区', '0453');
INSERT INTO `t_area` VALUES ('932', '928', '爱民区', 'hlj,mdj,amq', '231004', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市爱民区', '0453');
INSERT INTO `t_area` VALUES ('933', '928', '西安区', 'hlj,mdj,xaq', '231005', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市西安区', '029');
INSERT INTO `t_area` VALUES ('934', '928', '东宁县', 'hlj,mdj,dnx', '231024', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市东宁县', '0453');
INSERT INTO `t_area` VALUES ('935', '928', '林口县', 'hlj,mdj,lkx', '231025', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市林口县', '0453');
INSERT INTO `t_area` VALUES ('936', '928', '绥芬河市', 'hlj,mdj,sfh', '231081', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市绥芬河市', '0453');
INSERT INTO `t_area` VALUES ('937', '928', '海林市', 'hlj,mdj,hl', '231083', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市海林市', '0453');
INSERT INTO `t_area` VALUES ('938', '928', '宁安市', 'hlj,mdj,na', '231084', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市宁安市', '0453');
INSERT INTO `t_area` VALUES ('939', '928', '穆棱市', 'hlj,mdj,ml', '231085', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省牡丹江市穆棱市', '0453');
INSERT INTO `t_area` VALUES ('940', '810', '黑河市', 'hlj,hh', '231100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省黑河市', '0456');
INSERT INTO `t_area` VALUES ('941', '940', '市辖区', 'hlj,hh,sxq', '231101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省黑河市市辖区', '0456');
INSERT INTO `t_area` VALUES ('942', '940', '爱辉区', 'hlj,hh,ahq', '231102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省黑河市爱辉区', '0456');
INSERT INTO `t_area` VALUES ('943', '940', '嫩江县', 'hlj,hh,njx', '231121', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省黑河市嫩江县', '0456');
INSERT INTO `t_area` VALUES ('944', '940', '逊克县', 'hlj,hh,xkx', '231123', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省黑河市逊克县', '0456');
INSERT INTO `t_area` VALUES ('945', '940', '孙吴县', 'hlj,hh,swx', '231124', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省黑河市孙吴县', '0456');
INSERT INTO `t_area` VALUES ('946', '940', '北安市', 'hlj,hh,ba', '231181', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省黑河市北安市', '0456');
INSERT INTO `t_area` VALUES ('947', '940', '五大连池市', 'hlj,hh,wdlc', '231182', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省黑河市五大连池市', '0456');
INSERT INTO `t_area` VALUES ('948', '810', '绥化市', 'hlj,sh', '231200', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市', '0455');
INSERT INTO `t_area` VALUES ('949', '948', '市辖区', 'hlj,sh,sxq', '231201', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市市辖区', '0455');
INSERT INTO `t_area` VALUES ('950', '948', '北林区', 'hlj,sh,blq', '231202', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市北林区', '0455');
INSERT INTO `t_area` VALUES ('951', '948', '望奎县', 'hlj,sh,wkx', '231221', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市望奎县', '0455');
INSERT INTO `t_area` VALUES ('952', '948', '兰西县', 'hlj,sh,lxx', '231222', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市兰西县', '0455');
INSERT INTO `t_area` VALUES ('953', '948', '青冈县', 'hlj,sh,qgx', '231223', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市青冈县', '0455');
INSERT INTO `t_area` VALUES ('954', '948', '庆安县', 'hlj,sh,qax', '231224', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市庆安县', '0455');
INSERT INTO `t_area` VALUES ('955', '948', '明水县', 'hlj,sh,msx', '231225', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市明水县', '0455');
INSERT INTO `t_area` VALUES ('956', '948', '绥棱县', 'hlj,sh,slx', '231226', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市绥棱县', '0455');
INSERT INTO `t_area` VALUES ('957', '948', '安达市', 'hlj,sh,ad', '231281', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市安达市', '0455');
INSERT INTO `t_area` VALUES ('958', '948', '肇东市', 'hlj,sh,zd', '231282', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市肇东市', '0455');
INSERT INTO `t_area` VALUES ('959', '948', '海伦市', 'hlj,sh,hl', '231283', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省绥化市海伦市', '0455');
INSERT INTO `t_area` VALUES ('960', '810', '大兴安岭地区', 'hlj,dxaldq', '232700', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大兴安岭地区', '0451');
INSERT INTO `t_area` VALUES ('961', '960', '加格达奇区', 'hlj,dxaldq,jgdqq', '232701', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大兴安岭地区加格达奇区', '0457');
INSERT INTO `t_area` VALUES ('962', '960', '松岭区', 'hlj,dxaldq,slq', '232702', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大兴安岭地区松岭区', '0451');
INSERT INTO `t_area` VALUES ('963', '960', '新林区', 'hlj,dxaldq,xlq', '232703', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大兴安岭地区新林区', '0451');
INSERT INTO `t_area` VALUES ('964', '960', '呼中区', 'hlj,dxaldq,hzq', '232704', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大兴安岭地区呼中区', '0451');
INSERT INTO `t_area` VALUES ('965', '960', '呼玛县', 'hlj,dxaldq,hmx', '232721', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大兴安岭地区呼玛县', '0451');
INSERT INTO `t_area` VALUES ('966', '960', '塔河县', 'hlj,dxaldq,thx', '232722', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大兴安岭地区塔河县', '0451');
INSERT INTO `t_area` VALUES ('967', '960', '漠河县', 'hlj,dxaldq,mhx', '232723', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '黑龙江省大兴安岭地区漠河县', '0451');
INSERT INTO `t_area` VALUES ('968', '969', '上海市', 'shs', '310000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市', '021');
INSERT INTO `t_area` VALUES ('969', '100', '上海', 'sh', '310100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海', '021');
INSERT INTO `t_area` VALUES ('970', '968', '黄浦区', 'sh,sxq,hpq', '310101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区黄浦区', '021');
INSERT INTO `t_area` VALUES ('971', '968', '卢湾区', 'sh,sxq,lwq', '310103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区卢湾区', '021');
INSERT INTO `t_area` VALUES ('972', '968', '徐汇区', 'sh,sxq,xhq', '310104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区徐汇区', '021');
INSERT INTO `t_area` VALUES ('973', '968', '长宁区', 'sh,sxq,cnq', '310105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区长宁区', '021');
INSERT INTO `t_area` VALUES ('974', '968', '静安区', 'sh,sxq,jaq', '310106', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区静安区', '021');
INSERT INTO `t_area` VALUES ('975', '968', '普陀区', 'sh,sxq,ptq', '310107', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区普陀区', '021');
INSERT INTO `t_area` VALUES ('976', '968', '闸北区', 'sh,sxq,zbq', '310108', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区闸北区', '021');
INSERT INTO `t_area` VALUES ('977', '968', '虹口区', 'sh,sxq,hkq', '310109', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区虹口区', '021');
INSERT INTO `t_area` VALUES ('978', '968', '杨浦区', 'sh,sxq,ypq', '310110', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区杨浦区', '021');
INSERT INTO `t_area` VALUES ('979', '968', '闵行区', 'sh,sxq,mxq', '310112', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区闵行区', '021');
INSERT INTO `t_area` VALUES ('980', '968', '宝山区', 'sh,sxq,bsq', '310113', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区宝山区', '021');
INSERT INTO `t_area` VALUES ('981', '968', '嘉定区', 'sh,sxq,jdq', '310114', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区嘉定区', '021');
INSERT INTO `t_area` VALUES ('982', '968', '浦东新区', 'sh,sxq,pdxq', '310115', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区浦东新区', '021');
INSERT INTO `t_area` VALUES ('983', '968', '金山区', 'sh,sxq,jsq', '310116', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区金山区', '021');
INSERT INTO `t_area` VALUES ('984', '968', '松江区', 'sh,sxq,sjq', '310117', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区松江区', '021');
INSERT INTO `t_area` VALUES ('985', '968', '青浦区', 'sh,sxq,qpq', '310118', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区青浦区', '021');
INSERT INTO `t_area` VALUES ('986', '968', '南汇区', 'sh,sxq,nhq', '310119', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区南汇区', '021');
INSERT INTO `t_area` VALUES ('987', '968', '奉贤区', 'sh,sxq,fxq', '310120', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市市辖区奉贤区', '021');
INSERT INTO `t_area` VALUES ('989', '968', '崇明县', 'shs,cmx', '310230', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '上海市崇明县', '021');
INSERT INTO `t_area` VALUES ('990', '100', '江苏省', 'js', '320000', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '江苏省', '0516');
INSERT INTO `t_area` VALUES ('991', '990', '南京市', 'js,nj', '320100', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '江苏省南京市', '025');
INSERT INTO `t_area` VALUES ('992', '991', '市辖区', 'js,nj,sxq', '320101', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '江苏省南京市市辖区', '025');
INSERT INTO `t_area` VALUES ('993', '991', '玄武区', 'js,nj,xwq', '320102', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '江苏省南京市玄武区', '025');
INSERT INTO `t_area` VALUES ('994', '991', '白下区', 'js,nj,bxq', '320103', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '江苏省南京市白下区', '025');
INSERT INTO `t_area` VALUES ('995', '991', '秦淮区', 'js,nj,qhq', '320104', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '江苏省南京市秦淮区', '025');
INSERT INTO `t_area` VALUES ('996', '991', '建邺区', 'js,nj,jyq', '320105', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '江苏省南京市建邺区', '025');
INSERT INTO `t_area` VALUES ('997', '991', '鼓楼区', 'js,nj,glq', '320106', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '江苏省南京市鼓楼区', '025');
INSERT INTO `t_area` VALUES ('998', '991', '下关区', 'js,nj,xgq', '320107', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '江苏省南京市下关区', '025');
INSERT INTO `t_area` VALUES ('999', '991', '浦口区', 'js,nj,pkq', '320111', '2017-03-02 13:22:02', '2017-03-02 13:22:02', '江苏省南京市浦口区', '025');

-- ----------------------------
-- Table structure for t_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_bill`;
CREATE TABLE `t_bill` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `amount` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `factory_Id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sys_user_Id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_bill
-- ----------------------------
INSERT INTO `t_bill` VALUES ('4028ad815af97c3d015afa0408100006', '388', '2017-03-23 15:14:12', '2017-03-23 15:14:46', '4028ad815a9d2eaf015a9d51f20b003a', '2017-03-23 15:14:12 倬利管理员申请结算388.0元\n2017-03-23 15:14:46 admin确认已付款，详情：塔顶fad塔顶fad塔顶fad塔顶fad塔顶fad', '2', '1');
INSERT INTO `t_bill` VALUES ('4028ad815af97c3d015afa0779040007', '388', '2017-03-23 15:17:58', '2017-03-23 15:21:47', '4028ad815a9d2eaf015a9d3c8eb2000d', '2017-03-23 15:17:58 倬利管理员申请结算388.0元\n2017-03-23 15:21:47 admin确认已付款，详情：收付款备注信息内容收付款备注信息内容收付款备注信息内容', '2', '1');

-- ----------------------------
-- Table structure for t_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_bill_detail`;
CREATE TABLE `t_bill_detail` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `price_pay` double DEFAULT NULL COMMENT '金额，正数代表公司收款，负数代表付款',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `factory_Id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注说明',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（结算，未结算）',
  `bill_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `book_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `bookform_detail_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_bill_detail
-- ----------------------------
INSERT INTO `t_bill_detail` VALUES ('4028ad815a9d2eaf015a9d44c6530027', '0', '2017-03-05 15:00:14', '2017-03-23 15:21:47', '4028ad815a9d2eaf015a9d3c8eb2000d', '订单：201703059680243562 || 交易金额：￥1290.0元 || 付款类型：在线付款 || 门店应付平台：￥0.0元', '1', '4028ad815af97c3d015afa0779040007', '4028ad815a9d2eaf015a9d3e7c8f0011', null);
INSERT INTO `t_bill_detail` VALUES ('4028ad815a9d2eaf015a9d49ff5e0032', '388', '2017-03-05 15:05:56', '2017-03-23 15:21:47', '4028ad815a9d2eaf015a9d3c8eb2000d', '订单：201703059750693435 || 交易金额：￥388.0元 || 付款类型：预发货后付款 || 门店应付平台：￥388.0元', '1', '4028ad815af97c3d015afa0779040007', '4028ad815a9d2eaf015a9d493c78002d', null);
INSERT INTO `t_bill_detail` VALUES ('4028ad815a9d2eaf015a9d5451390042', '388', '2017-03-05 15:17:13', '2017-03-23 15:14:46', '4028ad815a9d2eaf015a9d51f20b003a', '订单：201703059817562420 || 交易金额：￥388.0元 || 付款类型：预发货后付款 || 门店应付平台：￥388.0元', '1', '4028ad815af97c3d015afa0408100006', '4028ad815a9d2eaf015a9d53708b003d', null);
INSERT INTO `t_bill_detail` VALUES ('4028ad815af716f8015af75929f60007', '0', '2017-03-23 02:48:20', '2017-03-23 02:48:20', '4028ad815a9c1569015a9c175d410002', '订单：201703076941646086 || 交易金额：￥141.0元 || 付款类型：在线付款 || 门店应付平台：￥0.0元', '0', null, '4028ad815aa71389015aa7885e0e0014', null);

-- ----------------------------
-- Table structure for t_bookform
-- ----------------------------
DROP TABLE IF EXISTS `t_bookform`;
CREATE TABLE `t_bookform` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `factory_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `contact_man` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `contact_province_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `contact_city_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `contact_county_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `contact_addr` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `sales` double DEFAULT NULL,
  `delivery_cost` double DEFAULT NULL COMMENT '运费',
  `pay_type` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '付款类型（在线支付、到店支付、货物预付）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `code` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `contact_tel` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `payment_id` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `cancel_time` datetime DEFAULT NULL,
  `cancel_reason` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `delivery_factory` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tracking_number` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tracking_info` text CHARACTER SET utf8,
  `tracking_status` tinyint(4) DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `confirm_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_status_deliveryTime` (`status`,`delivery_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_bookform
-- ----------------------------
INSERT INTO `t_bookform` VALUES ('4028ad815a9c1569015a9c18b2230006', '4028ad815a9c1569015a9c175d410002', '陈', '2250', '2251', '2255', '昌岗东', '1', '141', '15', '0', '2017-03-05 09:32:28', '2017-03-05 09:32:54', null, '201703057754856734', '13760755956', '4028ad815a9c1569015a9c18f3920009', null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815a9d2eaf015a9d3e7c8f0011', '4028ad815a9d2eaf015a9d3c8eb2000d', '啊开收货', '1236', '1290', '1296', '啊开地址', '4', '1290', '0', '0', '2017-03-05 14:53:22', '2017-03-15 00:00:02', null, '201703059680243562', '15914380611', '4028ad815a9d2eaf015a9d40c3c30016', null, null, '顺丰快递', '123456789001', null, '1', '2017-03-05 15:00:15', null);
INSERT INTO `t_bookform` VALUES ('4028ad815a9d2eaf015a9d493c78002d', '4028ad815a9d2eaf015a9d3c8eb2000d', '二次购买', '2250', '2251', '2257', '啊开地址', '4', '388', '0', '2', '2017-03-05 15:05:06', '2017-03-15 00:00:02', null, '201703059750693435', '15914380611', null, null, null, '天天快递', '123456', null, '1', '2017-03-05 15:05:57', null);
INSERT INTO `t_bookform` VALUES ('4028ad815a9d2eaf015a9d53708b003d', '4028ad815a9d2eaf015a9d51f20b003a', '庞健下单', '2250', '2251', '2257', '天河区', '4', '388', '0', '2', '2017-03-05 15:16:15', '2017-03-15 00:00:02', null, '201703059817562420', '18922378741', null, null, null, '天天快递', '1234999', null, '1', '2017-03-05 15:17:13', null);
INSERT INTO `t_bookform` VALUES ('4028ad815aa71389015aa77555a1000a', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '882', '0', '0', '2017-03-07 14:29:29', '2017-03-07 14:29:29', null, '201703076816911154', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815aa71389015aa779f5ab000d', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '1', '141', '15', '1', '2017-03-07 14:34:32', '2017-03-07 14:34:32', null, '201703076847223296', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815aa71389015aa7885e0e0014', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '4', '141', '15', '0', '2017-03-07 14:50:16', '2017-04-07 00:00:01', null, '201703076941646086', '13760755956', '4028ad815aabc185015aabe51e5f0005', null, null, '顺丰快递', '123456231', null, '2', '2017-03-23 02:48:20', null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b00f727b80004', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '128', '2', '0', '2017-03-24 23:37:29', '2017-03-24 23:37:29', null, '201703246984926562', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b00ff542a0006', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '128', '2', '0', '2017-03-24 23:46:24', '2017-03-24 23:46:24', null, '201703247038493218', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b00ff69f00008', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '128', '2', '0', '2017-03-24 23:46:30', '2017-03-24 23:46:30', null, '201703247039051011', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b01012e87000a', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '128', '2', '0', '2017-03-24 23:48:26', '2017-03-24 23:48:26', null, '20170324705063733', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b010b4311000c', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '128', '2', '0', '2017-03-24 23:59:26', '2017-03-24 23:59:26', null, '201703247116698982', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b01102004000f', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '128', '2', '0', '2017-03-25 00:04:45', '2017-03-25 00:04:45', null, '201703257148569830', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b01131fed0012', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '202', '2', '0', '2017-03-25 00:08:02', '2017-03-25 00:08:02', null, '201703257168227521', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b0113c5b10015', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '588', '0', '0', '2017-03-25 00:08:44', '2017-03-25 00:08:44', null, '201703257172471835', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b0115da050018', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '588', '0', '0', '2017-03-25 00:11:01', '2017-03-25 00:11:01', null, '201703257175538970', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b0117367a001b', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '588', '0', '0', '2017-03-25 00:12:30', '2017-03-25 00:12:30', null, '20170325719470805', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b01197cae001e', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '202', '2', '0', '2017-03-25 00:14:59', '2017-03-25 00:14:59', null, '20170325720992438', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b011a15fc0021', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '128', '2', '0', '2017-03-25 00:15:38', '2017-03-25 00:15:38', null, '201703257213849053', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b011b9a2d0024', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '128', '2', '0', '2017-03-25 00:17:17', '2017-03-25 00:17:17', null, '201703257223786665', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b00b9e1015b011c3bac0027', '4028ad815a9c1569015a9c175d410002', '陈', '1236', '1290', '1296', '31栋', '0', '202', '2', '0', '2017-03-25 00:17:59', '2017-03-25 00:17:59', null, '201703257227920852', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b03dada015b042b7e390002', '4028ad815b03cfa8015b03d284c60002', '陈', '1236', '1290', '1296', '123', '0', '400', '0', '0', '2017-03-25 14:33:30', '2017-03-25 14:33:30', null, '201703252361092120', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b046523015b049f0d9d0002', '4028ad815b03cfa8015b03d284c60002', '陈', '1236', '1290', '1296', '1', '0', '202', '2', '0', '2017-03-25 16:39:44', '2017-03-25 16:39:44', null, '201703253118426198', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815b046523015b04a014c50004', '4028ad815b03cfa8015b03d284c60002', '陈', '1236', '1290', '1296', '1', '0', '202', '2', '0', '2017-03-25 16:40:51', '2017-03-25 16:40:51', null, '201703253125164537', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815de66330015de6697d570003', '4028ad815d357201015d3576277f0006', '陈先生', '1236', '1290', '1296', '琦', '0', '202', '2', '0', '2017-08-15 23:00:59', '2017-08-15 23:00:59', null, '201708150925934023', '13760755956', null, null, null, null, null, null, '0', null, null);
INSERT INTO `t_bookform` VALUES ('4028ad815de96652015de9d883010002', '4028ad815d357201015d3576277f0006', '陈', '1236', '1290', '1296', '琦', '0', '588', '0', '0', '2017-08-16 15:01:06', '2017-08-16 15:01:06', null, '201708166686690186', '13760755956', null, null, null, null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for t_bookform_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_bookform_detail`;
CREATE TABLE `t_bookform_detail` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `book_Id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `product_id` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `security_code` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '防伪码，对应t_product_item的防伪码',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `price` double DEFAULT NULL COMMENT '批发价格',
  `price_mart` double DEFAULT NULL COMMENT '市场价',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_bookform_detail
-- ----------------------------
INSERT INTO `t_bookform_detail` VALUES ('4028ad815a9c1569015a9c18b22a0007', '4028ad815a9c1569015a9c18b2230006', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-05 09:32:28', '2017-03-05 09:32:28', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815a9d2eaf015a9d3e7c960012', '4028ad815a9d2eaf015a9d3e7c8f0011', '4028ad815a4ff856015a5001111e000b', null, '2017-03-05 14:53:22', '2017-03-05 14:53:22', '388', '588', '3');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815a9d2eaf015a9d3e7c960013', '4028ad815a9d2eaf015a9d3e7c8f0011', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-05 14:53:22', '2017-03-05 14:53:22', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815a9d2eaf015a9d493c79002e', '4028ad815a9d2eaf015a9d493c78002d', '4028ad815a4ff856015a5001111e000b', null, '2017-03-05 15:05:06', '2017-03-05 15:05:06', '388', '588', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815a9d2eaf015a9d53708b003e', '4028ad815a9d2eaf015a9d53708b003d', '4028ad815a4ff856015a5001111e000b', null, '2017-03-05 15:16:15', '2017-03-05 15:16:15', '388', '588', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815aa71389015aa77555a9000b', '4028ad815aa71389015aa77555a1000a', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-07 14:29:29', '2017-03-07 14:29:29', '126', '200', '7');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815aa71389015aa779f5ac000e', '4028ad815aa71389015aa779f5ab000d', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-07 14:34:32', '2017-03-07 14:34:32', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815aa71389015aa7885e0e0015', '4028ad815aa71389015aa7885e0e0014', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-07 14:50:16', '2017-03-07 14:50:16', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b00f727bb0005', '4028ad815b00b9e1015b00f727b80004', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-24 23:37:29', '2017-03-24 23:37:29', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b00ff542b0007', '4028ad815b00b9e1015b00ff542a0006', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-24 23:46:24', '2017-03-24 23:46:24', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b00ff69f00009', '4028ad815b00b9e1015b00ff69f00008', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-24 23:46:30', '2017-03-24 23:46:30', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b01012e88000b', '4028ad815b00b9e1015b01012e87000a', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-24 23:48:26', '2017-03-24 23:48:26', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b010b4312000d', '4028ad815b00b9e1015b010b4311000c', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-24 23:59:26', '2017-03-24 23:59:26', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b011020040010', '4028ad815b00b9e1015b01102004000f', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-25 00:04:45', '2017-03-25 00:04:45', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b01131fed0013', '4028ad815b00b9e1015b01131fed0012', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-25 00:08:02', '2017-03-25 00:08:02', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b0113c5b20016', '4028ad815b00b9e1015b0113c5b10015', '4028ad815a4ff856015a5001111e000b', null, '2017-03-25 00:08:44', '2017-03-25 00:08:44', '388', '588', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b0115da060019', '4028ad815b00b9e1015b0115da050018', '4028ad815a4ff856015a5001111e000b', null, '2017-03-25 00:11:01', '2017-03-25 00:11:01', '388', '588', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b0117367b001c', '4028ad815b00b9e1015b0117367a001b', '4028ad815a4ff856015a5001111e000b', null, '2017-03-25 00:12:30', '2017-03-25 00:12:30', '588', '588', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b01197cae001f', '4028ad815b00b9e1015b01197cae001e', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-25 00:14:59', '2017-03-25 00:14:59', '200', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b011a15fd0022', '4028ad815b00b9e1015b011a15fc0021', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-25 00:15:38', '2017-03-25 00:15:38', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b011b9a2d0025', '4028ad815b00b9e1015b011b9a2d0024', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-25 00:17:17', '2017-03-25 00:17:17', '126', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b00b9e1015b011c3bad0028', '4028ad815b00b9e1015b011c3bac0027', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-25 00:17:59', '2017-03-25 00:17:59', '200', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b03dada015b042b7e3d0003', '4028ad815b03dada015b042b7e390002', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-25 14:33:31', '2017-03-25 14:33:31', '200', '200', '2');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b046523015b049f0da40003', '4028ad815b046523015b049f0d9d0002', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-25 16:39:44', '2017-03-25 16:39:44', '200', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815b046523015b04a014c60005', '4028ad815b046523015b04a014c50004', '4028ad815a4f0157015a4f42f1060019', null, '2017-03-25 16:40:51', '2017-03-25 16:40:51', '200', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815de66330015de6697d5e0004', '4028ad815de66330015de6697d570003', '4028ad815a4f0157015a4f42f1060015', null, '2017-08-15 23:00:59', '2017-08-15 23:00:59', '200', '200', '1');
INSERT INTO `t_bookform_detail` VALUES ('4028ad815de96652015de9d883080003', '4028ad815de96652015de9d883010002', '4028ad815a4ff856015a5001111e000b', null, '2017-08-16 15:01:06', '2017-08-16 15:01:06', '588', '588', '1');

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cart
-- ----------------------------
INSERT INTO `t_cart` VALUES ('4028ad815c0c8a66015c0c8c0abb0001', '4028ad815a9c1569015a9c175d650003', '4028ad815a4f0157015a4f42f1060019', '1', '2017-05-15 22:38:43', '2017-05-15 22:38:43');
INSERT INTO `t_cart` VALUES ('4028ad815de96652015de9e4b26b0004', '4028ad815d357201015d357627800007', '4028ad815a4ff856015a5001111e000b', '2', '2017-08-16 15:14:25', '2017-08-16 15:58:39');

-- ----------------------------
-- Table structure for t_express_fee
-- ----------------------------
DROP TABLE IF EXISTS `t_express_fee`;
CREATE TABLE `t_express_fee` (
  `id` varchar(32) NOT NULL,
  `express_company_id` varchar(100) DEFAULT NULL COMMENT '快递公司ID',
  `fee` double DEFAULT NULL COMMENT '邮费',
  `amount_for_free` varchar(255) DEFAULT NULL COMMENT '订单总额满多少可免费',
  `area_id` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_express_fee
-- ----------------------------
INSERT INTO `t_express_fee` VALUES ('1', '123123', '2', '222.0', null, '2017-02-24 13:24:30', '2017-03-23 00:30:16');
INSERT INTO `t_express_fee` VALUES ('4028ad815d2d1c22015d2d1df6610001', null, '1', '1.0', null, '2017-07-10 23:28:44', '2017-07-10 23:28:44');
INSERT INTO `t_express_fee` VALUES ('4028ad815d2d1c22015d2d1e32ab0002', null, '12', '1.0', null, '2017-07-10 23:29:00', '2017-07-10 23:29:00');

-- ----------------------------
-- Table structure for t_factory
-- ----------------------------
DROP TABLE IF EXISTS `t_factory`;
CREATE TABLE `t_factory` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `man` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `province_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `city_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `county_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `addr` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `gps_X` double DEFAULT NULL,
  `gps_Y` double DEFAULT NULL,
  `license_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '营业执照名称',
  `license_file_ids` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '营业执照名称',
  `photo_ids` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '业务员ID',
  `update_time` datetime DEFAULT NULL,
  `referee_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '推荐商家id',
  `sys_user_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `auto_status` varchar(20) DEFAULT NULL COMMENT '认证状态',
  `money_account` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `agree_protocol` tinyint(4) DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `bank_branch_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `bank_owner_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_factory
-- ----------------------------
INSERT INTO `t_factory` VALUES ('4028ad815a9d2eaf015a9d35dd330006', '刘总维修店', null, '13802938100', '2250', '2251', '2257', '白云区', null, null, null, null, null, '2017-03-05 14:43:57', '2017-03-05 14:43:57', null, '4028ad815a9d2eaf015a9d31e17c0002', '3', null, null, null, null, null, null);
INSERT INTO `t_factory` VALUES ('4028ad815a9d2eaf015a9d3c8eb2000d', '啊开', null, '15914380611', '2250', '2251', '2257', '啊开地址', null, null, null, null, null, '2017-03-05 14:51:16', '2017-03-05 14:51:16', null, '4028ad815a9d2eaf015a9d31e17c0002', '3', null, null, null, null, null, null);
INSERT INTO `t_factory` VALUES ('4028ad815a9d2eaf015a9d51f20b003a', '庞健维修店', '庞健', '18922378741', '2250', '2251', '2257', '天河区', '113.23590719672', '23.166917599348', '维修店', '4028ad815a9d2eaf015a9d55ec8a0045', '4028ad815a9d2eaf015a9d56511a0046,4028ad815a9d2eaf015a9d5699940047,4028ad815a9d2eaf015a9d56c0be0048', '2017-03-05 15:14:37', '2017-03-05 15:19:58', '4028ad815a9d2eaf015a9d3c8eb2000d', '4028ad815a9d2eaf015a9d31e17c0002', '3', null, null, null, null, null, null);
INSERT INTO `t_factory` VALUES ('4028ad815d357201015d3576277f0006', '测试', null, '13760755956', '1236', '1290', '1296', '琦', null, null, null, null, null, '2017-07-12 14:22:02', '2017-07-12 14:22:02', null, null, '3', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_factory_user
-- ----------------------------
DROP TABLE IF EXISTS `t_factory_user`;
CREATE TABLE `t_factory_user` (
  `id` varchar(40) NOT NULL,
  `factory_id` varchar(40) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `protocol` int(11) DEFAULT NULL COMMENT '是否阅读协议 0:未同意 1：已同意',
  `openid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_factory_user
-- ----------------------------
INSERT INTO `t_factory_user` VALUES ('4028ad815a9d2eaf015a9d35dd3b0007', '4028ad815a9d2eaf015a9d35dd330006', '13802938100', '0cc175b9c0f1b6a831c399e269772661', null, '1', '2017-03-05 14:43:57', '2017-03-05 14:43:57', null, '13802938100', null, null);
INSERT INTO `t_factory_user` VALUES ('4028ad815a9d2eaf015a9d3c8eb4000e', '4028ad815a9d2eaf015a9d3c8eb2000d', '15914380611', '0cc175b9c0f1b6a831c399e269772661', null, '1', '2017-03-05 14:51:16', '2017-03-05 14:51:16', null, '15914380611', null, null);
INSERT INTO `t_factory_user` VALUES ('4028ad815a9d2eaf015a9d51f20d003b', '4028ad815a9d2eaf015a9d51f20b003a', '18922378741', '0cc175b9c0f1b6a831c399e269772661', null, '1', '2017-03-05 15:14:37', '2017-03-05 15:14:37', null, '18922378741', null, null);
INSERT INTO `t_factory_user` VALUES ('4028ad815d357201015d357627800007', '4028ad815d357201015d3576277f0006', '13760755956', 'c4ca4238a0b923820dcc509a6f75849b', null, '1', '2017-07-12 14:22:02', '2017-08-15 22:54:32', null, '13760755956', null, '');

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `id` varchar(32) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_size` decimal(10,0) DEFAULT NULL,
  `content_type` varchar(10) DEFAULT NULL,
  `content` mediumblob,
  `upload_time` datetime DEFAULT NULL,
  `table_Name` varchar(100) DEFAULT NULL,
  `reference_Id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_file
-- ----------------------------

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `price_mart` double DEFAULT NULL,
  `model` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '电池型号',
  `core_type` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '电池属性',
  `capacity` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '容量',
  `apply_brand` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '适用品牌',
  `apply_phone_type` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '适用机型',
  `execute_normal` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '执行标准',
  `normal_voltage` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '标准电压',
  `charge_voltage` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '充电电压',
  `environment` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '是否环保',
  `quick_charge` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '快充功能',
  `content_photo_ids` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品详情',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `virtual_count` int(11) DEFAULT NULL COMMENT '虚拟销量',
  `photo_ids` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `stock_count` int(11) DEFAULT NULL,
  `sale_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('4028ad815a4f0157015a4f42f1060011', '诺希 苹果6 手机内置电池', '99', '150', '安卓系列', 'iPhone系列', '1001-1600毫安', '苹果', 'iPhone4/4s/5/5s/6/6s', '苹果', '4.2', '220', '否', '是', '4028ad815a4f0157015a4f42e7410017', '2017-02-18 11:33:50', '2017-03-01 00:20:43', '10000', '4028ad815a4f0157015a4f42cf810016', '2', '0', null);
INSERT INTO `t_product` VALUES ('4028ad815a4f0157015a4f42f1060012', '小米电池小米原装手机电池红米note/1s/2A/2s/M1/M2/红米2A/note2', '126', '200', 'iPhone系列', 'iPhone系列', '1001-1600毫安', '苹果', 'iPhone4/4s/5/5s/6/6s', '苹果', '4.2', '220', '否', '是', '4028ad815a4f0157015a4f42e7410017', '2017-02-18 11:33:50', '2017-03-23 00:42:59', '10000', '4028ad815a4f0157015a4f42cf810016', '2', null, '10');
INSERT INTO `t_product` VALUES ('4028ad815a4f0157015a4f42f1060013', '苹果原装手机内置电池 iPhone6/6splus电池 iphone5S/5C(1560mah)', '126', '200', 'iPhone系列', 'iPhone系列', '1001-1600毫安', '苹果', 'iPhone4/4s/5/5s/6/6s', '苹果', '4.2', '220', '否', '是', '4028ad815a4f0157015a4f42e7410017', '2017-02-18 11:33:50', '2017-02-18 11:33:50', '10000', '4028ad815a4f0157015a4f42cf810016', '2', null, null);
INSERT INTO `t_product` VALUES ('4028ad815a4f0157015a4f42f1060014', '酷派（Coolpad）大神F2原装电池8675 5891q 5951 5950 7296', '126', '200', 'iPhone系列', 'iPhone系列', '1001-1600毫安', '苹果', 'iPhone4/4s/5/5s/6/6s', '苹果', '4.2', '220', '否', '是', '4028ad815a4f0157015a4f42e7410017', '2017-02-18 11:33:50', '2017-02-18 11:33:50', '10000', '4028ad815a4f0157015a4f42cf810016', '2', null, null);
INSERT INTO `t_product` VALUES ('4028ad815a4f0157015a4f42f1060015', '三星（SAMSUNG）note4原装正品电池', '126', '200', 'iPhone系列', 'iPhone系列', '1001-1600毫安', '苹果', 'iPhone4/4s/5/5s/6/6s', '苹果', '4.2', '220', '否', '是', '4028ad815a4f0157015a4f42e7410017', '2017-02-18 11:33:50', '2017-05-15 23:14:02', '10000', '4028ad815a4f0157015a4f42cf810016,4028ad815c0c8a66015c0cabbecf000e,4028ad815c0c8a66015c0cac41c0000f', '1', null, '20');
INSERT INTO `t_product` VALUES ('4028ad815a4f0157015a4f42f1060016', '摩米士（MOMAX）三星Note3手机电池', '126', '200', 'iPhone系列', 'iPhone系列', '1001-1600毫安', '苹果', 'iPhone4/4s/5/5s/6/6s', '苹果', '4.2', '220', '否', '是', '4028ad815a4f0157015a4f42e7410017', '2017-02-18 11:33:50', '2017-02-18 11:33:50', '10000', '4028ad815a4f0157015a4f42cf810016', '2', null, null);
INSERT INTO `t_product` VALUES ('4028ad815a4f0157015a4f42f1060017', '酷波 小米红米 电池/手机电池', '126', '200', 'iPhone系列', 'iPhone系列', '1001-1600毫安', '苹果', 'iPhone4/4s/5/5s/6/6s', '苹果', '4.2', '220', '否', '是', '4028ad815a4f0157015a4f42e7410017', '2017-02-18 11:33:50', '2017-02-18 11:33:50', '10000', '4028ad815a4f0157015a4f42cf810016', '2', null, null);
INSERT INTO `t_product` VALUES ('4028ad815a4f0157015a4f42f1060018', '苹果原装手机内置电池 iPhone6/6splus电池 iphone5S/5C(1560mah)', '126', '200', 'iPhone系列', 'iPhone系列', '1001-1600毫安', '苹果', 'iPhone4/4s/5/5s/6/6s', '苹果', '4.2', '220', '否', '是', '4028ad815a4f0157015a4f42e7410017', '2017-02-18 11:27:51', '2017-02-18 11:27:51', '10000', '4028ad815a4f0157015a4f42cf810016', '2', null, null);
INSERT INTO `t_product` VALUES ('4028ad815a4f0157015a4f42f1060019', '力威恒业手机内置电池', '126', '200', 'iPhone系列', 'iPhone系列', '1001-1600毫安', '苹果', 'iPhone4/4s/5/5s/6/6s', '苹果', '4.2', '220', '否', '是', '4028ad815b4125d7015b41de1bef0009,4028ad815b4125d7015b41de7809000b', '2017-02-18 11:33:51', '2017-05-15 23:03:17', '10000', '4028ad815c0c8a66015c0ca23b00000a', '1', '4', null);
INSERT INTO `t_product` VALUES ('4028ad815a4f0157015a4f42f1060022', '品胜 三星N9100 手机电池', '126', '200', 'iPhone系列', 'iPhone系列', '1001-1600毫安', '苹果', 'iPhone4/4s/5/5s/6/6s', '苹果', '4.2', '220', '否', '是', '4028ad815a4f0157015a4f42e7410017', '2017-02-18 11:33:51', '2017-02-18 11:33:51', '10000', '4028ad815a4f0157015a4f42cf810016', '2', null, null);
INSERT INTO `t_product` VALUES ('4028ad815a4ff856015a5001111e000b', '苹果原装手机内置电池iPhone4/4s/5/5s/6/7iPhone6s', '388', '588', '苹果iPhone4/4s/5/5s/6/7iPhone6s', '苹果', '1001-1600毫安', '苹果', '苹果', '苹果', '4.5', '220', '是', '是', '4028ad815a4ff856015a5000f01e000a', '2017-02-18 14:55:31', '2017-05-15 23:14:35', '1000', '4028ad815a4ff856015a5000b3520009,4028ad815c0c8a66015c0ca97b35000b,4028ad815c0c8a66015c0caa72be000c,4028ad815c0c8a66015c0cab38c8000d', '1', '2', null);

-- ----------------------------
-- Table structure for t_product_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_product_brand`;
CREATE TABLE `t_product_brand` (
  `id` varchar(40) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` text,
  `content` text,
  `status` tinyint(4) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product_brand
-- ----------------------------
INSERT INTO `t_product_brand` VALUES ('402880e75e0a31cd015e0a4346660001', '特别好牌子', '特别好牌子特别好牌子特别好牌子特别好牌子特别好牌子特别好牌子特别好牌子特别好牌子特别好牌子特别好牌子特别好牌子特别好牌子特别好牌子', null, '1', '1', '2017-08-22 22:31:50', '2017-08-22 22:41:35');

-- ----------------------------
-- Table structure for t_product_item
-- ----------------------------
DROP TABLE IF EXISTS `t_product_item`;
CREATE TABLE `t_product_item` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `security_code` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '防伪码',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_product_item
-- ----------------------------
INSERT INTO `t_product_item` VALUES ('4028ad815a4f0157015a4f48f08d0019', '4028ad815a4f0157015a4f42f1060019', '1234567890', '2017-02-18 11:34:24', '2017-02-18 11:53:38', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815a4f0157015a4f751c5b001f', '4028ad815a4f0157015a4f42f1060011', '201702181234', '2017-02-18 12:22:39', '2017-02-18 12:24:02', '1');
INSERT INTO `t_product_item` VALUES ('4028ad815a4ff856015a5001aea1000c', '4028ad815a4ff856015a5001111e000b', '1234567891', '2017-02-18 14:56:11', '2017-02-26 16:37:44', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815a4ff856015a501a43780019', '4028ad815a4ff856015a5001111e000b', '1234567892', '2017-02-18 15:23:02', '2017-02-18 15:23:02', '1');
INSERT INTO `t_product_item` VALUES ('4028ad815a4ff856015a50202536001b', '4028ad815a4ff856015a5001111e000b', '1234567893', '2017-02-18 15:29:28', '2017-02-18 15:29:28', '1');
INSERT INTO `t_product_item` VALUES ('4028ad815a8a6617015a8adc9a88000a', '4028ad815a4f0157015a4f42f1060019', '1234567899', '2017-03-02 01:13:17', '2017-03-02 01:13:17', '1');
INSERT INTO `t_product_item` VALUES ('4028ad815a8a6617015a8ae0b4fa000c', '4028ad815a4ff856015a5001111e000b', '1234567898', '2017-03-02 01:17:46', '2017-03-02 02:14:07', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815a8d792d015a8d885518000b', '4028ad815a4ff856015a5001111e000b', '12345678901', '2017-03-02 13:40:06', '2017-03-02 13:40:26', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815a9402f1015a9409c1fd0004', '4028ad815a4ff856015a5001111e000b', '12345678912', '2017-03-03 19:59:11', '2017-03-03 19:59:25', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815a9d209c015a9d2bec7a0009', '4028ad815a4ff856015a5001111e000b', '02170170377', '2017-03-05 14:33:05', '2017-03-05 14:33:05', '1');
INSERT INTO `t_product_item` VALUES ('4028ad815a9d2eaf015a9d42014d0017', '4028ad815a4ff856015a5001111e000b', '2017030510000', '2017-03-05 14:57:13', '2017-03-05 14:58:05', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815a9d2eaf015a9d421a040019', '4028ad815a4ff856015a5001111e000b', '2017030510001', '2017-03-05 14:57:19', '2017-03-05 14:57:54', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815a9d2eaf015a9d42563b001b', '4028ad815a4f0157015a4f42f1060019', '2017030510003', '2017-03-05 14:57:34', '2017-03-05 14:58:09', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815a9d2eaf015a9d426011001d', '4028ad815a4f0157015a4f42f1060019', '2017030510004', '2017-03-05 14:57:37', '2017-03-05 14:57:37', '1');
INSERT INTO `t_product_item` VALUES ('4028ad815a9d2eaf015a9d43579a0022', '4028ad815a4f0157015a4f42f1060019', '2017030510002', '2017-03-05 14:58:40', '2017-03-05 14:58:40', '1');
INSERT INTO `t_product_item` VALUES ('4028ad815a9d2eaf015a9d44083b0024', '4028ad815a4ff856015a5001111e000b', '2017030510005', '2017-03-05 14:59:25', '2017-03-05 14:59:34', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815a9d2eaf015a9d49b73b002f', '4028ad815a4ff856015a5001111e000b', '2017030510006', '2017-03-05 15:05:38', '2017-03-05 15:05:46', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815a9d2eaf015a9d53df76003f', '4028ad815a4ff856015a5001111e000b', '2017030510007', '2017-03-05 15:16:44', '2017-03-05 15:16:51', '2');
INSERT INTO `t_product_item` VALUES ('4028ad815af716f8015af758c71a0004', '4028ad815a4f0157015a4f42f1060019', '111222333444', '2017-03-23 02:47:54', '2017-03-23 02:48:06', '2');

-- ----------------------------
-- Table structure for t_profit_config
-- ----------------------------
DROP TABLE IF EXISTS `t_profit_config`;
CREATE TABLE `t_profit_config` (
  `id` varchar(32) NOT NULL,
  `push_direct_open_factory` double DEFAULT NULL COMMENT '直接开店提成',
  `push_indirect_open_factory` varchar(45) DEFAULT NULL COMMENT '间接提成',
  `push_order` double DEFAULT NULL,
  `factory_order` double DEFAULT NULL COMMENT '商家下单，上级的商家提成',
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  `install_amount` double DEFAULT NULL COMMENT '安装费用',
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_profit_config
-- ----------------------------
INSERT INTO `t_profit_config` VALUES ('1', '50', '20', '1', '10', null, null, '0', 'EFFECTIVE');

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `factory_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '门店积分',
  `score` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `source` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '积分来源（第一下级推荐积分，下单积分，签到积分等）',
  `relation_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单id或者下线的门店ID',
  `sys_user_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '地推人员积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('4028ad815a9d2eaf015a9d3c8eb1000c', null, '50', '2017-03-05 14:51:16', '2017-03-05 14:51:16', '15914380611注册所得积分', null, '4028ad815a9d2eaf015a9d31e17c0002');
INSERT INTO `t_score` VALUES ('4028ad815a9d2eaf015a9d44c6580028', null, '129', '2017-03-05 15:00:14', '2017-03-05 15:00:14', '15914380611门店下单积分', '4028ad815a9d2eaf015a9d3e7c8f0011', null);
INSERT INTO `t_score` VALUES ('4028ad815a9d2eaf015a9d44c6590029', null, '13', '2017-03-05 15:00:14', '2017-03-05 15:00:14', '15914380611下单', '4028ad815a9d2eaf015a9d3c8eb2000d', '4028ad815a9d2eaf015a9d31e17c0002');
INSERT INTO `t_score` VALUES ('4028ad815a9d2eaf015a9d49ff620033', null, '39', '2017-03-05 15:05:56', '2017-03-05 15:05:56', '15914380611门店下单积分', '4028ad815a9d2eaf015a9d493c78002d', null);
INSERT INTO `t_score` VALUES ('4028ad815a9d2eaf015a9d49ff620034', null, '4', '2017-03-05 15:05:56', '2017-03-05 15:05:56', '15914380611下单', '4028ad815a9d2eaf015a9d3c8eb2000d', '4028ad815a9d2eaf015a9d31e17c0002');
INSERT INTO `t_score` VALUES ('4028ad815a9d2eaf015a9d51f20b0039', null, '20', '2017-03-05 15:14:37', '2017-03-05 15:14:37', '18922378741注册所得积分', null, '4028ad815a9d2eaf015a9d31e17c0002');
INSERT INTO `t_score` VALUES ('4028ad815a9d2eaf015a9d54513c0043', '4028ad815a9d2eaf015a9d3c8eb2000d', '39', '2017-03-05 15:17:13', '2017-03-05 15:17:13', '18922378741门店下单积分', '4028ad815a9d2eaf015a9d53708b003d', null);
INSERT INTO `t_score` VALUES ('4028ad815a9d2eaf015a9d54513c0044', null, '4', '2017-03-05 15:17:13', '2017-03-05 15:17:13', '18922378741下单', '4028ad815a9d2eaf015a9d51f20b003a', '4028ad815a9d2eaf015a9d31e17c0002');
INSERT INTO `t_score` VALUES ('4028ad815af716f8015af7592a5b0008', null, '14', '2017-03-23 02:48:20', '2017-03-23 02:48:20', '13760755956门店下单积分', '4028ad815aa71389015aa7885e0e0014', null);
INSERT INTO `t_score` VALUES ('4028ad815af716f8015af7592a5b0009', null, '1', '2017-03-23 02:48:20', '2017-03-23 02:48:20', '13760755956下单', '4028ad815a9c1569015a9c175d410002', null);
INSERT INTO `t_score` VALUES ('4028ad815b00b9e1015b013c6da70033', null, '50', '2017-03-25 00:53:09', '2017-03-25 00:53:09', '13760755956注册所得积分', null, 'null');

-- ----------------------------
-- Table structure for t_sms
-- ----------------------------
DROP TABLE IF EXISTS `t_sms`;
CREATE TABLE `t_sms` (
  `id` varchar(32) NOT NULL,
  `obj_mobile` varchar(20) DEFAULT NULL,
  `content` text,
  `pre_send_time` datetime DEFAULT NULL,
  `final_send_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `ip_addr` varchar(255) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sms
-- ----------------------------

-- ----------------------------
-- Table structure for t_stock_record
-- ----------------------------
DROP TABLE IF EXISTS `t_stock_record`;
CREATE TABLE `t_stock_record` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `security_code` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '出库还是入库(1:入库，0出库）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `book_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '出库才有订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_stock_record
-- ----------------------------
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d209c015a9d2bec8b000a', '02170170377', '1', '2017-03-05 14:33:05', '2017-03-05 14:33:05', null);
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d4201530018', '2017030510000', '1', '2017-03-05 14:57:13', '2017-03-05 14:57:13', null);
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d421a05001a', '2017030510001', '1', '2017-03-05 14:57:19', '2017-03-05 14:57:19', null);
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d42563b001c', '2017030510003', '1', '2017-03-05 14:57:34', '2017-03-05 14:57:34', null);
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d426012001e', '2017030510004', '1', '2017-03-05 14:57:37', '2017-03-05 14:57:37', null);
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d42a1e6001f', '2017030510001', '0', '2017-03-05 14:57:54', '2017-03-05 14:57:54', '4028ad815a9d2eaf015a9d3e7c8f0011');
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d42cf960020', '2017030510000', '0', '2017-03-05 14:58:05', '2017-03-05 14:58:05', '4028ad815a9d2eaf015a9d3e7c8f0011');
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d42dbfa0021', '2017030510003', '0', '2017-03-05 14:58:09', '2017-03-05 14:58:09', '4028ad815a9d2eaf015a9d3e7c8f0011');
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d43579b0023', '2017030510002', '1', '2017-03-05 14:58:40', '2017-03-05 14:58:40', null);
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d44083b0025', '2017030510005', '1', '2017-03-05 14:59:25', '2017-03-05 14:59:25', null);
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d4428060026', '2017030510005', '0', '2017-03-05 14:59:34', '2017-03-05 14:59:34', '4028ad815a9d2eaf015a9d3e7c8f0011');
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d49b73b0030', '2017030510006', '1', '2017-03-05 15:05:38', '2017-03-05 15:05:38', null);
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d49d5b10031', '2017030510006', '0', '2017-03-05 15:05:46', '2017-03-05 15:05:46', '4028ad815a9d2eaf015a9d493c78002d');
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d53df770040', '2017030510007', '1', '2017-03-05 15:16:44', '2017-03-05 15:16:44', null);
INSERT INTO `t_stock_record` VALUES ('4028ad815a9d2eaf015a9d53fcb00041', '2017030510007', '0', '2017-03-05 15:16:51', '2017-03-05 15:16:51', '4028ad815a9d2eaf015a9d53708b003d');
INSERT INTO `t_stock_record` VALUES ('4028ad815af716f8015af758c7210005', '111222333444', '1', '2017-03-23 02:47:54', '2017-03-23 02:47:54', null);
INSERT INTO `t_stock_record` VALUES ('4028ad815af716f8015af758f30b0006', '111222333444', '0', '2017-03-23 02:48:06', '2017-03-23 02:48:06', '4028ad815aa71389015aa7885e0e0014');

-- ----------------------------
-- Table structure for t_temp_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `t_temp_verifycode`;
CREATE TABLE `t_temp_verifycode` (
  `id` varchar(32) NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `code_key` varchar(255) DEFAULT NULL,
  `code_value` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_temp_verifycode
-- ----------------------------
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d209c015a9d215afa0001', '0', '8ce9d83f959c2b0778d882b353d7f563', 'ovic', '2017-03-05 14:21:33', '2017-03-05 14:26:33');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d209c015a9d291e990005', '0', 'afed9d492e3c4342b95bc03b44e0453a', '42k3', '2017-03-05 14:30:02', '2017-03-05 14:35:02');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d209c015a9d2973fa0006', '0', 'afed9d492e3c4342b95bc03b44e0453a', 'q3gd', '2017-03-05 14:30:24', '2017-03-05 14:35:24');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d209c015a9d298b030007', '0', 'afed9d492e3c4342b95bc03b44e0453a', 'fcxy', '2017-03-05 14:30:30', '2017-03-05 14:35:30');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d209c015a9d2a11900008', '0', '79db4f6c1a529854d8d181b91e5590b2', 'mnb2', '2017-03-05 14:31:04', '2017-03-05 14:36:04');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d2eaf015a9d2fbc1f0001', '0', 'b4416816ef3c175d7ec376dfd0e6d75e', 'tov7', '2017-03-05 14:37:15', '2017-03-05 14:42:15');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d2eaf015a9d3210780004', '0', 'b4416816ef3c175d7ec376dfd0e6d75e', 'vi4r', '2017-03-05 14:39:48', '2017-03-05 14:44:48');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d2eaf015a9d3858070008', '0', 'b4416816ef3c175d7ec376dfd0e6d75e', 'hgq0', '2017-03-05 14:46:40', '2017-03-05 14:51:40');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d2eaf015a9d3aae950009', '0', 'b4416816ef3c175d7ec376dfd0e6d75e', '150g', '2017-03-05 14:49:13', '2017-03-05 14:54:13');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d2eaf015a9d4069af0015', '0', 'e61e7aaf58f22385ee226d39e723bf6c', 'wl8v', '2017-03-05 14:55:29', '2017-03-05 15:00:29');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815a9d2eaf015a9dcbb1e00049', '0', '1a6d75e8db19a29f930c295bc3f0be2b', 'y0qo', '2017-03-05 17:27:37', '2017-03-05 17:32:37');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815aa71389015aa74ceee80001', '0', '7e54b79492eda4cc9056e83400c7c03c', '08fz', '2017-03-07 13:45:21', '2017-03-07 13:50:21');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815aa71389015aa74cfc6d0002', '0', '7e54b79492eda4cc9056e83400c7c03c', 'coqj', '2017-03-07 13:45:25', '2017-03-07 13:50:25');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815aa71389015aa74e53b60003', '0', '7e54b79492eda4cc9056e83400c7c03c', 'kgud', '2017-03-07 13:46:53', '2017-03-07 13:51:53');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815aa71389015aa74ed52c0004', '0', '7e54b79492eda4cc9056e83400c7c03c', '4gbk', '2017-03-07 13:47:26', '2017-03-07 13:52:26');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815aa71389015aa74f2f9e0005', '0', 'a32f03ab732b2a6884e879088f6e96d4', '85hb', '2017-03-07 13:47:49', '2017-03-07 13:52:49');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815aa71389015aa752b53a0006', '0', 'a32f03ab732b2a6884e879088f6e96d4', 'mhe6', '2017-03-07 13:51:40', '2017-03-07 13:56:40');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815aa71389015aa76e47640007', '0', 'a32f03ab732b2a6884e879088f6e96d4', '9467', '2017-03-07 14:21:47', '2017-03-07 14:26:47');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815aa71389015aa76ea3920008', '0', 'a32f03ab732b2a6884e879088f6e96d4', 'lbnc', '2017-03-07 14:22:10', '2017-03-07 14:27:10');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab0f6ef015ab0f8f9e70001', '0', '162d5cbd8778953e39ffb00efd5c56bc', 'rkwg', '2017-03-09 10:49:51', '2017-03-09 10:54:51');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab0f6ef015ab0fe560a0002', '0', '162d5cbd8778953e39ffb00efd5c56bc', 'lxgk', '2017-03-09 10:55:43', '2017-03-09 11:00:43');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab0f6ef015ab1065b450003', '0', 'cc99abd7c1b42afdf518d5f383fb2dd2', 'jjf7', '2017-03-09 11:04:28', '2017-03-09 11:09:28');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab0f6ef015ab106ab150004', '0', 'cc99abd7c1b42afdf518d5f383fb2dd2', 'kmpq', '2017-03-09 11:04:49', '2017-03-09 11:09:49');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab109a8015ab10b3f030001', '0', 'e6fa0a3f906d3d192c3f55043a123918', '20qr', '2017-03-09 11:09:48', '2017-03-09 11:14:48');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab1129e015ab115050d0001', '0', 'a1a840c4a4f225520a27b5778406f3e2', '361i', '2017-03-09 11:20:29', '2017-03-09 11:25:29');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab1129e015ab1161e4f0002', '0', '0c0172eb898c2537b9e4107a0fb4da37', 'gqqv', '2017-03-09 11:21:41', '2017-03-09 11:26:41');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab118c1015ab1193ba10001', '0', '54026320a54c95e7b399003d116ad15d', 'pluc', '2017-03-09 11:25:05', '2017-03-09 11:30:05');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab118c1015ab119cd800002', '0', '54026320a54c95e7b399003d116ad15d', 'cjog', '2017-03-09 11:25:43', '2017-03-09 11:30:43');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab118c1015ab11a58a60003', '0', '54026320a54c95e7b399003d116ad15d', '2abr', '2017-03-09 11:26:18', '2017-03-09 11:31:18');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab118c1015ab11c60220004', '0', '54026320a54c95e7b399003d116ad15d', 'yh0l', '2017-03-09 11:28:31', '2017-03-09 11:33:31');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab118c1015ab11c8dce0005', '0', '54026320a54c95e7b399003d116ad15d', 'pe4r', '2017-03-09 11:28:43', '2017-03-09 11:33:43');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab60f78015ab6112f560001', '0', 'b7e742346d720c197bfe322600986616', 'w6dm', '2017-03-10 10:34:23', '2017-03-10 10:39:23');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab60f78015ab611ec1c0002', '0', 'b7e742346d720c197bfe322600986616', 'phz5', '2017-03-10 10:35:12', '2017-03-10 10:40:12');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab60f78015ab6127e8b0003', '0', 'b7e742346d720c197bfe322600986616', 'te6s', '2017-03-10 10:35:50', '2017-03-10 10:40:50');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab62319fa0001', '0', '347af4bed3b737ff98b35b33ed545150', 'oj8d', '2017-03-10 10:53:58', '2017-03-10 10:58:58');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab623fc710002', '0', '347af4bed3b737ff98b35b33ed545150', 'f5or', '2017-03-10 10:54:56', '2017-03-10 10:59:56');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab62498bb0003', '0', '347af4bed3b737ff98b35b33ed545150', 'u2mz', '2017-03-10 10:55:36', '2017-03-10 11:00:36');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab62781ed0004', '0', '347af4bed3b737ff98b35b33ed545150', 'qduh', '2017-03-10 10:58:47', '2017-03-10 11:03:47');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab6282f860005', '0', '347af4bed3b737ff98b35b33ed545150', 'b254', '2017-03-10 10:59:31', '2017-03-10 11:04:31');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab628d7e80006', '0', '347af4bed3b737ff98b35b33ed545150', 'g0kn', '2017-03-10 11:00:14', '2017-03-10 11:05:14');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab6296b700007', '0', '347af4bed3b737ff98b35b33ed545150', 'dbc9', '2017-03-10 11:00:52', '2017-03-10 11:05:52');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab629cc9d0008', '0', '347af4bed3b737ff98b35b33ed545150', 'oe9o', '2017-03-10 11:01:17', '2017-03-10 11:06:17');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab62a24de0009', '0', '347af4bed3b737ff98b35b33ed545150', '7kgv', '2017-03-10 11:01:40', '2017-03-10 11:06:40');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab62cc19a000a', '0', '347af4bed3b737ff98b35b33ed545150', '06ld', '2017-03-10 11:04:31', '2017-03-10 11:09:31');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab62d1aa6000b', '0', '347af4bed3b737ff98b35b33ed545150', 'z634', '2017-03-10 11:04:54', '2017-03-10 11:09:54');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ab61fe0015ab62d55f9000c', '0', '347af4bed3b737ff98b35b33ed545150', '1rrd', '2017-03-10 11:05:09', '2017-03-10 11:10:09');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815af65705015af66109560001', '0', '1f2b4b91a7774618f97701db6fa3fb0f', 'f4hp', '2017-03-22 22:17:19', '2017-03-22 22:22:19');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815af65705015af6622c970002', '0', 'e4df3d44fd96759e8712411c6c9074d2', '7w1c', '2017-03-22 22:18:33', '2017-03-22 22:23:33');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815af65705015af662631c0003', '0', 'e4df3d44fd96759e8712411c6c9074d2', 'a8nq', '2017-03-22 22:18:47', '2017-03-22 22:23:47');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815af716f8015af71b38460001', '0', '45cc6d7345b99148338445aa79320812', 'anl7', '2017-03-23 01:40:40', '2017-03-23 01:45:40');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815af716f8015af71c02a90002', '0', 'aef0b401f0de49bb73f6c344b1ba3fc4', 'lwe5', '2017-03-23 01:41:32', '2017-03-23 01:46:32');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afa1dbe015afa334d720001', '0', 'e9dd520d24ff7fef85e68d20129f4128', 'c1ux', '2017-03-23 16:05:51', '2017-03-23 16:10:51');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afa1dbe015afa337e170002', '0', 'e9dd520d24ff7fef85e68d20129f4128', '67kv', '2017-03-23 16:06:03', '2017-03-23 16:11:03');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afa1dbe015afa339a650003', '0', 'e9dd520d24ff7fef85e68d20129f4128', '97gm', '2017-03-23 16:06:10', '2017-03-23 16:11:10');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9ca0d70001', '0', 'f80216ef413281543f4e44a287e6e399', 'jy8s', '2017-03-23 22:40:30', '2017-03-23 22:45:30');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9d10f00002', '0', 'f80216ef413281543f4e44a287e6e399', '4zf3', '2017-03-23 22:40:59', '2017-03-23 22:45:59');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9d33bf0003', '0', 'f80216ef413281543f4e44a287e6e399', '1ll3', '2017-03-23 22:41:08', '2017-03-23 22:46:08');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9d68f50004', '0', 'f80216ef413281543f4e44a287e6e399', 'g423', '2017-03-23 22:41:22', '2017-03-23 22:46:22');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9e27b20005', '0', 'f80216ef413281543f4e44a287e6e399', '9940', '2017-03-23 22:42:10', '2017-03-23 22:47:10');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9e5d850006', '0', 'f80216ef413281543f4e44a287e6e399', 'fcxt', '2017-03-23 22:42:24', '2017-03-23 22:47:24');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9e7eb50007', '0', 'f80216ef413281543f4e44a287e6e399', '9ewa', '2017-03-23 22:42:33', '2017-03-23 22:47:33');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9e962c0008', '0', 'f80216ef413281543f4e44a287e6e399', 'bm4c', '2017-03-23 22:42:39', '2017-03-23 22:47:39');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9ec6780009', '0', 'f80216ef413281543f4e44a287e6e399', '9uj3', '2017-03-23 22:42:51', '2017-03-23 22:47:51');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9eea5c000a', '0', 'f80216ef413281543f4e44a287e6e399', 'edez', '2017-03-23 22:43:00', '2017-03-23 22:48:00');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afb9efe84000b', '0', 'f80216ef413281543f4e44a287e6e399', '29q2', '2017-03-23 22:43:05', '2017-03-23 22:48:05');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afb8c47015afba050c8000c', '0', 'f80216ef413281543f4e44a287e6e399', 'gokh', '2017-03-23 22:44:32', '2017-03-23 22:49:32');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afba0f7015afba14fb50001', '0', '37c9eac31e559482a61c3cb3c1ead543', '5r6o', '2017-03-23 22:45:37', '2017-03-23 22:50:37');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afba0f7015afba2ce6f0002', '0', '37c9eac31e559482a61c3cb3c1ead543', 'kmlv', '2017-03-23 22:47:15', '2017-03-23 22:52:15');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afba0f7015afba2f1be0003', '0', '37c9eac31e559482a61c3cb3c1ead543', '3t5i', '2017-03-23 22:47:24', '2017-03-23 22:52:24');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afba0f7015afba323dc0004', '0', '37c9eac31e559482a61c3cb3c1ead543', 'oft2', '2017-03-23 22:47:37', '2017-03-23 22:52:37');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afba0f7015afba4d7600005', '0', '37c9eac31e559482a61c3cb3c1ead543', 'cogz', '2017-03-23 22:49:29', '2017-03-23 22:54:29');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afba5f2015afba78bc80001', '0', '9c06601614f729d8acfe242b87109c64', 'f932', '2017-03-23 22:52:25', '2017-03-23 22:57:25');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afba5f2015afbaa7c950002', '0', '9c06601614f729d8acfe242b87109c64', 'mc8r', '2017-03-23 22:55:39', '2017-03-23 23:00:39');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815afbab95015afbace8c10001', '0', '922f450aebf9280dab675b013f1f0775', 'glgx', '2017-03-23 22:58:17', '2017-03-23 23:03:17');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815b00b9e1015b00d74b600001', '0', 'f70c0dd0d2ddfeb4f282e2f786d97c07', '0qo3', '2017-03-24 23:02:41', '2017-03-24 23:07:41');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815b00b9e1015b00da0cf10002', '0', 'f70c0dd0d2ddfeb4f282e2f786d97c07', 'azsv', '2017-03-24 23:05:42', '2017-03-24 23:10:42');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815b00b9e1015b013dc0a20036', '0', 'f70c0dd0d2ddfeb4f282e2f786d97c07', 'k338', '2017-03-25 00:54:36', '2017-03-25 00:59:36');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815b00b9e1015b013de8700037', '0', 'f70c0dd0d2ddfeb4f282e2f786d97c07', 'ofgd', '2017-03-25 00:54:46', '2017-03-25 00:59:46');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815ca68259015ca682c5810001', '0', '544ee4883dc0b010eed1a4d3b3fbf9d2', 'ocjq', '2017-06-14 20:10:07', '2017-06-14 20:15:07');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815d357201015d357294370001', '0', 'd4311a7acd2dd295938e1441215d3be9', '9jub', '2017-07-12 14:18:07', '2017-07-12 14:23:07');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815d35947f015d3595fa610001', '0', '3447f71c749205b18dfc708a6ac57887', 'iyu1', '2017-07-12 14:56:47', '2017-07-12 15:01:47');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815de66330015de66370d50001', '0', '50f45daff4be7556ec3f996a1078c580', 'a85q', '2017-08-15 22:54:23', '2017-08-15 22:59:23');
INSERT INTO `t_temp_verifycode` VALUES ('4028ad815de66330015de69fa6800005', '0', '50c7ebbbc8cfdc76e70e114aa1b081cc', 'u0b1', '2017-08-16 00:00:09', '2017-08-16 00:05:09');

-- ----------------------------
-- Table structure for t_usage_record
-- ----------------------------
DROP TABLE IF EXISTS `t_usage_record`;
CREATE TABLE `t_usage_record` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `security_code` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `factory_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '查询商家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_usage_record
-- ----------------------------
INSERT INTO `t_usage_record` VALUES ('4028ad815a9d2eaf015a9d4768e7002a', '2017030510005', '2017-03-05 15:03:07', '4028ad815a9d2eaf015a9d3c8eb2000d');
INSERT INTO `t_usage_record` VALUES ('4028ad815a9d2eaf015a9d47c29e002b', '2017030510005', '2017-03-05 15:03:30', '4028ad815a9d2eaf015a9d3c8eb2000d');
INSERT INTO `t_usage_record` VALUES ('4028ad815aa71389015aa77264d40009', '1234567890', '2017-03-07 14:26:16', '4028ad815a9c1569015a9c175d410002');
DROP TRIGGER IF EXISTS `t_create_on_log_payment`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_log_payment` BEFORE INSERT ON `log_payment` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_log_payment`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_log_payment` BEFORE UPDATE ON `log_payment` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_sys_module`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_sys_module` BEFORE INSERT ON `sys_module` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_sys_module`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_sys_module` BEFORE UPDATE ON `sys_module` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_sys_modulerole`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_sys_modulerole` BEFORE INSERT ON `sys_modulerole` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_sys_modulerole`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_sys_modulerole` BEFORE UPDATE ON `sys_modulerole` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_sys_role`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_sys_role` BEFORE INSERT ON `sys_role` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_sys_role`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_sys_role` BEFORE UPDATE ON `sys_role` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_sys_user`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_sys_user` BEFORE INSERT ON `sys_user` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_sys_user`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_sys_user` BEFORE UPDATE ON `sys_user` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_sys_userrole`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_sys_userrole` BEFORE INSERT ON `sys_userrole` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_sys_userrole`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_sys_userrole` BEFORE UPDATE ON `sys_userrole` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_ad`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_ad` BEFORE INSERT ON `t_ad` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_ad`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_ad` BEFORE UPDATE ON `t_ad` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_area`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_area` BEFORE INSERT ON `t_area` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_area`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_area` BEFORE UPDATE ON `t_area` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_bill`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_bill` BEFORE INSERT ON `t_bill` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_bill`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_bill` BEFORE UPDATE ON `t_bill` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_bill_detail`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_bill_detail` BEFORE INSERT ON `t_bill_detail` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_bill_detail`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_bill_detail` BEFORE UPDATE ON `t_bill_detail` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_bookform`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_bookform` BEFORE INSERT ON `t_bookform` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_bookform`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_bookform` BEFORE UPDATE ON `t_bookform` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_bookform_detail`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_bookform_detail` BEFORE INSERT ON `t_bookform_detail` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_bookform_detail`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_bookform_detail` BEFORE UPDATE ON `t_bookform_detail` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_cart`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_cart` BEFORE INSERT ON `t_cart` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_cart`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_cart` BEFORE UPDATE ON `t_cart` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_express_fee`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_express_fee` BEFORE INSERT ON `t_express_fee` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_express_fee`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_express_fee` BEFORE UPDATE ON `t_express_fee` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_factory`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_factory` BEFORE INSERT ON `t_factory` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_factory`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_factory` BEFORE UPDATE ON `t_factory` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_factory_user`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_factory_user` BEFORE INSERT ON `t_factory_user` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_factory_user`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_factory_user` BEFORE UPDATE ON `t_factory_user` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_product`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_product` BEFORE INSERT ON `t_product` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_product`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_product` BEFORE UPDATE ON `t_product` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_product_brand`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_product_brand` BEFORE INSERT ON `t_product_brand` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_product_brand`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_product_brand` BEFORE UPDATE ON `t_product_brand` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_product_item`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_product_item` BEFORE INSERT ON `t_product_item` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_product_item`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_product_item` BEFORE UPDATE ON `t_product_item` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_score`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_score` BEFORE INSERT ON `t_score` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_score`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_score` BEFORE UPDATE ON `t_score` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_sms`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_sms` BEFORE INSERT ON `t_sms` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_sms`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_sms` BEFORE UPDATE ON `t_sms` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_stock_record`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_stock_record` BEFORE INSERT ON `t_stock_record` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
SET new.update_time = SYSDATE();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_update_on_stock_record`;
DELIMITER ;;
CREATE TRIGGER `t_update_on_stock_record` BEFORE UPDATE ON `t_stock_record` FOR EACH ROW SET new.update_time = SYSDATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_create_on_usage_record`;
DELIMITER ;;
CREATE TRIGGER `t_create_on_usage_record` BEFORE INSERT ON `t_usage_record` FOR EACH ROW BEGIN
SET new.create_time = SYSDATE();
END
;;
DELIMITER ;
