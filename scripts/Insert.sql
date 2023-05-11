-- Patients
INSERT INTO Patients (PatientID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber) VALUES 
(1, 'John', 'Doe', 'Male', '1990-01-01', '123 Main St', '555-1234'),
(2, 'Jane', 'Doe', 'Female', '1995-05-05', '456 Second St', '555-5678'),
(3, 'Bob', 'Smith', 'Male', '1980-10-10', '789 Third St', '555-9012'),
(4, 'Sara', 'Johnson', 'Female', '1975-02-20', '321 Fourth St', '555-3456'),
(5, 'David', 'Lee', 'Male', '1992-07-15', '654 Fifth St', '555-7890'),
(6, 'Amy', 'Chen', 'Female', '1985-12-25', '987 Sixth St', '555-2345'),
(7, 'Mark', 'Garcia', 'Male', '1978-03-30', '135 Seventh St', '555-6789'),
(8, 'Emily', 'Davis', 'Female', '1998-06-06', '864 Eighth St', '555-0123'),
(9, 'Michael', 'Wilson', 'Male', '1970-09-12', '975 Ninth St', '555-4567'),
(10, 'Jessica', 'Kim', 'Female', '1993-04-05', '246 Tenth St', '555-8901');

-- Doctors
INSERT INTO Doctors (DoctorID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber, Specialization)
VALUES
(1, 'John', 'Smith', 'Male', '1975-06-15', '123 Main St, New York, NY', '555-1234', 'Cardiology'),
(2, 'Sarah', 'Johnson', 'Female', '1980-08-20', '456 Elm St, Los Angeles, CA', '555-5678', 'Neurology'),
(3, 'Michael', 'Williams', 'Male', '1972-02-03', '789 Oak St, Chicago, IL', '555-9012', 'Oncology'),
(4, 'Emily', 'Davis', 'Female', '1990-05-12', '321 Maple St, Houston, TX', '555-3456', 'Pediatrics'),
(5, 'David', 'Jones', 'Male', '1985-12-01', '654 Pine St, Miami, FL', '555-7890', 'Orthopedics'),
(6, 'Lisa', 'Garcia', 'Female', '1978-09-27', '987 Cedar St, Seattle, WA', '555-2345', 'Dermatology'),
(7, 'Robert', 'Brown', 'Male', '1983-04-17', '753 Spruce St, Boston, MA', '555-6789', 'Psychiatry'),
(8, 'Jessica', 'Miller', 'Female', '1995-11-08', '246 Oak St, San Francisco, CA', '555-1234', 'Gastroenterology'),
(9, 'William', 'Wilson', 'Male', '1976-07-29', '864 Elm St, Denver, CO', '555-5678', 'Endocrinology'),
(10, 'Melissa', 'Taylor', 'Female', '1988-03-18', '135 Pine St, Washington, DC', '555-9012', 'Obstetrics and Gynecology');



-- Appointments
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime)
VALUES
    (1, 1, 1, '2023-05-10', '10:00:00'),
    (2, 2, 3, '2023-05-12', '14:30:00'),
    (3, 3, 2, '2023-05-15', '09:15:00'),
    (4, 4, 4, '2023-05-18', '16:00:00'),
    (5, 5, 5, '2023-05-20', '11:45:00'),
    (6, 6, 2, '2023-05-22', '15:20:00'),
    (7, 7, 3, '2023-05-24', '10:30:00'),
    (8, 8, 1, '2023-05-26', '13:45:00'),
    (9, 9, 4, '2023-05-29', '16:30:00'),
    (10, 10, 5, '2023-06-01', '11:00:00');

