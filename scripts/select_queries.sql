
-- A. GROUP BY + HAVING:
--Retrieve the total cost of bills for each patient, but only show patients who have a total bill cost greater than $1000
SELECT PatientID, SUM(TotalCost) AS TotalBillCost
FROM Billing
GROUP BY PatientID
HAVING SUM(TotalCost) > 1000;

-- Retrieve the doctors and their average patient count per appointment
SELECT DoctorID, COUNT(*) AS AppointmentCount, AVG(AppointmentCount) AS AvgPatientCount
FROM (
    SELECT DoctorID, PatientID, COUNT(*) AS AppointmentCount
    FROM Appointments
    GROUP BY DoctorID, PatientID
) AS Subquery
GROUP BY DoctorID;


-- B. ORDER BY:
-- Sorted by patient's age in descending order
SELECT *
FROM Patients
ORDER BY DATEDIFF(CURRENT_DATE, DateOfBirth) DESC;

-- In descending order by the number of patient visits (i.e., patients with the most visits are listed first)
SELECT Patients.PatientID, Patients.FirstName, Patients.LastName, COUNT(MedicalRecords.RecordID) AS VisitCount
FROM Patients
LEFT JOIN MedicalRecords ON Patients.PatientID = MedicalRecords.PatientID
GROUP BY Patients.PatientID, Patients.FirstName, Patients.LastName
ORDER BY VisitCount DESC;


-- C. <func>(..) OVER (..):
-- 1. PARTITION BY:
-- Each patient's visit history and information about the most recent physician visit
SELECT p.PatientID, p.FirstName, p.LastName,
  r.RecordDate, r.Diagnosis, r.Treatment,
  d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName,
  MAX(r.RecordDate) OVER(PARTITION BY p.PatientID) AS LatestRecordDate
FROM Patients p
INNER JOIN MedicalRecords r ON p.PatientID = r.PatientID
INNER JOIN Doctors d ON r.DoctorID = d.DoctorID;


-- Query the average number of beds for each type of room in each section and group by section and room type
SELECT r.DepartmentID, d.DepartmentName, r.RoomType,
  AVG(COUNT(b.BedID)) OVER (PARTITION BY r.DepartmentID, r.RoomType) AS AverageBedCount
FROM Rooms r
JOIN Departments d ON r.DepartmentID = d.DepartmentID
JOIN Beds b ON r.RoomID = b.RoomID
GROUP BY r.DepartmentID, d.DepartmentName, r.RoomType;


-- 2. ORDER BY:
-- Sort by appointment date and time
SELECT PatientID, FirstName, LastName, 
       RANK() OVER (ORDER BY DateOfBirth) AS RankNumber
FROM Patients;


-- 3. PARTITION BY + ORDER BY:
-- Link Patients, Doctors, MedicalRecords, and Prescriptions tables, partitioned by patient and doctor, and sorted by date
SELECT p.PatientID, p.FirstName, p.LastName, d.DoctorID, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName,
  m.RecordID, m.RecordDate,
  ROW_NUMBER() OVER (PARTITION BY p.PatientID, d.DoctorID ORDER BY m.RecordDate) AS RowNum
FROM Patients p
JOIN MedicalRecords m ON p.PatientID = m.PatientID
JOIN Doctors d ON m.DoctorID = d.DoctorID
JOIN Prescriptions pr ON p.PatientID = pr.PatientID AND d.DoctorID = pr.DoctorID;





-- D. <func>
-- 1. AGGREGATING:
-- Calculate the number of appointments and the earliest appointment date for each patient
SELECT p.PatientID, p.FirstName, p.LastName,
  COUNT(a.AppointmentID) AS AppointmentCount,
  MIN(a.AppointmentDate) AS EarliestAppointmentDate
FROM Patients p
INNER JOIN Appointments a ON p.PatientID = a.PatientID
GROUP BY p.PatientID, p.FirstName, p.LastName;

-- Calculate the number of patients per physician and sort them in descending order by number of patients
SELECT d.DoctorID, d.FirstName, d.LastName, COUNT(p.PatientID) AS PatientCount
FROM Doctors d
JOIN Appointments a ON d.DoctorID = a.DoctorID
JOIN Patients p ON a.PatientID = p.PatientID
GROUP BY d.DoctorID, d.FirstName, d.LastName
ORDER BY PatientCount DESC;


-- 2. Ranking
-- Calculate the number of medical records for each patient and rank the patients based on the number.
SELECT PatientID, RecordCount, RANK() OVER(ORDER BY RecordCount DESC) AS PatientRank
FROM (
  SELECT PatientID, COUNT(RecordID) AS RecordCount
  FROM MedicalRecords
  GROUP BY PatientID
) AS RecordCounts;


-- 3. OFFSET:
-- Sort by appointment date and time, then return 10 rows of results starting from the first row
SELECT *
FROM Appointments
WHERE AppointmentDate >= '2023-01-01'
ORDER BY AppointmentDate, AppointmentTime
LIMIT 10 OFFSET 0;


-- 4. ALL 3 FUNCTIONS:
-- paginate the data in the patient table
SELECT *
FROM (
  SELECT PatientID, FirstName, LastName,
    ROW_NUMBER() OVER(ORDER BY PatientID) AS RowNumber,
    COUNT(*) OVER() AS TotalRows
  FROM Patients
) AS PatientData
WHERE RowNumber BETWEEN 2 AND 4
LIMIT 2 OFFSET 0