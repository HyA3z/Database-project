-- 1）
-- Anonymous Patient information

CREATE VIEW patients_anonymized AS
SELECT
  PatientID,
  CONCAT(LEFT(FirstName, 1), REPEAT('*', CHAR_LENGTH(FirstName) - 2), RIGHT(FirstName, 1)) AS AnonymizedFirstName,
  CONCAT(LEFT(LastName, 1), REPEAT('*', CHAR_LENGTH(LastName) - 2), RIGHT(LastName, 1)) AS AnonymizedLastName,
  Gender,
  CASE
  WHEN FLOOR(DATE_PART('YEAR', CURRENT_DATE) - DATE_PART('YEAR', DateOfBirth)) < 18 THEN 'Under 18'
  WHEN FLOOR(DATE_PART('YEAR', CURRENT_DATE) - DATE_PART('YEAR', DateOfBirth)) < 30 THEN '18-29'
  WHEN FLOOR(DATE_PART('YEAR', CURRENT_DATE) - DATE_PART('YEAR', DateOfBirth)) < 40 THEN '30-39'
  WHEN FLOOR(DATE_PART('YEAR', CURRENT_DATE) - DATE_PART('YEAR', DateOfBirth)) < 50 THEN '40-49'
  ELSE '50 and above'
  END AS AnonymizedAgeRange,
  '********' AS AnonymizedAddress,
  '********' AS AnonymizedPhoneNumber
FROM Patients;

SELECT * FROM patients_anonymized;


-- 2）
-- Anonymous medical records

CREATE VIEW medicalrecords_anonymized AS
SELECT
    m.RecordID,
    p.PatientID,
    d.DoctorID,
    m.RecordDate,
    REPLACE(p.FirstName, SUBSTRING(p.FirstName, 2, LENGTH(p.FirstName)), REPEAT('x', LENGTH(p.FirstName)-1)) AS FirstName,
    REPLACE(p.LastName, SUBSTRING(p.LastName, 2, LENGTH(p.LastName)), REPEAT('x', LENGTH(p.LastName)-1)) AS LastName,
    REPLACE(d.FirstName, SUBSTRING(d.FirstName, 2, LENGTH(d.FirstName)), REPEAT('x', LENGTH(d.FirstName)-1)) AS DoctorFirstName,
    REPLACE(d.LastName, SUBSTRING(d.LastName, 2, LENGTH(d.LastName)), REPEAT('x', LENGTH(d.LastName)-1)) AS DoctorLastName,
    'Hidden' AS Diagnosis,
    'Hidden' AS Treatment
FROM
    MedicalRecords m
    JOIN Patients p ON m.PatientID = p.PatientID
    JOIN Doctors d ON m.DoctorID = d.DoctorID;

SELECT * FROM medicalrecords_anonymized;


-- 3）
-- Create a view for patient appointment statistics

CREATE VIEW PatientAppointmentStats AS
SELECT
    p.PatientID,
    p.FirstName,
    p.LastName,
    COUNT(a.AppointmentID) AS TotalAppointments,
    MIN(a.AppointmentDate) AS FirstAppointmentDate,
    MAX(a.AppointmentDate) AS LastAppointmentDate
FROM
    Patients p
    LEFT JOIN Appointments a ON p.PatientID = a.PatientID
GROUP BY
    p.PatientID,
    p.FirstName,
    p.LastName
ORDER BY TotalAppointments DESC;

SELECT * FROM PatientAppointmentStats;


-- 4)
-- Displays the appointment information for each patient and the doctor associated with it

CREATE VIEW PatientAppointments AS
SELECT
    P.PatientID,
    P.FirstName,
    P.LastName,
    A.AppointmentID,
    A.AppointmentDate,
    A.AppointmentTime,
    D.FirstName AS DoctorFirstName,
    D.LastName AS DoctorLastName
FROM
    Patients P
    INNER JOIN Appointments A ON P.PatientID = A.PatientID
    INNER JOIN Doctors D ON A.DoctorID = D.DoctorID;

SELECT * FROM PatientAppointments;


-- 5)
-- Shows the drugs prescribed by each doctor and their quantities

CREATE VIEW DoctorPrescriptions AS
SELECT d.DoctorID, d.FirstName, d.LastName, m.MedicationID, m.MedicationName, COUNT(p.PrescriptionID) AS PrescriptionCount
FROM Doctors d
INNER JOIN Prescriptions p ON d.DoctorID = p.DoctorID
INNER JOIN Medications m ON p.MedicationID = m.MedicationID
GROUP BY d.DoctorID, d.FirstName, d.LastName, m.MedicationID, m.MedicationName
ORDER BY d.FirstName;

SELECT * FROM DoctorPrescriptions;

-- 6)
-- The number of prescriptions for each drug and how many patients are using them

CREATE VIEW MedicationPrescriptions AS
SELECT m.MedicationID, m.MedicationName, COUNT(p.PrescriptionID) AS PrescriptionCount, COUNT(DISTINCT p.PatientID) AS UniquePatients
FROM Medications m
INNER JOIN Prescriptions p ON m.MedicationID = p.MedicationID
GROUP BY m.MedicationID, m.MedicationName
ORDER BY PrescriptionCount DESC;

SELECT * FROM MedicationPrescriptions;


-- 7)
-- Displays all prescriptions received for each patient and their details

CREATE VIEW PatientPrescriptions AS
SELECT p.PrescriptionID, pat.FirstName AS PatientFirstName, pat.LastName AS PatientLastName,
       doc.FirstName AS DoctorFirstName, doc.LastName AS DoctorLastName,
       m.MedicationName, p.Dosage, p.PrescriptionDate
FROM Prescriptions p
INNER JOIN Patients pat ON p.PatientID = pat.PatientID
INNER JOIN Doctors doc ON p.DoctorID = doc.DoctorID
INNER JOIN Medications m ON p.MedicationID = m.MedicationID
ORDER BY PatientFirstName, PatientLastName;

SELECT * FROM PatientPrescriptions;
