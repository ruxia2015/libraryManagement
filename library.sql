/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50630
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2019-12-10 13:44:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` int(255) DEFAULT NULL COMMENT '国际标准图书编码',
  `bookName` varchar(255) NOT NULL COMMENT '图书名称',
  `bookSynopsis` varchar(255) DEFAULT NULL COMMENT '图书简介',
  `bookAuthor` varchar(255) DEFAULT NULL COMMENT '作者',
  `booksParticulars` varchar(255) DEFAULT NULL COMMENT '图书详情',
  `bookType` varchar(255) DEFAULT NULL COMMENT '图书类型',
  `bookPicture` varchar(255) DEFAULT NULL COMMENT '封面',
  `bookPrice` double DEFAULT NULL COMMENT '价格',
  `caerteDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `bookTotal` int(255) DEFAULT NULL COMMENT '书的总数量',
  `bookQuantity` int(255) DEFAULT NULL COMMENT '可以借的数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', '123', '骆驼祥子', '车夫祥子。。。', '老舍', '此书为老舍经典著作之一，也是必读名著。。。', '文学', 'E:\\图书馆图片\\骆驼祥子.jpg', '69.8', '2019-12-05 17:27:53', '2019-12-05 17:28:03', '10', '5');
INSERT INTO `books` VALUES ('2', '1234', '西游记', '唐僧和3大徒弟前往西天取经。。。', '吴承恩', '此书为中国四大名著之一', '文学', null, '99.8', '2019-12-09 14:07:37', null, '50', '0');
INSERT INTO `books` VALUES ('3', '12345', '三国演义', '曹操、刘备、孙权争天下。。。', '罗贯中', '此书为中国四大名著之一', '文学', null, '99.8', '2019-12-09 14:10:01', null, '50', '20');
INSERT INTO `books` VALUES ('4', '123456', '水浒传', '以宋江领导的起义军为主要题材，通过一系列梁山英雄反抗压迫、英勇斗争的生动故事', '施耐庵', '此书为中国四大名著之一', '文学', null, '99.8', '2019-12-09 14:11:27', null, '50', '50');
INSERT INTO `books` VALUES ('5', '1234567', '红楼梦', '贾宝玉、林黛玉、薛宝钗三个人之间的感情纠葛为主线通过对一些日常事件的描述体现了在贾府的大观园中以金陵十二钗为主体的众女子的爱恨情愁。', '曹雪芹', '此书为中国四大名著之一', '文学', null, '99.8', '2019-12-09 14:13:18', null, '50', '40');

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookTypeName` varchar(255) DEFAULT NULL COMMENT '图书类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_type
-- ----------------------------
INSERT INTO `book_type` VALUES ('1', '文学');
INSERT INTO `book_type` VALUES ('2', '艺术');
INSERT INTO `book_type` VALUES ('3', '动漫/幽默');
INSERT INTO `book_type` VALUES ('4', '教程');
INSERT INTO `book_type` VALUES ('5', '小说');
INSERT INTO `book_type` VALUES ('6', '旅游');
INSERT INTO `book_type` VALUES ('7', '娱乐时尚');
INSERT INTO `book_type` VALUES ('8', '生活');
INSERT INTO `book_type` VALUES ('9', '地理');
INSERT INTO `book_type` VALUES ('10', '育儿/成长');
INSERT INTO `book_type` VALUES ('11', '保健/心理健康');
INSERT INTO `book_type` VALUES ('12', '体育');
INSERT INTO `book_type` VALUES ('13', '自我实现/励志');
INSERT INTO `book_type` VALUES ('14', '管理');
INSERT INTO `book_type` VALUES ('15', '经济');
INSERT INTO `book_type` VALUES ('16', '法律');
INSERT INTO `book_type` VALUES ('17', '政治/军事');
INSERT INTO `book_type` VALUES ('18', '青春');
INSERT INTO `book_type` VALUES ('19', '婚恋');

-- ----------------------------
-- Table structure for book_users
-- ----------------------------
DROP TABLE IF EXISTS `book_users`;
CREATE TABLE `book_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_users
-- ----------------------------
INSERT INTO `book_users` VALUES ('1', '张三', '123456', null, null, null);
INSERT INTO `book_users` VALUES ('2', 'abc', '123', null, null, null);
INSERT INTO `book_users` VALUES ('3', '1', '1', '1', null, null);
INSERT INTO `book_users` VALUES ('5', '2', '2', '2', '2019-11-28 17:11:34', null);
INSERT INTO `book_users` VALUES ('6', '12', '1', '3', '2019-11-28 17:44:18', null);
INSERT INTO `book_users` VALUES ('7', 'qqw', '1', '3', '2019-11-28 17:45:41', null);
INSERT INTO `book_users` VALUES ('8', '3', '1', '', '2019-11-29 09:21:04', null);
INSERT INTO `book_users` VALUES ('9', '34', '4', '5', '2019-11-29 09:21:26', null);
INSERT INTO `book_users` VALUES ('10', '5', '5', '', '2019-11-29 09:22:55', null);
INSERT INTO `book_users` VALUES ('11', '6', '6', '', '2019-11-29 09:27:23', null);
INSERT INTO `book_users` VALUES ('12', '7', '7', '7', '2019-11-29 10:06:05', null);
INSERT INTO `book_users` VALUES ('14', '8', '8', '8', '2019-11-29 10:13:09', null);
INSERT INTO `book_users` VALUES ('15', '123', '1', '1', '2019-11-29 11:16:48', null);
INSERT INTO `book_users` VALUES ('16', '333', '2', '1', '2019-11-29 11:33:06', null);
INSERT INTO `book_users` VALUES ('17', '3334', '1', '4', '2019-11-29 11:37:44', null);

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL,
  `bookName` varchar(255) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `returnDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('1', null, ' 张三', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-11 00:00:00');
INSERT INTO `borrow` VALUES ('2', null, ' 1', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-17 00:00:00');
INSERT INTO `borrow` VALUES ('3', null, ' 1', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-17 00:00:00');
INSERT INTO `borrow` VALUES ('4', null, ' 1', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-17 00:00:00');
INSERT INTO `borrow` VALUES ('5', null, ' 1', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-17 00:00:00');
INSERT INTO `borrow` VALUES ('6', null, ' 1', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-17 00:00:00');
INSERT INTO `borrow` VALUES ('7', null, ' 张三', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-11 00:00:00');
INSERT INTO `borrow` VALUES ('8', null, ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00');
INSERT INTO `borrow` VALUES ('9', null, ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00');
INSERT INTO `borrow` VALUES ('10', null, ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00');
INSERT INTO `borrow` VALUES ('11', null, ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00');
INSERT INTO `borrow` VALUES ('12', null, ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00');
INSERT INTO `borrow` VALUES ('13', null, ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00');
INSERT INTO `borrow` VALUES ('14', null, ' 1', null, '水浒传', '1', '2019-12-09 00:00:00', null, '2019-12-19 00:00:00');

-- ----------------------------
-- Table structure for librarian
-- ----------------------------
DROP TABLE IF EXISTS `librarian`;
CREATE TABLE `librarian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of librarian
-- ----------------------------
