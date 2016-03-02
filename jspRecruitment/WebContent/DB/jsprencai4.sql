/*
Navicat MySQL Data Transfer

Source Server         : yaya
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : jsprencai

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2016-03-02 22:54:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(30) DEFAULT NULL,
  `userName` varchar(30) NOT NULL,
  `nature` varchar(30) DEFAULT NULL,
  `industry` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `telphone` varchar(30) DEFAULT NULL,
  `scale` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `introduction` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('4', 'xinxijishu', 'bcd', '私营企业', '销售/ 客服/技术支持', '上海市金科路', '13213123123', '10-50人', '1163423440@qq.com', ' ');
INSERT INTO `t_company` VALUES ('5', '华喻视讯技术有限公司', 'abc', '集体企业', '销售/ 客服/技术支持', '上海市', '13213123123', '10-50人', '1163423440@qq.com', ' ');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL,
  `companyName` varchar(30) DEFAULT NULL,
  `amount` varchar(20) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL,
  `education` varchar(30) DEFAULT NULL,
  `experience` varchar(30) DEFAULT NULL,
  `salary` varchar(30) DEFAULT NULL,
  `contents` varchar(500) DEFAULT NULL,
  `addtime` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company_job
-- ----------------------------
INSERT INTO `t_company_job` VALUES ('1', '5', 'java工程师', '华喻视讯技术有限公司', '4-8人', '上海', '大专', '3-5年', '10000-14999/月 ', '精通java，热爱编程', '2016-03-02', '2016-04-30');
INSERT INTO `t_company_job` VALUES ('2', '5', 'web工程师', '华喻视讯技术有限公司', '3-5人', '上海', '大专', '3-5年', '8000-16000/月 ', '精通html，css', '2016-03-02', '2016-07-23');
INSERT INTO `t_company_job` VALUES ('3', '5', 'C++软件工程师', '华喻视讯技术有限公司', '5人', '上海市.杨浦区', '本科', '3-5年', '6000-12000/月', '1、计算机、数学或相关专业，本科及以上学历，一年以上相关工作经验； \r\n2、熟悉C/C++编程语言，OO设计理念和设计模式，熟练使用VC++各版本开发环境； \r\n3、熟悉动态链接库DLL的应用和开发、MFC程序设计； \r\n4、熟悉SQL数据库基本操作； ', '2016-03-02', '2016-05-28');
INSERT INTO `t_company_job` VALUES ('4', '5', '资深PHP工程师', '华喻视讯技术有限公司', '1人', '上海-徐汇区', '大专', '5-10年', '20000-25000/月', '1、负责公司CRM软件研发相关工作；\r\n2、负责公司项目平台的维护和系统优化；\r\n3、负责微信管理平台开发；\r\n4、其他领导交办的工作。', '2016-03-02', '2016-07-16');
INSERT INTO `t_company_job` VALUES ('5', '5', 'q', '华喻视讯技术有限公司', 'q', 'q', '初中及以下', '不限', 'q', '', '2016-03-02', '2016-03-26');
INSERT INTO `t_company_job` VALUES ('6', '5', 'q', '华喻视讯技术有限公司', 'a', 'a', '高中/中技/中专', '1-3年', 'a', '', '2016-03-02', '2016-03-25');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `fullName` varchar(30) DEFAULT NULL,
  `industry` varchar(30) DEFAULT NULL,
  `birthday` varchar(30) DEFAULT NULL,
  `experience` text,
  `address` varchar(30) DEFAULT NULL,
  `education` varchar(30) DEFAULT NULL,
  `telphone` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `intentionJobs` varchar(30) DEFAULT NULL,
  `specialty` varchar(200) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resume
-- ----------------------------
INSERT INTO `t_resume` VALUES ('1', '42', 'cherry', null, null, null, null, null, null, null, null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'ccit', '123456', '2');
INSERT INTO `t_user` VALUES ('2', 'c0kaishi', '123456', '1');
INSERT INTO `t_user` VALUES ('3', 'yufan', '123456', '1');
INSERT INTO `t_user` VALUES ('4', 'admin', '123456', '3');
INSERT INTO `t_user` VALUES ('5', 'xiaobei', '123456', '1');
INSERT INTO `t_user` VALUES ('6', 'user1', '123456', '1');
INSERT INTO `t_user` VALUES ('14', 'qzzhuce', '123456', '1');
INSERT INTO `t_user` VALUES ('16', 'qzzhuce1', '123456', '1');
INSERT INTO `t_user` VALUES ('18', 'zhuceqz', '123456', '1');
INSERT INTO `t_user` VALUES ('24', 'yaya1', '123456', '1');
INSERT INTO `t_user` VALUES ('31', 'yaya', '123456', '1');
INSERT INTO `t_user` VALUES ('32', 'abc', '123456', '2');
INSERT INTO `t_user` VALUES ('33', 'bcd', '123456', '2');
INSERT INTO `t_user` VALUES ('34', 'bgv', '123456', '2');
INSERT INTO `t_user` VALUES ('40', 'bcd', '123456', '2');
INSERT INTO `t_user` VALUES ('42', 'cherry', '123456', '1');
