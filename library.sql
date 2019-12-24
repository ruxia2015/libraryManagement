/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50630
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2019-12-24 09:39:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookIsbn` varchar(255) DEFAULT NULL COMMENT '国际标准图书编码',
  `bookName` varchar(255) NOT NULL COMMENT '图书名称',
  `bookAuthor` varchar(255) DEFAULT NULL COMMENT '作者',
  `bookParticulars` varchar(255) DEFAULT NULL COMMENT '图书详情',
  `bookTypeId` int(255) DEFAULT NULL COMMENT '图书类型',
  `bookPicture` varchar(255) DEFAULT NULL COMMENT '封面',
  `bookPrice` double DEFAULT NULL COMMENT '价格',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `bookTotal` int(255) DEFAULT NULL COMMENT '书的总数量',
  `bookQuantity` int(255) DEFAULT NULL COMMENT '可以借的数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('2', '1234', '西游记', '吴承恩', '此书为中国四大名著之一', '1', 'image/西游记.jpg', '99.8', '2019-12-09 14:07:37', '2019-12-20 10:52:05', '50', '0');
INSERT INTO `books` VALUES ('3', '12345', '三国演义', '罗贯中', '此书为中国四大名著之一', '1', 'image/三国演义.jpg', '99.8', '2019-12-09 14:10:01', '2019-12-20 15:13:42', '50', '18');
INSERT INTO `books` VALUES ('4', '123456', '水浒传', '施耐庵', '此书为中国四大名著之一', '1', null, '99.8', '2019-12-09 14:11:27', null, '50', '46');
INSERT INTO `books` VALUES ('5', '1234567', '红楼梦', '曹雪芹', '此书为中国四大名著之一', '1', null, '99.8', '2019-12-09 14:13:18', null, '50', '35');
INSERT INTO `books` VALUES ('6', '7', '7', null, '7', '5', '7', '7', '2019-12-11 11:46:22', null, '7', '7');
INSERT INTO `books` VALUES ('7', '8', '8', null, '8', '4', '2.png', '8', '2019-12-11 14:07:43', null, '8', '8');
INSERT INTO `books` VALUES ('8', '2', '2', null, '2.png', '5', null, '2', '2019-12-11 17:06:05', null, '2', '2');
INSERT INTO `books` VALUES ('9', '22', '22', '22', '22', '6', '2.png', '22', '2019-12-11 17:17:06', null, '22', '22');
INSERT INTO `books` VALUES ('10', '33', '33', '33', '33', '7', 'file', '33', '2019-12-11 17:24:15', null, '33', '33');
INSERT INTO `books` VALUES ('11', '44', '44', '44', '44', '8', 'E:/项目图片/timg.jpg', '44', '2019-12-11 17:35:45', null, '44', '44');
INSERT INTO `books` VALUES ('12', '55', '55', '55', '55', '9', 'E:\\项目图片\\timg.jpg', '55', '2019-12-11 17:37:28', null, '55', '55');
INSERT INTO `books` VALUES ('13', '77', '77', '77', '77', '10', 'E:\\项目图片\\timg.jpg', '77', '2019-12-11 17:41:36', null, '77', '77');
INSERT INTO `books` VALUES ('14', '888', '888', '888', '888', '11', 'E:\\项目图片\\timg.jpg', '888', '2019-12-12 09:18:43', null, '888', '888');
INSERT INTO `books` VALUES ('15', '444', '444', '444', '444', '12', '\\timg.jpg', '444', '2019-12-12 09:52:11', null, '444', '444');
INSERT INTO `books` VALUES ('16', '999', '999', '999', '999', '13', '\\timg.jpg', '999', '2019-12-12 09:53:58', null, '999', '999');
INSERT INTO `books` VALUES ('17', '54', '54', '54', '54', '14', '\\timg.jpg', '54', '2019-12-12 09:55:40', null, '54', '54');
INSERT INTO `books` VALUES ('18', '97', '97', '97', '97', '15', '/G:/develop/git/libraryManagement/target/library-1.0-SNAPSHOT/WEB-INF/classes/\\timg.jpg', '97', '2019-12-12 10:15:36', null, '97', '97');
INSERT INTO `books` VALUES ('19', '63', '63', '63', '63', '16', '/G:/develop/git/libraryManagement/target/library-1.0-SNAPSHOT/WEB-INF/classes/statics\\imagetimg.jpg', '63', '2019-12-12 10:23:54', null, '63', '63');
INSERT INTO `books` VALUES ('20', '84', '84', '84', '84', '17', '/G:/develop/git/libraryManagement/target/library-1.0-SNAPSHOT/WEB-INF/classes/statics/image/timg.jpg', '84', '2019-12-12 10:25:37', null, '84', '84');
INSERT INTO `books` VALUES ('21', '321', '321', '321', '321', '18', '/image/timg.jpg', '321', '2019-12-12 10:35:37', null, '321', '31');
INSERT INTO `books` VALUES ('24', '9', '09', '09', '09', '19', 'image/', '98', '2019-12-12 12:00:19', '2019-12-12 17:22:23', '97', '98');
INSERT INTO `books` VALUES ('25', '9999', '9988', '9988', '9988', '20', 'image/骆驼祥子.jpg', '9999', '2019-12-12 17:05:30', '2019-12-13 09:47:33', '9999', '9998');
INSERT INTO `books` VALUES ('26', '88888', '8888', '8888', '8', '1', 'image/默认.jpg', '888', '2019-12-13 09:45:49', '2019-12-13 09:54:30', '88', '88');
INSERT INTO `books` VALUES ('27', 'd', 'd', 'd', 'd', null, 'image/默认.jpg', '4', '2019-12-17 16:13:56', null, '4', '4');
INSERT INTO `books` VALUES ('28', 'x', 'x', '西西', 'x', '5', null, '6', null, null, '6', '6');
INSERT INTO `books` VALUES ('29', 'krrj-lx999', '狂人日记', '鲁迅', 'we', null, 'image/默认.jpg', '99.9', '2019-12-23 11:13:53', null, '999', '98');

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookTypeName` varchar(255) DEFAULT NULL COMMENT '图书类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

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
INSERT INTO `book_type` VALUES ('20', '其它');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_users
-- ----------------------------
INSERT INTO `book_users` VALUES ('1', '张三', '123456', null, null, null);
INSERT INTO `book_users` VALUES ('2', 'abc', '123', null, null, null);
INSERT INTO `book_users` VALUES ('3', '1', '1', '1', null, null);
INSERT INTO `book_users` VALUES ('5', '2', '2222', '2', '2019-11-28 17:11:34', null);
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
INSERT INTO `book_users` VALUES ('18', '9', '9999', '9999', '2019-12-19 17:07:30', null);
INSERT INTO `book_users` VALUES ('19', '99', '99999', '9999', '2019-12-19 17:11:32', null);

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
  `overdue` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('1', '1', ' 张三', null, '骆驼祥子', '1', '2019-12-09 00:00:00', '2019-12-20 11:03:33', '2019-12-11 00:00:00', null);
