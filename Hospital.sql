create schema hospital;
use hospital;
 
CREATE TABLE IF NOT EXISTS stu_login_k
(
  stu_id char(50) NOT NULL,
  stu_pass char(50) default NULL,
  PRIMARY KEY (stu_id)
) ENGINE = InnoDB;
 
CREATE TABLE IF NOT EXISTS admin_login_k
(
  admin_id char(50) NOT NULL,
  admin_pass char(50) default NULL,
  PRIMARY KEY (admin_id)
) ENGINE = InnoDB;
 
CREATE TABLE IF NOT EXISTS h
(
  id char(50) NOT NULL,
  hpname char(100) default NULL,
  hos char(50),
  hadr char(50),
  htel char(50),
  PRIMARY KEY (id)
) ENGINE = InnoDB;
 
CREATE TABLE IF NOT EXISTS department
(
  dpname char(50) NOT NULL,
  dpno char(50) NOT NULL,
  dpadr char(50) default NULL,
  dptel char(50) default NULL,
  PRIMARY KEY (dpno),
  KEY key_dpno (dpno)
) ENGINE = InnoDB;
 
create table nurse
(
  nno char(50) primary key ,
  nname char(50) unique ,
  nsex char(10),
  nage int,
  KEY key_nno (nno)
);
 
create table drug
(
  dgno char(4) primary key ,
  dgname char(100),
  dgpro char(100),
  dgnum int check(dgnum>=0),
  dgprice int check(dgprice>=0),
  KEY key_dgno (dgno)
);
 
create table doctor
(
  dno char(3) primary key,
  dname char(50),
  duty char(100),
  dsex char(10),
  dage int check (dage>=0 and dage <=150),
  dpno char(50),
  foreign key (dpno) references department (dpno),
  KEY key_dno (dno)
) ENGINE = InnoDB;

 
create table room
(
  rno char(10) primary key ,
  radr char(50) unique,
  dpno char(5),
  foreign key (dpno) references department(dpno)
);
 
create table PN
(
  pno char(20),
  nno char(2),
  content char(50),
  time datetime,
  foreign key (pno) references patient(pno),
  foreign key (nno) references nurse(nno)
);
 
create table PD
(
  dgno char(4),
  pno char(4),
  num int check(num>=0),
  foreign key (dgno) references drug(dgno),
  foreign key (pno)  references patient(pno),
  primary key (dgno,pno)
);
