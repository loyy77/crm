

INSERT INTO chance VALUES (default,'��ֽ','����Ͱ�',87,'111','����','0571-12345678','���۽���ϵͳ',1,'2009-07-20 00:00:00',3,'2009-10-12 00:00:00',3);
INSERT INTO chance VALUES (default,'���ӹ��','΢��',90,'222','�ȶ�����','010-22222222','���۲���ϵͳ',2,'2009-10-01 00:00:00',3,'2009-10-12 00:00:00',4);
INSERT INTO chance VALUES (default,'������','�����״�Ƽ����޹�˾',89,'444','������','0711-32234234','����ҩƷ',3,'2009-02-18 00:00:00',4,'2009-10-14 00:00:00',3);
INSERT INTO chance VALUES (default,'ý����','����˴�������޹�˾',78,'555','��С˧','025-12345678','���۹�洴��',2,'2007-12-16 00:00:00',4,'2007-12-16 00:00:00',2);
INSERT INTO chance VALUES (default,'���⴫�����','���ݺ��Ƶ��Դ�����',90,'���۴�ӡֽ','������','0516-34213412','���۴�ӡֽ',2,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO chance VALUES (default,'����ý��','�����������',78,'������ֽ��','������','0516-65753459','������ֽ��',2,'2007-12-16 00:00:00',4,'2007-12-16 00:00:00',2);
INSERT INTO chance VALUES (default,'���ѿڱ�','ɽ��������ҳ�',87,'��ֽ','Ǯ����','0627-21321312','�����Ҫֽ��������ֽ',4,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO chance VALUES (default,'С����Ϣ','����',99,'��֪��','�����','��������','��²�',2,'2007-12-16 00:00:00',NULL,NULL,1);
INSERT INTO chance VALUES (default,'�����˸����ҵ�','����˹',20,'Ҫ��ʯ��','�˶���','�����','Ҫ�ѵ����ʯ��ȫ�����\r\n����',1,'2009-10-21 00:00:00',NULL,NULL,1);

 


INSERT INTO dict VALUES (default,'��������','��ѯ','��ѯ',true);
INSERT INTO dict VALUES (default,'��������','����','����',true);
INSERT INTO dict VALUES (default,'��������','Ͷ��','Ͷ��',true);
INSERT INTO dict VALUES (default,'�ͻ��ȼ�','��ͨ�ͻ�','1',false);
INSERT INTO dict VALUES (default,'�ͻ��ȼ�','�ص㿪���ͻ�','2',false);
INSERT INTO dict VALUES (default,'�ͻ��ȼ�','��ͻ�','3',false);
INSERT INTO dict VALUES (default,'�ͻ��ȼ�','�������','4',false);
INSERT INTO dict VALUES (default,'�ͻ��ȼ�','ս�Ժ������','5',false);
INSERT INTO dict VALUES (default,'����','����','����',true);
INSERT INTO dict VALUES (default,'����','����','����',true);
INSERT INTO dict VALUES (default,'����','����','����',true);
INSERT INTO dict VALUES (default,'����','�Ϻ�','�Ϻ�',true);
INSERT INTO dict VALUES (default,'����','����','����',true);
INSERT INTO dict VALUES (default,'����','����','����',true);
INSERT INTO dict VALUES (default,'����','�Ͼ�','�Ͼ�',true);



INSERT INTO linkman VALUES (default,2,'����֮','��','����','0516-4567878','13814423344','ϲ���鷨');
INSERT INTO linkman VALUES (default,1,'��С˧','��','�����ܹ�','010-1111111','111111111','zdasdasd');
INSERT INTO linkman VALUES (default,1,'ëίԱ','��','��ϯ','0516-212122','2121231','2132123');


INSERT INTO plan VALUES (default,4,'2009-05-12 00:00:00','�״μ���','�Է���ϵ�˵ĳ������ǹ���');
INSERT INTO plan VALUES (default,4,'2007-12-21 00:00:00','һ��Է�������','���ܵĲ�����Ҷ��ܿ���');
INSERT INTO plan VALUES (default,2,'2007-12-20 00:00:00','�̱ȶ����ӽ���ͨ��','�ȶ�����̫������ô��Ҳ���ᣬ����');
INSERT INTO plan VALUES (default,1,'2007-12-20 00:00:00','���������ݣ�ʵ��̫������','�����ˣ����ƺܿ���');
INSERT INTO plan VALUES (default,8,'2007-12-20 00:00:00','�Ϳͻ�����',NULL);
INSERT INTO plan VALUES (default,5,'2009-10-23 00:00:00','�¼ƻ�',NULL);


INSERT INTO rights VALUES (default,0,'Ӫ������','','Ӫ������');
INSERT INTO rights VALUES (default,1,'���ۻ������','chance.do?op=toList','���ۻ������');
INSERT INTO rights VALUES (default,1,'�ͻ������ƻ�','plan.do?op=toList','�ͻ������ƻ�');
INSERT INTO rights VALUES (default,0,'�ͻ�����','','�ͻ�����');
INSERT INTO rights VALUES (default,4,'�ͻ���Ϣ����','customer.do?op=toList','�ͻ���Ϣ����');
INSERT INTO rights VALUES (default,4,'�ͻ���ʧ����','','�ͻ���ʧ����');
INSERT INTO rights VALUES (default,0,'�������','','�������');
INSERT INTO rights VALUES (default,7,'���񴴽�','','���񴴽�');
INSERT INTO rights VALUES (default,7,'�������','','�������');
INSERT INTO rights VALUES (default,7,'������','','������');
INSERT INTO rights VALUES (default,7,'������','','������');
INSERT INTO rights VALUES (default,7,'����鵵','','����鵵');
INSERT INTO rights VALUES (default,0,'ͳ�Ʊ���','','ͳ�Ʊ���');
INSERT INTO rights VALUES (default,13,'�ͻ����׷���','','�ͻ����׷���');
INSERT INTO rights VALUES (default,13,'�ͻ����ɷ���','','�ͻ����ɷ���');
INSERT INTO rights VALUES (default,13,'�ͻ��������','','�ͻ��������');
INSERT INTO rights VALUES (default,13,'�ͻ���ʧ����','','�ͻ���ʧ����');
INSERT INTO rights VALUES (default,0,'��������','','��������');
INSERT INTO rights VALUES (default,18,'�����ֵ����','','�����ֵ����');
INSERT INTO rights VALUES (default,18,'��ѯ��Ʒ��Ϣ','','��ѯ��Ʒ��Ϣ');
INSERT INTO rights VALUES (default,18,'��ѯ���','','��ѯ���');
INSERT INTO rights VALUES (default,0,'Ȩ�޹���','','Ȩ�޹���');
INSERT INTO rights VALUES (default,22,'�û�����','users.do?op=toList','�û�����');
INSERT INTO rights VALUES (default,22,'��ɫ����','role.do?op=toList','��ɫ����');

INSERT INTO role VALUES (default,'����Ա','ӵ������Ȩ��',true);
INSERT INTO role VALUES (default,'��������','������ָ�����ۻ���',true);
INSERT INTO role VALUES (default,'�ͻ�����','������ִ��ָ�ɵ����ۻ���',true);
INSERT INTO role VALUES (default,'�߼�����Ա','���Ÿ߼�����ӵ�е�Ȩ��',true);


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


INSERT INTO customer VALUES (default,'�Ϻ���Ϣ�Ƽ����޹�˾','����',3,'ӣ��С����',3,'��ͻ�',5,5,'�����к�����','123456','010-12345678','111111','http://www.chkj.com','111','����ʦ',1000,3232,'�й���������','2134432234','23124435','45345345',1);
INSERT INTO customer VALUES (default,'�������ƿƼ����޹�˾','����',3,'ӣ��С����',2,'�ص㿪���ͻ�',4,3,'������������','154321','010-65432187','222222','http://www.sad.net','2133','��С˧',200,3324,'�й���ͨ����','32424323','2344234','3234234',1);
INSERT INTO customer VALUES (default,'̫��ҩҵ','����',4,'��������è',1,'��ͨ�ͻ�',3,4,'�ӱ��ȷ�','4212321','6456456','456456','http://www.163.com','','',0,0,'�й�ũҵ����','','','',1);
INSERT INTO customer VALUES (default,'��������̲ݹ�˾','����',3,'ӣ��С����',2,'�ص㿪���ͻ�',2,4,'��������','12312','456456456','678678','http://www.yunnan.com','','',2000,80,'�й���������','','','',2);
INSERT INTO customer VALUES (default,'����������Ϣ���޹�˾','����',4,'��������è',3,'��ͻ�',1,4,'������ʯ��ɽ��','13223','456456456','45645678','http://sina.com','asdasdasd','����֮',200,100,'��������','33243','234234','234234',3);
INSERT INTO customer VALUES (default,'���������������ι�˾','����',3,'ӣ��С����',5,'ս�Ժ������',4,4,'������������','12312','456456456','678678','http://www.163.com','','',0,0,'��������','','','',1);
INSERT INTO customer VALUES (default,'���������ѵ','����',4,'��������è',3,'��ͻ�',5,3,'�����к�����','213123','45645645','768678','http://zbaccp.com','','',0,0,'�շ�����','','','',2);
INSERT INTO customer VALUES (default,'Ϋ�����񻪹�','����',3,'ӣ��С����',2,'�ص㿪���ͻ�',4,5,'ɽ��ʡΫ����','213123','645645645','768678','http://sina.com','','',0,0,'��������','','','',1);
INSERT INTO customer VALUES (default,'������������','����',4,'��������è',4,'�������',3,4,'����ʡ�����й�¥��','213233','645645645','678678','http://www.86516.com','','',0,0,'ũ��������','','','',1);
INSERT INTO customer VALUES (default,'��ҵ��ѧ','����',3,'ӣ��С����',5,'ս�Ժ������',5,5,'����ʡ������Ȫɽ��','123123','6456456456','678678','http://sina.com','','',0,0,'��������','','','',1);



INSERT INTO users VALUES (default,'admin','��־��','123',true,1);
INSERT INTO users VALUES (default,'mike','����С��','321',false,2);
INSERT INTO users VALUES (default,'jack','ӣ��С����','111',false,3);
INSERT INTO users VALUES (default,'tom','��������è','321',true,3);
INSERT INTO users VALUES (default,'supper','���г���','111',true,NULL);

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


