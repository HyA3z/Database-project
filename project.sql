create schema hospital;
use hospital;
 
CREATE TABLE IF NOT EXISTS stu_login_k
(
  stu_id char(50) NOT NULL,
  stu_pass char(50) default NULL,
  PRIMARY KEY (stu_id)
) ENGINE = InnoDB;
insert into stu_login_k values("1","123");
 
CREATE TABLE IF NOT EXISTS admin_login_k
(
  admin_id char(50) NOT NULL,
  admin_pass char(50) default NULL,
  PRIMARY KEY (admin_id)
) ENGINE = InnoDB;
insert into admin_login_k values("root","czy490603");
 
CREATE TABLE IF NOT EXISTS h
(
  id char(50) NOT NULL,
  hpname char(100) default NULL,
  hos char(50),
  hadr char(50),
  htel char(50),
  PRIMARY KEY (id)
) ENGINE = InnoDB;
insert into h values("1","Harbin Engineering University Hospital","Wang Changxin","Harbin Engineering University Tenth Apartment 627","19995725990");
 
CREATE TABLE IF NOT EXISTS department
(
  dpname char(50) NOT NULL,
  dpno char(50) NOT NULL,
  dpadr char(50) default NULL,
  dptel char(50) default NULL,
  PRIMARY KEY (dpno),
  KEY key_dpno (dpno)
) ENGINE = InnoDB;
insert into department values("Internal Medicine","01","Building No.1 514","04512340987"),
                             ("Surgery","02","Building No.2 202","04514521234"),
                             ("Gynecology","03","Building No.1 421","04510987654"),
                             ("Pediatrics","04","Building No.3 628","04511234567"),
                             ("Neurology","05","Building No.1 555","04519283746"),
                             ("Psychiatry","06","Isolation House No.1 Building 01","04510987890"),
                             ("Pentacameral","07","Building No.3 101","04511029281"),
                             ("Radiation Department","08","Isolation House No.2 Building 11","04518888888"),
                             ("Laboratory Department","09","Building No.2 456","04518787878");
 
create table nurse
(
  nno char(50) primary key ,
  nname char(50) unique ,
  nsex char(10),
  nage int,
  KEY key_nno (nno)
);
insert into nurse values ("01","Li Xiaobei",'Female',21),
                         ("02","Yan Chunzhu",'Female',22),
                         ("03","Marlene",'Female',23),
                         ("04","Su Shiwen",'Female',34),
                         ("05","Liu Ying",'Female',23),
                         ("06","Qing Feiyu",'Female',31),
                         ("07","Xu Long",'Male',20),
                         ("08","Qu Qian Yu",'Female',19);
 
