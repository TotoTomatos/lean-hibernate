/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80100
 Source Host           : localhost:3306
 Source Schema         : lean-hibernate

 Target Server Type    : MySQL
 Target Server Version : 80100
 File Encoding         : 65001

 Date: 29/05/2024 15:43:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章内容',
  `author_id` int NULL DEFAULT NULL COMMENT '所属作者id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_author_id`(`author_id` ASC) USING BTREE,
  CONSTRAINT `fk_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'hellowarticle', 1);
INSERT INTO `article` VALUES (2, 'nothello', 2);
INSERT INTO `article` VALUES (3, '帅', 2);

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES (1, '123', 'admin');
INSERT INTO `author` VALUES (2, '321', 'user');

-- ----------------------------
-- Table structure for author_details
-- ----------------------------
DROP TABLE IF EXISTS `author_details`;
CREATE TABLE `author_details`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生日',
  `gender` enum('男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `author_id` int NULL DEFAULT NULL COMMENT '作者id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_detail_author_id`(`author_id` ASC) USING BTREE,
  CONSTRAINT `fk_detail_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of author_details
-- ----------------------------
INSERT INTO `author_details` VALUES (1, '2024-5-1', '男', 13, 'xv', 1);
INSERT INTO `author_details` VALUES (2, '2020-3-4', '女', 12, 'cheng', 2);

SET FOREIGN_KEY_CHECKS = 1;
