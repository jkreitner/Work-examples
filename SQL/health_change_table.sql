set echo on;

-- Monash University Health Institute
-- health_change_table.sql
-- Student ID: 27528332
-- Student Name: Jason Kreitner

-- Add your code below

ALTER TABLE RProject
    ADD (RProjStartDate DATE);
    
ALTER TABLE RProject
    ADD (RProjEndDate DATE);
    
UPDATE RProject
    SET RProjStartDate = '15-JAN-2015'
    WHERE RProject.RGrantNo = 15010001;
    
UPDATE RProject
    SET RProjStartDate = '01-JUN-2015'
    WHERE RProject.RGrantNo = 15060001;
    
UPDATE RProject
    SET RProjStartDate = '16-SEP-2013'
    WHERE RProject.RGrantNo = 13070001;

UPDATE RProject
    SET RProjEndDate = '31-MAR-2016'
    WHERE RProjID = 25;
    
UPDATE RProject
    SET RProjEndDate = '26-FEB-2016'
    WHERE RProjID = 21;


set echo off;