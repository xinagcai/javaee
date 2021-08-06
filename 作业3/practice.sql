/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : practice

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-12-24 12:03:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '/', null, '1', '所有', '');
INSERT INTO `menu` VALUES ('2', '/home', '1', '1', '所有管理', 'Home');
INSERT INTO `menu` VALUES ('3', '/db/**', '2', '1', '成绩管理', 'Score');
INSERT INTO `menu` VALUES ('4', '/admin/**', '2', '1', '基本信息', 'Information');
INSERT INTO `menu` VALUES ('5', '/student/**', '2', '1', '学生管理', 'Student');
INSERT INTO `menu` VALUES ('6', '/home', '1', '1', '权限管理', 'Home');
INSERT INTO `menu` VALUES ('7', '/user/**', '6', '1', '用户管理', 'UserManage');

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('1', '3', '1');
INSERT INTO `menu_role` VALUES ('2', '4', '2');
INSERT INTO `menu_role` VALUES ('3', '5', '3');
INSERT INTO `menu_role` VALUES ('4', '7', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nameZh` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ROLE_dba', '数据库管理员');
INSERT INTO `role` VALUES ('2', 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES ('3', 'ROLE_user', '用户');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '徐昊', '23', '男');
INSERT INTO `student` VALUES ('9', '王二狗', '23', '男');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `ethnic` varchar(255) DEFAULT NULL,
  `nativePlace` varchar(255) DEFAULT NULL,
  `certificate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `diploma` varchar(255) DEFAULT NULL,
  `schoolOfGraduation` varchar(255) DEFAULT NULL,
  `timeOfGraduation` varchar(255) DEFAULT NULL,
  `positions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `clazz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '徐昊', '22', '男', '车辆工程', '金融系', '计算机学院', '1988-06-30T15:00:00.000Z', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('2', '王泰迪', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021808', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('9', '王二狗', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('14', '王三狗', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('16', '李贵宾', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川德阳', '先进教师', '博士', '清华大学', '2013.09', '教师', '算法设计', '118230202');
INSERT INTO `teacher` VALUES ('17', '李贵宾', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川德阳', '先进教师', '博士', '清华大学', '2013.09', '教师', '算法设计', '118230202');
INSERT INTO `teacher` VALUES ('18', '王泰迪', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('19', '王二狗', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('20', '王三狗', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('21', '王泰迪', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('22', '王二狗', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('23', '王三狗', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('24', '王泰迪', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');
INSERT INTO `teacher` VALUES ('25', '王二狗', '23', '男', '软件工程', '计算机', '人工智能学院', '1988.2', '6000.00', '13508021992', '1298842198@qq.com', '重庆市渝北区普福大道459号', '汉族', '四川成都', '先进教师', '博士', '清华大学', '2013.09', '教师', 'JAVAEE', '118230202');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'userID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '超级管理员', '18568887789', '029-82881234', '哈尔滨', '1', 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', null);
INSERT INTO `user` VALUES ('2', '徐昊', '18568123489', '029-82123434', '重庆', '1', 'xuhao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', null);
INSERT INTO `user` VALUES ('3', '老王', '18568123666', '029-82111555', '广州', '1', 'laowang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', null);
INSERT INTO `user` VALUES ('8', '老张', null, null, null, '1', 'laozhang', '$2a$10$lv5kCzOsIVXVrYSOxykyGOUPpW.AIJ9.rAIVk6EJ6nxOyFGVmC0Zq', null);
INSERT INTO `user` VALUES ('9', '老李', null, null, null, '0', 'laoli', '$2a$10$s3.qcTY9tw9egA.UoyBZ8Oyi6.NVAW84P6mN.A8wcgzXJQho.Ck9i', null);
INSERT INTO `user` VALUES ('10', '小程', null, null, null, '1', 'xiaocheng', '$2a$10$9WvViONP7a.VcId3ktgg.Odj.WJExpc./j/eSNv2bSa8nArwfGGY2', null);
INSERT INTO `user` VALUES ('11', '哈哈哈', null, null, null, '1', 'hhh', '$2a$10$30.wi4mGO6.wWgG2TEVw/O5glfMG1TWpgeEi7xK5Y5GvrQglQlH86', null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '1', '2');
INSERT INTO `user_role` VALUES ('3', '2', '2');
INSERT INTO `user_role` VALUES ('4', '3', '3');
INSERT INTO `user_role` VALUES ('5', '1', '3');
