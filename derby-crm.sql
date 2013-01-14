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

INSERT INTO `chance` VALUES (1,'��ֽ','����Ͱ�',87,'111','����','0571-12345678','���۽���ϵͳ',1,'2009-07-20 00:00:00',3,'2009-10-12 00:00:00',3);
INSERT INTO `chance` VALUES (2,'���ӹ��','΢��',90,'222','�ȶ�����','010-22222222','���۲���ϵͳ',2,'2009-10-01 00:00:00',3,'2009-10-12 00:00:00',4);
INSERT INTO `chance` VALUES (4,'������','�����״�Ƽ����޹�˾',89,'444','������','0711-32234234','����ҩƷ',3,'2009-02-18 00:00:00',4,'2009-10-14 00:00:00',3);
INSERT INTO `chance` VALUES (5,'ý����','����˴�������޹�˾',78,'555','��С˧','025-12345678','���۹�洴��',2,'2007-12-16 00:00:00',4,'2007-12-16 00:00:00',2);
INSERT INTO `chance` VALUES (6,'���⴫�����','���ݺ��Ƶ��Դ�����',90,'���۴�ӡֽ','������','0516-34213412','���۴�ӡֽ',2,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO `chance` VALUES (8,'����ý��','�����������',78,'������ֽ��','������','0516-65753459','������ֽ��',2,'2007-12-16 00:00:00',4,'2007-12-16 00:00:00',2);
INSERT INTO `chance` VALUES (9,'���ѿڱ�','ɽ��������ҳ�',87,'��ֽ','Ǯ����','0627-21321312','�����Ҫֽ��������ֽ',4,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO `chance` VALUES (10,'С����Ϣ','����',99,'��֪��','�����','��������','��²�',2,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO `chance` VALUES (11,'�����˸����ҵ�','����˹',20,'Ҫ��ʯ��','�˶���','�����','Ҫ�ѵ����ʯ��ȫ�����\r\n����',1,'2009-10-21 00:00:00',NULL,NULL,1);
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

INSERT INTO `customer` VALUES (1,'�Ϻ���Ϣ�Ƽ����޹�˾','����',3,'ӣ��С����',3,'��ͻ�',5,5,'�����к�����','123456','010-12345678','111111','http://www.chkj.com','111','����ʦ',1000,3232,'�й���������','2134432234','23124435','45345345',1);
INSERT INTO `customer` VALUES (2,'�������ƿƼ����޹�˾','����',3,'ӣ��С����',2,'�ص㿪���ͻ�',4,3,'������������','654321','010-65432187','222222','http://www.sad.net','21323213','��С˧',200,234324,'�й���ͨ����','32423424323','234234234','324234234',1);
INSERT INTO `customer` VALUES (3,'̫��ҩҵ','����',4,'��������è',1,'��ͨ�ͻ�',3,4,'�ӱ��ȷ�','4212321','56456456456','456456','http://www.163.com','','',0,0,'�й�ũҵ����','','','',1);
INSERT INTO `customer` VALUES (4,'��������̲ݹ�˾','����',3,'ӣ��С����',2,'�ص㿪���ͻ�',2,4,'��������','12312','456456456','678678','http://www.yunnan.com','','',2000,80,'�й���������','','','',2);
INSERT INTO `customer` VALUES (5,'����������Ϣ���޹�˾','����',4,'��������è',3,'��ͻ�',1,4,'������ʯ��ɽ��','13223','456456456','45645678','http://sina.com','asdasdasd','����֮',200,100,'��������','33243','234234','234234',3);
INSERT INTO `customer` VALUES (6,'���������������ι�˾','����',3,'ӣ��С����',5,'ս�Ժ������',4,4,'������������','12312','456456456','678678','http://www.163.com','','',0,0,'��������','','','',1);
INSERT INTO `customer` VALUES (7,'���������ѵ','����',4,'��������è',3,'��ͻ�',5,3,'�����к�����','213123','45645645','768678','http://zbaccp.com','','',0,0,'�շ�����','','','',2);
INSERT INTO `customer` VALUES (8,'Ϋ�����񻪹�','����',3,'ӣ��С����',2,'�ص㿪���ͻ�',4,5,'ɽ��ʡΫ����','213123','645645645','768678','http://sina.com','','',0,0,'��������','','','',1);
INSERT INTO `customer` VALUES (9,'������������','����',4,'��������è',4,'�������',3,4,'����ʡ�����й�¥��','213233','645645645','678678','http://www.86516.com','','',0,0,'ũ��������','','','',1);
INSERT INTO `customer` VALUES (10,'��ҵ��ѧ','����',3,'ӣ��С����',5,'ս�Ժ������',5,5,'����ʡ������Ȫɽ��','123123','6456456456','678678','http://sina.com','','',0,0,'��������','','','',1);
CREATE TABLE `dict` (
  `id` int(11) NOT NULL auto_increment,
  `dictType` varchar(50) NOT NULL,
  `dictItem` varchar(50) NOT NULL,
  `dictValue` varchar(50) NOT NULL,
  `editable` bit(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `dict` VALUES (1,'��������','��ѯ','��ѯ',b'1');
INSERT INTO `dict` VALUES (2,'��������','����','����',b'1');
INSERT INTO `dict` VALUES (3,'��������','Ͷ��','Ͷ��',b'1');
INSERT INTO `dict` VALUES (4,'�ͻ��ȼ�','��ͨ�ͻ�','1',b'0');
INSERT INTO `dict` VALUES (5,'�ͻ��ȼ�','�ص㿪���ͻ�','2',b'0');
INSERT INTO `dict` VALUES (6,'�ͻ��ȼ�','��ͻ�','3',b'0');
INSERT INTO `dict` VALUES (7,'�ͻ��ȼ�','�������','4',b'0');
INSERT INTO `dict` VALUES (8,'�ͻ��ȼ�','ս�Ժ������','5',b'0');
INSERT INTO `dict` VALUES (9,'����','����','����',b'1');
INSERT INTO `dict` VALUES (10,'����','����','����',b'1');
INSERT INTO `dict` VALUES (11,'����','����','����',b'1');
INSERT INTO `dict` VALUES (12,'����','�Ϻ�','�Ϻ�',b'1');
INSERT INTO `dict` VALUES (13,'����','����','����',b'1');
INSERT INTO `dict` VALUES (14,'����','����','����',b'1');
INSERT INTO `dict` VALUES (15,'����','�Ͼ�','�Ͼ�',b'1');
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

INSERT INTO `linkman` VALUES (1,2,'����֮','��','����','0516-4567878','13814423344','ϲ���鷨');
INSERT INTO `linkman` VALUES (2,1,'��С˧','��','�����ܹ�','010-1111111','111111111','zdasdasd');
INSERT INTO `linkman` VALUES (3,1,'ëίԱ','��','��ϯ','0516-212122','2121231','2132123');
CREATE TABLE `plan` (
  `id` int(11) NOT NULL auto_increment,
  `chanceId` int(11) default NULL,
  `planDate` datetime NOT NULL,
  `planTodo` varchar(500) NOT NULL,
  `planResult` varchar(500) default NULL,
  PRIMARY KEY  (`id`),
  KEY `chanceId` (`chanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `plan` VALUES (1,4,'2009-05-12 00:00:00','�״μ���','�Է���ϵ�˵ĳ������ǹ���');
INSERT INTO `plan` VALUES (3,4,'2007-12-21 00:00:00','һ��Է�������','���ܵĲ�����Ҷ��ܿ���');
INSERT INTO `plan` VALUES (4,2,'2007-12-20 00:00:00','�̱ȶ����ӽ���ͨ��','�ȶ�����̫������ô��Ҳ���ᣬ����');
INSERT INTO `plan` VALUES (5,1,'2007-12-20 00:00:00','���������ݣ�ʵ��̫������','�����ˣ����ƺܿ���');
INSERT INTO `plan` VALUES (6,8,'2007-12-20 00:00:00','�Ϳͻ�����',NULL);
INSERT INTO `plan` VALUES (7,5,'2009-10-23 00:00:00','�¼ƻ�',NULL);
CREATE TABLE `rights` (
  `rightId` int(11) NOT NULL auto_increment,
  `parentId` int(11) NOT NULL,
  `rightName` varchar(100) NOT NULL,
  `rightUrl` varchar(100) NOT NULL,
  `rightDesc` varchar(100) NOT NULL,
  PRIMARY KEY  (`rightId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `rights` VALUES (1,0,'Ӫ������','','Ӫ������');
INSERT INTO `rights` VALUES (2,1,'���ۻ������','chance.do?op=toList','���ۻ������');
INSERT INTO `rights` VALUES (3,1,'�ͻ������ƻ�','plan.do?op=toList','�ͻ������ƻ�');
INSERT INTO `rights` VALUES (4,0,'�ͻ�����','','�ͻ�����');
INSERT INTO `rights` VALUES (5,4,'�ͻ���Ϣ����','customer.do?op=toList','�ͻ���Ϣ����');
INSERT INTO `rights` VALUES (6,4,'�ͻ���ʧ����','','�ͻ���ʧ����');
INSERT INTO `rights` VALUES (7,0,'�������','','�������');
INSERT INTO `rights` VALUES (8,7,'���񴴽�','','���񴴽�');
INSERT INTO `rights` VALUES (9,7,'�������','','�������');
INSERT INTO `rights` VALUES (10,7,'������','','������');
INSERT INTO `rights` VALUES (11,7,'������','','������');
INSERT INTO `rights` VALUES (12,7,'����鵵','','����鵵');
INSERT INTO `rights` VALUES (13,0,'ͳ�Ʊ���','','ͳ�Ʊ���');
INSERT INTO `rights` VALUES (14,13,'�ͻ����׷���','','�ͻ����׷���');
INSERT INTO `rights` VALUES (15,13,'�ͻ����ɷ���','','�ͻ����ɷ���');
INSERT INTO `rights` VALUES (16,13,'�ͻ��������','','�ͻ��������');
INSERT INTO `rights` VALUES (17,13,'�ͻ���ʧ����','','�ͻ���ʧ����');
INSERT INTO `rights` VALUES (18,0,'��������','','��������');
INSERT INTO `rights` VALUES (19,18,'�����ֵ����','','�����ֵ����');
INSERT INTO `rights` VALUES (20,18,'��ѯ��Ʒ��Ϣ','','��ѯ��Ʒ��Ϣ');
INSERT INTO `rights` VALUES (21,18,'��ѯ���','','��ѯ���');
INSERT INTO `rights` VALUES (22,0,'Ȩ�޹���','','Ȩ�޹���');
INSERT INTO `rights` VALUES (23,22,'�û�����','users.do?op=toList','�û�����');
INSERT INTO `rights` VALUES (24,22,'��ɫ����','role.do?op=toList','��ɫ����');
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL auto_increment,
  `roleName` varchar(50) NOT NULL,
  `roleDesc` varchar(100) NOT NULL,
  `flag` bit(1) NOT NULL,
  PRIMARY KEY  (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `role` VALUES (1,'����Ա','ӵ������Ȩ��',b'1');
INSERT INTO `role` VALUES (2,'��������','������ָ�����ۻ���',b'1');
INSERT INTO `role` VALUES (3,'�ͻ�����','������ִ��ָ�ɵ����ۻ���',b'1');
INSERT INTO `role` VALUES (4,'�߼�����Ա','���Ÿ߼�����ӵ�е�Ȩ��',b'1');
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

INSERT INTO `users` VALUES (1,'admin','��־��','123',b'1',1);
INSERT INTO `users` VALUES (2,'mike','����С��','321',b'0',2);
INSERT INTO `users` VALUES (3,'jack','ӣ��С����','111',b'1',3);
INSERT INTO `users` VALUES (4,'tom','��������è','321',b'1',3);
INSERT INTO `users` VALUES (5,'supper','���г���','111',b'1',NULL);

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
