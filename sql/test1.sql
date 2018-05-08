/*
Navicat MySQL Data Transfer

Source Server         : mysqlconnect
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : test1

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-04-12 17:29:05
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dianpu
-- ----------------------------
INSERT INTO `dianpu` VALUES ('1', '肯德基', '打折促销', '500', '1.jpg');
INSERT INTO `dianpu` VALUES ('2', '肯德基', '打折促销', '500', '1.jpg');
INSERT INTO `dianpu` VALUES ('3', '肯德基', '打折促销', '500', '1.jpg');
INSERT INTO `dianpu` VALUES ('4', '肯德基', '打折促销', '500', '1.jpg');
INSERT INTO `dianpu` VALUES ('5', '肯德基', '打折促销', '500', '1.jpg');

-- ----------------------------
-- Table structure for shangpin_left_1
-- ----------------------------
DROP TABLE IF EXISTS `shangpin_left_1`;
CREATE TABLE `shangpin_left_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shangpin_left_1
-- ----------------------------
INSERT INTO `shangpin_left_1` VALUES ('1', '营养套餐');
INSERT INTO `shangpin_left_1` VALUES ('2', '美味快餐');
INSERT INTO `shangpin_left_1` VALUES ('4', '可口饮料');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shangpin_right_1
-- ----------------------------
INSERT INTO `shangpin_right_1` VALUES ('1', '3', '宫爆鸡丁3', '家常菜', '18', 'img/pic.png');
INSERT INTO `shangpin_right_1` VALUES ('2', '2', '宫爆鸡丁1', '家常菜', '18', 'img/pic.png');
INSERT INTO `shangpin_right_1` VALUES ('3', '2', '宫爆鸡丁2', '家常菜', '18', 'img/pic.png');

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
