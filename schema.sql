CREATE TABLE Officers (
    officer_id SERIAL PRIMARY KEY,
    officer_name VARCHAR(100) NOT NULL,
    rank VARCHAR(50),
    department VARCHAR(100),
    contact_number VARCHAR(15)
);

CREATE TABLE Cases (
    case_id SERIAL PRIMARY KEY,
    case_title VARCHAR(150) NOT NULL,
    crime_type VARCHAR(100),
    crime_location VARCHAR(150),
    date_reported DATE,
    status VARCHAR(50)
);

CREATE TABLE Suspects (
    suspect_id SERIAL PRIMARY KEY,
    suspect_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    address TEXT
);

CREATE TABLE Evidence (
    evidence_id SERIAL PRIMARY KEY,
    case_id INT REFERENCES Cases(case_id),
    evidence_type VARCHAR(100),
    description TEXT,
    collected_date DATE
);

CREATE TABLE Witnesses (
    witness_id SERIAL PRIMARY KEY,
    witness_name VARCHAR(100),
    contact_number VARCHAR(15),
    statement TEXT
);

CREATE TABLE Case_Assignments (
    assignment_id SERIAL PRIMARY KEY,
    case_id INT REFERENCES Cases(case_id),
    officer_id INT REFERENCES Officers(officer_id),
    assigned_date DATE
);
INSERT INTO Officers (officer_name, rank, department, contact_number)
VALUES
('Rajesh Kumar','Inspector','Crime Branch','9876543210'),
('Priya Sharma','Sub Inspector','Cyber Cell','9876543211'),
('Amit Das','Inspector','Homicide','9876543212');

INSERT INTO Cases (case_title, crime_type, crime_location, date_reported, status)
VALUES
('Bank Robbery','Robbery','Bhubaneswar','2026-06-01','Open'),
('Online Fraud','Cyber Crime','Cuttack','2026-06-03','Under Investigation'),
('Missing Person','Missing','Puri','2026-06-05','Closed');

INSERT INTO Suspects (suspect_name, age, gender, address)
VALUES
('Rohan Singh',30,'Male','Bhubaneswar'),
('Vikas Patel',28,'Male','Cuttack'),
('Anjali Das',25,'Female','Puri');

INSERT INTO Evidence (case_id, evidence_type, description, collected_date)
VALUES
(1,'Fingerprint','Fingerprint from locker','2026-06-02'),
(2,'Laptop','Seized suspect laptop','2026-06-04'),
(3,'CCTV Footage','Market camera footage','2026-06-06');

INSERT INTO Witnesses (witness_name, contact_number, statement)
VALUES
('Bidyadhar Jena','7328884405','Saw two suspects leaving the bank'),
('Meena Rout','9234567890','Received suspicious calls'),
('Kiran Mohanty','9345678901','Last saw the missing person');

INSERT INTO Case_Assignments (case_id, officer_id, assigned_date)
VALUES
(1,1,'2026-06-01'),
(2,2,'2026-06-03'),
(3,3,'2026-06-05');
SELECT * FROM Officers;
SELECT * FROM Cases;
SELECT * FROM Suspects;
SELECT * FROM Evidence;
SELECT * FROM Witnesses;
SELECT * FROM Case_Assignments;
SELECT c.case_title,
       c.status,
       o.officer_name,
       o.department
FROM Cases c
JOIN Case_Assignments ca
ON c.case_id = ca.case_id
JOIN Officers o
ON ca.officer_id = o.officer_id;
SELECT c.case_title,
       e.evidence_type,
       e.description
FROM Cases c
JOIN Evidence e
ON c.case_id = e.case_id;
SELECT o.officer_name,
       COUNT(ca.case_id) AS total_cases
FROM Officers o
LEFT JOIN Case_Assignments ca
ON o.officer_id = ca.officer_id
GROUP BY o.officer_name
ORDER BY total_cases DESC;
SELECT status,
       COUNT(*) AS total_cases
FROM Cases
GROUP BY status;
CREATE VIEW Investigation_Report AS
SELECT c.case_title,
       c.status,
       o.officer_name,
       o.department
FROM Cases c
JOIN Case_Assignments ca
ON c.case_id = ca.case_id
JOIN Officers o
ON ca.officer_id = o.officer_id;
SELECT * FROM Investigation_Report;
CREATE INDEX idx_case_status
ON Cases(status);

CREATE INDEX idx_assignment_officer
ON Case_Assignments(officer_id);

CREATE INDEX idx_evidence_case
ON Evidence(case_id);
