/*
Navicat MySQL Data Transfer

Source Server         : yaya
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : jsprencai

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2016-02-23 22:51:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `nature` varchar(30) NOT NULL,
  `industry` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `telphone` varchar(30) NOT NULL,
  `scale` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `introduction` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------

-- ----------------------------
-- Table structure for `t_company_interview`
-- ----------------------------
DROP TABLE IF EXISTS `t_company_interview`;
CREATE TABLE `t_company_interview` (
  `id` int(11) NOT NULL,
  `resumeId` int(11) NOT NULL,
  `resumeUid` int(11) NOT NULL,
  `jobId` int(11) NOT NULL,
  `jobName` varchar(30) NOT NULL,
  `companyId` varchar(30) NOT NULL,
  `companyName` varchar(30) NOT NULL,
  `interviewTime` date NOT NULL,
  `Note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company_interview
-- ----------------------------

-- ----------------------------
-- Table structure for `t_company_job`
-- ----------------------------
DROP TABLE IF EXISTS `t_company_job`;
CREATE TABLE `t_company_job` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `jobName` varchar(30) NOT NULL,
  `companyName` varchar(30) NOT NULL,
  `Nature` varchar(30) NOT NULL,
  `amount` smallint(6) NOT NULL,
  `scale` varchar(30) NOT NULL,
  `distinct` varchar(30) NOT NULL,
  `education` varchar(30) NOT NULL,
  `experience` varchar(30) NOT NULL,
  `salary` varchar(30) NOT NULL,
  `contents` varchar(500) DEFAULT NULL,
  `addtime` date NOT NULL,
  `deadline` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company_job
-- ----------------------------

-- ----------------------------
-- Table structure for `t_industry`
-- ----------------------------
DROP TABLE IF EXISTS `t_industry`;
CREATE TABLE `t_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=840 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_industry
-- ----------------------------
INSERT INTO `t_industry` VALUES ('35', '计算机/互联网', '6');
INSERT INTO `t_industry` VALUES ('36', '销售/客服/技术支持', '0');
INSERT INTO `t_industry` VALUES ('37', '会计/金融/银行/保险', '0');
INSERT INTO `t_industry` VALUES ('38', '生产/营运/采购/物流', '0');
INSERT INTO `t_industry` VALUES ('39', '生物/制药/医疗/护理', '0');
INSERT INTO `t_industry` VALUES ('40', '广告/市场/媒体/艺术', '0');
INSERT INTO `t_industry` VALUES ('41', '建筑/房地产', '0');
INSERT INTO `t_industry` VALUES ('42', '人事/行政/高级管理', '0');
INSERT INTO `t_industry` VALUES ('43', '咨询/法律/教育/科研', '0');
INSERT INTO `t_industry` VALUES ('44', '服务业', '0');
INSERT INTO `t_industry` VALUES ('45', '公务员/翻译/其他', '1');
INSERT INTO `t_industry` VALUES ('836', '化工/能源', '1');
INSERT INTO `t_industry` VALUES ('835', '贸易/百货', '2');
INSERT INTO `t_industry` VALUES ('837', '机械/设备/技工', '2');
INSERT INTO `t_industry` VALUES ('839', '通信/电子', '0');

-- ----------------------------
-- Table structure for `t_jobclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_jobclass`;
CREATE TABLE `t_jobclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=953 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jobclass
-- ----------------------------
INSERT INTO `t_jobclass` VALUES ('53', '36', '销售管理', '4', null);
INSERT INTO `t_jobclass` VALUES ('54', '36', '销售人员', '3', null);
INSERT INTO `t_jobclass` VALUES ('55', '36', '销售行政及商务', '2', null);
INSERT INTO `t_jobclass` VALUES ('57', '37', '财务/审计/税务', '1', null);
INSERT INTO `t_jobclass` VALUES ('58', '37', '金融/证券/期货/投资', '2', null);
INSERT INTO `t_jobclass` VALUES ('59', '37', '银行', '3', null);
INSERT INTO `t_jobclass` VALUES ('60', '37', '保险 ', '4', null);
INSERT INTO `t_jobclass` VALUES ('61', '38', '生产/营运', '9', null);
INSERT INTO `t_jobclass` VALUES ('62', '38', '质量/安全管理', '8', null);
INSERT INTO `t_jobclass` VALUES ('63', '38', '工程/机械/能源', '7', null);
INSERT INTO `t_jobclass` VALUES ('64', '38', '汽车', '6', null);
INSERT INTO `t_jobclass` VALUES ('65', '38', '技工', '5', null);
INSERT INTO `t_jobclass` VALUES ('66', '38', '服装/纺织/皮革', '4', null);
INSERT INTO `t_jobclass` VALUES ('67', '38', '采购', '3', null);
INSERT INTO `t_jobclass` VALUES ('68', '38', '贸易', '2', null);
INSERT INTO `t_jobclass` VALUES ('69', '38', '物流/仓储 ', '1', null);
INSERT INTO `t_jobclass` VALUES ('70', '39', '生物/制药/医疗器械', '3', null);
INSERT INTO `t_jobclass` VALUES ('72', '39', '医院/医疗/护理 ', '1', null);
INSERT INTO `t_jobclass` VALUES ('73', '40', '广告', '6', null);
INSERT INTO `t_jobclass` VALUES ('74', '40', '公关/媒介', '5', null);
INSERT INTO `t_jobclass` VALUES ('75', '40', '市场/营销', '4', null);
INSERT INTO `t_jobclass` VALUES ('76', '40', '影视/媒体', '3', null);
INSERT INTO `t_jobclass` VALUES ('77', '40', '写作/出版/印刷', '2', null);
INSERT INTO `t_jobclass` VALUES ('78', '40', '艺术/设计', '1', null);
INSERT INTO `t_jobclass` VALUES ('82', '42', '人力资源', '3', null);
INSERT INTO `t_jobclass` VALUES ('83', '42', '高级管理', '2', null);
INSERT INTO `t_jobclass` VALUES ('84', '42', '行政/后勤', '1', null);
INSERT INTO `t_jobclass` VALUES ('85', '43', '咨询/顾问', '1', null);
INSERT INTO `t_jobclass` VALUES ('86', '43', '律师/法务/合规', '2', null);
INSERT INTO `t_jobclass` VALUES ('87', '43', '教师', '3', null);
INSERT INTO `t_jobclass` VALUES ('88', '43', '培训', '4', null);
INSERT INTO `t_jobclass` VALUES ('89', '43', '科研人员', '5', null);
INSERT INTO `t_jobclass` VALUES ('96', '45', '公务员', '8', null);
INSERT INTO `t_jobclass` VALUES ('97', '45', '翻译', '7', null);
INSERT INTO `t_jobclass` VALUES ('98', '45', '在校学生', '6', null);
INSERT INTO `t_jobclass` VALUES ('99', '45', '储备干部/培训生/实习生', '5', null);
INSERT INTO `t_jobclass` VALUES ('100', '45', '兼职', '4', null);
INSERT INTO `t_jobclass` VALUES ('101', '45', '其他', '3', null);
INSERT INTO `t_jobclass` VALUES ('102', '45', '环保', '2', null);
INSERT INTO `t_jobclass` VALUES ('103', '45', '农/林/牧/渔 ', '1', null);
INSERT INTO `t_jobclass` VALUES ('107', '35', '网游', '4', null);
INSERT INTO `t_jobclass` VALUES ('106', '35', '计算机硬件', '2', null);
INSERT INTO `t_jobclass` VALUES ('45', '0', '公务员/翻译/其他', '0', null);
INSERT INTO `t_jobclass` VALUES ('43', '0', '咨询/法律/教育/科研', '0', null);
INSERT INTO `t_jobclass` VALUES ('42', '0', '人事/行政/高级管理', '0', null);
INSERT INTO `t_jobclass` VALUES ('105', '35', '计算机软件', '0', null);
INSERT INTO `t_jobclass` VALUES ('40', '0', '广告/市场/媒体/艺术', '0', null);
INSERT INTO `t_jobclass` VALUES ('39', '0', '生物/制药/医疗/护理', '0', null);
INSERT INTO `t_jobclass` VALUES ('38', '0', '生产/营运/采购/物流', '0', null);
INSERT INTO `t_jobclass` VALUES ('37', '0', '会计/金融/银行/保险', '0', null);
INSERT INTO `t_jobclass` VALUES ('36', '0', '销售/客服/技术支持', '0', null);
INSERT INTO `t_jobclass` VALUES ('35', '0', '计算机/互联网', '6', null);

-- ----------------------------
-- Table structure for `t_job_apply`
-- ----------------------------
DROP TABLE IF EXISTS `t_job_apply`;
CREATE TABLE `t_job_apply` (
  `id` int(11) NOT NULL,
  `resumeId` int(11) NOT NULL,
  `resumeUid` int(11) NOT NULL,
  `jobId` int(11) NOT NULL,
  `jobName` varchar(30) NOT NULL,
  `companyName` varchar(30) NOT NULL,
  `companyId` varchar(30) NOT NULL,
  `applyTime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resume`
-- ----------------------------
DROP TABLE IF EXISTS `t_resume`;
CREATE TABLE `t_resume` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `fullName` varchar(30) NOT NULL,
  `industry` varchar(30) NOT NULL,
  `birthday` varchar(30) NOT NULL,
  `experience` text,
  `address` varchar(30) NOT NULL,
  `education` varchar(30) NOT NULL,
  `telphone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `intentionJobs` varchar(30) NOT NULL,
  `specialty` varchar(200) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resume
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) DEFAULT NULL,
  `userPass` varchar(50) DEFAULT NULL,
  `userType` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'ccit', '123456', '2');
INSERT INTO `t_user` VALUES ('2', 'c0kaishi', '820036', '1');
INSERT INTO `t_user` VALUES ('3', 'yufan', '123', '1');
INSERT INTO `t_user` VALUES ('4', 'admin', 'admin', '3');
INSERT INTO `t_user` VALUES ('5', 'xiaobei', '123456', '1');
INSERT INTO `t_user` VALUES ('6', 'user1', '123456', '1');
INSERT INTO `t_user` VALUES ('14', 'qzzhuce', '123456', '1');
INSERT INTO `t_user` VALUES ('16', 'qzzhuce1', '123456', '1');
INSERT INTO `t_user` VALUES ('18', 'zhuceqz', '123456', '1');
INSERT INTO `t_user` VALUES ('24', 'yaya1', '123456', '1');
INSERT INTO `t_user` VALUES ('31', 'yaya', '123456', '1');
INSERT INTO `t_user` VALUES ('32', 'abc', '123456', '2');
