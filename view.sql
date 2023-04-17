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