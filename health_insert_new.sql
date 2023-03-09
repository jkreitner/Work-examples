set echo on;

-- Monash University Health Institute Project 
-- Add new participants

-- Student Name:  Jason Kreitner
-- Student ID:  27528332

-- Add the SQL statements below

INSERT INTO Participant 
    VALUES (PartID_SEQ.NEXTVAL,'SAJIV','DASH','21','Jump Street','Durka','Durr',
    '3109',to_date('1986-09-28','yyyy-mm-dd'),'0383447098',
    'sajiv.dash@21jumpstreet.com.au');

INSERT INTO PCASE
    VALUES (PCASENo_SEQ.NEXTVAL,176,98,4.2,120,80,1,2,PartID_SEQ.CURRVAL,
    (SELECT RProjID from RProject WHERE RProjName LIKE 'Meditation%'));
    
INSERT INTO PCASE
    VALUES (PCASENo_SEQ.NEXTVAL,165,87,2.3,110,70,2.1,3.0,(SELECT PartID FROM Participant WHERE Participant.PartDOB = '02-OCT-1974' AND Participant.PARTSURNAME = 'ROSSITER'),(SELECT RProjID FROM RProject WHERE RProjName LIKE 'Meditation%')); 

COMMIT; 

set echo off;