INSERT INTO `borrow` VALUES ('2', '2', ' 1', null, '骆驼祥子', '1', '2019-12-09 00:00:00', '2019-12-20 14:18:43', '2019-12-17 00:00:00', null);
INSERT INTO `borrow` VALUES ('3', '3', ' 1', null, '骆驼祥子', '1', '2019-12-09 00:00:00', '2019-12-20 15:53:13', '2019-12-17 00:00:00', null);
INSERT INTO `borrow` VALUES ('4', '3', ' 1', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-17 00:00:00', null);
INSERT INTO `borrow` VALUES ('5', '4', ' 1', null, '骆驼祥子', '1', '2019-12-09 00:00:00', '2019-12-20 14:18:26', '2019-12-17 00:00:00', null);
INSERT INTO `borrow` VALUES ('6', '2', ' 1', null, '骆驼祥子', '1', '2019-12-09 00:00:00', '2019-12-20 16:26:11', '2019-12-17 00:00:00', null);
INSERT INTO `borrow` VALUES ('7', '1', ' 张三', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-11 00:00:00', null);
INSERT INTO `borrow` VALUES ('8', '7', ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00', null);
INSERT INTO `borrow` VALUES ('9', '8', ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00', null);
INSERT INTO `borrow` VALUES ('10', '9', ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', '2019-12-24 09:23:28', '2019-12-26 00:00:00', '0');
INSERT INTO `borrow` VALUES ('11', '1', ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00', null);
INSERT INTO `borrow` VALUES ('12', '2', ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00', null);
INSERT INTO `borrow` VALUES ('13', '3', ' 2', null, '骆驼祥子', '1', '2019-12-09 00:00:00', null, '2019-12-26 00:00:00', null);
INSERT INTO `borrow` VALUES ('14', '2', ' 1', null, '水浒传', '1', '2019-12-09 00:00:00', null, '2019-12-19 00:00:00', null);
INSERT INTO `borrow` VALUES ('15', '5', '2', null, '三国演义', '1', '2019-12-10 00:00:00', '2019-12-24 09:20:56', '2019-12-19 00:00:00', '1');
INSERT INTO `borrow` VALUES ('16', '6', '2', null, '水浒传', '1', '2019-12-10 00:00:00', null, '2019-12-20 00:00:00', null);
INSERT INTO `borrow` VALUES ('17', '16', '333', '4', '水浒传', '1', '2019-12-10 00:00:00', null, '2019-12-27 00:00:00', null);
INSERT INTO `borrow` VALUES ('18', '5', '2', '4', '水浒传', '1', '2019-12-10 00:00:00', null, '2019-12-26 00:00:00', null);
INSERT INTO `borrow` VALUES ('19', '5', '2', '5', '红楼梦', '1', '2019-12-10 00:00:00', null, '2019-12-27 00:00:00', null);
INSERT INTO `borrow` VALUES ('20', '5', '2', '5', '红楼梦', '1', '2019-12-10 00:00:00', null, '2019-12-27 00:00:00', null);
INSERT INTO `borrow` VALUES ('21', '5', '2', '5', '红楼梦', '1', '2019-12-10 00:00:00', null, '2019-12-27 00:00:00', null);
INSERT INTO `borrow` VALUES ('22', '5', '2', '5', '红楼梦', '1', '2019-12-10 00:00:00', null, '2019-12-19 00:00:00', null);
INSERT INTO `borrow` VALUES ('23', '5', '2', '4', '水浒传', '1', '2019-12-10 00:00:00', '2019-12-24 09:22:31', '2020-01-04 00:00:00', '0');
INSERT INTO `borrow` VALUES ('24', '5', '2', '1', '骆驼祥子', '1', '2019-12-10 00:00:00', null, '2019-12-28 00:00:00', null);
INSERT INTO `borrow` VALUES ('25', '2', '1', '4', '水浒传', '1', '2019-12-10 00:00:00', null, '2019-12-21 00:00:00', null);
INSERT INTO `borrow` VALUES ('26', '2', '1', '4', '水浒传', '1', '2019-12-11 00:00:00', '2019-12-20 15:11:06', '2019-12-28 00:00:00', null);
INSERT INTO `borrow` VALUES ('27', '5', '2', '25', '9999', '1', '2019-12-12 00:00:00', null, '2019-12-28 00:00:00', null);
INSERT INTO `borrow` VALUES ('28', '3', '1', '3', '三国演义', '1', '2019-12-20 00:00:00', null, '2019-12-27 00:00:00', null);
INSERT INTO `borrow` VALUES ('29', '3', '1', '5', '红楼梦', '1', '2019-12-20 00:00:00', '2019-12-24 09:25:27', '2020-01-20 00:00:00', '1');
INSERT INTO `borrow` VALUES ('30', '3', '1', '5', '红楼梦', '1', '2019-12-24 00:00:00', '2019-12-24 09:27:10', '2020-01-24 00:00:00', '1');
INSERT INTO `borrow` VALUES ('31', '3', '1', '4', '水浒传', '1', '2019-12-24 00:00:00', '2019-12-24 09:34:50', '2020-01-24 00:00:00', '1');
INSERT INTO `borrow` VALUES ('32', '3', '1', '5', '红楼梦', null, '2019-12-24 09:39:08', null, '2020-01-24 09:39:14', null);

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
