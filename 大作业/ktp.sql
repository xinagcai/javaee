/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : ktp

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-12-24 11:38:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `tno` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cm_date` datetime NOT NULL,
  PRIMARY KEY (`tno`,`uid`,`cm_date`),
  KEY `uid` (`uid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`tno`) REFERENCES `task` (`tno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('0094bb', '18847da7', '我也来啦', '2020-12-03 16:56:37');
INSERT INTO `comment` VALUES ('0094bb', '207b0043', '沙发', '2020-11-19 11:58:01');
INSERT INTO `comment` VALUES ('0094bb', '207b0043', '我觉得非常不错！', '2020-11-30 17:20:02');
INSERT INTO `comment` VALUES ('0094bb', '207b0043', 'djksfj \njisodjf\ndsjf', '2020-12-02 11:59:08');
INSERT INTO `comment` VALUES ('2d9513', '18847da7', '哈哈哈哈', '2020-11-06 12:33:14');
INSERT INTO `comment` VALUES ('2d9513', '18847da7', '哒哒哒', '2020-11-06 12:33:20');
INSERT INTO `comment` VALUES ('2d9513', '18847da7', '哈哈哈哈', '2020-11-06 12:33:30');
INSERT INTO `comment` VALUES ('2d9513', '18847da7', '嘻嘻', '2020-11-06 12:37:33');
INSERT INTO `comment` VALUES ('64aaf6', '18847da7', '啦啦啦啦啦', '2020-12-03 15:57:44');
INSERT INTO `comment` VALUES ('64aaf6', '18847da7', 'hhh', '2020-12-03 16:13:55');
INSERT INTO `comment` VALUES ('64aaf6', '18847da7', 'hhhh1', '2020-12-03 16:20:01');
INSERT INTO `comment` VALUES ('7b041e', '207b0043', 'hhhhh', '2020-12-15 08:53:01');
INSERT INTO `comment` VALUES ('96cd31', '18847da7', '不错不错，神清气爽', '2020-11-04 03:44:54');
INSERT INTO `comment` VALUES ('96cd31', 'c59e5462', '大家今天感觉如何？？？', '2020-11-04 03:44:10');
INSERT INTO `comment` VALUES ('9f9087', '18847da7', '哈哈哈哈', '2020-11-07 03:07:05');
INSERT INTO `comment` VALUES ('9f9087', '18847da7', '啦啦啦啦', '2020-11-07 03:07:11');
INSERT INTO `comment` VALUES ('9f9087', '18847da7', '我想留言', '2020-11-07 03:07:16');
INSERT INTO `comment` VALUES ('9f9087', '18847da7', '我要留言', '2020-11-07 03:07:24');
INSERT INTO `comment` VALUES ('9f9087', '18847da7', '哒哒哒', '2020-11-07 03:07:30');
INSERT INTO `comment` VALUES ('9f9087', '18847da7', '留言快乐', '2020-11-07 03:07:37');
INSERT INTO `comment` VALUES ('e02192', '207b0043', '哈哈哈哈', '2020-12-02 16:50:03');
INSERT INTO `comment` VALUES ('ec7fe9', '18847da7', '啦啦啦啦啦', '2020-12-07 15:04:16');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cno` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程号',
  `cname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
  `admin` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `school_year` char(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学年(例2019-2020)',
  `semester` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学期',
  `snum` int(4) NOT NULL COMMENT '成员数量(学生)',
  `archive` int(1) NOT NULL COMMENT '归档状态',
  `cdelete` int(1) NOT NULL COMMENT '删除状态',
  PRIMARY KEY (`cno`),
  KEY `admin` (`admin`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('0c72d', '人类一败涂地', '207b0043', '2020-12-06 10:04:04', '2019-2020', '1', '0', '0', '1');
INSERT INTO `course` VALUES ('1cf41', '快乐的一只小青蛙', '207b0043', '2020-12-07 14:38:50', '2019-2020', '1', '0', '0', '1');
INSERT INTO `course` VALUES ('4f782', 'C++', '207b0043', '2020-10-15 08:32:46', '2018-2019', '1', '3', '0', '0');
INSERT INTO `course` VALUES ('4f93b', 'Python程序设计', '207b0043', '2020-10-15 08:35:43', '2019-2020', '2', '1', '1', '1');
INSERT INTO `course` VALUES ('574cb', '35435', '207b0043', '2020-11-10 03:27:54', '2020-2021', '1', '0', '1', '1');
INSERT INTO `course` VALUES ('77613', '高级Java', '207b0043', '2020-10-13 02:45:57', '2019-2020', '1', '0', '0', '0');
INSERT INTO `course` VALUES ('96380', '算法设计', '207b0043', '2020-12-15 08:52:19', '2018-2019', '1', '0', '1', '0');
INSERT INTO `course` VALUES ('c67e8', '人类一败涂地', '207b0043', '2020-12-07 14:05:24', '2019-2020', '1', '4', '0', '0');
INSERT INTO `course` VALUES ('d912a', '快乐的一只小青蛙', '207b0043', '2020-12-05 14:00:10', '2018-2019', '1', '2', '0', '1');
INSERT INTO `course` VALUES ('da986', '234xx', '207b0043', '2020-11-10 13:41:42', '2019-2020', '1', '0', '1', '1');
INSERT INTO `course` VALUES ('ef2cf', '戒网', '207b0043', '2020-12-02 16:50:37', '2019-2020', '2', '1', '0', '1');
INSERT INTO `course` VALUES ('f30f3', '几啊河北师大', '0e95a48a', '2020-12-23 03:40:19', '2018-2019', '1', '1', '0', '0');
INSERT INTO `course` VALUES ('ff7db', '戒网', 'c59e5462', '2020-11-04 03:37:43', '2019-2020', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for course_member
-- ----------------------------
DROP TABLE IF EXISTS `course_member`;
CREATE TABLE `course_member` (
  `cno` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程号',
  `member` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '成员ID',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '课程状态,0->正常,1->归档,2->退课',
  PRIMARY KEY (`cno`,`member`),
  KEY `member` (`member`),
  CONSTRAINT `course_member_ibfk_1` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_member_ibfk_2` FOREIGN KEY (`member`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_member
-- ----------------------------
INSERT INTO `course_member` VALUES ('4f782', '0d347e2f', '0');
INSERT INTO `course_member` VALUES ('4f782', '18847da7', '0');
INSERT INTO `course_member` VALUES ('4f782', '2c025bae', '0');
INSERT INTO `course_member` VALUES ('4f782', '5ddc9d7a', '0');
INSERT INTO `course_member` VALUES ('4f782', 'f4c5b7f9', '2');
INSERT INTO `course_member` VALUES ('77613', '18847da7', '2');
INSERT INTO `course_member` VALUES ('77613', 'd1f7378b', '0');
INSERT INTO `course_member` VALUES ('77613', 'f4c5b7f9', '2');
INSERT INTO `course_member` VALUES ('c67e8', '18847da7', '0');
INSERT INTO `course_member` VALUES ('c67e8', '2c025bae', '0');
INSERT INTO `course_member` VALUES ('c67e8', '5ddc9d7a', '0');
INSERT INTO `course_member` VALUES ('c67e8', 'a2f0badc', '0');
INSERT INTO `course_member` VALUES ('d912a', '18847da7', '2');
INSERT INTO `course_member` VALUES ('ef2cf', '18847da7', '2');
INSERT INTO `course_member` VALUES ('f30f3', '8e9b296e', '0');
INSERT INTO `course_member` VALUES ('ff7db', '18847da7', '2');
INSERT INTO `course_member` VALUES ('ff7db', '207b0043', '2');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `member` char(8) NOT NULL COMMENT '成员',
  `tno` char(6) NOT NULL COMMENT '作业号',
  `score` int(3) DEFAULT '-1' COMMENT '分数',
  `status` int(1) DEFAULT '0' COMMENT '批改状态',
  `answer` text,
  PRIMARY KEY (`member`,`tno`),
  KEY `tno` (`tno`),
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`member`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grade_ibfk_3` FOREIGN KEY (`tno`) REFERENCES `task` (`tno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('0d347e2f', '0094bb', '-1', '0', null);
INSERT INTO `grade` VALUES ('0d347e2f', '0190e3', '-1', '0', null);
INSERT INTO `grade` VALUES ('0d347e2f', '2d9513', '-1', '0', null);
INSERT INTO `grade` VALUES ('0d347e2f', '57b64c', '-1', '0', null);
INSERT INTO `grade` VALUES ('0d347e2f', '748bc6', '-1', '0', null);
INSERT INTO `grade` VALUES ('0d347e2f', '7b041e', '-1', '0', null);
INSERT INTO `grade` VALUES ('0d347e2f', '848992', '-1', '0', null);
INSERT INTO `grade` VALUES ('0d347e2f', '8a41a2', '-1', '0', null);
INSERT INTO `grade` VALUES ('0d347e2f', 'ffba83', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', '0094bb', '0', '1', '啦啦啦llll');
INSERT INTO `grade` VALUES ('18847da7', '0190e3', '100', '1', '1232312');
INSERT INTO `grade` VALUES ('18847da7', '2d9513', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', '49e3a6', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', '543aac', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', '57b64c', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', '64aaf6', '0', '0', '啦啦啦啦');
INSERT INTO `grade` VALUES ('18847da7', '748bc6', '50', '1', 'ddddd');
INSERT INTO `grade` VALUES ('18847da7', '7b041e', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', '8488e0', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', '848992', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', '8a41a2', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', '96cd31', '75', '1', '今天已经把电脑砸了');
INSERT INTO `grade` VALUES ('18847da7', '9f9087', '30', '1', null);
INSERT INTO `grade` VALUES ('18847da7', 'e20139', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', 'ec7fe9', '80', '1', '哈哈哈哈哈');
INSERT INTO `grade` VALUES ('18847da7', 'f258b7', '-1', '0', null);
INSERT INTO `grade` VALUES ('18847da7', 'ffba83', '-1', '0', null);
INSERT INTO `grade` VALUES ('207b0043', '96cd31', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', '0094bb', '80', '1', null);
INSERT INTO `grade` VALUES ('2c025bae', '0190e3', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', '2d9513', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', '49e3a6', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', '543aac', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', '57b64c', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', '748bc6', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', '7b041e', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', '8488e0', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', '848992', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', '8a41a2', '-1', '0', null);
INSERT INTO `grade` VALUES ('2c025bae', 'ec7fe9', '98', '1', '自嘻嘻嘻嘻');
INSERT INTO `grade` VALUES ('2c025bae', 'ffba83', '-1', '0', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', '0094bb', '87', '1', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', '0190e3', '-1', '0', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', '49e3a6', '-1', '0', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', '543aac', '-1', '0', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', '57b64c', '-1', '0', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', '748bc6', '-1', '0', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', '7b041e', '-1', '0', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', '8488e0', '-1', '0', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', '848992', '-1', '0', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', '8a41a2', '-1', '0', null);
INSERT INTO `grade` VALUES ('5ddc9d7a', 'ec7fe9', '87', '1', '嘻嘻嘻嘻');
INSERT INTO `grade` VALUES ('5ddc9d7a', 'ffba83', '-1', '0', null);
INSERT INTO `grade` VALUES ('8e9b296e', '730050', '44', '1', '聚合反应天方夜谭');
INSERT INTO `grade` VALUES ('a2f0badc', '49e3a6', '-1', '0', null);
INSERT INTO `grade` VALUES ('a2f0badc', '543aac', '-1', '0', null);
INSERT INTO `grade` VALUES ('a2f0badc', '8488e0', '-1', '0', null);
INSERT INTO `grade` VALUES ('a2f0badc', 'ec7fe9', '0', '0', '规律的风格');
INSERT INTO `grade` VALUES ('d1f7378b', '64aaf6', '-1', '0', null);
INSERT INTO `grade` VALUES ('d1f7378b', '9f9087', '30', '1', null);
INSERT INTO `grade` VALUES ('d1f7378b', 'e02192', '-1', '0', null);
INSERT INTO `grade` VALUES ('d1f7378b', 'e20139', '-1', '0', null);
INSERT INTO `grade` VALUES ('d1f7378b', 'f258b7', '-1', '0', null);
INSERT INTO `grade` VALUES ('f4c5b7f9', '0094bb', '93', '1', '123');
INSERT INTO `grade` VALUES ('f4c5b7f9', '9f9087', '30', '1', '提交本次的作业！');
INSERT INTO `grade` VALUES ('f4c5b7f9', 'e20139', '-1', '0', null);
INSERT INTO `grade` VALUES ('f4c5b7f9', 'f258b7', '-1', '0', null);
INSERT INTO `grade` VALUES ('f4c5b7f9', 'ffba83', '20', '1', '提交测试');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `msg_id` char(11) NOT NULL COMMENT '消息id',
  `from_u` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送方',
  `to_u` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收方',
  `msg` text NOT NULL COMMENT '消息内容',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '阅读状态',
  PRIMARY KEY (`msg_id`),
  KEY `message_ibfk_1` (`from_u`),
  KEY `message_ibfk_2` (`to_u`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`from_u`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`to_u`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('022e02f0d64', '207b0043', '0d347e2f', 'C++发布了yrrdt, 请注意查收。', '0');
INSERT INTO `message` VALUES ('03af76d0200', '207b0043', '18847da7', '课程: C++, 修改了你的分数，新的分数: 100', '1');
INSERT INTO `message` VALUES ('04c1be1ad9c', 'a2f0badc', '207b0043', '乔纳森乔斯达加入了你的课程:人类一败涂地', '1');
INSERT INTO `message` VALUES ('0933da64a19', '207b0043', '2c025bae', '人类一败涂地发布了啦啦啦, 请注意查收。', '0');
INSERT INTO `message` VALUES ('097ebb7c2fd', '207b0043', '18847da7', '人类一败涂地发布了哈哈哈哈, 请注意查收。', '1');
INSERT INTO `message` VALUES ('0a229d6d39f', '207b0043', '18847da7', '高级Java发布了哈哈哈, 请注意查收。', '1');
INSERT INTO `message` VALUES ('0c1566c6e4b', '207b0043', '5ddc9d7a', '课程: C, 修改了你的分数，新的分数: 20', '1');
INSERT INTO `message` VALUES ('11f3edcbe03', '207b0043', '5ddc9d7a', '人类一败涂地发布了啦啦啦, 请注意查收。', '0');
INSERT INTO `message` VALUES ('13256ddba25', '207b0043', '2c025bae', '人类一败涂地发布了嘟嘟嘟, 请注意查收。', '0');
INSERT INTO `message` VALUES ('1388b06ba79', 'c59e5462', '18847da7', '课程: 戒网, 修改了你的分数，新的分数: 100', '1');
INSERT INTO `message` VALUES ('13898c04b74', '8e9b296e', '0e95a48a', '化粪池加入了你的课程:几啊河北师大', '0');
INSERT INTO `message` VALUES ('141319b6e59', '207b0043', '5ddc9d7a', '人类一败涂地发布了嘟嘟嘟, 请注意查收。', '0');
INSERT INTO `message` VALUES ('14ce8687853', '207b0043', '2c025bae', 'C++发布了xixixi, 请注意查收。', '0');
INSERT INTO `message` VALUES ('17681e54e9c', '207b0043', '18847da7', '课程: 人类一败涂地, 修改了你的分数，新的分数: 80', '1');
INSERT INTO `message` VALUES ('19e471f111c', '18847da7', '207b0043', '花泽香菜加入了你的课程:快乐的一只小青蛙', '1');
INSERT INTO `message` VALUES ('1a78ccb9989', '207b0043', '18847da7', '人类一败涂地发布了测试, 请注意查收。', '1');
INSERT INTO `message` VALUES ('1ea229771fd', '207b0043', '5ddc9d7a', 'C++发布了llll, 请注意查收。', '0');
INSERT INTO `message` VALUES ('1f87bb4e213', '207b0043', '5ddc9d7a', '课程: C++, 修改了你的分数，新的分数: 87', '1');
INSERT INTO `message` VALUES ('249ebb6bf97', '207b0043', '18847da7', '课程: C++, 修改了你的分数，新的分数: 88', '1');
INSERT INTO `message` VALUES ('283d4acee29', '207b0043', '0d347e2f', 'C++发布了xixixi, 请注意查收。', '0');
INSERT INTO `message` VALUES ('28fde9b3925', '207b0043', '18847da7', '高级Java发布了testss, 请注意查收。', '1');
INSERT INTO `message` VALUES ('29d78067317', '207b0043', 'f4c5b7f9', '课程: C++, 修改了你的分数，新的分数: 80', '0');
INSERT INTO `message` VALUES ('2bd1e76607d', '207b0043', '18847da7', '人类一败涂地发布了啦啦啦, 请注意查收。', '1');
INSERT INTO `message` VALUES ('2c96be739f9', '207b0043', '5ddc9d7a', 'C++发布了测试, 请注意查收。', '1');
INSERT INTO `message` VALUES ('2fdc6c89b89', '207b0043', '2c025bae', 'C++发布了yrrdt, 请注意查收。', '0');
INSERT INTO `message` VALUES ('3166960b4ad', '207b0043', '0d347e2f', 'C++发布了测试, 请注意查收。', '0');
INSERT INTO `message` VALUES ('36364a875f1', '207b0043', 'f4c5b7f9', '课程: 高级Java, 修改了你的分数，新的分数: 30', '0');
INSERT INTO `message` VALUES ('36c52e849e2', 'c59e5462', '18847da7', '课程: 戒网, 修改了你的分数，新的分数: 80', '1');
INSERT INTO `message` VALUES ('381f57f1be8', '207b0043', '5ddc9d7a', '人类一败涂地发布了哈哈哈哈, 请注意查收。', '0');
INSERT INTO `message` VALUES ('3acb0f4dd11', '207b0043', '0d347e2f', 'C++发布了哈哈哈, 请注意查收。', '0');
INSERT INTO `message` VALUES ('3c1e0eee3f8', '207b0043', '5ddc9d7a', 'C++发布了xixixi, 请注意查收。', '0');
INSERT INTO `message` VALUES ('403e2ce6e36', '207b0043', 'a2f0badc', '人类一败涂地发布了哈哈哈哈, 请注意查收。', '0');
INSERT INTO `message` VALUES ('404e0c0c4e3', '207b0043', 'f4c5b7f9', 'C发布了test22, 请注意查收。', '1');
INSERT INTO `message` VALUES ('41dd3a32ba5', 'c59e5462', '18847da7', '课程: 戒网, 修改了你的分数，新的分数: 0', '1');
INSERT INTO `message` VALUES ('42be6c55ab9', '207b0043', '18847da7', '课程: C++, 修改了你的分数，新的分数: 84', '1');
INSERT INTO `message` VALUES ('462ea5ee1f3', '207b0043', '5ddc9d7a', 'C++发布了yrrdt, 请注意查收。', '0');
INSERT INTO `message` VALUES ('4919a004b17', '207b0043', '18847da7', '花泽香菜加入了你的课程:快乐的一只小青蛙', '1');
INSERT INTO `message` VALUES ('4e8327ba00f', '207b0043', '18847da7', 'C++发布了哈哈哈, 请注意查收。', '1');
INSERT INTO `message` VALUES ('51238f4e433', '207b0043', '18847da7', 'C++发布了哈哈哈, 请注意查收。', '1');
INSERT INTO `message` VALUES ('57a4bc7a613', '207b0043', '18847da7', 'C++发布了xixixi, 请注意查收。', '1');
INSERT INTO `message` VALUES ('59227da5b37', 'c59e5462', '18847da7', '课程: 戒网, 修改了你的分数，新的分数: 75', '1');
INSERT INTO `message` VALUES ('59f3167b026', '207b0043', '0d347e2f', 'C++发布了iohgj, 请注意查收。', '0');
INSERT INTO `message` VALUES ('5af182d8196', '207b0043', '18847da7', '人类一败涂地发布了嘟嘟嘟, 请注意查收。', '1');
INSERT INTO `message` VALUES ('5bc9ffe2acb', '207b0043', '18847da7', 'C++发布了测试, 请注意查收。', '1');
INSERT INTO `message` VALUES ('5bd4bcda002', 'c59e5462', '18847da7', '戒网发布了戒网第一步, 请注意查收。', '1');
INSERT INTO `message` VALUES ('60c413f2248', '207b0043', '0d347e2f', 'C++发布了llll, 请注意查收。', '0');
INSERT INTO `message` VALUES ('658d2271a27', '207b0043', '2c025bae', '课程: C++, 修改了你的分数，新的分数: 91', '0');
INSERT INTO `message` VALUES ('679ea8fac95', '207b0043', '2c025bae', 'C++发布了iohgj, 请注意查收。', '0');
INSERT INTO `message` VALUES ('6a95479e7fa', '0e95a48a', '8e9b296e', '课程: 几啊河北师大, 修改了你的分数，新的分数: 44', '1');
INSERT INTO `message` VALUES ('6c7439eb5a0', '207b0043', '2c025bae', '课程: 人类一败涂地, 修改了你的分数，新的分数: 80', '0');
INSERT INTO `message` VALUES ('6e12a61ff40', '207b0043', '5ddc9d7a', '课程: 人类一败涂地, 修改了你的分数，新的分数: 80', '0');
INSERT INTO `message` VALUES ('6f082aadc0f', '207b0043', '2c025bae', 'C++发布了哈哈哈, 请注意查收。', '0');
INSERT INTO `message` VALUES ('7169164b6c9', '207b0043', '2c025bae', '人类一败涂地发布了哈哈哈哈, 请注意查收。', '0');
INSERT INTO `message` VALUES ('79a2ab96c9a', '207b0043', '2c025bae', '课程: C++, 修改了你的分数，新的分数: 80', '0');
INSERT INTO `message` VALUES ('7a46090157b', 'c59e5462', '18847da7', '课程: 戒网, 修改了你的分数，新的分数: 100', '1');
INSERT INTO `message` VALUES ('7f4170c4ea1', '207b0043', '18847da7', '课程: C++, 修改了你的分数，新的分数: 78', '1');
INSERT INTO `message` VALUES ('80a516c935a', '18847da7', '207b0043', '花泽香菜加入了你的课程:人类一败涂地', '1');
INSERT INTO `message` VALUES ('85bb141459b', '207b0043', 'a2f0badc', '人类一败涂地发布了嘟嘟嘟, 请注意查收。', '0');
INSERT INTO `message` VALUES ('912319f3c72', '207b0043', '5ddc9d7a', '课程: C++, 修改了你的分数，新的分数: 80', '1');
INSERT INTO `message` VALUES ('938a04cccfc', '207b0043', 'f4c5b7f9', '这是一个测试用的消息', '1');
INSERT INTO `message` VALUES ('9bd6cf42abb', '207b0043', '5ddc9d7a', 'C++发布了iohgj, 请注意查收。', '0');
INSERT INTO `message` VALUES ('9e713f2bd02', '207b0043', '5ddc9d7a', 'C++发布了哈哈哈, 请注意查收。', '1');
INSERT INTO `message` VALUES ('a0bb2eab796', '207b0043', '5ddc9d7a', 'C++发布了哈哈哈, 请注意查收。', '1');
INSERT INTO `message` VALUES ('a6128c454c6', '207b0043', 'f4c5b7f9', '课程: C++, 修改了你的分数，新的分数: 0', '1');
INSERT INTO `message` VALUES ('aaa85334129', 'c59e5462', '18847da7', '课程: 戒网, 修改了你的分数，新的分数: 100', '1');
INSERT INTO `message` VALUES ('ab13a680ae1', '207b0043', '2c025bae', 'C++发布了llll, 请注意查收。', '0');
INSERT INTO `message` VALUES ('abb6840fe9e', '207b0043', '18847da7', 'C++发布了yrrdt, 请注意查收。', '1');
INSERT INTO `message` VALUES ('af1f56e7aed', '207b0043', '18847da7', '人类一败涂地发布了再次测试, 请注意查收。', '1');
INSERT INTO `message` VALUES ('b49b1281ddf', '207b0043', 'd1f7378b', '高级Java发布了哈哈哈, 请注意查收。', '0');
INSERT INTO `message` VALUES ('b50052fb5ab', '207b0043', '18847da7', '课程: 人类一败涂地, 修改了你的分数，新的分数: 80', '1');
INSERT INTO `message` VALUES ('b86b3d9a904', '207b0043', '2c025bae', '课程: C++, 修改了你的分数，新的分数: 80', '0');
INSERT INTO `message` VALUES ('bba2838def1', '207b0043', '18847da7', '课程: 人类一败涂地, 修改了你的分数，新的分数: 80', '1');
INSERT INTO `message` VALUES ('bc8358349f5', '207b0043', 'a2f0badc', '人类一败涂地发布了啦啦啦, 请注意查收。', '0');
INSERT INTO `message` VALUES ('c06719c1868', '2c025bae', '207b0043', '东方仗助加入了你的课程:人类一败涂地', '1');
INSERT INTO `message` VALUES ('c18d806bb1a', '207b0043', '5ddc9d7a', '课程: C++, 修改了你的分数，新的分数: 78', '1');
INSERT INTO `message` VALUES ('c1b7d35b9c1', '5ddc9d7a', '207b0043', '苍井优加入了你的课程:人类一败涂地', '1');
INSERT INTO `message` VALUES ('c351bb2d8d8', '207b0043', '0d347e2f', 'C++发布了哈哈哈, 请注意查收。', '0');
INSERT INTO `message` VALUES ('c4325c5530e', '207b0043', 'c59e5462', '石原里美加入了你的课程:戒网', '0');
INSERT INTO `message` VALUES ('c45f1a19e95', '207b0043', '2c025bae', 'C++发布了测试, 请注意查收。', '0');
INSERT INTO `message` VALUES ('ca2a54aad2b', '207b0043', 'd1f7378b', '课程: 高级Java, 修改了你的分数，新的分数: 30', '1');
INSERT INTO `message` VALUES ('cbe8767bc5e', '207b0043', 'f4c5b7f9', '高级Java发布了testss, 请注意查收。', '0');
INSERT INTO `message` VALUES ('cbedc0dbd62', '207b0043', '18847da7', '课程: C++, 修改了你的分数，新的分数: 50', '1');
INSERT INTO `message` VALUES ('ccb4dac82de', '207b0043', 'f4c5b7f9', '课程: C++, 修改了你的分数，新的分数: 78', '0');
INSERT INTO `message` VALUES ('d05d8eaac77', '207b0043', '5ddc9d7a', '课程: 人类一败涂地, 修改了你的分数，新的分数: 87', '0');
INSERT INTO `message` VALUES ('d0b4b56e084', '207b0043', 'd1f7378b', '高级Java发布了啦啦啦啦, 请注意查收。', '0');
INSERT INTO `message` VALUES ('d10057e1f92', '18847da7', '207b0043', '花泽香菜加入了你的课程:快乐的一只小青蛙', '1');
INSERT INTO `message` VALUES ('d1da6ed18eb', '207b0043', '18847da7', '课程: 高级Java, 修改了你的分数，新的分数: 30', '1');
INSERT INTO `message` VALUES ('d61793c892f', '207b0043', '18847da7', 'C++发布了iohgj, 请注意查收。', '1');
INSERT INTO `message` VALUES ('d66457a4c66', 'd1f7378b', 'f4c5b7f9', 'This is test too', '1');
INSERT INTO `message` VALUES ('d74af8329e1', '207b0043', '2c025bae', '课程: 人类一败涂地, 修改了你的分数，新的分数: 98', '0');
INSERT INTO `message` VALUES ('e0a791481bb', '207b0043', 'd1f7378b', '高级Java发布了testss, 请注意查收。', '1');
INSERT INTO `message` VALUES ('e4bff2cbd3f', '207b0043', '18847da7', '课程: C++, 修改了你的分数，新的分数: 80', '1');
INSERT INTO `message` VALUES ('e5c44877823', '207b0043', '18847da7', 'C++发布了llll, 请注意查收。', '1');
INSERT INTO `message` VALUES ('efc6d2b6505', '207b0043', 'f4c5b7f9', '课程: C++, 修改了你的分数，新的分数: 93', '0');
INSERT INTO `message` VALUES ('f2df7506363', '207b0043', '2c025bae', 'C++发布了哈哈哈, 请注意查收。', '0');
INSERT INTO `message` VALUES ('f326a30b6cd', '207b0043', 'f4c5b7f9', '课程: C, 修改了你的分数，新的分数: 20', '0');
INSERT INTO `message` VALUES ('f8a3e71d489', '207b0043', '18847da7', '课程: 人类一败涂地, 修改了你的分数，新的分数: 80', '1');
INSERT INTO `message` VALUES ('f8a83786368', '207b0043', '5ddc9d7a', 'C发布了test22, 请注意查收。', '1');
INSERT INTO `message` VALUES ('fdf66df6931', '207b0043', 'c59e5462', '石原里美加入了你的课程:戒网', '0');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `pid` int(11) NOT NULL,
  `pname` varchar(16) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '学生');
INSERT INTO `permission` VALUES ('2', '教师');

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `scl_id` int(11) NOT NULL,
  `scl_name` varchar(40) NOT NULL,
  PRIMARY KEY (`scl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('1', '重庆理工大学');
INSERT INTO `school` VALUES ('2', '重庆大学');
INSERT INTO `school` VALUES ('3', '西南大学');
INSERT INTO `school` VALUES ('4', '重庆邮电大学');
INSERT INTO `school` VALUES ('5', '北京大学');
INSERT INTO `school` VALUES ('6', '清华大学');
INSERT INTO `school` VALUES ('7', '西南大学');
INSERT INTO `school` VALUES ('8', '四川大学');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `tno` char(6) NOT NULL COMMENT '作业号',
  `tname` varchar(30) NOT NULL COMMENT '作业名',
  `description` text COMMENT '作业的说明',
  `annex` varchar(255) DEFAULT NULL COMMENT '附件路径',
  `avg_score` float DEFAULT NULL COMMENT '平均分',
  `pass_rate` float DEFAULT NULL COMMENT '合格率',
  `highest_score` int(3) DEFAULT NULL COMMENT '最高分',
  `lowest_score` int(3) DEFAULT NULL COMMENT '最低分',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `end_date` datetime NOT NULL COMMENT '最迟提交时间',
  `submit_num` int(11) DEFAULT '0' COMMENT '提交人数',
  `cno` char(5) NOT NULL COMMENT '所属课程',
  `judge_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`tno`),
  KEY `cno` (`cno`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('0094bb', '1', '<p>1</p>', null, '0', '0', '0', '0', '2020-11-27 13:29:48', '2020-11-29 16:45:00', '1', '4f782', '0');
INSERT INTO `task` VALUES ('0190e3', 'llll', '', '', '0', '0', '0', '0', '2020-12-15 08:22:11', '2020-12-01 16:30:00', '0', '4f782', '0');
INSERT INTO `task` VALUES ('2d9513', '第一次作业：猜数游戏（新）', '<p>联系Servlet的使用，完成猜数游戏。</p>', '', '0', '0', '0', '0', '2020-12-01 15:23:12', '2020-12-09 17:00:00', '0', '4f782', '0');
INSERT INTO `task` VALUES ('49e3a6', '啦啦啦', '', null, '0', '0', '0', '0', '2020-12-07 17:08:11', '2020-12-08 16:00:00', '0', 'c67e8', '0');
INSERT INTO `task` VALUES ('543aac', '嘟嘟嘟', '', null, '0', '0', '0', '0', '2020-12-07 16:59:08', '2020-12-08 16:15:00', '0', 'c67e8', '0');
INSERT INTO `task` VALUES ('57b64c', '测试', '', '14b1b0fd9209教学课件共享系统 - 副本.doc', '0', '0', '0', '0', '2020-12-07 08:04:34', '2020-12-08 16:15:00', '0', '4f782', '0');
INSERT INTO `task` VALUES ('64aaf6', '哈哈哈', '', 'e1253e8d0f课程论文模板.doc', '0', '0', '0', '0', '2020-12-03 15:56:00', '2020-12-08 16:00:00', '0', '77613', '0');
INSERT INTO `task` VALUES ('730050', '景观规划SV达到', '', 'cb0cb7ae4a1、Android小组和个人提交文档清单.txt', '0', '0', '0', '0', '2020-12-23 03:41:56', '2020-12-22 16:30:00', '0', 'f30f3', '0');
INSERT INTO `task` VALUES ('748bc6', 'xixixi', '', '', '0', '0', '0', '0', '2020-12-15 08:23:22', '2020-12-15 16:15:00', '0', '4f782', '0');
INSERT INTO `task` VALUES ('7b041e', 'yrrdt', '', '234bd93e8209教学课件共享系统 - 副本.doc', '0', '0', '0', '0', '2020-12-15 08:40:46', '2020-12-07 16:15:00', '0', '4f782', '0');
INSERT INTO `task` VALUES ('8488e0', '哈哈哈哈', '', 'f728b5838c11802050130尹蕾c语言.docx', '0', '0', '0', '0', '2020-12-07 17:12:05', '2020-12-08 16:30:00', '0', 'c67e8', '0');
INSERT INTO `task` VALUES ('848992', 'iohgj', '', '372ab58dbb1、Android小组和个人提交文档清单.txt', '0', '0', '0', '0', '2020-12-15 08:49:32', '2020-12-22 16:45:00', '0', '4f782', '0');
INSERT INTO `task` VALUES ('8a41a2', '哈哈哈', '', 'fbe33832ad17.png', '0', '0', '0', '0', '2020-12-06 11:30:56', '2020-12-14 16:15:00', '0', '4f782', '0');
INSERT INTO `task` VALUES ('96cd31', '戒网第一步', '', '', '0', '0', '0', '0', '2020-11-04 03:42:08', '2020-11-04 20:45:00', '0', 'ff7db', '0');
INSERT INTO `task` VALUES ('9f9087', 'test', '<p>test</p><p>dfioh</p><p>sdf</p>', '', '0', '0', '0', '0', '2020-11-27 02:42:35', '2020-11-27 17:00:00', '0', '77613', '0');
INSERT INTO `task` VALUES ('e02192', '啦啦啦啦', '', '93936d51b2课程论文模板.doc', '0', '0', '0', '0', '2020-12-02 16:49:20', '2020-12-16 16:00:00', '0', '77613', '0');
INSERT INTO `task` VALUES ('e20139', 'test222', '<p>dsfdsg</p>', null, '0', '0', '0', '0', '2020-11-20 02:49:11', '2021-01-21 16:30:00', '0', '77613', '0');
INSERT INTO `task` VALUES ('ec7fe9', '再次测试', '', 'db081b11bd09教学课件共享系统 - 副本.doc', '0', '0', '0', '0', '2020-12-07 15:01:48', '2020-12-14 16:00:00', '0', 'c67e8', '0');
INSERT INTO `task` VALUES ('f258b7', 'testss', '', '8ab30ca80a教学资源共享系统.docx', '0', '0', '0', '0', '2020-11-06 14:13:28', '2020-11-19 16:30:00', '0', '77613', '0');
INSERT INTO `task` VALUES ('ffba83', '123', '<p>123</p>', null, '0', '0', '0', '0', '2020-11-19 12:29:54', '2020-12-02 16:45:00', '1', '4f782', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `permission` int(1) NOT NULL COMMENT '身份',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `school` int(11) DEFAULT NULL COMMENT '学校',
  `i_no` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学号or教师号',
  `u_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一身份识别号',
  `avatar` varchar(40) DEFAULT 'default.jpg',
  PRIMARY KEY (`account`),
  UNIQUE KEY `u_id` (`u_id`) USING BTREE,
  KEY `user_ibfk_1` (`permission`),
  KEY `user_ibfk_2` (`school`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`permission`) REFERENCES `permission` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`school`) REFERENCES `school` (`scl_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1010', 'Qpf0SxOVUjUkWySXOZ16kw==', '1', '柏原崇', '1', '11823020219', 'f4c5b7f9', 'default.jpg');
INSERT INTO `user` VALUES ('111', 'Qpf0SxOVUjUkWySXOZ16kw==', '1', '花泽香菜', '1', '12784623782', '18847da7', '8fe26f097ameinv5.jpg');
INSERT INTO `user` VALUES ('1111', 'Qpf0SxOVUjUkWySXOZ16kw==', '2', '小泽珍珠', '1', '23123123123', 'c59e5462', 'default.jpg');
INSERT INTO `user` VALUES ('1212', 'Qpf0SxOVUjUkWySXOZ16kw==', '2', '齐木楠雄', '1', '11123123333', 'de92c34d', 'default.jpg');
INSERT INTO `user` VALUES ('1313', 'Qpf0SxOVUjUkWySXOZ16kw==', '2', '空条乔太郎', '2', '12312312312', '3548f9e0', 'default.jpg');
INSERT INTO `user` VALUES ('1414', 'Qpf0SxOVUjUkWySXOZ16kw==', '1', '猪猪侠', '2', '12315135', '520f9ade', 'default.jpg');
INSERT INTO `user` VALUES ('1515', 'Qpf0SxOVUjUkWySXOZ16kw==', '2', '朱莉老师', '4', null, '58d959d3', 'default.jpg');
INSERT INTO `user` VALUES ('222', 'Qpf0SxOVUjUkWySXOZ16kw==', '1', '苍井优', '1', '12789473928', '5ddc9d7a', '7f8983a8dbzhishi.jpg');
INSERT INTO `user` VALUES ('333', 'Qpf0SxOVUjUkWySXOZ16kw==', '1', '东方仗助', '1', '12789473284', '2c025bae', 'default.jpg');
INSERT INTO `user` VALUES ('444', 'Qpf0SxOVUjUkWySXOZ16kw==', '1', '乔纳森乔斯达', '1', '118230202', 'a2f0badc', 'default.jpg');
INSERT INTO `user` VALUES ('555', 'Qpf0SxOVUjUkWySXOZ16kw==', '1', '西撒', '1', '1123151654', 'c50c44d7', 'default.jpg');
INSERT INTO `user` VALUES ('55556', 'Qpf0SxOVUjUkWySXOZ16kw==', '1', '化粪池', '2', '3215156', '8e9b296e', 'default.jpg');
INSERT INTO `user` VALUES ('666', 'Qpf0SxOVUjUkWySXOZ16kw==', '2', '山崎贤人', '1', '12323445434', '0d347e2f', 'b537ed6eadmeinv.jpg');
INSERT INTO `user` VALUES ('777', 'Qpf0SxOVUjUkWySXOZ16kw==', '2', '石原里美', '2', '32489083425', '207b0043', '522a3139f2keai.jpg');
INSERT INTO `user` VALUES ('8788', 'Qpf0SxOVUjUkWySXOZ16kw==', '2', '金黄色的不错', '2', null, '0e95a48a', 'default.jpg');
INSERT INTO `user` VALUES ('888', 'Qpf0SxOVUjUkWySXOZ16kw==', '1', '白金之星', '2', '1125542', '04d67386', 'default.jpg');
INSERT INTO `user` VALUES ('8888', 'Qpf0SxOVUjUkWySXOZ16kw==', '1', '斋藤飞鸟', '2', '1182454215', 'f2b4a61c', 'default.jpg');
INSERT INTO `user` VALUES ('999', 'Qpf0SxOVUjUkWySXOZ16kw==', '2', '贺来贤人', '1', '11823020220', 'd1f7378b', 'default.jpg');
