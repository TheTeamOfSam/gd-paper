/*
 Navicat Premium Data Transfer

 Source Server         : LocalMySQL
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : gd_music_server1

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 27/04/2018 00:44:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for artist
-- ----------------------------
DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '艺人ID',
  `artist_name` varchar(30) NOT NULL COMMENT '艺人姓名',
  `artist_other_name` varchar(30) NOT NULL COMMENT '艺人别名',
  `intro` varchar(500) NOT NULL COMMENT '艺人简介',
  `artist_head_photo_big` varchar(128) NOT NULL COMMENT '艺人大头像',
  `artist_head_photo_small` varchar(128) NOT NULL COMMENT '艺人小头像',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `last_modified_time` datetime NOT NULL COMMENT '最近修改时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='艺人表';

-- ----------------------------
-- Table structure for like_comment
-- ----------------------------
DROP TABLE IF EXISTS `like_comment`;
CREATE TABLE `like_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '点赞id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `comment_id` bigint(20) NOT NULL COMMENT '评论id',
  `like_time` datetime NOT NULL COMMENT '评论时间',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `last_modified_time` datetime NOT NULL COMMENT '最近修改时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `like_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `like_comment_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `music_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='点赞评论表';

-- ----------------------------
-- Table structure for music
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '歌曲id',
  `music_name` varchar(30) NOT NULL COMMENT '歌曲名',
  `special_id` bigint(20) NOT NULL COMMENT '专辑id，关联到专辑表',
  `music_path` varchar(128) NOT NULL COMMENT '歌曲路径',
  `music_duration` int(11) NOT NULL COMMENT '歌曲时长',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `last_modified_time` datetime NOT NULL COMMENT '最近修改时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `special_id` (`special_id`),
  CONSTRAINT `music_ibfk_1` FOREIGN KEY (`special_id`) REFERENCES `special` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='歌曲表';

-- ----------------------------
-- Table structure for music_comment
-- ----------------------------
DROP TABLE IF EXISTS `music_comment`;
CREATE TABLE `music_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '歌曲评论id',
  `music_id` bigint(20) NOT NULL COMMENT '歌曲id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `comment_content` varchar(150) NOT NULL COMMENT '评论内容',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `last_modified_time` datetime NOT NULL COMMENT '最近修改时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `music_id` (`music_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `music_comment_ibfk_1` FOREIGN KEY (`music_id`) REFERENCES `music` (`id`),
  CONSTRAINT `music_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='歌曲评论表';

-- ----------------------------
-- Table structure for music_in_user_music_list
-- ----------------------------
DROP TABLE IF EXISTS `music_in_user_music_list`;
CREATE TABLE `music_in_user_music_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '歌单内歌曲id',
  `user_music_list_id` bigint(20) NOT NULL COMMENT '用户歌单id，关联到歌单',
  `music_id` bigint(20) NOT NULL COMMENT '歌曲id，关联到歌曲',
  `user_id` bigint(20) NOT NULL COMMENT '用户id，关联到用户',
  `collected_time` datetime NOT NULL COMMENT '收藏时间',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `last_modified_time` datetime NOT NULL COMMENT '最近修改时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `user_music_list_id` (`user_music_list_id`),
  KEY `music_id` (`music_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `music_in_user_music_list_ibfk_1` FOREIGN KEY (`user_music_list_id`) REFERENCES `user_music_list` (`id`),
  CONSTRAINT `music_in_user_music_list_ibfk_2` FOREIGN KEY (`music_id`) REFERENCES `music` (`id`),
  CONSTRAINT `music_in_user_music_list_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户歌单内歌曲表';

-- ----------------------------
-- Table structure for music_list_collection
-- ----------------------------
DROP TABLE IF EXISTS `music_list_collection`;
CREATE TABLE `music_list_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_music_list_id` bigint(20) NOT NULL COMMENT '用户歌单id',
  `collected_time` datetime NOT NULL COMMENT '收藏时间',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `last_modified_time` datetime NOT NULL COMMENT '最近修改时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_music_list_id` (`user_music_list_id`),
  CONSTRAINT `music_list_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `music_list_collection_ibfk_2` FOREIGN KEY (`user_music_list_id`) REFERENCES `user_music_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户收藏的歌单表';

-- ----------------------------
-- Table structure for special
-- ----------------------------
DROP TABLE IF EXISTS `special`;
CREATE TABLE `special` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '专辑id',
  `special_name` varchar(30) NOT NULL COMMENT '专辑名',
  `artist_id` bigint(20) NOT NULL COMMENT '艺人id，关联到艺人表',
  `publish_company` varchar(25) NOT NULL COMMENT '发行公司',
  `publish_time` date NOT NULL COMMENT '发行时间',
  `special_photo` varchar(128) NOT NULL COMMENT '专辑图片',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `last_modified_time` datetime NOT NULL COMMENT '最近修改时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `special_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='专辑表';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `email` varchar(50) NOT NULL COMMENT '用户邮箱',
  `nickname` varchar(20) NOT NULL COMMENT '用户昵称',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `introduction` varchar(150) NOT NULL COMMENT '介绍',
  `sex` tinyint(4) NOT NULL COMMENT '性别：1（男），2（女）',
  `date_of_birth` date NOT NULL COMMENT '出生日期',
  `province` varchar(20) NOT NULL COMMENT '所在省',
  `city` varchar(20) NOT NULL COMMENT '所在市',
  `head_photo` varchar(128) NOT NULL COMMENT '头像',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `last_modified_time` datetime NOT NULL COMMENT '最近修改时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING BTREE COMMENT '用户邮箱的唯一性约束条件'
) ENGINE=InnoDB AUTO_INCREMENT=100004 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Table structure for user_music_list
-- ----------------------------
DROP TABLE IF EXISTS `user_music_list`;
CREATE TABLE `user_music_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户歌单表主键id',
  `music_list_name` varchar(30) NOT NULL COMMENT '歌单名',
  `user_id` bigint(20) NOT NULL COMMENT '用户id，关联到用户表',
  `intro` varchar(150) NOT NULL COMMENT '简介',
  `generate_time` datetime NOT NULL COMMENT '歌单创建时间',
  `music_list_photo` varchar(128) NOT NULL COMMENT '歌单图片',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `last_modified_time` datetime NOT NULL COMMENT '最近修改时间',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_music_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户歌单表';

SET FOREIGN_KEY_CHECKS = 1;