create table drug
(
  dgno char(4) primary key ,
  dgname char(100),
  dgpro char(100),
  dgnum int check(dgnum>=0),
  dgprice int check(dgprice>=0),
  KEY key_dgno (dgno)
);
insert into drug values("0001","Benzathine penicillin for injection","Harbin Pharmaceutical Factory",123,24),
                       ("0002","Disodium adenosine triphosphate","Changchun Pharmaceutical Factory",213,34),
                       ("0003","Compound Aminobarbital Injection","Shenyang Pharmaceutical Factory",121,25),
                       ("0004","Arginine biosynthetic human insulin injection","Beijing Pharmaceutical Factory",123,214),
                       ("0005","Sodium cytophosphatidylcholine","Shanghai Pharmaceutical Factory",1010,28),
                       ("0006","Eszopiclone","Guangzhou Pharmaceutical Factory",132,124),
                       ("0007","Cephalexin","Harbin Pharmaceutical Factory",12,43),
                       ("0008","Isoniazid","Changchun Pharmaceutical Factory",153,34),
                       ("0009","Deacetyltrichoside","Beijing Pharmaceutical Factory",53,123),
                       ("0010","Flunarizine hydrochloride","Guangzhou Pharmaceutical Factory",12,342),
                       ("0011","Methocarbamol","Harbin Pharmaceutical Factory",32,102),
                       ("0012","Methimazole","Guangzhou Pharmaceutical Factory",32,34),
                       ("0013","Butylamine kanamycin","Guangzhou Pharmaceutical Factory",12,240),
                       ("0014","Isosorbide nitrate","Harbin Pharmaceutical Factory",123,234),
                       ("0015","Domperidone","Changchun Pharmaceutical Factory",143,535),
                       ("0016","Salbutamol Sulfate","Beijing Pharmaceutical Factory",354,23),
                       ("0017","pentoxifylline","Guangzhou Pharmaceutical Factory",3242,534),
                       ("0018","Clomiphene citrate","Harbin Pharmaceutical Factory",544,53),
                       ("0019","Tamoxifen citrate","Guangzhou Pharmaceutical Factory",233,465),
                       ("0020","Haicetong Injection","Guangzhou Pharmaceutical Factory",532,42),
                       ("0021","Ceftezole sodium for injection","Harbin Pharmaceutical Factory",1232,23),
                       ("0022","Cefotiam Hydrochloride for Injection","Changchun Pharmaceutical Factory",124,27),
                       ("0023","Compound Guaiacol Sulfonic Acid Potassium Solution for Oral Use","Beijing Pharmaceutical Factory",1344,23),
                       ("0024","Clindamycin","Guangzhou Pharmaceutical Factory",113,223),
                       ("0025","Amiodarone hydrochloride","Harbin Pharmaceutical Factory",132,26),
                       ("0026","Lamivudine","Guangzhou Pharmaceutical Factory",1030,23),
                       ("0027","Cefixime Granules","Guangzhou Pharmaceutical Factory",1040,16),
                       ("0028","Haloperidol Melitrexin Tablets","Harbin Pharmaceutical Factory",123,53),
                       ("0029","Clindamycin palmitate hydrochloride dispersible tablets","Guangzhou Pharmaceutical Factory",135,53);
 
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
insert into doctor values ("101","Li Xiaoming","Intermediate Physician","Male",18,"01"),
                          ("102","Zhao Ermao","Senior Physician","Male",56,"01"),
                          ("103","Chen Renyi","Junior Physician","Female",20,"01"),
                          ("201","Chen Sheng","Junior Physician","Female",21,"02"),
                          ("202","Wang Xueqing","Associate Senior Physician","Female",32,"02"),
                          ("203","Zhao Caijie","Senior Physician","Female",50,"02"),
                          ("301","Wang Henan","Intermediate Physician","Female",20,"03"),
                          ("302","Wang Feng","Junior Physician","Female",31,"03"),
                          ("303","Li Wenge","Senior Physician","Female",51,"03"),
                          ("401","Qian Qiuhe","Junior Physician","Female",24,"04"),
                          ("402","Chen Shaojie","Intermediate Physician","Male",26,"04"),
                          ("403","Laplace","Senior Physician","Male",59,"04"),
                          ("501","Zhao Yishi","Junior Physician","Female",31,"05"),
                          ("502","Chen Daye","Intermediate Physician","Male",29,"05"),
                          ("503","Ou Shanglu","Junior Physician","Male",31,"05"),
                          ("601","Chen Xiaoxi","Junior Physician","Female",51,"06"),
                          ("602","Chen Ouhuang","Intermediate Physician","Male",29,"06"),
                          ("603","Fu Jie","Associate Senior Physician","Female",46,"06"),
                          ("701","Zhao Mengsha","Junior Physician","Male",59,"07"),
                          ("702","Wang Laiwen","Senior Physician","Male",32,"07"),
                          ("703","Fu Chu","Associate Senior Physician","Female",42,"07"),
                          ("801","Wang Fengzi","Junior Physician","Female",21,"08"),
                          ("802","Wu Zhao","Intermediate Physician","Male",25,"08"),
                          ("803","Cai Zijie","Junior Physician","Female",21,"08"),
                          ("901","Xie Haokan","Junior Physician","Female",21,"09"),
                          ("902","Chen Zhenshuai","Intermediate Physician","Male",20,"09"),
                          ("903","Wang Meng","Junior Physician","Male",21,"09");

 
create table room
(
  rno char(10) primary key ,
  radr char(50) unique,
  dpno char(5),
  foreign key (dpno) references department(dpno)
);
INSERT INTO room VALUES ("1101","Building 1 Room 101","01"),
                        ("1102","Building 1 Room 102","01"),
                        ("1103","Building 1 Room 103","01"),
                        ("2101","Building 2 Room 101","02"),
                        ("2102","Building 2 Room 102","02"),
                        ("2103","Building 2 Room 103","02"),
                        ("1401","Building 1 Room 401","03"),
                        ("1402","Building 1 Room 402","03"),
                        ("1403","Building 1 Room 403","03"),
                        ("1104","Building 1 Room 104","04"),
                        ("1105","Building 1 Room 105","05"),
                        ("1106","Building 1 Room 106","06"),
                        ("1407","Building 1 Room 407","07"),
                        ("1408","Building 1 Room 408","08"),
                        ("1409","Building 1 Room 409","09");
 
