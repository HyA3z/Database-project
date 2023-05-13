-- 1)
-- Calculates and updates the average length of a patient's diagnosis when a new record is inserted into the patient's medical record

-- This field does not exist in the Patients table, add this field manually
ALTER TABLE Patients ADD COLUMN AvgDiagnosisLength INTERVAL;

CREATE OR REPLACE FUNCTION update_patient_avg_diagnosis_length()
RETURNS TRIGGER AS $$
DECLARE
    total_duration INTERVAL;
    avg_duration INTERVAL;
BEGIN
    SELECT SUM(RecordDate - RecordDate) INTO total_duration
    FROM MedicalRecords
    WHERE PatientID = NEW.PatientID;
    
    SELECT total_duration / COUNT(*) INTO avg_duration
    FROM MedicalRecords
    WHERE PatientID = NEW.PatientID;
    
    UPDATE Patients
    SET AvgDiagnosisLength = avg_duration
    WHERE PatientID = NEW.PatientID;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_avg_diagnosis_length
AFTER INSERT ON MedicalRecords
FOR EACH ROW
EXECUTE FUNCTION update_patient_avg_diagnosis_length();



-- 2)
-- Automatically update the doctor's appointment counter when inserting a new row into the Appointments table

-- Manually add the field to the Doctors table
ALTER TABLE Doctors ADD COLUMN AppointmentCounter INT;

CREATE OR REPLACE FUNCTION update_doctor_appointment_counter()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Doctors
    SET AppointmentCounter = AppointmentCounter + 1
    WHERE DoctorID = NEW.DoctorID;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_appointment_counter
AFTER INSERT ON Appointments
FOR EACH ROW
EXECUTE FUNCTION update_doctor_appointment_counter();
