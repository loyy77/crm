
drop table activity;
CREATE TABLE activity (
  id int NOT NULL generated always as identity,
  customerId int default NULL,
  atvDate timestamp NOT NULL,
  place varchar(200) NOT NULL,
  title varchar(500) NOT NULL,
  description varchar(2000) default NULL,
  PRIMARY KEY  (id)

);

drop table chance;
CREATE TABLE chance (
  id int NOT NULL generated always as identity,
  source varchar(100) default NULL,
  customerName varchar(50) default NULL,
  rate decimal(8,2) default NULL,
  title varchar(50) NOT NULL,
  linkMan varchar(50) default NULL,
  linkPhone varchar(20) default NULL,
  description varchar(1000) default NULL,
  createId int default NULL,
  createDate timestamp default NULL,
  assignId int default NULL,
  assignDate timestamp default NULL,
  state int default NULL,
  PRIMARY KEY  (id)
 
  
);

drop table dict;
CREATE TABLE dict (
  id int NOT NULL generated always as identity,
  dictType varchar(50) NOT NULL,
  dictItem varchar(50) NOT NULL,
  dictValue varchar(50) NOT NULL,
  editable boolean NOT NULL,
  PRIMARY KEY  (id)
);


drop table linkman;
CREATE TABLE linkman (
  id int NOT NULL generated always as identity,
  customerId int default NULL,
  name varchar(50) NOT NULL,
  sex varchar(5) default NULL,
  position varchar(50) default NULL,
  tel varchar(50) NOT NULL,
  mobile varchar(50) default NULL,
  memo varchar(300) default NULL,
  PRIMARY KEY  (id)
  
);

drop table plan;
CREATE TABLE plan (
  id int NOT NULL generated always as identity,
  chanceId int default NULL,
  planDate timestamp NOT NULL,
  planTodo varchar(500) NOT NULL,
  planResult varchar(500) default NULL,
  PRIMARY KEY  (id)
  
);



drop table rights;
CREATE TABLE rights (
  rightId int NOT NULL generated always as identity,
  parentId int NOT NULL,
  rightName varchar(100) NOT NULL,
  rightUrl varchar(100) NOT NULL,
  rightDesc varchar(100) NOT NULL,
  PRIMARY KEY  (rightId)
);


drop table role;
CREATE TABLE role (
  roleId int NOT NULL generated always as identity,
  roleName varchar(50) NOT NULL,
  roleDesc varchar(100) NOT NULL,
  flag boolean NOT NULL,
  PRIMARY KEY  (roleId)
);


drop table role_right;
CREATE TABLE role_right (
  rightId int NOT NULL,
  roleId int NOT NULL

);


drop table users;
CREATE TABLE users (
  userId int NOT NULL generated always as identity,
  loginName varchar(30) NOT NULL,
  trueName varchar(30) NOT NULL,
  loginPass varchar(30) NOT NULL,
  flag boolean NOT NULL,
  roleId int default NULL,
  PRIMARY KEY  (userId)

);


drop table customer;
CREATE TABLE customer (
  id int NOT NULL generated always as identity,
  name varchar(100) NOT NULL,
  region varchar(50) default NULL,
  managerId int default NULL,
  managerName varchar(50) default NULL,
  custLevel int default NULL,
  levelLabel varchar(50) default NULL,
  satisfy int default NULL,
  credit int default NULL,
  addr varchar(300) default NULL,
  zip varchar(10) default NULL,
  tel varchar(50) default NULL,
  fax varchar(50) default NULL,
  website varchar(50) default NULL,
  licence varchar(50) default NULL,
  chieftain varchar(50) default NULL,
  bankroll DECIMAL default NULL,
  turnover DECIMAL default NULL,
  bank varchar(200) default NULL,
  account varchar(50) default NULL,
  localTax varchar(50) default NULL,
  nationalTax varchar(50) default NULL,
  state int default NULL,
  PRIMARY KEY  (id)
  
);
