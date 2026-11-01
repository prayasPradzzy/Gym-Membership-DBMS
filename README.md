# Gym Membership Management System

DBMS Mini Project | KIET Group of Institutions | Academic Year 2026–27

## About

A MySQL database that stores gym members, their membership plans and their attendance records. It uses three related tables with primary keys and foreign keys, and SQL queries to get information from them.

## Tables

| Table | Primary Key | Foreign Key |
|---|---|---|
| MEMBER | Member_ID | — |
| MEMBERSHIP | Membership_ID | Member_ID → MEMBER |
| ATTENDANCE | Attendance_ID | Member_ID → MEMBER |

- MEMBER – MEMBERSHIP: one-to-one (each member has one membership)
- MEMBER – ATTENDANCE: one-to-many (a member can have many attendance records)

## Folder structure

```
sql/gym_membership.sql   full script: database, tables, data and queries
erd/gym_erd.png          ER diagram
screenshots/             MySQL Workbench output screenshots
report/                  project report (Word)
```

## How to run

1. Open MySQL Workbench (MySQL 8.0).
2. Open `sql/gym_membership.sql`.
3. Run the whole script. It creates `gym_membership_db`, the three tables, the sample data and runs all the queries.

## Queries included

1. Members with a Gold membership
2. JOIN of all three tables
3. Attendance count per member
4. Total membership revenue
5. Members with more than one visit
6. Memberships sorted by fee

## Results

- Total members: 5
- Total membership records: 5
- Total attendance records: 7
- Total membership revenue: ₹45,500
- Members with more than one visit: Rahul Sharma and Priya Singh
