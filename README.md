# EasyDrive School of Motoring — Relational Database Design (3NF)

**Tech:** MySQL · SQL Workbench · ER Diagrams · Google Sheets

This project was developed to design and implement a relational database for the fictitious EasyDrive School of Motoring, a multi-location driving school. While I collaborated with other students, I contributed significantly to each stage of the project — from requirements analysis and ER diagram creation to normalization, SQL implementation, and query development.

---

## Project Overview
The goal was to create a database system to manage the operations of multiple offices, instructors, vehicles, clients, lessons, and tests. The design process followed these steps:

1. **Requirements Analysis** – Extracted key entities and relationships from the provided project brief.
2. **ER Diagram** – Designed a clear entity-relationship diagram mapping offices, staff, clients, cars, lessons, interviews, and tests.
3. **Normalization** – Converted the conceptual model to a logical schema and normalized all tables to **Third Normal Form (3NF)**.
4. **Implementation** – Created tables in MySQL with appropriate data types, primary keys, and foreign key constraints.
5. **Sample Data** – Populated each table with at least 10 realistic sample rows for testing.
6. **SQL Queries** – Wrote 15+ queries to answer practical business questions, including joins, aggregates, grouping, and date logic.

---

## My Contributions
While this was a team project, I personally:
- Led the **ER Diagram** design and ensured relationships matched the business rules.
- Performed the **full normalization process** to 3NF and documented it.
- Created several key tables in MySQL with correct constraints and indexes.
- Wrote a majority of the **SQL queries** for reporting and operational analysis.
- Validated the database with sample data and cross-checked query outputs.

---

## Repository Structure

ER Diagram.pdf # Entity Relationship Diagram
Normalization.pdf # Full normalization documentation
queries.sql # Schema creation script, data insertion statements, SQL queries for analysis
README.md

---

## Example Queries
Some of the SQL queries included:
- Names and phone numbers of managers for each office
- Full addresses of all offices in Glasgow
- Female instructors in the Glasgow – Bearsden office
- Total number of staff per office
- Timetable for an instructor for the upcoming week
- Clients who passed the driving test in January 2013
- Average miles driven during a one-hour lesson

Full query list is in [`queries.sql`](queries.sql).

---

## ER Diagram
<p align="center">
  <img src="ER Diagram.pdf" alt="EasyDrive ER Diagram" width="720">
</p>

---

## Normalization
All tables were checked for:
- **1NF** – Atomic attributes and primary keys defined
- **2NF** – No partial dependencies on composite keys
- **3NF** – No transitive dependencies between non-key attributes

The full normalization process is documented in [`Normalization.pdf`](Normalization.pdf).

---

📄 License

This repository is for personal portfolio and educational purposes only. Not licensed for commercial use.


---

