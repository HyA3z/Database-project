import psycopg2
import pandas as pd
from pandas.testing import assert_frame_equal


conn = psycopg2.connect(f"""
            dbname='hospital_database'
            user='postgres'
            host='localhost'
            port='5432'
            password='czy490603'
        """)

# Test for query A
def a():
    cur = conn.cursor()
    cur.execute("""
    SELECT PatientID, CAST(SUM(TotalCost) AS INT) AS TotalBillCost
    FROM Billing
    GROUP BY PatientID
    HAVING SUM(TotalCost) > 2000
    ORDER BY TotalBillCost;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["PatientID", "TotalBillCost"])


result_a = a()
expected_a = pd.read_csv('./result_output/select_A.csv')


# Test for query B
def b():
    cur = conn.cursor()
    cur.execute("""
    SELECT Patients.PatientID, Patients.FirstName, Patients.LastName, COUNT(MedicalRecords.RecordID) AS VisitCount
    FROM Patients
    LEFT JOIN MedicalRecords ON Patients.PatientID = MedicalRecords.PatientID
    GROUP BY Patients.PatientID, Patients.FirstName, Patients.LastName
    ORDER BY VisitCount DESC, FirstName;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["PatientID", "FirstName", "LastName", "VisitCount"])


result_b = b()
expected_b = pd.read_csv('./result_output/select_B.csv')


# Test for query C1
def c1():
    cur = conn.cursor()
    cur.execute("""
    SELECT r.DepartmentID, d.DepartmentName, r.RoomType,
    AVG(COUNT(b.BedID)) OVER (PARTITION BY r.DepartmentID, r.RoomType) AS AverageBedCount
    FROM Rooms r
    JOIN Departments d ON r.DepartmentID = d.DepartmentID
    JOIN Beds b ON r.RoomID = b.RoomID
    GROUP BY r.DepartmentID, d.DepartmentName, r.RoomType;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["departmentid", "departmentname", "roomtype", "averagebedcount"])


result_c1 = c1()
expected_c1 = pd.read_csv('./result_output/select_C1.csv')


# Test for query C2
def c2():
    cur = conn.cursor()
    cur.execute("""
    SELECT PatientID, FirstName, LastName, 
        RANK() OVER (ORDER BY DateOfBirth) AS RankNumber
    FROM Patients;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["patientid", "firstname", "lastname", "ranknumber"])


result_c2 = c2()
expected_c2 = pd.read_csv('./result_output/select_C2.csv')


# Test for query C3
def c3():
    cur = conn.cursor()
    cur.execute("""
    SELECT p.PatientID, p.FirstName, p.LastName, d.DoctorID, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName,
    m.RecordID, m.RecordDate,
    ROW_NUMBER() OVER (PARTITION BY p.PatientID, d.DoctorID ORDER BY m.RecordDate) AS RowNum
    FROM Patients p
    JOIN MedicalRecords m ON p.PatientID = m.PatientID
    JOIN Doctors d ON m.DoctorID = d.DoctorID
    JOIN Prescriptions pr ON p.PatientID = pr.PatientID AND d.DoctorID = pr.DoctorID;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["patientid", "firstname", "lastname", "doctorid", "doctorfirstname", "doctorlastname", "recordid", "recorddate", "rownum"])


result_c3 = c3()
expected_c3 = pd.read_csv('./result_output/select_C3.csv')
expected_c3['recorddate'] = pd.to_datetime(expected_c3['recorddate'])
result_c3['recorddate'] = pd.to_datetime(result_c3['recorddate'])



# Test for query d1
def d1():
    cur = conn.cursor()
    cur.execute("""
    SELECT p.PatientID, p.FirstName, p.LastName,
    COUNT(a.AppointmentID) AS AppointmentCount,
    MIN(a.AppointmentDate) AS EarliestAppointmentDate
    FROM Patients p
    INNER JOIN Appointments a ON p.PatientID = a.PatientID
    GROUP BY p.PatientID, p.FirstName, p.LastName;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["patientid", "firstname", "lastname", "appointmentcount", "earliestappointmentdate",])


result_d1 = d1()
expected_d1 = pd.read_csv('./result_output/select_D1.csv')
expected_d1['earliestappointmentdate'] = pd.to_datetime(expected_d1['earliestappointmentdate'])
result_d1['earliestappointmentdate'] = pd.to_datetime(result_d1['earliestappointmentdate'])



# Test for query d2
def d2():
    cur = conn.cursor()
    cur.execute("""
    SELECT
        p.FirstName AS PatientFirstName,
        p.LastName AS PatientLastName,
        d.FirstName AS DoctorFirstName,
        d.LastName AS DoctorLastName,
        a.AppointmentDate,
        a.AppointmentTime,
        RANK() OVER (PARTITION BY a.DoctorID ORDER BY a.AppointmentDate) AS AppointmentRank
    FROM
        Appointments a
        JOIN Patients p ON a.PatientID = p.PatientID
        JOIN Doctors d ON a.DoctorID = d.DoctorID
    WHERE
        a.AppointmentDate >= CURRENT_DATE
    ORDER BY
        a.DoctorID,
        a.AppointmentDate;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["patientfirstname", "patientlastname", "doctorfirstname", "doctorlastname", "appointmentdate", "appointmenttime", "appointmentrank"])


result_d2 = d2()
expected_d2 = pd.read_csv('./result_output/select_D2.csv', encoding='utf-8')
expected_d2['appointmentdate'] = pd.to_datetime(expected_d2['appointmentdate'])
result_d2['appointmentdate'] = pd.to_datetime(result_d2['appointmentdate'])
result_d2['appointmenttime'] = result_d2['appointmenttime'].astype(str)


# Test for query d3
def d3():
    cur = conn.cursor()
    cur.execute("""
    SELECT *
    FROM Appointments
    WHERE AppointmentDate >= '2023-01-01'
    ORDER BY AppointmentDate, AppointmentTime
    LIMIT 10 OFFSET 0;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["appointmentid", "patientid", "doctorid", "appointmentdate", "appointmenttime"])


result_d3 = d3()
expected_d3 = pd.read_csv('./result_output/select_D3.csv')
expected_d3['appointmentdate'] = pd.to_datetime(expected_d3['appointmentdate'])
result_d3['appointmentdate'] = pd.to_datetime(result_d3['appointmentdate'])
result_d3['appointmenttime'] = result_d3['appointmenttime'].astype(str)


# Test for query d4
def d4():
    cur = conn.cursor()
    cur.execute("""
    SELECT *
    FROM (
    SELECT PatientID, FirstName, LastName,
        ROW_NUMBER() OVER(ORDER BY PatientID) AS RowNumber,
        COUNT(*) OVER() AS TotalRows
    FROM Patients
    ) AS PatientData
    WHERE RowNumber BETWEEN 2 AND 4
    LIMIT 2 OFFSET 0;
    """)
    rows = cur.fetchall()
    cur.close()
    return pd.DataFrame(rows, columns=["patientid", "firstname", "lastname", "rownumber", "totalrows"])


result_d4 = d4()
expected_d4 = pd.read_csv('./result_output/select_D4.csv')


conn.close()


def test():
    test_cases = [
    (result_a, expected_a),
    (result_b, expected_b),
    (result_c1, expected_c1),
    (result_c2, expected_c2),
    (result_c3, expected_c3),
    (result_d1, expected_d1),
    (result_d2, expected_d2),
    (result_d3, expected_d3),
    (result_d4, expected_d4)
    ]

    for result, expected in test_cases:
        assert_frame_equal(result, expected, check_dtype=False)


test()

