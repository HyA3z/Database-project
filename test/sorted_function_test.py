import psycopg2
import unittest

class MedicalHistoryTest(unittest.TestCase):
    def setUp(self):
        self.connection = psycopg2.connect(
            host="localhost",
            database="hospital_database",
            user="postgres",
            password="czy490603"
        )
        self.cursor = self.connection.cursor()

    def tearDown(self):
        self.cursor.close()
        self.connection.close()

    def test_get_patient_medical_history(self):
        # Call the getPatientMedicalHistory function with patientId = 5
        self.cursor.execute("SELECT * FROM getPatientMedicalHistory(5)")
        result_set = self.cursor.fetchall()

        # Convert the actual result set to match the expected data types
        converted_result_set = [
            (str(row[0]), str(row[1]), str(row[2]), str(row[3]), str(row[4]), str(row[5]))
            for row in result_set
        ]

        # Assert that the result set matches the expected values
        expected_result = [
            ("David", "Lee", "2023-05-20", "Hypertension", "Lifestyle changes and medication", "Simvastatin"),
            ("David", "Lee", "2023-06-09", "Hypertension", "Lifestyle changes and medication", "Simvastatin")
        ]
        self.assertListEqual(converted_result_set, expected_result)

    def test_get_patient_details(self):
        # Call the get_patient_details function with patient_id = 3
        self.cursor.execute("SELECT * FROM get_patient_details(3)")
        result_set = self.cursor.fetchall()

        # Convert the actual result set to match the expected data types
        converted_result_set = [
            (str(row[0]), str(row[1]), str(row[2]), str(row[3]), str(row[4]), str(row[5]), str(row[6]), float(row[7]))
            for row in result_set
        ]

        # Assert that the result set matches the expected values
        expected_result = [
            ("2023-05-15", "09:15:00", "Sarah", "Johnson", "Influenza", "Bed rest, fluids, and antiviral medications", "2022-06-03", 600),
            ("2023-05-15", "09:15:00", "Sarah", "Johnson", "Influenza", "Bed rest, fluids, and antiviral medications", "2023-03-20", 900)
        ]
        self.assertListEqual(converted_result_set, expected_result)


if __name__ == '__main__':
    unittest.main()