create table patient
(
  pno char(20) primary key,
  pname char(20) not null,
  psex char(15),
  page int check (page>=0 and page <=150),
  dno char(10),
  rno char(10),
  illness char(50),
  startdate date,
  predictenddate date,
  foreign key (dno) references doctor(dno),
  foreign key (rno) references room(rno),
  KEY key_pno (pno)
);
insert into patient values ("0001","Zhao Yi","Male",20,"101","1101","Comminuted fracture of the left ankle","2019-12-20","2020-01-28"),
                           ("0002","Zhao Er","Male",21,"101","1101","Comminuted fracture of the left ankle","2018-11-20","2019-12-8"),
                           ("0003","Qian Er","Female",23,"201","2102","Internal bleeding","2018-11-22","2018-12-29"),
                           ("0004","Zhu San","Female",19,"301","1401","Gynecological Inflammation","2018-12-22","2018-12-23"),
                           ("0005","Li Laiwu","Male",6,"401","1104","Multiple tic syndromes","2018-11-10","2019-01-01"),
                           ("0006","Wang Zemin","Male",52,"501","1105","Parkinson's syndrome","2018-11-24","2018-12-25"),
                           ("0007","Chen Wenxin","Female",54,"601","1106","Obsessive Compulsive Disorder (OCD)","2018-12-15","2018-12-23"),
                           ("0008","Dai Chenyi","Male",22,"701","1407","Osteomyelitis of the frontal bone","2018-12-24","2018-12-25"),
                           ("0009","Gao Laiji","Female",34,"801","1408","Nuclear Magnetic Resonance Testing","2018-12-23","2018-12-26"),
                           ("0010","Wu Zonghui","Female",43,"901","1409","HIV Testing","2018-12-22","2018-12-27"),
                           ("0011","Cao Wenlong","Male",32,"102","1102","Comminuted clavicle fracture","2018-12-21","2019-01-25"),
                           ("0012","Chen GaoYi","Male",26,"202","2102","Poor breathing","2018-12-19","2019-01-26"),
                           ("0013","Chen Wennuan","Male",29,"302","1401","Endometritis","2018-12-18","2019-01-24"),
                           ("0014","Niu qun","Female",3,"402","1104","Tuberous sclerosis","2018-12-17","2019-01-27"),
                           ("0015","Li Jinjin","Female",61,"502","1105","Alzheimer's disease","2018-12-16","2019-01-28"),
                           ("0016","Li Qinying","Male",23,"602","1106","Depression","2018-12-15","2019-01-26"),
                           ("0017","Liu Xinyu","Female",21,"702","1407","Thrombophlebitis of the spongy sinus","2018-12-14","2019-01-25"),
                           ("0018","Fang Zijian","Male",34,"802","1408","Digital subtraction angiography testing","2018-12-13","2019-01-26"),
                           ("0019","Lin Weiliang","Male",43,"902","1409","Blood leukocyte test","2018-12-12","2019-01-24"),
                           ("0020","Wang Enqi","Female",27,"103","1101","Comminuted fracture of the finger","2018-12-12","2019-01-26"),
                           ("0021","Zang Qingliang","Male",26,"203","2102","Indigestion","2018-12-21","2019-01-29"),
                           ("0022","Li Huanhuan","Female",18,"303","1401","Pelvic inflammatory disease","2018-12-22","2019-01-31"),
                           ("0023","Ou Jun","Male",6,"403","1104","Pediatric hyperthermia","2018-12-21","2019-01-30"),
                           ("0024","Quan Shuming","Male",43,"503","1105","Autism","2018-12-22","2019-01-01"),
                           ("0025","Gong Jingbo","Male",51,"603","1106","Depressive neurosis","2018-12-24","2019-01-22"),
                           ("0026","Dai Chuyi","Female",21,"703","1407","Retrobulbar optic neuritis","2018-12-23","2019-01-23"),
                           ("0027","Hao Fan","Female",22,"803","1408","Computerized X-ray inspection","2018-12-22","2018-12-28"),
                           ("0028","Li Xiaopei","Female",21,"903","1409","Routine blood tests","2018-12-21","2018-12-22");
 