-- MedicalRecords
INSERT INTO MedicalRecords (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, Treatment) VALUES
(1, 1, 2, '2022-01-01', 'Common cold', 'Rest and hydration'),
(2, 1, 2, '2022-03-15', 'Influenza', 'Antiviral medication'),
(3, 2, 1, '2022-02-14', 'Pneumonia', 'Antibiotics and rest'),
(4, 3, 3, '2022-01-23', 'Asthma', 'Bronchodilator medication'),
(5, 4, 4, '2022-02-06', 'Type 2 diabetes', 'Insulin therapy and dietary changes'),
(6, 5, 5, '2022-03-01', 'Hypertension', 'Lifestyle changes and medication'),
(7, 6, 3, '2022-03-20', 'Depression', 'Cognitive-behavioral therapy and antidepressants'),
(8, 7, 4, '2022-02-15', 'Anxiety disorder', 'Anxiolytic medication and therapy'),
(9, 8, 1, '2022-01-09', 'Migraine', 'Pain relief medication and rest'),
(10, 9, 5, '2022-03-10', 'Osteoarthritis', 'Pain relief medication and physical therapy'),
(11, 2, 3, '2022-02-15', 'Seasonal allergies', 'Antihistamines and nasal sprays'),
(12, 1, 1, '2022-03-10', 'Headache', 'Over-the-counter pain relievers and relaxation techniques'),
(13, 3, 2, '2022-04-20', 'Influenza', 'Bed rest, fluids, and antiviral medications'),
(14, 2, 1, '2022-05-05', 'Sinusitis', 'Nasal irrigation, steam inhalation, and antibiotics if necessary'),
(15, 1, 2, '2022-06-30', 'Migraine', 'Dark, quiet room, cold compress, and prescription migraine medication');

-- Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (1, 'Cardiology'),
       (2, 'Neurology'),
       (3, 'Oncology'),
       (4, 'Pediatrics'),
       (5, 'Orthopedics'),
       (6, 'Dermatology'),
       (7, 'Psychiatry'),
       (8, 'Gastroenterology'),
       (9, 'Endocrinology'),
       (10, 'Obstetrics and Gynecology');


-- Staff
INSERT INTO Staff (StaffID, DepartmentID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber)
VALUES 
(1, 1, 'John', 'Doe', 'Male', '1980-01-01', '123 Main St', '555-1234'),
(2, 1, 'Jane', 'Smith', 'Female', '1985-05-10', '456 Elm St', '555-5678'),
(3, 2, 'Michael', 'Johnson', 'Male', '1975-08-15', '789 Oak St', '555-9012'),
(4, 2, 'Emily', 'Brown', 'Female', '1990-03-20', '234 Maple Ave', '555-3456'),
(5, 3, 'William', 'Davis', 'Male', '1982-11-30', '567 Pine St', '555-7890'),
(6, 3, 'Olivia', 'Garcia', 'Female', '1988-06-25', '890 Cedar Ln', '555-2345'),
(7, 4, 'David', 'Miller', 'Male', '1984-04-05', '345 Walnut St', '555-6789'),
(8, 4, 'Sophia', 'Hernandez', 'Female', '1995-09-15', '678 Cherry Dr', '555-0123'),
(9, 5, 'Daniel', 'Lee', 'Male', '1978-02-15', '901 Oak Hill', '555-4567'),
(10, 5, 'Isabella', 'Gonzalez', 'Female', '1992-07-20', '1234 Ridge Rd', '555-8901');

-- Admissions
INSERT INTO Admissions (AdmissionID, PatientID, AdmissionDate, DischargeDate)
VALUES
(1, 1, '2022-01-01', '2022-01-05'),
(2, 1, '2022-02-15', '2022-02-21'),
(3, 2, '2022-03-10', '2022-03-13'),
(4, 3, '2022-04-01', '2022-04-06'),
(5, 4, '2022-05-12', '2022-05-15'),
(6, 5, '2022-06-20', '2022-06-25'),
(7, 6, '2022-07-01', '2022-07-04'),
(8, 7, '2022-08-10', '2022-08-14'),
(9, 8, '2022-09-05', '2022-09-10'),
(10, 9, '2022-10-20', '2022-10-23');

