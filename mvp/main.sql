-- Creates a new database named "hospital"
CREATE DATABASE hospital;
-- Switches to using the "hospital" database
USE hospital;
-- Creates the "Patient" table with columns "patientID" and "name"
-- "patientID" is the primary key of the table, and "name" is a VARCHAR column with a maximum length of 50 characters
CREATE TABLE Patient (
    patientID INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50)
);
-- Creates the "Physician" table with columns for physician details
CREATE TABLE Physician (
    physicianID INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50),
    specialty VARCHAR(50)
);
-- Creates the "Insurance" table with columns for insurance details
-- It includes a foreign key reference to the "Patient" table
CREATE TABLE Insurance (
    insuranceID INT PRIMARY KEY AUTOINCREMENT,
    isActive BOOLEAN,
    type VARCHAR(50),
    patientID INT,
    insuranceNumber VARCHAR(50),
    provider VARCHAR(50),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID)
);
-- Creates the "MedicalTest" table with columns for medical test details
-- It includes a foreign key reference to the "Physician" table
CREATE TABLE MedicalTest (
    medicalTestID INT PRIMARY KEY AUTOINCREMENT,
    physicianID INT,
    name VARCHAR(50),
    dateTested DATE,
    cost DECIMAL(10, 2),
    results TEXT,
    FOREIGN KEY (physicianID) REFERENCES Physician(physicianID)
);
-- Creates the "Ward" table with columns for ward details
-- It includes a foreign key reference to the "Physician" table
CREATE TABLE Ward (
    wardID INT PRIMARY KEY AUTOINCREMENT,
    physicianID INT,
    name VARCHAR(50),
    type VARCHAR(50),
    capacity INT,
    isAvailable BOOLEAN,
    FOREIGN KEY (physicianID) REFERENCES Physician(physicianID)
);
-- Creates the "Admit" table with columns for admission details
-- It includes foreign key references to the "Patient," "Physician," and "Ward" tables
CREATE TABLE Admit (
    admitID INT PRIMARY KEY AUTOINCREMENT,
    patientID INT,
    physicianID INT,
    wardID INT,
    dischargeDate DATE,
    admissionDate DATE,
    isActive BOOLEAN,
    FOREIGN KEY (patientID) REFERENCES Patient (patientID),
    FOREIGN KEY (physicianID) REFERENCES Physician (physicianID),
    FOREIGN KEY (wardID) REFERENCES Ward (wardID)
);
-- Creates the "TreatmentDetail" table with columns for treatment details
-- It includes foreign key references to the "Patient" and "Physician" tables
CREATE TABLE TreatmentDetail (
    treatmentID INT PRIMARY KEY AUTOINCREMENT,
    patientID INT,
    physicianID INT,
    results TEXT,
    FOREIGN KEY (patientID) REFERENCES Patient(patientID),
    FOREIGN KEY (physicianID) REFERENCES Physician(physicianID)
);
-- Creates the "InchargeDetails" table with columns for in-charge details
-- It includes foreign key references to the "Physician" and "Ward" tables
CREATE TABLE InchargeDetails (
    inchargeID INT PRIMARY KEY AUTOINCREMENT,
    physicianID INT,
    wardID INT,
    dateRemoved DATE,
    isCurrent BOOLEAN,
    FOREIGN KEY (physicianID) REFERENCES Physician(physicianID),
    FOREIGN KEY (wardID) REFERENCES Ward(wardID)
);
-- Inserting values into the "Patient" table
INSERT INTO Patient (name)
VALUES ('John Doe'),
    ('Jane Smith'),
    ('Michael Johnson'),
    ('Emily Davis'),
    ('Daniel Wilson'),
    ('Olivia Brown'),
    ('William Jones'),
    ('Sophia Taylor'),
    ('Alexander Miller'),
    ('Ava Anderson');
-- Inserting values into the "Physician" table
INSERT INTO Physician (name, specialty)
VALUES ('Dr. Robert Johnson', 'Cardiology'),
    ('Dr. Emily Thompson', 'Orthopedics'),
    ('Dr. Sarah Davis', 'Pediatrics'),
    ('Dr. Michael Roberts', 'Ophthalmology'),
    ('Dr. Jennifer Wilson', 'Dermatology'),
    ('Dr. James Brown', 'Neurology'),
    ('Dr. Elizabeth White', 'Gastroenterology'),
    (
        'Dr. Benjamin Lee',
        'Obstetrics and Gynecology'
    ),
    ('Dr. Emma Martin', 'Psychiatry'),
    ('Dr. Samuel Clark', 'Urology');
-- Inserting values into the "Insurance" table
INSERT INTO Insurance (
        isActive,
        type,
        patientID,
        insuranceNumber,
        provider
    )
VALUES (
        true,
        'Health',
        1,
        'INS12345',
        'ABC Insurance'
    ),
    (
        true,
        'Health',
        2,
        'INS67890',
        'XYZ Insurance'
    ),
    (
        true,
        'Dental',
        3,
        'INS54321',
        'DEF Insurance'
    ),
    (
        true,
        'Health',
        4,
        'INS09876',
        'PQR Insurance'
    ),
    (
        true,
        'Vision',
        5,
        'INS13579',
        'MNO Insurance'
    ),
    (
        true,
        'Health',
        6,
        'INS24680',
        'GHI Insurance'
    ),
    (
        true,
        'Health',
        7,
        'INS97531',
        'JKL Insurance'
    ),
    (
        true,
        'Health',
        8,
        'INS86420',
        'STU Insurance'
    ),
    (
        true,
        'Dental',
        9,
        'INS75319',
        'VWX Insurance'
    ),
    (
        true,
        'Health',
        10,
        'INS64208',
        'YZA Insurance'
    );
