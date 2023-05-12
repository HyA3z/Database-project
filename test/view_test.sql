import psycopg2
import pandas as pd
from pandas.testing import assert_frame_equal


class ViewTester:
    def __init__(self, dbname, user, host, port, password):
        self.connection = psycopg2.connect(
            dbname=dbname,
            user=user,
            host=host,
            port=port,
            password=password
        )
    
    def execute_query(self, query):
        cursor = self.connection.cursor()
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
    
    def load_csv(self, csv_path):
        return pd.read_csv(csv_path)
    
    def test_view(self, view_name, csv_path):
        query = f"SELECT * FROM {view_name};"
        result_df = pd.DataFrame(self.execute_query(query))
        expected_df = self.load_csv(csv_path)
        # Set column names for result_df
        result_df.columns = expected_df.columns
        # Replace empty values with NULL
        result_df = result_df.fillna('NULL')
        expected_df = expected_df.fillna('NULL')
        # Convert columns to string type
        result_df = result_df.astype(str)
        expected_df = expected_df.astype(str)
        assert_frame_equal(result_df, expected_df, check_dtype=False)
            # Convert column data types to match expected_df
        print(f"View {view_name} matches the expected CSV file.")
    
    def close_connection(self):
        self.connection.close()


# Set the database connection parameters
host = "localhost"
port = "5432"
database = "hospital_database"
user = "postgres"
password = "czy490603"

# Create ViewTester class instance
tester = ViewTester(database, user, host, port, password)

# Test each view
views_and_csv_files = [
    ("patients_anonymized", "./result_output/patients_anonymized.csv"),
    ("medicalrecords_anonymized", "./result_output/medicalrecords_anonymized.csv"),
    ("PatientAppointmentStats", "./result_output/PatientAppointmentStats.csv"),
    ("PatientAppointments", "./result_output/PatientAppointments.csv"),
    ("DoctorPrescriptions", "./result_output/DoctorPrescriptions.csv"),
    ("MedicationPrescriptions", "./result_output/MedicationPrescriptions.csv"),
    ("PatientPrescriptions", "./result_output/PatientPrescriptions.csv")
]

for view_name, csv_file in views_and_csv_files:
    print(f"Testing view: {view_name}")
    tester.test_view(view_name, csv_file)
    print("----------------------\n")

# Close the database connection
tester.close_connection()
