

INSERT INTO chance VALUES (default,'报纸','阿里巴巴',87,'111','马云','0571-12345678','销售交易系统',1,'2009-07-20 00:00:00',3,'2009-10-12 00:00:00',3);
INSERT INTO chance VALUES (default,'电视广告','微软',90,'222','比尔盖子','010-22222222','销售操作系统',2,'2009-10-01 00:00:00',3,'2009-10-12 00:00:00',4);
INSERT INTO chance VALUES (default,'网络广告','广州易达科技有限公司',89,'444','王功发','0711-32234234','销售药品',3,'2009-02-18 00:00:00',4,'2009-10-14 00:00:00',3);
INSERT INTO chance VALUES (default,'媒体广告','江苏舜天广告有限公司',78,'555','赵小帅','025-12345678','销售广告创意',2,'2007-12-16 00:00:00',4,'2007-12-16 00:00:00',2);
INSERT INTO chance VALUES (default,'户外传单广告','徐州海云电脑大世界',90,'销售打印纸','张先生','0516-34213412','销售打印纸',2,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO chance VALUES (default,'电视媒体','徐州用友软件',78,'销售碎纸机','王先生','0516-65753459','销售碎纸机',2,'2007-12-16 00:00:00',4,'2007-12-16 00:00:00',2);
INSERT INTO chance VALUES (default,'朋友口碑','山东济南造币厂',87,'卖纸','钱先生','0627-21321312','造币需要纸，卖给他纸',4,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO chance VALUES (default,'小道消息','保密',99,'不知道','不清楚','不告诉你','你猜猜',2,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO chance VALUES (default,'外星人告诉我的','哈迪斯',20,'要买石油','潘多拉','不清楚','要把地球的石油全部买光\r\n哈哈',1,'2009-10-21 00:00:00',NULL,NULL,1);

 


INSERT INTO dict VALUES (default,'服务类型','咨询','咨询',true);
INSERT INTO dict VALUES (default,'服务类型','建议','建议',true);
INSERT INTO dict VALUES (default,'服务类型','投诉','投诉',true);
INSERT INTO dict VALUES (default,'客户等级','普通客户','1',false);
INSERT INTO dict VALUES (default,'客户等级','重点开发客户','2',false);
INSERT INTO dict VALUES (default,'客户等级','大客户','3',false);
INSERT INTO dict VALUES (default,'客户等级','合作伙伴','4',false);
INSERT INTO dict VALUES (default,'客户等级','战略合作伙伴','5',false);
INSERT INTO dict VALUES (default,'地区','江苏','江苏',true);
INSERT INTO dict VALUES (default,'地区','北京','北京',true);
INSERT INTO dict VALUES (default,'地区','华北','华北',true);
INSERT INTO dict VALUES (default,'地区','上海','上海',true);
INSERT INTO dict VALUES (default,'地区','广州','广州',true);
INSERT INTO dict VALUES (default,'地区','徐州','徐州',true);
INSERT INTO dict VALUES (default,'地区','南京','南京',true);



INSERT INTO linkman VALUES (default,2,'王曦之','男','秘书','0516-4567878','13814423344','喜欢书法');
INSERT INTO linkman VALUES (default,1,'赵小帅','男','大内总管','010-1111111','111111111','zdasdasd');
INSERT INTO linkman VALUES (default,1,'毛委员','男','主席','0516-212122','2121231','2132123');


INSERT INTO plan VALUES (default,4,'2009-05-12 00:00:00','首次见面','对方联系人的长相真是鬼斧神工');
INSERT INTO plan VALUES (default,4,'2007-12-21 00:00:00','一起吃饭，腐败','腐败的不错，大家都很开心');
INSERT INTO plan VALUES (default,2,'2007-12-20 00:00:00','教比尔盖子讲普通话','比尔盖子太笨，怎么教也不会，放弃');
INSERT INTO plan VALUES (default,1,'2007-12-20 00:00:00','帮马云整容，实在太疴碜了','整好了，马云很开心');
INSERT INTO plan VALUES (default,8,'2007-12-20 00:00:00','和客户见面',NULL);
INSERT INTO plan VALUES (default,5,'2009-10-23 00:00:00','新计划',NULL);


INSERT INTO rights VALUES (default,0,'营销管理','','营销管理');
INSERT INTO rights VALUES (default,1,'销售机会管理','chance.do?op=toList','销售机会管理');
INSERT INTO rights VALUES (default,1,'客户开发计划','plan.do?op=toList','客户开发计划');
INSERT INTO rights VALUES (default,0,'客户管理','','客户管理');
INSERT INTO rights VALUES (default,4,'客户信息管理','customer.do?op=toList','客户信息管理');
INSERT INTO rights VALUES (default,4,'客户流失管理','','客户流失管理');
INSERT INTO rights VALUES (default,0,'服务管理','','服务管理');
INSERT INTO rights VALUES (default,7,'服务创建','','服务创建');
INSERT INTO rights VALUES (default,7,'服务分配','','服务分配');
INSERT INTO rights VALUES (default,7,'服务处理','','服务处理');
INSERT INTO rights VALUES (default,7,'服务反馈','','服务反馈');
INSERT INTO rights VALUES (default,7,'服务归档','','服务归档');
INSERT INTO rights VALUES (default,0,'统计报表','','统计报表');
INSERT INTO rights VALUES (default,13,'客户贡献分析','','客户贡献分析');
INSERT INTO rights VALUES (default,13,'客户构成分析','','客户构成分析');
INSERT INTO rights VALUES (default,13,'客户服务分析','','客户服务分析');
INSERT INTO rights VALUES (default,13,'客户流失分析','','客户流失分析');
INSERT INTO rights VALUES (default,0,'基础数据','','基础数据');
INSERT INTO rights VALUES (default,18,'数据字典管理','','数据字典管理');
INSERT INTO rights VALUES (default,18,'查询产品信息','','查询产品信息');
INSERT INTO rights VALUES (default,18,'查询库存','','查询库存');
INSERT INTO rights VALUES (default,0,'权限管理','','权限管理');
INSERT INTO rights VALUES (default,22,'用户管理','users.do?op=toList','用户管理');
INSERT INTO rights VALUES (default,22,'角色管理','role.do?op=toList','角色管理');

INSERT INTO role VALUES (default,'管理员','拥有所有权限',true);
INSERT INTO role VALUES (default,'销售主管','创建、指派销售机会',true);
INSERT INTO role VALUES (default,'客户经理','创建、执行指派的销售机会',true);
INSERT INTO role VALUES (default,'高级管理员','部门高级主管拥有的权限',true);


INSERT INTO role_right VALUES (1,1);
INSERT INTO role_right VALUES (2,1);
INSERT INTO role_right VALUES (3,1);
INSERT INTO role_right VALUES (4,1);
INSERT INTO role_right VALUES (5,1);
INSERT INTO role_right VALUES (6,1);
INSERT INTO role_right VALUES (7,1);
INSERT INTO role_right VALUES (8,1);
INSERT INTO role_right VALUES (9,1);
INSERT INTO role_right VALUES (10,1);
INSERT INTO role_right VALUES (11,1);
INSERT INTO role_right VALUES (12,1);
INSERT INTO role_right VALUES (13,1);
INSERT INTO role_right VALUES (14,1);
INSERT INTO role_right VALUES (15,1);
INSERT INTO role_right VALUES (16,1);
INSERT INTO role_right VALUES (17,1);
INSERT INTO role_right VALUES (18,1);
INSERT INTO role_right VALUES (19,1);
INSERT INTO role_right VALUES (20,1);
INSERT INTO role_right VALUES (21,1);
INSERT INTO role_right VALUES (22,1);
INSERT INTO role_right VALUES (23,1);
INSERT INTO role_right VALUES (24,1);
INSERT INTO role_right VALUES (1,2);
INSERT INTO role_right VALUES (2,2);
INSERT INTO role_right VALUES (3,2);
INSERT INTO role_right VALUES (13,4);
INSERT INTO role_right VALUES (14,4);
INSERT INTO role_right VALUES (15,4);
INSERT INTO role_right VALUES (16,4);
INSERT INTO role_right VALUES (17,4);
INSERT INTO role_right VALUES (1,3);
INSERT INTO role_right VALUES (2,3);
INSERT INTO role_right VALUES (3,3);
INSERT INTO role_right VALUES (4,3);
INSERT INTO role_right VALUES (5,3);
INSERT INTO role_right VALUES (6,3);


INSERT INTO customer VALUES (default,'聪海信息科技有限公司','北京',3,'樱桃小玩子',3,'大客户',5,5,'北京市海淀区','123456','010-12345678','111111','http://www.chkj.com','111','马老师',1000,3232,'中国工商银行','2134432234','23124435','45345345',1);
INSERT INTO customer VALUES (default,'北京明科科技有限公司','北京',3,'樱桃小玩子',2,'重点开发客户',4,3,'北京市宣武区','154321','010-65432187','222222','http://www.sad.net','2133','赵小帅',200,3324,'中国交通银行','32424323','2344234','3234234',1);
INSERT INTO customer VALUES (default,'太阳药业','华北',4,'叮当机器猫',1,'普通客户',3,4,'河北廊坊','4212321','6456456','456456','http://www.163.com','','',0,0,'中国农业银行','','','',1);
INSERT INTO customer VALUES (default,'云南天河烟草公司','广州',3,'樱桃小玩子',2,'重点开发客户',2,4,'云南昆明','12312','456456456','678678','http://www.yunnan.com','','',2000,80,'中国建设银行','','','',2);
INSERT INTO customer VALUES (default,'北京天桥信息有限公司','北京',4,'叮当机器猫',3,'大客户',1,4,'北京市石景山区','13223','456456456','45645678','http://sina.com','asdasdasd','王西之',200,100,'花旗银行','33243','234234','234234',3);
INSERT INTO customer VALUES (default,'北京白羽有限责任公司','北京',3,'樱桃小玩子',5,'战略合作伙伴',4,4,'北京市西城区','12312','456456456','678678','http://www.163.com','','',0,0,'招商银行','','','',1);
INSERT INTO customer VALUES (default,'北京神光培训','北京',4,'叮当机器猫',3,'大客户',5,3,'北京市海淀区','213123','45645645','768678','http://zbaccp.com','','',0,0,'普发银行','','','',2);
INSERT INTO customer VALUES (default,'潍坊青鸟华光','华北',3,'樱桃小玩子',2,'重点开发客户',4,5,'山东省潍坊市','213123','645645645','768678','http://sina.com','','',0,0,'江苏银行','','','',1);
INSERT INTO customer VALUES (default,'青鸟无限数码','徐州',4,'叮当机器猫',4,'合作伙伴',3,4,'江苏省徐州市鼓楼区','213233','645645645','678678','http://www.86516.com','','',0,0,'农村信用社','','','',1);
INSERT INTO customer VALUES (default,'矿业大学','徐州',3,'樱桃小玩子',5,'战略合作伙伴',5,5,'江苏省徐州市泉山区','123123','6456456456','678678','http://sina.com','','',0,0,'社区银行','','','',1);



INSERT INTO users VALUES (default,'admin','马志国','123',true,1);
INSERT INTO users VALUES (default,'mike','蜡笔小新','321',false,2);
INSERT INTO users VALUES (default,'jack','樱桃小玩子','111',false,3);
INSERT INTO users VALUES (default,'tom','叮当机器猫','321',true,3);
INSERT INTO users VALUES (default,'supper','动感超人','111',true,NULL);

ALTER TABLE activity
  ADD FOREIGN KEY (customerId) REFERENCES customer (id);

ALTER TABLE chance
  ADD FOREIGN KEY (createId) REFERENCES users (userId);
  ALTER TABLE chance
  ADD FOREIGN KEY (assignId) REFERENCES users (userId);

ALTER TABLE customer
  ADD FOREIGN KEY (managerId) REFERENCES users (userId);

ALTER TABLE linkman
  ADD FOREIGN KEY (customerId) REFERENCES customer (id);

ALTER TABLE plan
  ADD FOREIGN KEY (chanceId) REFERENCES chance (id);

ALTER TABLE role_right
  ADD FOREIGN KEY (roleId) REFERENCES role (roleId);
  ALTER TABLE role_right
  ADD FOREIGN KEY (rightId) REFERENCES rights (rightId);

ALTER TABLE users
  ADD FOREIGN KEY (roleId) REFERENCES role (roleId);