-- Inserting values into the "MedicalTest" table
INSERT INTO MedicalTest (
        physicianID,
        name,
        dateTested,
        cost,
        results
    )
VALUES (
        1,
        'Blood Test',
        '2024-01-01',
        100.00,
        'Normal'
    ),
    (
        2,
        'X-Ray',
        '2024-01-02',
        150.00,
        'Fracture detected'
    ),
    (
        3,
        'Ultrasound',
        '2024-01-03',
        200.00,
        'Healthy'
    ),
    (
        4,
        'Eye Exam',
        '2024-01-04',
        80.00,
        '20/20 vision'
    ),
    (
        5,
        'Skin Biopsy',
        '2024-01-05',
        120.00,
        'Benign'
    ),
    (
        6,
        'MRI Scan',
        '2024-01-06',
        300.00,
        'No abnormalities'
    ),
    (
        7,
        'Colonoscopy',
        '2024-01-07',
        250.00,
        'Polyps found'
    ),
    (
        8,
        'Prenatal Screening',
        '2024-01-08',
        180.00,
        'Normal'
    ),
    (
        9,
        'Psychological Evaluation',
        '2024-01-09',
        220.00,
        'No significant issues'
    ),
    (
        10,
        'Urinalysis',
        '2024-01-10',
        90.00,
        'Normal'
    );
-- Inserting values into the "Ward" table
INSERT INTO Ward (
        physicianID,
        name,
        type,
        capacity,
        isAvailable
    )
VALUES (1, 'Cardiology Ward', 'Cardiology', 20, true),
    (
        2,
        'Orthopedics Ward',
        'Orthopedics',
        15,
        true
    ),
    (3, 'Pediatrics Ward', 'Pediatrics', 30, true),
    (
        4,
        'Ophthalmology Ward',
        'Ophthalmology',
        10,
        true
    ),
    (
        5,
        'Dermatology Ward',
        'Dermatology',
        25,
        true
    ),
    (6, 'Neurology Ward', 'Neurology', 12, true),
    (
        7,
        'Gastroenterology Ward',
        'Gastroenterology',
        18,
        true
    ),
    (
        8,
        ' Obstetrics
        and Gynecology Ward ',
        ' Obstetrics
        and Gynecology ',
        20,
        true
    ),
    (
        9,
        ' Psychiatry Ward ',
        ' Psychiatry ',
        15,
        true
    ),
    (10, ' Urology Ward ', ' Urology ', 10, true);
-- Inserting values into the "Admit" table
INSERT INTO Admit (
        patientID,
        physicianID,
        wardID,
        dischargeDate,
        admissionDate,
        isActive
    )
VALUES (
        1,
        1,
        1,
        '2024-01-01',
        '2024-01-01',
        false
    ),
    (
        2,
        2,
        2,
        '2024-01-02',
        '2024-01-02',
        false
    ),
    (
        3,
        3,
        3,
        '2024-01-03',
        '2024-01-03',
        false
    ),
    (
        4,
        4,
        4,
        '2024-01-04',
        '2024-01-04',
        false
    ),
    (
        5,
        5,
        5,
        '2024-01-05',
        '2024-01-05',
        false
    ),
    (
        6,
        6,
        6,
        '2024-01-06',
        '2024-01-06',
        false
    ),
    (
        7,
        7,
        7,
        '2024-01-07',
        '2024-01-07',
        false
    ),
    (
        8,
        8,
        8,
        '2024-01-08',
        '2024-01-08',
        false
    ),
    (
        9,
        9,
        9,
        '2024-01-09',
        '2024-01-09',
        false
    ),
    (
        10,
        10,
        10,
        '2024-01-10',
        '2024-01-10',
        false
    );
-- Inserting values into the "TreatmentDetail" table
INSERT INTO TreatmentDetail (patientID, physicianID, results)
VALUES (
        1,
        1,
        ' Prescribed medication
        and rest '
    ),
    (2, 2, ' Surgery required '),
    (3, 3, ' Physical therapy recommended '),
    (4, 4, ' Prescribed eye drops '),
    (5, 5, ' Scheduled follow - up appointment '),
    (6, 6, ' MRI results reviewed '),
    (7, 7, ' Polyps removed during colonoscopy '),
    (8, 8, ' Routine prenatal care '),
    (9, 9, ' Therapy sessions scheduled '),
    (10, 10, ' Prescribed antibiotics ');
-- Inserting values into the "InchargeDetails" table
INSERT INTO InchargeDetails (
        physicianID,
        wardID,
        dateRemoved,
        isCurrent
    )
VALUES (1, 1, NULL, true),
    (2, 2, NULL, true),
    (3, 3, NULL, true),
    (4, 4, NULL, true),
    (5, 5, NULL, true),
    (6, 6, NULL, true),
    (7, 7, NULL, true),
    (8, 8, NULL, true),
    (9, 9, NULL, true),
    (10, 10, NULL, true);