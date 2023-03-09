set echo on;

-- Monash University Health Institute
-- health_delete.sql

-- Student Name: Jason Kreitner
-- Student ID: 27528332

-- Add your SQL statements below

SELECT * FROM Participant;

SELECT * FROM PCASE;

ALTER TABLE PCASE
    DROP CONSTRAINT PCASE_Participant_FK;
    
ALTER TABLE PCASE
    ADD CONSTRAINT PCASE_Part_CASC_FK FOREIGN KEY (PartID)
    REFERENCES Participant (PartID)
    ON DELETE CASCADE;
    
-- Mitchel Parker ceases participating in any Health Institute Projects.

DELETE FROM Participant
    WHERE Participant.PartID = 12225;
    
SELECT * from Participant;

SELECT * from PCASE;



set echo off;
