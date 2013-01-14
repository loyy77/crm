/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES gbk */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='SYSTEM' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


DROP DATABASE ;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL auto_increment,
  `customerId` int(11) default NULL,
  `atvDate` datetime NOT NULL,
  `place` varchar(200) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` varchar(2000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `customerId` (`customerId`)
);

CREATE TABLE `chance` (
  `id` int(11) NOT NULL auto_increment,
  `source` varchar(100) default NULL,
  `customerName` varchar(50) default NULL,
  `rate` decimal(8,2) default NULL,
  `title` varchar(50) NOT NULL,
  `linkMan` varchar(50) default NULL,
  `linkPhone` varchar(20) default NULL,
  `description` varchar(1000) default NULL,
  `createId` int(11) default NULL,
  `createDate` datetime default NULL,
  `assignId` int(11) default NULL,
  `assignDate` datetime default NULL,
  `state` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `createId` (`createId`),
  KEY `assignId` (`assignId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `chance` VALUES (1,'报纸','阿里巴巴',87,'111','马云','0571-12345678','销售交易系统',1,'2009-07-20 00:00:00',3,'2009-10-12 00:00:00',3);
INSERT INTO `chance` VALUES (2,'电视广告','微软',90,'222','比尔盖子','010-22222222','销售操作系统',2,'2009-10-01 00:00:00',3,'2009-10-12 00:00:00',4);
INSERT INTO `chance` VALUES (4,'网络广告','广州易达科技有限公司',89,'444','王功发','0711-32234234','销售药品',3,'2009-02-18 00:00:00',4,'2009-10-14 00:00:00',3);
INSERT INTO `chance` VALUES (5,'媒体广告','江苏舜天广告有限公司',78,'555','赵小帅','025-12345678','销售广告创意',2,'2007-12-16 00:00:00',4,'2007-12-16 00:00:00',2);
INSERT INTO `chance` VALUES (6,'户外传单广告','徐州海云电脑大世界',90,'销售打印纸','张先生','0516-34213412','销售打印纸',2,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO `chance` VALUES (8,'电视媒体','徐州用友软件',78,'销售碎纸机','王先生','0516-65753459','销售碎纸机',2,'2007-12-16 00:00:00',4,'2007-12-16 00:00:00',2);
INSERT INTO `chance` VALUES (9,'朋友口碑','山东济南造币厂',87,'卖纸','钱先生','0627-21321312','造币需要纸，卖给他纸',4,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO `chance` VALUES (10,'小道消息','保密',99,'不知道','不清楚','不告诉你','你猜猜',2,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO `chance` VALUES (11,'外星人告诉我的','哈迪斯',20,'要买石油','潘多拉','不清楚','要把地球的石油全部买光\r\n哈哈',1,'2009-10-21 00:00:00',NULL,NULL,1);
CREATE TABLE `customer` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `region` varchar(50) default NULL,
  `managerId` int(11) default NULL,
  `managerName` varchar(50) default NULL,
  `custLevel` int(11) default NULL,
  `levelLabel` varchar(50) default NULL,
  `satisfy` int(11) default NULL,
  `credit` int(11) default NULL,
  `addr` varchar(300) default NULL,
  `zip` varchar(10) default NULL,
  `tel` varchar(50) default NULL,
  `fax` varchar(50) default NULL,
  `website` varchar(50) default NULL,
  `licence` varchar(50) default NULL,
  `chieftain` varchar(50) default NULL,
  `bankroll` bigint(20) default NULL,
  `turnover` bigint(20) default NULL,
  `bank` varchar(200) default NULL,
  `account` varchar(50) default NULL,
  `localTax` varchar(50) default NULL,
  `nationalTax` varchar(50) default NULL,
  `state` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `managerId` (`managerId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `customer` VALUES (1,'聪海信息科技有限公司','北京',3,'樱桃小玩子',3,'大客户',5,5,'北京市海淀区','123456','010-12345678','111111','http://www.chkj.com','111','马老师',1000,3232,'中国工商银行','2134432234','23124435','45345345',1);
INSERT INTO `customer` VALUES (2,'北京明科科技有限公司','北京',3,'樱桃小玩子',2,'重点开发客户',4,3,'北京市宣武区','654321','010-65432187','222222','http://www.sad.net','21323213','赵小帅',200,234324,'中国交通银行','32423424323','234234234','324234234',1);
INSERT INTO `customer` VALUES (3,'太阳药业','华北',4,'叮当机器猫',1,'普通客户',3,4,'河北廊坊','4212321','56456456456','456456','http://www.163.com','','',0,0,'中国农业银行','','','',1);
INSERT INTO `customer` VALUES (4,'云南天河烟草公司','广州',3,'樱桃小玩子',2,'重点开发客户',2,4,'云南昆明','12312','456456456','678678','http://www.yunnan.com','','',2000,80,'中国建设银行','','','',2);
INSERT INTO `customer` VALUES (5,'北京天桥信息有限公司','北京',4,'叮当机器猫',3,'大客户',1,4,'北京市石景山区','13223','456456456','45645678','http://sina.com','asdasdasd','王西之',200,100,'花旗银行','33243','234234','234234',3);
INSERT INTO `customer` VALUES (6,'北京白羽有限责任公司','北京',3,'樱桃小玩子',5,'战略合作伙伴',4,4,'北京市西城区','12312','456456456','678678','http://www.163.com','','',0,0,'招商银行','','','',1);
INSERT INTO `customer` VALUES (7,'北京神光培训','北京',4,'叮当机器猫',3,'大客户',5,3,'北京市海淀区','213123','45645645','768678','http://zbaccp.com','','',0,0,'普发银行','','','',2);
INSERT INTO `customer` VALUES (8,'潍坊青鸟华光','华北',3,'樱桃小玩子',2,'重点开发客户',4,5,'山东省潍坊市','213123','645645645','768678','http://sina.com','','',0,0,'江苏银行','','','',1);
INSERT INTO `customer` VALUES (9,'青鸟无限数码','徐州',4,'叮当机器猫',4,'合作伙伴',3,4,'江苏省徐州市鼓楼区','213233','645645645','678678','http://www.86516.com','','',0,0,'农村信用社','','','',1);
INSERT INTO `customer` VALUES (10,'矿业大学','徐州',3,'樱桃小玩子',5,'战略合作伙伴',5,5,'江苏省徐州市泉山区','123123','6456456456','678678','http://sina.com','','',0,0,'社区银行','','','',1);
CREATE TABLE `dict` (
  `id` int(11) NOT NULL auto_increment,
  `dictType` varchar(50) NOT NULL,
  `dictItem` varchar(50) NOT NULL,
  `dictValue` varchar(50) NOT NULL,
  `editable` bit(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `dict` VALUES (1,'服务类型','咨询','咨询',b'1');
INSERT INTO `dict` VALUES (2,'服务类型','建议','建议',b'1');
INSERT INTO `dict` VALUES (3,'服务类型','投诉','投诉',b'1');
INSERT INTO `dict` VALUES (4,'客户等级','普通客户','1',b'0');
INSERT INTO `dict` VALUES (5,'客户等级','重点开发客户','2',b'0');
INSERT INTO `dict` VALUES (6,'客户等级','大客户','3',b'0');
INSERT INTO `dict` VALUES (7,'客户等级','合作伙伴','4',b'0');
INSERT INTO `dict` VALUES (8,'客户等级','战略合作伙伴','5',b'0');
INSERT INTO `dict` VALUES (9,'地区','江苏','江苏',b'1');
INSERT INTO `dict` VALUES (10,'地区','北京','北京',b'1');
INSERT INTO `dict` VALUES (11,'地区','华北','华北',b'1');
INSERT INTO `dict` VALUES (12,'地区','上海','上海',b'1');
INSERT INTO `dict` VALUES (13,'地区','广州','广州',b'1');
INSERT INTO `dict` VALUES (14,'地区','徐州','徐州',b'1');
INSERT INTO `dict` VALUES (15,'地区','南京','南京',b'1');
CREATE TABLE `linkman` (
  `id` int(11) NOT NULL auto_increment,
  `customerId` int(11) default NULL,
  `name` varchar(50) NOT NULL,
  `sex` varchar(5) default NULL,
  `position` varchar(50) default NULL,
  `tel` varchar(50) NOT NULL,
  `mobile` varchar(50) default NULL,
  `memo` varchar(300) default NULL,
  PRIMARY KEY  (`id`),
  KEY `customerId` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `linkman` VALUES (1,2,'王曦之','男','秘书','0516-4567878','13814423344','喜欢书法');
INSERT INTO `linkman` VALUES (2,1,'赵小帅','男','大内总管','010-1111111','111111111','zdasdasd');
INSERT INTO `linkman` VALUES (3,1,'毛委员','男','主席','0516-212122','2121231','2132123');
CREATE TABLE `plan` (
  `id` int(11) NOT NULL auto_increment,
  `chanceId` int(11) default NULL,
  `planDate` datetime NOT NULL,
  `planTodo` varchar(500) NOT NULL,
  `planResult` varchar(500) default NULL,
  PRIMARY KEY  (`id`),
  KEY `chanceId` (`chanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `plan` VALUES (1,4,'2009-05-12 00:00:00','首次见面','对方联系人的长相真是鬼斧神工');
INSERT INTO `plan` VALUES (3,4,'2007-12-21 00:00:00','一起吃饭，腐败','腐败的不错，大家都很开心');
INSERT INTO `plan` VALUES (4,2,'2007-12-20 00:00:00','教比尔盖子讲普通话','比尔盖子太笨，怎么教也不会，放弃');
INSERT INTO `plan` VALUES (5,1,'2007-12-20 00:00:00','帮马云整容，实在太疴碜了','整好了，马云很开心');
INSERT INTO `plan` VALUES (6,8,'2007-12-20 00:00:00','和客户见面',NULL);
INSERT INTO `plan` VALUES (7,5,'2009-10-23 00:00:00','新计划',NULL);
CREATE TABLE `rights` (
  `rightId` int(11) NOT NULL auto_increment,
  `parentId` int(11) NOT NULL,
  `rightName` varchar(100) NOT NULL,
  `rightUrl` varchar(100) NOT NULL,
  `rightDesc` varchar(100) NOT NULL,
  PRIMARY KEY  (`rightId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `rights` VALUES (1,0,'营销管理','','营销管理');
INSERT INTO `rights` VALUES (2,1,'销售机会管理','chance.do?op=toList','销售机会管理');
INSERT INTO `rights` VALUES (3,1,'客户开发计划','plan.do?op=toList','客户开发计划');
INSERT INTO `rights` VALUES (4,0,'客户管理','','客户管理');
INSERT INTO `rights` VALUES (5,4,'客户信息管理','customer.do?op=toList','客户信息管理');
INSERT INTO `rights` VALUES (6,4,'客户流失管理','','客户流失管理');
INSERT INTO `rights` VALUES (7,0,'服务管理','','服务管理');
INSERT INTO `rights` VALUES (8,7,'服务创建','','服务创建');
INSERT INTO `rights` VALUES (9,7,'服务分配','','服务分配');
INSERT INTO `rights` VALUES (10,7,'服务处理','','服务处理');
INSERT INTO `rights` VALUES (11,7,'服务反馈','','服务反馈');
INSERT INTO `rights` VALUES (12,7,'服务归档','','服务归档');
INSERT INTO `rights` VALUES (13,0,'统计报表','','统计报表');
INSERT INTO `rights` VALUES (14,13,'客户贡献分析','','客户贡献分析');
INSERT INTO `rights` VALUES (15,13,'客户构成分析','','客户构成分析');
INSERT INTO `rights` VALUES (16,13,'客户服务分析','','客户服务分析');
INSERT INTO `rights` VALUES (17,13,'客户流失分析','','客户流失分析');
INSERT INTO `rights` VALUES (18,0,'基础数据','','基础数据');
INSERT INTO `rights` VALUES (19,18,'数据字典管理','','数据字典管理');
INSERT INTO `rights` VALUES (20,18,'查询产品信息','','查询产品信息');
INSERT INTO `rights` VALUES (21,18,'查询库存','','查询库存');
INSERT INTO `rights` VALUES (22,0,'权限管理','','权限管理');
INSERT INTO `rights` VALUES (23,22,'用户管理','users.do?op=toList','用户管理');
INSERT INTO `rights` VALUES (24,22,'角色管理','role.do?op=toList','角色管理');
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL auto_increment,
  `roleName` varchar(50) NOT NULL,
  `roleDesc` varchar(100) NOT NULL,
  `flag` bit(1) NOT NULL,
  PRIMARY KEY  (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `role` VALUES (1,'管理员','拥有所有权限',b'1');
INSERT INTO `role` VALUES (2,'销售主管','创建、指派销售机会',b'1');
INSERT INTO `role` VALUES (3,'客户经理','创建、执行指派的销售机会',b'1');
INSERT INTO `role` VALUES (4,'高级管理员','部门高级主管拥有的权限',b'1');
CREATE TABLE `role_right` (
  `rightId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  KEY `FK6CC8F5139E87B317` (`rightId`),
  KEY `FK6CC8F5137FF0EFD0` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `role_right` VALUES (1,1);
INSERT INTO `role_right` VALUES (2,1);
INSERT INTO `role_right` VALUES (3,1);
INSERT INTO `role_right` VALUES (4,1);
INSERT INTO `role_right` VALUES (5,1);
INSERT INTO `role_right` VALUES (6,1);
INSERT INTO `role_right` VALUES (7,1);
INSERT INTO `role_right` VALUES (8,1);
INSERT INTO `role_right` VALUES (9,1);
INSERT INTO `role_right` VALUES (10,1);
INSERT INTO `role_right` VALUES (11,1);
INSERT INTO `role_right` VALUES (12,1);
INSERT INTO `role_right` VALUES (13,1);
INSERT INTO `role_right` VALUES (14,1);
INSERT INTO `role_right` VALUES (15,1);
INSERT INTO `role_right` VALUES (16,1);
INSERT INTO `role_right` VALUES (17,1);
INSERT INTO `role_right` VALUES (18,1);
INSERT INTO `role_right` VALUES (19,1);
INSERT INTO `role_right` VALUES (20,1);
INSERT INTO `role_right` VALUES (21,1);
INSERT INTO `role_right` VALUES (22,1);
INSERT INTO `role_right` VALUES (23,1);
INSERT INTO `role_right` VALUES (24,1);
INSERT INTO `role_right` VALUES (1,2);
INSERT INTO `role_right` VALUES (2,2);
INSERT INTO `role_right` VALUES (3,2);
INSERT INTO `role_right` VALUES (13,4);
INSERT INTO `role_right` VALUES (14,4);
INSERT INTO `role_right` VALUES (15,4);
INSERT INTO `role_right` VALUES (16,4);
INSERT INTO `role_right` VALUES (17,4);
INSERT INTO `role_right` VALUES (1,3);
INSERT INTO `role_right` VALUES (2,3);
INSERT INTO `role_right` VALUES (3,3);
INSERT INTO `role_right` VALUES (4,3);
INSERT INTO `role_right` VALUES (5,3);
INSERT INTO `role_right` VALUES (6,3);
CREATE TABLE `users` (
  `userId` int(11) NOT NULL auto_increment,
  `loginName` varchar(30) NOT NULL,
  `trueName` varchar(30) NOT NULL,
  `loginPass` varchar(30) NOT NULL,
  `flag` bit(1) NOT NULL,
  `roleId` int(11) default NULL,
  PRIMARY KEY  (`userId`),
  UNIQUE KEY `loginName` (`loginName`),
  KEY `FK6A68E087FF0EFD0` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `users` VALUES (1,'admin','马志国','123',b'1',1);
INSERT INTO `users` VALUES (2,'mike','蜡笔小新','321',b'0',2);
INSERT INTO `users` VALUES (3,'jack','樱桃小玩子','111',b'1',3);
INSERT INTO `users` VALUES (4,'tom','叮当机器猫','321',b'1',3);
INSERT INTO `users` VALUES (5,'supper','动感超人','111',b'1',NULL);

ALTER TABLE `activity`
  ADD FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`);

ALTER TABLE `chance`
  ADD FOREIGN KEY (`createId`) REFERENCES `users` (`userId`),
  ADD FOREIGN KEY (`assignId`) REFERENCES `users` (`userId`);

ALTER TABLE `customer`
  ADD FOREIGN KEY (`managerId`) REFERENCES `users` (`userId`);

ALTER TABLE `linkman`
  ADD FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`);

ALTER TABLE `plan`
  ADD FOREIGN KEY (`chanceId`) REFERENCES `chance` (`id`);

ALTER TABLE `role_right`
  ADD FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`),
  ADD FOREIGN KEY (`rightId`) REFERENCES `rights` (`rightId`);

ALTER TABLE `users`
  ADD FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`);


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
