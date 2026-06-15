## Crime Record & Investigation Database

## Overview

The Crime Record & Investigation Database is a PostgreSQL-based project designed to manage and analyze criminal investigation data efficiently. The system stores information related to crime cases, investigating officers, suspects, evidence, witnesses, and case assignments. It demonstrates the practical application of relational database concepts and SQL in building a real-world investigation management system.

---

## Features

- Crime case registration and management
- Officer information management
- Suspect record maintenance
- Evidence tracking
- Witness information storage
- Case assignment to officers
- Investigation reporting
- Officer workload analysis
- Solved and unsolved case analytics
- Views for simplified reporting
- Triggers for data validation
- Indexes for query optimization

---

## Database Tables

## Officers

Stores information about investigating officers.

- officer_id
- officer_name
- rank
- department
- contact_number

## Cases

Stores details of reported crime cases.

- case_id
- case_title
- crime_type
- crime_location
- date_reported
- status

## Suspects

Stores suspect details.

- suspect_id
- suspect_name
- age
- gender
- address

## Evidence

Maintains records of evidence collected during investigations.

- evidence_id
- case_id
- evidence_type
- description
- collected_date

## Witnesses

Stores witness information and statements.

- witness_id
- witness_name
- contact_number
- statement

## Case_Assignments

Tracks the assignment of officers to cases.

- assignment_id
- case_id
- officer_id
- assigned_date

---

## Technologies Used

- PostgreSQL
- SQL
- OneCompiler PostgreSQL / pgAdmin
- GitHub
- Visual Studio Code

---

## How to Run

1. Open PostgreSQL using pgAdmin or an online PostgreSQL compiler.
2. Execute the SQL code from the "crime_record_investigation.sql" file.
3. Run the CREATE TABLE statements.
4. Insert the sample data.
5. Execute the SELECT and analytical queries.
6. Verify the outputs and reports.

---

## Analytics Implemented

- Officer workload analysis
- Cases assigned to officers
- Evidence tracking by case
- Solved versus unsolved case statistics
- Investigation reports using SQL views

---

## Learning Outcomes

Through this project, I gained practical experience in:

- Relational database design
- Primary and foreign key implementation
- Writing SQL queries
- Performing JOIN operations
- Using aggregate functions
- Creating views
- Implementing triggers
- Optimizing queries using indexes
- Building real-world database applications

---

## Future Enhancements

- Crime trend analysis dashboards
- Region-wise crime reporting
- Chain of custody tracking for evidence
- Role-based access control
- Web application integration
- Real-time reporting features

---

## Author

Bidyadhar Jena
