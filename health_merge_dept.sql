set echo on;

-- Monash Unievrsity Health Institute Project
-- Department Merging

-- Student Name: Jason Kreitner
-- Student ID: 27528332

-- Add SQL statements to implement the merging of department 

INSERT INTO Department
    VALUES (555,'HEALTH SCIENCES');

UPDATE Researcher
    SET Researcher.DeptNo = 555
    WHERE Researcher.DeptNo IN (SELECT DeptNo FROM Department WHERE DeptName IN ('CLINICAL SCIENCES','BIOMEDICAL SCIENCES'));

DELETE FROM Department
    WHERE DeptNo IN (SELECT DeptNo FROM Department WHERE DeptName IN ('CLINICAL SCIENCES','BIOMEDICAL SCIENCES'));

set echo off;