-- ==========================================
-- GYM MEMBERSHIP MANAGEMENT SYSTEM
-- DBMS MINI PROJECT
-- MySQL 8.0
-- ==========================================

CREATE DATABASE IF NOT EXISTS gym_membership_db;

USE gym_membership_db;

-- 1. Remove old tables if recreating the project
DROP TABLE IF EXISTS ATTENDANCE;
DROP TABLE IF EXISTS MEMBERSHIP;
DROP TABLE IF EXISTS MEMBER;

-- 2. Create MEMBER table
CREATE TABLE MEMBER (
    Member_ID INT PRIMARY KEY,
    Name VARCHAR(30),
    Phone VARCHAR(15),
    Email VARCHAR(50)
);

-- 3. Create MEMBERSHIP table
CREATE TABLE MEMBERSHIP (
    Membership_ID INT PRIMARY KEY,
    Plan_Name VARCHAR(20),
    Duration INT,
    Fee DECIMAL(10,2),
    Member_ID INT UNIQUE NOT NULL,
    FOREIGN KEY (Member_ID)
        REFERENCES MEMBER(Member_ID)
);

-- 4. Create ATTENDANCE table
CREATE TABLE ATTENDANCE (
    Attendance_ID INT PRIMARY KEY,
    Attendance_Date DATE,
    Check_In_Time TIME,
    Check_Out_Time TIME,
    Member_ID INT,
    FOREIGN KEY (Member_ID)
        REFERENCES MEMBER(Member_ID)
);

-- 5. Insert members
INSERT INTO MEMBER VALUES
(101, 'Rahul Sharma', '9876543210', 'rahul@gmail.com'),
(102, 'Aman Verma', '9876543211', 'aman@gmail.com'),
(103, 'Priya Singh', '9876543212', 'priya@gmail.com'),
(104, 'Arjun Gupta', '9876543213', 'arjun@gmail.com'),
(105, 'Sneha Sharma', '9876543214', 'sneha@gmail.com');

-- 6. Insert memberships
INSERT INTO MEMBERSHIP VALUES
(201, 'Gold', 12, 12000, 101),
(202, 'Silver', 6, 6000, 102),
(203, 'Platinum', 12, 18000, 103),
(204, 'Gold', 3, 3500, 104),
(205, 'Silver', 6, 6000, 105);

-- 7. Insert attendance
INSERT INTO ATTENDANCE VALUES
(301, '2026-11-01', '06:00:00', '07:30:00', 101),
(302, '2026-11-02', '06:15:00', '07:45:00', 101),
(303, '2026-11-01', '07:00:00', '08:00:00', 102),
(304, '2026-11-01', '17:30:00', '19:00:00', 103),
(305, '2026-11-02', '06:30:00', '08:00:00', 103),
(306, '2026-11-01', '08:00:00', '09:00:00', 104),
(307, '2026-11-02', '07:00:00', '08:30:00', 105);

-- 8. Verify records
SELECT * FROM MEMBER;
SELECT * FROM MEMBERSHIP;
SELECT * FROM ATTENDANCE;

-- 9. Gold membership query
SELECT *
FROM MEMBERSHIP
WHERE Plan_Name = 'Gold';

-- 10. Join all three tables
SELECT
    M.Member_ID,
    M.Name,
    MS.Plan_Name,
    MS.Fee,
    A.Attendance_Date,
    A.Check_In_Time,
    A.Check_Out_Time
FROM MEMBER M
JOIN MEMBERSHIP MS
    ON M.Member_ID = MS.Member_ID
JOIN ATTENDANCE A
    ON M.Member_ID = A.Member_ID;

-- 11. Count attendance per member
SELECT
    M.Name,
    COUNT(A.Attendance_ID) AS Total_Attendance
FROM MEMBER M
LEFT JOIN ATTENDANCE A
    ON M.Member_ID = A.Member_ID
GROUP BY M.Member_ID, M.Name;

-- 12. Calculate total revenue
SELECT SUM(Fee) AS Total_Revenue
FROM MEMBERSHIP;

-- 13. Find members with more than one visit
SELECT
    M.Name,
    COUNT(A.Attendance_ID) AS Visits
FROM MEMBER M
JOIN ATTENDANCE A
    ON M.Member_ID = A.Member_ID
GROUP BY M.Member_ID, M.Name
HAVING COUNT(A.Attendance_ID) > 1;

-- 14. Sort memberships by fee
SELECT *
FROM MEMBERSHIP
ORDER BY Fee DESC;

COMMIT;