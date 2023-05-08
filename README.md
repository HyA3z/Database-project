# Hospital Project

## conceptual model 
![photo_2023-04-18_00-11-17](https://user-images.githubusercontent.com/98240581/232611785-44f5717e-de1b-4665-bf6b-9a742c0b77ac.jpg)


## Logical schema
![Alt text]('docs/logical model.png')

Logic model description:
### Table 1: Patients
| Column Name | Description | Data Type |
| ----------- | ----------- | --------- |
| PatientID | Unique identifier for a patient | INT |
| FirstName | First name of the patient | VARCHAR(50) |
| LastName | Last name of the patient | VARCHAR(50) |
| Gender | Gender of the patient | VARCHAR(10) |
| DateOfBirth | Date of birth of the patient | DATE |
| Address | Address of the patient | VARCHAR(100) |
| PhoneNumber | Phone number of the patient | VARCHAR(20) |

### Table 2: Doctors
| Column Name | Description | Data Type |
| ----------- | ----------- | --------- |
| DoctorID | Unique identifier for a doctor | INT |
| FirstName | First name of the doctor | VARCHAR(50) |
| LastName | Last name of the doctor | VARCHAR(50) |
| Gender | Gender of the doctor | VARCHAR(10) |
| DateOfBirth | Date of birth of the doctor | DATE |
| Address | Address of the doctor | VARCHAR(100) |
| PhoneNumber | Phone number of the doctor | VARCHAR(20) |
| Specialization | Specialization of the doctor | VARCHAR(50) |

### Table 3: Appointments
| Column Name | Description | Data Type |
| ----------- | ----------- | --------- |
| AppointmentID | Unique identifier for an appointment | INT |
| PatientID | Foreign key referencing the PatientID column in the Patients table | INT |
| DoctorID | Foreign key referencing the DoctorID column in the Doctors table | INT |
| AppointmentDate | Date of the appointment | DATE |
| AppointmentTime | Time of the appointment | TIME |

### Table 4: MedicalRecords
| Column Name | Description | Data Type |
| ----------- | ----------- | --------- |
| RecordID | Unique identifier for a medical record | INT |
| PatientID | Foreign key referencing the PatientID column in the Patients table | INT |
| DoctorID | Foreign key referencing the DoctorID column in the Doctors table | INT |
| RecordDate | Date of the medical record | DATE |
| Diagnosis | Diagnosis of the medical record | VARCHAR(200) |
| Treatment | Treatment of the medical record | VARCHAR(200) |

### Table 5: Departments
| Column Name | Description | Data Type |
| ----------- | ----------- | --------- |
| DepartmentID | Unique identifier for a department | INT |
| DepartmentName | Name of the department | VARCHAR(50) |

### Table 6: Staff
| Column Name | Description | Data Type |
| ----------- | ----------- | --------- |
| StaffID | Unique identifier for a staff member | INT |
| DepartmentID | Foreign key referencing the DepartmentID column in the Departments table | INT |
| FirstName | First name of the staff member | VARCHAR(50) |
| LastName | Last name of the staff member | VARCHAR(50) |
| Gender | Gender of the staff member | VARCHAR(10) |
| DateOfBirth | Date of birth of the staff member | DATE |
| Address | Address of the staff member | VARCHAR(100) |
| PhoneNumber | Phone number of the staff member | VARCHAR(20) |

### Table 7: Admissions
| Column Name | Description | Data Type |
| ----------- | ----------- | --------- |
| AdmissionID | Unique identifier for an admission | INT |
| PatientID | Foreign key referencing the PatientID column in the Patients table | INT |
| AdmissionDate | Date of the admission | DATE |
| DischargeDate | Date of discharge from the admission | DATE |

### Table 8: Rooms
| Column Name | Description | Data Type |
| --- | --- | --- |
| RoomID | Primary key for the room | INT |
| RoomNumber | The room number | VARCHAR(10) |
| RoomType | The type of the room (e.g., private, shared) | VARCHAR(20) |
| DepartmentID | The department to which the room belongs (foreign key referencing Departments) | INT |

### Table 9: Beds
| Column Name | Description | Data Type |
| --- | --- | --- |
| BedID | Primary key for the bed | INT |
| RoomID | The room to which the bed belongs (foreign key referencing Rooms) | INT |
| BedNumber | The bed number | VARCHAR(10) |

### Table 10: Medications
| Column Name | Description | Data Type |
| --- | --- | --- |
| MedicationID | Primary key for the medication | INT |
| MedicationName | The name of the medication | VARCHAR(50) |
| MedicationDescription | Description of the medication | VARCHAR(200) |

### Table 11: Prescriptions
| Column Name | Description | Data Type |
| --- | --- | --- |
| PrescriptionID | Primary key for the prescription | INT |
| PatientID | The patient for whom the prescription is written (foreign key referencing Patients) | INT |
| DoctorID | The doctor who wrote the prescription (foreign key referencing Doctors) | INT |
| MedicationID | The medication prescribed (foreign key referencing Medications) | INT |
| PrescriptionDate | The date on which the prescription was written | DATE |
| Dosage | The dosage for the medication | VARCHAR(50) |

### Table 12: Billing
| Column Name | Description | Data Type |
| --- | --- | --- |
| BillID | Primary key for the bill | INT |
| PatientID | The patient who is being billed (foreign key referencing Patients) | INT |
| BillDate | The date on which the bill was issued | DATE |
| TotalCost | The total cost of the bill | DECIMAL(10,2) |

### Table 13: Payments
| Column Name | Description | Data Type |
| --- | --- | --- |
| PaymentID | Primary key for the payment | INT |
| PatientID | The patient who is making the payment (foreign key referencing Patients) | INT |
| PaymentDate | The date on which the payment was made | DATE |
| PaymentAmount | The amount of the payment | DECIMAL(10,2) |