-- Rooms
INSERT INTO Rooms (RoomID, RoomNumber, RoomType, DepartmentID) VALUES 
(1, '101', 'Single', 1),
(2, '102', 'Single', 1),
(3, '103', 'Double', 1),
(4, '104', 'Double', 1),
(5, '201', 'Single', 2),
(6, '202', 'Single', 2),
(7, '203', 'Double', 2),
(8, '204', 'Double', 2),
(9, '301', 'Single', 3),
(10, '302', 'Single', 3);

-- Beds
INSERT INTO Beds (BedID, RoomID, BedNumber) VALUES 
(1, 1, '1A'),
(2, 1, '1B'),
(3, 2, '2A'),
(4, 2, '2B'),
(5, 3, '3A'),
(6, 3, '3B'),
(7, 4, '4A'),
(8, 4, '4B'),
(9, 5, '5A'),
(10, 5, '5B');


-- 向Medications表插入数据
INSERT INTO Medications (MedicationID, MedicationName, MedicationDescription)
VALUES
(1, 'Aspirin', 'Pain reliever and fever reducer'),
(2, 'Amoxicillin', 'Antibiotic used to treat bacterial infections'),
(3, 'Lisinopril', 'Medication used to treat high blood pressure'),
(4, 'Metformin', 'Oral medication used to treat type 2 diabetes'),
(5, 'Simvastatin', 'Medication used to lower cholesterol levels'),
(6, 'Levothyroxine', 'Medication used to treat hypothyroidism'),
(7, 'Prednisone', 'Steroid medication used to treat inflammation'),
(8, 'Gabapentin', 'Medication used to treat seizures and nerve pain'),
(9, 'Losartan', 'Medication used to treat high blood pressure'),
(10, 'Tramadol', 'Pain medication used to treat moderate to severe pain');

-- 向Prescriptions表插入数据

INSERT INTO Prescriptions (PrescriptionID, PatientID, DoctorID, MedicationID, PrescriptionDate, Dosage)
VALUES
    (1, 1, 1, 1, '2022-04-01', '10mg daily'),
    (2, 2, 2, 2, '2022-04-02', '20mg daily'),
    (3, 3, 3, 3, '2022-04-03', '30mg daily'),
    (4, 4, 4, 4, '2022-04-04', '40mg daily'),
    (5, 5, 5, 5, '2022-04-05', '50mg daily'),
    (6, 6, 6, 6, '2022-04-06', '60mg daily'),
    (7, 7, 7, 7, '2022-04-07', '70mg daily'),
    (8, 8, 8, 8, '2022-04-08', '80mg daily'),
    (9, 9, 9, 9, '2022-04-09', '90mg daily'),
    (10, 10, 10, 10, '2022-04-10', '100mg daily');



-- Insert data into Billing table
INSERT INTO Billing (BillID, PatientID, BillDate, TotalCost)
VALUES (1, 1, '2022-04-01', 1500.00),
       (2, 2, '2022-05-15', 3200.00),
       (3, 3, '2022-06-03', 600.00),
       (4, 4, '2022-07-12', 1800.00),
       (5, 5, '2022-08-05', 2400.00),
       (6, 6, '2022-09-20', 1500.00),
       (7, 7, '2022-10-10', 800.00),
       (8, 8, '2022-11-25', 1000.00),
       (9, 9, '2022-12-15', 450.00),
       (10, 10, '2023-01-07', 2000.00);

-- Insert data into Payments table
INSERT INTO Payments (PaymentID, PatientID, PaymentDate, PaymentAmount)
VALUES (1, 1, '2022-05-01', 500.00),
       (2, 2, '2022-06-15', 1000.00),
       (3, 3, '2022-07-03', 200.00),
       (4, 4, '2022-08-12', 800.00),
       (5, 5, '2022-09-05', 1200.00),
       (6, 6, '2022-10-20', 500.00),
       (7, 7, '2022-11-10', 400.00),
       (8, 8, '2022-12-25', 600.00),
       (9, 9, '2023-01-15', 150.00),
       (10, 10, '2023-02-07', 1000.00);