create table PN
(
  pno char(20),
  nno char(2),
  content char(50),
  time datetime,
  foreign key (pno) references patient(pno),
  foreign key (nno) references nurse(nno)
);
insert into PN values ("0001","01","Rehab 1","2018-12-22 13:12:11"),
                      ("0002","02","Rehab 2","2018-12-23 15:12:22"),
                      ("0003","03","Rehab 3","2018-12-22 13:34:02"),
                      ("0004","04","Rehab 4","2018-12-23 14:32:23"),
                      ("0005","05","Rehab 1","2018-12-22 15:14:11"),
                      ("0006","06","Rehab 2","2018-12-23 16:14:11"),
                      ("0007","07","Rehab 3","2018-12-24 17:13:11"),
                      ("0008","08","Rehab 4","2018-12-24 18:14:11"),
                      ("0009","01","Change of dressing on wound 1","2018-12-22 19:27:21"),
                      ("0001","02","Change of dressing on wound 2","2018-12-23 12:16:14"),
                      ("0002","03","Change of dressing on wound 1","2018-12-26 13:15:15"),
                      ("0003","04","Change of dressing on wound 1","2018-12-23 14:11:15"),
                      ("0001","05","Change of dressing on wound 3","2018-12-24 15:42:16"),
                      ("0002","06","Change of dressing on wound 2","2018-12-22 16:24:17"),
                      ("0003","07","Change of dressing on wound 2","2018-12-23 17:14:18"),
                      ("0004","08","Rehab 1","2018-12-26 18:25:43"),
                      ("0005","01","Rehab 2","2018-12-24 19:52:12"),
                      ("0006","02","Rehab 3","2018-12-22 20:15:45"),
                      ("0007","03","Rehab 4","2018-12-24 21:43:34"),
                      ("0008","04","Rehab 5","2018-12-24 22:32:42"),
                      ("0009","05","Rehab 6","2018-12-22 23:23:24"),
                      ("0001","06","Rehab 7","2018-12-24 00:12:31"),
                      ("0005","07","Rehab 8","2018-12-25 01:53:41"),
                      ("0004","08","Rehab 9","2018-12-23 02:32:42");
 
create table PD
(
  dgno char(4),
  pno char(4),
  num int check(num>=0),
  foreign key (dgno) references drug(dgno),
  foreign key (pno)  references patient(pno),
  primary key (dgno,pno)
);
insert into PD values ("0001","0001",1),
                      ("0002","0001",2),
                      ("0001","0002",3),
                      ("0003","0001",1),
                      ("0004","0002",2),
                      ("0005","0001",3),
                      ("0004","0003",1),
                      ("0011","0003",2),
                      ("0005","0004",3),
                      ("0011","0022",1),
                      ("0012","0022",2),
                      ("0023","0013",3),
                      ("0023","0024",1),
                      ("0014","0022",2),
                      ("0015","0001",3),
                      ("0014","0002",1),
                      ("0021","0003",2),
                      ("0025","0004",3),
                      ("0021","0001",1),
                      ("0022","0001",2),
                      ("0021","0002",3),
                      ("0023","0003",1),
                      ("0024","0004",2),
                      ("0025","0005",3),
                      ("0024","0011",1),
                      ("0021","0021",2),
                      ("0025","0020",3),
                      ("0011","0019",1),
                      ("0022","0018",2),
                      ("0001","0017",3),
                      ("0003","0016",1),
                      ("0024","0015",2),
                      ("0015","0014",3),
                      ("0014","0013",1),
                      ("0021","0012",2),
                      ("0015","0011",3),
                      ("0006","0005",1),
                      ("0007","0005",2),
                      ("0008","0005",3),
                      ("0009","0005",1),
                      ("0010","0006",2),
                      ("0016","0006",3),
                      ("0017","0006",1),
                      ("0018","0006",2),
                      ("0019","0007",3),
                      ("0005","0007",1),
                      ("0025","0007",2),
                      ("0023","0007",3),
                      ("0024","0007",1),
                      ("0021","0008",2),
                      ("0028","0008",3),
                      ("0002","0008",1),
                      ("0001","0008",2),
                      ("0025","0009",3),
                      ("0011","0009",1),
                      ("0022","0010",2),
                      ("0001","0010",3),
                      ("0003","0010",1),
                      ("0024","0023",2),
                      ("0015","0025",3),
                      ("0014","0026",1),
                      ("0021","0027",2),
                      ("0013","0027",3),
                      ("0020","0021",1),
                      ("0007","0018",2),
                      ("0020","0018",3);
 
