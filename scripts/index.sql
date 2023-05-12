-- Simple indexes
CREATE INDEX idx_patients_dateofbirth ON Patients (DateOfBirth);

CREATE INDEX idx_medicalrecords_doctorid ON MedicalRecords (DoctorID);

CREATE INDEX idx_admissions_admissiondate ON Admissions (AdmissionDate);

CREATE INDEX idx_doctors_specialization ON Doctors (Specialization);

CREATE INDEX idx_appointments_appointmentdate ON Appointments (AppointmentDate);

CREATE INDEX idx_billing_patientid ON Billing (PatientID);

-- Composite indexes
CREATE INDEX idx_patients_name ON Patients (LastName, FirstName);

CREATE INDEX idx_doctors_name ON Doctors (LastName, FirstName);

CREATE INDEX idx_appointments_patient_date ON Appointments (PatientID, AppointmentDate);

CREATE INDEX idx_appointments_doctor_date ON Appointments (DoctorID, AppointmentDate);

CREATE INDEX idx_medicalrecords_patient_date ON MedicalRecords (PatientID, RecordDate);

CREATE INDEX idx_medicalrecords_doctor_date ON MedicalRecords (DoctorID, RecordDate);

CREATE INDEX idx_admissions_patient_date ON Admissions (PatientID, AdmissionDate);

CREATE INDEX idx_rooms_department_type ON Rooms (DepartmentID, RoomType);

CREATE INDEX idx_prescriptions_patient_date ON Prescriptions (PatientID, PrescriptionDate);

CREATE INDEX idx_billing_patient_date ON Billing (PatientID, BillDate);

CREATE INDEX idx_payments_patient_date ON Payments (PatientID, PaymentDate);


-- Prefix indexes
CREATE INDEX idx_patients_firstname ON Patients (FirstName(10));

CREATE INDEX idx_patients_lastname ON Patients (LastName(10));

CREATE INDEX idx_medications_medicationname_prefix ON Medications (MedicationName(5));

CREATE INDEX idx_medicalrecords_diagnosis ON MedicalRecords (Diagnosis(20));

CREATE INDEX idx_medicalrecords_treatment ON MedicalRecords (Treatment(20));

CREATE INDEX idx_prescriptions_dosage ON Prescriptions (Dosage(10));


-- Full-text indexes

CREATE INDEX idx_patients_fulltext ON Patients USING gin(to_tsvector('english', FirstName || ' ' || LastName));

CREATE INDEX idx_doctors_fulltext ON Doctors USING gin(to_tsvector('english', FirstName || ' ' || LastName));

CREATE INDEX idx_medical_records_fulltext ON MedicalRecords USING gin(to_tsvector('english', Diagnosis || ' ' || Treatment));

CREATE INDEX idx_departments_fulltext ON Departments USING gin(to_tsvector('english', DepartmentName));

CREATE INDEX idx_medications_fulltext ON Medications USING gin(to_tsvector('english', MedicationName || ' ' || MedicationDescription));
