CREATE TABLE Patients (
  Patient_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Date_of_Birth DATE,
  Gender VARCHAR(10),
  Contact_Info VARCHAR(100)
);

CREATE TABLE Doctors (
  Doctor_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Specialty VARCHAR(50),
  Qualifications VARCHAR(100),
  Availability VARCHAR(10)
);

CREATE TABLE Appointments (
  Appointment_ID INT PRIMARY KEY,
  Patient_ID INT,
  Doctor_ID INT,
  Date_and_Time DATETIME,
  Status VARCHAR(10),
  FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
  FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

CREATE TABLE Departments (
  Department_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Description VARCHAR(100)
);

CREATE TABLE Staff (
  Staff_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Role VARCHAR(50),
  Department_ID INT,
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

CREATE TABLE Rooms (
  Room_ID INT PRIMARY KEY,
  Room_Number INT,
  Department_ID INT,
  Availability VARCHAR(10),
  FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

CREATE TABLE Treatments (
  Treatment_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Description VARCHAR(100),
  Cost DECIMAL(10, 2)
);

CREATE TABLE Prescriptions (
  Prescription_ID INT PRIMARY KEY,
  Patient_ID INT,
  Doctor_ID INT,
  Treatment_ID INT,
  Dosage_Instructions VARCHAR(100),
  FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
  FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID),
  FOREIGN KEY (Treatment_ID) REFERENCES Treatments(Treatment_ID)
);

CREATE TABLE Bills (
  Bill_ID INT PRIMARY KEY,
  Patient_ID INT,
  Date DATE,
  Amount DECIMAL(10, 2),
  Status VARCHAR(10),
  FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

CREATE TABLE Lab_Results (
  Lab_Result_ID INT PRIMARY KEY,
  Patient_ID INT,
  Test_Name VARCHAR(50),
  Result VARCHAR(50),
  Date DATE,
  FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);