/*
 Navicat Premium Data Transfer

 Source Server         : LocalMySQL
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : gd_email_server

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 27/04/2018 00:46:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for email_code
-- ----------------------------
DROP TABLE IF EXISTS `email_code`;
CREATE TABLE `email_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '邮箱验证表主键id',
  `email` varchar(50) NOT NULL COMMENT '邮箱号',
  `code` varchar(10) NOT NULL COMMENT '邮箱验证码',
  `generate_time` datetime NOT NULL COMMENT '生成时间',
  `expiration_time` datetime NOT NULL COMMENT '过期时间',
  `status` tinyint(4) NOT NULL COMMENT '状态：0（发送失败），1（发送成功但未使用），2（发送成功并已经使用）',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `last_modified_time` datetime NOT NULL COMMENT '最近修改时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

SET FOREIGN_KEY_CHECKS = 1;
