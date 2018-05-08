/*
Navicat MySQL Data Transfer

Source Server         : mysqlconnect
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : test1

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-05-08 17:06:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dianpu
-- ----------------------------
DROP TABLE IF EXISTS `dianpu`;
CREATE TABLE `dianpu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `huodong` text,
  `yueshou` int(11) DEFAULT NULL,
  `img` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dianpu
-- ----------------------------
INSERT INTO `dianpu` VALUES ('1', '一食堂烤肉饭', '欢迎光临', '400', 'dianpu_img/1.png');
INSERT INTO `dianpu` VALUES ('2', '二食堂美味干锅', '打折促销', '500', 'dianpu_img/2.png');
INSERT INTO `dianpu` VALUES ('3', '三食堂甜点小吃', '打折促销', '600', '1.jpg');

-- ----------------------------
-- Table structure for shangpin_left_1
-- ----------------------------
DROP TABLE IF EXISTS `shangpin_left_1`;
CREATE TABLE `shangpin_left_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shangpin_left_1
-- ----------------------------
INSERT INTO `shangpin_left_1` VALUES ('1', '营养套餐');
INSERT INTO `shangpin_left_1` VALUES ('2', '美味快餐');
INSERT INTO `shangpin_left_1` VALUES ('3', '可口饮料');

-- ----------------------------
-- Table structure for shangpin_left_2
-- ----------------------------
DROP TABLE IF EXISTS `shangpin_left_2`;
CREATE TABLE `shangpin_left_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shangpin_left_2
-- ----------------------------
INSERT INTO `shangpin_left_2` VALUES ('1', '可口饮料');
INSERT INTO `shangpin_left_2` VALUES ('2', '可口饮料');
INSERT INTO `shangpin_left_2` VALUES ('3', '可口饮料');

-- ----------------------------
-- Table structure for shangpin_left_3
-- ----------------------------
DROP TABLE IF EXISTS `shangpin_left_3`;
CREATE TABLE `shangpin_left_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shangpin_left_3
-- ----------------------------
INSERT INTO `shangpin_left_3` VALUES ('1', '限时促销');
INSERT INTO `shangpin_left_3` VALUES ('2', '可口饮料');
INSERT INTO `shangpin_left_3` VALUES ('3', '快乐食间');

-- ----------------------------
-- Table structure for shangpin_right_1
-- ----------------------------
DROP TABLE IF EXISTS `shangpin_right_1`;
CREATE TABLE `shangpin_right_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id1` int(11) DEFAULT NULL,
  `name` text,
  `leixin` text,
  `price` int(11) DEFAULT NULL,
  `img` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shangpin_right_1
-- ----------------------------
INSERT INTO `shangpin_right_1` VALUES ('1', '3', '宫爆鸡丁3', '家常菜3', '18', 'img/pic.png');
INSERT INTO `shangpin_right_1` VALUES ('2', '2', '宫爆鸡丁1', '家常菜1', '18', 'img/pic.png');
INSERT INTO `shangpin_right_1` VALUES ('3', '2', '宫爆鸡丁2', '家常菜2', '18', 'img/pic.png');
INSERT INTO `shangpin_right_1` VALUES ('4', '1', '辣子鸡丁', '家常菜0', '25', 'img/pic.png');

-- ----------------------------
-- Table structure for shangpin_right_2
-- ----------------------------
DROP TABLE IF EXISTS `shangpin_right_2`;
CREATE TABLE `shangpin_right_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id1` int(11) DEFAULT NULL,
  `name` text,
  `leixin` text,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shangpin_right_2
-- ----------------------------

-- ----------------------------
-- Table structure for shangpin_right_3
-- ----------------------------
DROP TABLE IF EXISTS `shangpin_right_3`;
CREATE TABLE `shangpin_right_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id1` int(11) DEFAULT NULL,
  `name` text,
  `leixin` text,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shangpin_right_3
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` text,
  `name` text,
  `sex` text,
  `addr` text,
  `tel` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('133', 'oz5T8054SPLNQfkeIxsnktAgktYw', '温英润璃泽', '男', '重邮移通', '18083038806');
INSERT INTO `userinfo` VALUES ('135', 'oz5T80wGYkjfZIykJWfyrU1BpJfk', '王建东', '男', '重庆大学A区', '13002341389');
INSERT INTO `userinfo` VALUES ('136', 'oz5T80wPEknaQQGNr0YGMfO3DdUc', '假哲学', '未知', '未知', '未知');
INSERT INTO `userinfo` VALUES ('137', 'null', null, null, null, null);