delimiter // 
create procedure sl_drug_patient(in ppno char(4))
  begin
    select pname Patient_Name,illness Diseases,dgname Drug_name,num Quantity
      from patient,drug,PD
        where patient.pno = pd.pno
          and drug.dgno = pd.dgno
            and pd.pno = ppno;
  end;
call sl_drug_patient("0001");
 
create procedure sl_doctor(in ppno char(4))
  begin
    select doctor.dname Doctor_name,doctor.duty Position,dpname Department_Name from doctor,department
        where department.dpno = doctor.dpno
          and dno in
              (select dno from patient
               where ppno = pno);
  end;
call sl_doctor("0001");
 
create  procedure  sl_department(in ddno char(4))
begin
  select dname Doctor_name,dpname Department_Name
    from department,doctor
      where department.dpno = doctor.dpno
        and doctor.dno = ddno;
end;
call sl_department("302");
 
create procedure sl_room(in ddpno char(1))
  begin
   select dpname Department_Name,rno Ward_number,radr Ward_Address
    from room,department
      where ddpno = room.dpno
       and room.dpno = department.dpno;
  end;
call sl_room("1");
 
create procedure sl_money(in ppno char(4))
  begin
    select sum(num * dgprice) Amount_due
      from pd,patient,drug
        where pd.pno = patient.pno
          and drug.dgno = pd.dgno
            and patient.pno = ppno;
  end;
call sl_money("0023");
 
create procedure sl_doctor_patientnum(in ddno char(4))
  begin
    select count(*) Number_physicians_patients from patient
      where patient.dno = ddno;
  end;
call sl_doctor_patientnum("102");
 
create procedure sl_department_patientnum(in ddpno char(1))
  begin
    select count(*) Number_patients_department from patient,doctor,department
        where patient.dno = doctor.dno
          and department.dpno = doctor.dpno
            and ddpno = department.dpno ;
  end;
call sl_department_patientnum("2");
 
create procedure sl_department_patientname(in ddpno char(1))
  begin
    select pname Patient_Name,patient.pno Patient_Number,dname Name_Attending_Physician,doctor.dno Attending_Physician_Number
      from patient,doctor,department
        where patient.dno = doctor.dno
          and department.dpno = doctor.dpno
            and ddpno = department.dpno ;
  end;
call sl_department_patientname("1");
 
create procedure sl_nurse(in nnno char(2))
  begin
    select nno Nurse_Number,nname Nurse_Name from nurse
        where nno = nnno;
  end;
call sl_nurse("05");
 
create procedure sl_patient_nurse(in ppno char(4))
  begin
    select pname,illness,content,time,nname
    from nurse,patient,pn
        where nurse.nno = pn.nno
        and patient.pno = pn.pno
        and patient.pno = ppno;
  end;
call sl_patient_nurse("0002");
 
create procedure sl_patient_one_room(in ppno char(4))
  begin
    select A.pname,A.pno from patient A
        where rno in
              (select B.rno from patient B
              where B.pno=ppno);
  end;
call sl_patient_one_room("0002");
 
create procedure sl_room_patient(in rrno char(4))
  begin
    select pno,pname from patient
        where rno = rrno;
  end;
call sl_room_patient("1407");
 
create procedure del_patient(in ppno char(4))
  begin
    delete from PD where ppno = PD.pno;
    delete from patient where ppno = patient.pno;
  end;
call del_patient("0027");
 
create procedure del_drug(in ddgno char(4))
  begin
    delete from PD where ddgno = PD.dgno;
    delete from drug where ddgno = drug.dgno;
  end;
call del_drug("0029");
 
create view vadmin_login_k as select * from admin_login_k;
create view vstu_login_k as select * from stu_login_k;
create view vdepartment as select * from department;
create view vdoctor as select * from doctor;
create view vdrug as select * from drug;
create view vnurse as select * from nurse;
create view vpd as select * from pd;
create view vpn as select * from pn;
create view vroom as select * from room;
create view vh as select * from h;
create view vpatient as select * from patient;
 
CREATE TRIGGER chufa
AFTER DELETE ON pd FOR EACH ROW
BEGIN
delete from drug where dgno=old.dgno;
END

