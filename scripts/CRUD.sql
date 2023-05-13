-- INSERT
-- 1)
INSERT INTO Patients (PatientID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber)
(11, 'Alex', 'Johnson', 'Male', '1982-08-12', '753 Eleventh St', '555-1234');


-- SELECT 
-- 1) Check all patients who have made appointments after a specific date
SELECT p.FirstName, p.LastName, a.AppointmentDate
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
WHERE a.AppointmentDate > '2023-05-15';


-- 2) Search for the last name, first name and diagnosis of a patient with a specific diagnosis
SELECT p.FirstName, p.LastName, m.Diagnosis
FROM Patients p
JOIN MedicalRecords m ON p.PatientID = m.PatientID
WHERE m.Diagnosis = 'Pneumonia';


-- 3) Find the name and number of medical records for the patient with the most medical records.
SELECT p.FirstName, p.LastName, COUNT(m.RecordID) AS RecordCount
FROM Patients p
JOIN MedicalRecords m ON p.PatientID = m.PatientID
GROUP BY p.PatientID
ORDER BY RecordCount DESC
LIMIT 1;

-- 4) Find patients with the most medical records
SELECT p.FirstName, p.LastName, COUNT(m.RecordID) AS NumRecords
FROM Patients p
LEFT JOIN MedicalRecords m ON p.PatientID = m.PatientID
GROUP BY p.PatientID
ORDER BY NumRecords DESC
LIMIT 1;

-- 5) Find the average number of beds in each department
SELECT dp.DepartmentName, AVG(BedCount) AS AverageBedCount
FROM (
    SELECT r.DepartmentID, COUNT(*) AS BedCount
    FROM Beds b
    JOIN Rooms r ON b.RoomID = r.RoomID
    GROUP BY r.DepartmentID
) AS BedCounts
JOIN Departments dp ON BedCounts.DepartmentID = dp.DepartmentID
GROUP BY dp.DepartmentName;



-- Update
-- 1)In the MedicalRecords table, update all patients' diagnoses to the most recent one
UPDATE MedicalRecords
SET Diagnosis = (
    SELECT m.Diagnosis
    FROM (
        SELECT PatientID, Diagnosis
        FROM MedicalRecords
        ORDER BY RecordDate DESC
    ) AS m
    WHERE m.PatientID = MedicalRecords.PatientID
    LIMIT 1
);


-- 2)Update the addresses in the Patients table to capitalize the first letter of each word in the address
UPDATE Patients
SET Address = CONCAT_WS(' ', 
           UPPER(SUBSTRING_INDEX(Address, ' ', 1)), 
           UPPER(SUBSTRING_INDEX(SUBSTRING_INDEX(Address, ' ', 2), ' ', -1)), 
           UPPER(SUBSTRING_INDEX(SUBSTRING_INDEX(Address, ' ', 3), ' ', -1)), 
           UPPER(SUBSTRING_INDEX(SUBSTRING_INDEX(Address, ' ', -2), ' ', 1)), 
           UPPER(SUBSTRING_INDEX(Address, ' ', -1)));


-- 3)Update the specialization fields in the Doctors table, sorting them according to the number of records they have in other tables
UPDATE Doctors AS d
JOIN (
    SELECT DoctorID, COUNT(*) AS RecordCount
    FROM MedicalRecords
    GROUP BY DoctorID
) AS mr ON d.DoctorID = mr.DoctorID
SET d.Specialization = 'New Specialization'
ORDER BY mr.RecordCount DESC
LIMIT 1;



-- DELETE 
-- 1) Delete all appointments for patients who have not made any payments or have outstanding bills.
DELETE FROM Appointments 
WHERE PatientID IN (
  SELECT DISTINCT PatientID 
  FROM Payments 
  WHERE PaymentAmount < (
    SELECT SUM(TotalCost) 
    FROM Billing 
    WHERE PatientID = Payments.PatientID
  )
);

-- 2)Delete all patients without medical records and their related appointment and prescription records
DELETE FROM Patients
WHERE PatientID NOT IN (
    SELECT DISTINCT PatientID
    FROM MedicalRecords
)
AND PatientID NOT IN (
    SELECT DISTINCT PatientID
    FROM Appointments
)
AND PatientID NOT IN (
    SELECT DISTINCT PatientID
    FROM Prescriptions
);

-- 3)Delete all beds that have been discharged from the hospital and have no relevant medical records.
DELETE FROM Beds
WHERE RoomID IN (
    SELECT RoomID
    FROM Rooms
    WHERE RoomID NOT IN (
        SELECT DISTINCT RoomID
        FROM MedicalRecords
    )
)
AND BedID NOT IN (
    SELECT DISTINCT BedID
    FROM Admissions
    WHERE DischargeDate IS NOT NULL
);
