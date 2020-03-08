/*
 Navicat MySQL Data Transfer

 Source Server         : connect-mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 08/03/2020 13:57:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('4929948af7bd');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `aid` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `cid` int(0) NULL DEFAULT NULL,
  `hits` int(0) NULL DEFAULT NULL,
  `comments` int(0) NULL DEFAULT NULL,
  `picture` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_picture` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content_second` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '无辜的眼神求抱抱', '这是典型的撒娇表现，无辜的大眼睛看着你，还会发出呜咽声，这时候把猫咪抱起来，猫咪会感觉到无比的开心，就好像自己还是幼儿时期，还在猫妈妈的怀里一样。主要是通过和你身体的接触，来获得安全感。', '2020-02-05 20:30:35', 1, 0, 0, 'img/parent4.jpg', 'img/Lead.jpg', NULL);
INSERT INTO `article` VALUES (2, '喜欢在人身上爬上爬下', '猫咪并不是把你当作了一棵树，比如当你坐着的时候，猫咪会主动跳在腿上，这时候猫咪眼睛会看着你，希望你可以抚摸它，如果你顺势满足它，猫咪就会十分的开心，当一把把猫咪抱起来，放在身上抱住的话，猫咪撒娇模式会全开，感觉无比快乐。', '2020-03-06 20:30:57', 1, 0, 0, 'img/parent2.jpeg', 'img/Lead.jpg', NULL);
INSERT INTO `article` VALUES (3, '会踩奶，主动舔人', '猫咪在还是幼猫的时候，就是通过爪子来回动，促进乳汁流动，可以顺利的喝到。长大之后如果你平躺在床上，猫咪就会顺势上来，这时候你只要摸几下它，他就会开始踩奶，感觉好像按摩一样，这是典型的“恋母”情节。', '2020-03-07 20:31:02', 1, 0, 0, 'img/parent3.jpeg', 'img/Lead.jpg', '同时猫咪在你熟睡的时候，也会凑过来闻一闻，然后顺势舔一下你的脸，这也是幼猫对母亲的专属行为。');
INSERT INTO `article` VALUES (4, '一张床睡觉，且有叫必应', '猫咪是对气味很敏感且十分挑剔的，所以只会在自己喜欢的地点睡觉，如果你家猫咪经常半夜爬到你的脚底，甚至和你盖一张被子睡觉，就说明对你十分的信赖，像自己的父母一样。', '2020-03-09 20:31:24', 1, 0, 0, 'img/parent1.jpeg', 'img/Lead.jpg', '并不是所有的猫咪，你叫它，他都会有回应，猫咪的耳朵听力及其敏锐，怎会听不到你的叫声，只是懒得回应你罢了，一般只有幼猫听见了母猫的呼唤才会给出反应，因为如果不听母猫话就会遇到危险，所以如果你叫不动你家猫咪，说明你们的关系不属于父母这一类型。');
INSERT INTO `article` VALUES (5, '害怕了会躲在你的身后', '这也是典型的只有幼猫才会有的行为，就像小朋友遇到了危险，第一时间躲在父母的后面一样，因为父母在心底从来就是可以保护自己的人。如果家里来了陌生的人，或者被其他猫咪攻击害怕时，猫咪会逃到你的脚边，寻求保护。', '2020-03-13 20:31:30', 1, 0, 0, 'img/parent5.png', 'img/Lead.jpg', NULL);
INSERT INTO `article` VALUES (6, '肚子饿了会轻轻咬你', '猫咪一旦饿肚子了，就会来咬你，并不是攻击性质的，而是轻轻的咬，是希望母猫对自己注意一些，快来照顾自己的行为表现，需要注意的是，如果发现这种情况，你给予回应，猫咪就会觉得咬你就会解决问题，因为一定要合理的无视猫咪的一些请求。', '2020-03-16 20:31:34', 1, 0, 0, 'img/parent6.jpg', 'img/Lead.jpg', NULL);
INSERT INTO `article` VALUES (7, '深情地咬你', '在公猫和母猫进行交配的时候，公猫会要住母猫的脖子，这样母猫就会由于“冷冻”机制，变得听话，而当猫咪对你有恋人感觉的时候，就会深情地、一脸陶醉的咬着你，而且母猫也会有这种行为。', '2020-03-05 20:30:44', 2, 0, 0, 'img/love1.png', 'img/Lead.jpg', NULL);
INSERT INTO `article` VALUES (8, '会开心的扑过来', '当你过来的时候，会很开心的立刻本着你的脚扑过去，通常猫咪的眼睛会眯成一条缝，一直观察着你的动向，然后随时找机会扑过去，之后扑成功以后，紧接着就会深情地咬你。', '2020-03-07 20:31:06', 2, 0, 0, 'img/love2.png', 'img/Lead.jpg', NULL);
INSERT INTO `article` VALUES (9, '抚摸时会舔你', '一般抚摸猫咪，猫咪会舒展身体让你摸个够，但是如果在你抱着它或者它躺着的时候，你去抚摸，此刻猫咪深处舌头舔你的话，猫咪在内心就把你看成是自己的恋人了，也行用嘴帮你舔舐毛发且梳理。', '2020-03-12 20:31:20', 2, 0, 0, 'img/love3.png', 'img/Lead.jpg', NULL);
INSERT INTO `article` VALUES (10, '听到呼唤会用尾巴回应', '当你叫猫咪的时候，它并没有过来，而是尾巴动了一下，表示“我已经知道了”，就算是敷衍的回应你了，主要是因为猫咪此时此刻根本不想理你，但是看见你苦苦在叫它，就象征性的回应一下，就好像把你当作小孩子一样。', '2020-03-05 20:30:51', 3, 0, 0, 'img/child1.png', 'img/Lead.jpg', NULL);
INSERT INTO `article` VALUES (11, '抓虫子或老鼠给你', '猫妈妈会捕捉猎物，放到幼猫的跟前，然后慢慢教会幼猫如何捕猎，当发现你家猫咪给你抓了一些虫子或者老鼠的时候，千万不要天真的以为在像你“报恩”，送你礼物，只是猫咪觉得你还是个孩子，需要在你面前教你如何捕猎，以至于以后你不会被饿死，这是非常典型的孩子型行为特征。', '2020-03-10 20:31:10', 3, 0, 0, 'img/child2.jpg', 'img/Lead.jpg', NULL);
INSERT INTO `article` VALUES (12, '忍耐着让你抱', '此时在抱猫咪的时候，会明显的感觉猫咪没有耐心，被抱起来了也懒得互动，而全身放松，任你摆布，这种就是在展现自己一种大人忍受小孩子胡乱给自己捣乱的行为，不过持续不了多久，猫咪就会咬你来挣脱开，远离你。', '2020-03-20 20:31:15', 3, 0, 0, 'img/child3.png', 'img/Lead.jpg', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '孩子型', 6);
INSERT INTO `category` VALUES (2, '恋人型', 3);
INSERT INTO `category` VALUES (3, '父母型', 3);

-- ----------------------------
-- Table structure for mark
-- ----------------------------
DROP TABLE IF EXISTS `mark`;
CREATE TABLE `mark`  (
  `mid` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `uid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mark
-- ----------------------------
INSERT INTO `mark` VALUES (1, '1', '2020-03-07 04:07:07', NULL);
INSERT INTO `mark` VALUES (2, '2', '2020-03-07 04:07:29', NULL);
INSERT INTO `mark` VALUES (3, '3', '2020-03-07 04:07:33', NULL);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tid` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE,
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '卡哇伊', NULL);
INSERT INTO `tag` VALUES (2, '凶凶', NULL);
INSERT INTO `tag` VALUES (3, '傻傻', NULL);
INSERT INTO `tag` VALUES (4, '呆呆', NULL);
INSERT INTO `tag` VALUES (5, '乖乖', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `portrait` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regtime` datetime(0) NULL DEFAULT NULL,
  `isforbid` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (5, 'zz', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '15762886962', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
