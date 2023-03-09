set echo on;

-- Monash University Health Institute schema
-- Student Name:  Jason Kreitner
-- Student ID:  27528332
— Add the SQL statements at the space provided below. You need to scroll down.


--  Create Table	: 'ActivityType'
--  ActID	: Activity type ID
--  ActDesc	: Activity type description
CREATE TABLE ActivityType 
    ( 
     ActID NUMBER (4)  NOT NULL , 
     ActDesc VARCHAR2 (50) ,
     CONSTRAINT ActivityType_PK PRIMARY KEY ( ActID ) 
    ) 
;






--  Create Table	: 'Department'
--  DeptNo	: Department Number
--  DeptName	: Department Name
CREATE TABLE Department 
    ( 
     DeptNo NUMBER (3)  NOT NULL , 
     DeptName VARCHAR2 (300) UNIQUE,
     CONSTRAINT Department_PK PRIMARY KEY ( DeptNo )
    ) 
;


--  Create Table	: 'Diary'
--  PlanNo	: Plan number
--  FileEntryLocation: URI location of the file
--  ActID	: Activity ID (references ACTIVITY.ActID)
CREATE TABLE Diary 
    ( 
     MPlanNo NUMBER (4)  NOT NULL , 
     PlanFileLocation VARCHAR2 (200)  NOT NULL , 
     ActID NUMBER (4)  NOT NULL ,
     CONSTRAINT Diary_PK PRIMARY KEY ( MPlanNo )
     ) 
;




--  Create Table	: 'Laboratory'
--  MPlanNo	: Plan number (references PLAN.MPlanNo)
--  LabDate	: Laboratory check up date
--  Weight	: Participant weigth
--  BloodSugar	: Participant blood sugar level
--  HDL	: Participant HDL
--  LDL	: Participant LDL
CREATE TABLE Laboratory 
    ( 
     MPlanNo NUMBER (4)  NOT NULL , 
     LabDate DATE  NOT NULL , 
     LabWeight NUMBER (3,1) , 
     LabBloodSugar NUMBER (2,1) , 
     LabHDL NUMBER (2,1) , 
     LabLDL NUMBER (2,1) ,
     CONSTRAINT Laboratory_PK PRIMARY KEY ( LabDate, MPlanNo )
    ) 
;




--  Create Table	: 'Meeting'
--  MeetingNo	: Meeting number
--  PCaseNo	: Case number
--  MeetingDate	: Meeting date
--  MeetingLocation: Location of meeting
--  MeetingNote	: Meeting note document
--  RProjID	: Project ID (references ASSIGNMENT.RProjID)
--  RescID	: Researcher ID (references ASSIGNMENT.RescID)
CREATE TABLE Meeting 
    ( 
     PCaseNo NUMBER (4)  NOT NULL , 
     MeetingNo NUMBER (4)  NOT NULL , 
     MeetingDate DATE  NOT NULL , 
     MeetingLocation VARCHAR2 (100) , 
     MeetingNote VARCHAR2 (500) , 
     RProjID NUMBER (4) NOT NULL, 
     RescID NUMBER (8) NOT NULL,
     CONSTRAINT Meeting_PK PRIMARY KEY ( MeetingNo, PCaseNo )
    ) 
;


--  Create Table	: 'MeetingPlan'
--  MPlanNo	: Plan number
--  MPlanStartDate	: Plan start date
--  MPlanTitle	: Plan title
--  MPlanDuration	: Plan duration (weeks)
--  MPlanEntry	: Plan entry
--  MeetingNo	: Meeting number (references MEETING.MeetingNo)
--  PCaseNo	: Case number (references MEETING.PCaseNo)
CREATE TABLE MPlan 
    ( 
     MPlanNo NUMBER (4)  NOT NULL , 
     MPlanStartDate DATE  NOT NULL , 
     MPlanTitle VARCHAR2 (200) , 
     MPlanDuration NUMBER (2) , 
     MPlanEntry VARCHAR2 (500) , 
     PCaseNo NUMBER (4) NOT NULL, 
     MeetingNo NUMBER (4) NOT NULL,
     CONSTRAINT MPlan_PK PRIMARY KEY ( MPlanNo )
    ) 
;



--  Create Table	: 'Participant'
--  PartID	: Participant ID
--  PartFirstname	: Participant first name
--  PartSurname	: Participant surname
--  PartStreetNo	: Participant street no (address)
--  PartStreetName: Participant street name (address)
--  PartSuburb	: Participant suburb (address)
--  PartState	: Participant state (address)
--  PartPostcode	: Participant post code (address)
--  PartDOB	: Participant date of birth
--  PartPhone	: Participant phone number
--  PartEmail	: Participant email address
CREATE TABLE Participant 
    ( 
--  A person will have a new participant ID if he/she joins a new project.
     PartID NUMBER (5)  NOT NULL , 
     PartFirstname VARCHAR2 (100) , 
     PartSurname VARCHAR2 (100)  NOT NULL , 
     PartStreetNo VARCHAR2 (10)  NOT NULL , 
     PartStreetName VARCHAR2 (100) , 
     PartSuburb VARCHAR2 (100)  NOT NULL , 
     PartState CHAR (4)  NOT NULL , 
     PartPostcode NUMBER (4)  NOT NULL , 
     PartDOB DATE , 
     PartPhone CHAR (20)  NOT NULL , 
     PartEmail VARCHAR2 (50) ,
     CONSTRAINT Participant_PK PRIMARY KEY ( PartID )
    ) 
;




--  Create Table	: 'Researcher'
--  RescFirstname	: Researcher first name
--  RescSurname	: Researcher Surname
--  RescPosition	: Reseacher Position
--  RescEmail	: Researcher Email
--  DeptNo	: Department Number (references DEPARTMENT.DeptNo)
CREATE TABLE Researcher 
    ( 
     RescID NUMBER (8)  NOT NULL , 
     RescFirstname VARCHAR2 (100) , 
     RescSurname VARCHAR2 (100)  NOT NULL , 
     RescPosition VARCHAR2 (100)  NOT NULL , 
     RescEmail VARCHAR2 (50)  NOT NULL , 
     DeptNo NUMBER (3)  NOT NULL ,
     CONSTRAINT Researcher_PK PRIMARY KEY ( RescID )
    ) 
;

--  Create Table		: 'ResearchGrant'
--  RGrantNo		: Research grant number
--  RGrantName		: Reserach grant name
--  RGrantAmount	: Amount of research grant
--  RGrantStartDate	: Research grant start date
--  RGrantEndDate	: Research grant end date
--  RGrantor		: The organisation that give the research grant
--  RescID		: The researcher who received the grant (references
--  RESEARCHER.RescID)
CREATE TABLE RGrant 
    ( 
     RGrantNo NUMBER (8)  NOT NULL , 
     RGrantName VARCHAR2 (400)  NOT NULL , 
     RGrantAmount NUMBER (11,2)  NOT NULL , 
     RGrantStartDate DATE  NOT NULL , 
     RGrantEndDate DATE , 
     RGrantor VARCHAR2 (200)  NOT NULL , 
     RescID NUMBER (8)  NOT NULL,
     CONSTRAINT RGrant_PK PRIMARY KEY ( RGrantNo )
    ) 
;

-- ===================================================
-- ADD THE MISSING CREATE TABLE STATEMENTS BELOW

-- Create Table   : 'RProject'
-- RProjID    :  Research project number
-- RProjName    :  Research project name
-- RProjEthicsNo    :  Research project ethics number
-- RGrantNo   :  Research grant number (references RGrant.RGrantNo)
CREATE TABLE RProject
    (
    RProjID NUMBER (4) NOT NULL,
    RProjName VARCHAR (400),
    RProjEthicsNo CHAR (20),
    RGrantNo NUMBER (8),
    CONSTRAINT RProj_PK PRIMARY KEY (RProjID)
    )
;

-- Create Table   : 'Assignment'
-- RescID   :  Researcher identification (references Researcher.RescID)
-- RProjID    :  Research project identification (references RProject.RProjID)
-- AssignRole   : Assignment role
-- ManagerID    : Manager identification number
-- ManagerProjID    : Manager project identification
CREATE TABLE Assignment
    (
    RescID NUMBER (8) NOT NULL,
    RProjID NUMBER (4) NOT NULL,
    AssignRole VARCHAR (100),
    ManagerID NUMBER (8),
    ManagerProjID NUMBER (4),
    CONSTRAINT Assign_PK PRIMARY KEY (RescID, RProjID)
    )
;

-- Create Table   : 'PCASE'
-- PCaseNo    : Participant case number
-- PCaseInitHeight    : Participant case initial height
-- PCaseInitWeight    : Participant case initial weight
-- PCaseInitBloodSugar    : Participant case initial blood sugar
-- PCaseInitBP_systol   : Participant case initial systolic blood pressure
-- PCaseInitBP_diastol    : Participant case initial diastolic blood pressure
-- PCaseInitHDL   : Participant case initial HDL
-- PCaseInitLDL   : Participant case initial LDL
-- PartID   : Participant idenfitication (references Participant.PartID)
-- RProjID    : Research project identification (references RProject.RProjID)
CREATE TABLE PCASE 
    (
    PCaseNo NUMBER (4) NOT NULL,
    PCaseInitHeight NUMBER (4,1),
    PCaseInitWeight NUMBER (4,1),
    PCaseInitBloodSugar NUMBER (2,1),
    PCaseInitBP_systol NUMBER (3),
    PCaseInitBP_diastol NUMBER (3),
    PCaseInitHDL NUMBER (2,1),
    PCaseInitLDL NUMBER (2,1),
    PartID NUMBER (5) NOT NULL,
    RProjID NUMBER (4) NOT NULL,
    CONSTRAINT PCASE_PK PRIMARY KEY (PCaseNo)
    )
;


-- ================================================



ALTER TABLE Diary 
    ADD CONSTRAINT Diary_Activity_FK FOREIGN KEY 
    ( ActID ) 
    REFERENCES ActivityType 
    ( ActID ) 
;


ALTER TABLE Diary 
    ADD CONSTRAINT Diary_MPlan_FK FOREIGN KEY 
    ( MPlanNo ) 
    REFERENCES MPlan 
    ( MPlanNo ) 
;


ALTER TABLE Laboratory 
    ADD CONSTRAINT Laboratory_MPlan_FK FOREIGN KEY 
    ( MPlanNo ) 
    REFERENCES MPlan 
    ( MPlanNo ) 
;


ALTER TABLE Meeting 
    ADD CONSTRAINT Meeting_Assignment_FK FOREIGN KEY 
    ( RProjID, RescID ) 
    REFERENCES Assignment 
    ( RProjID, RescID) 
;


ALTER TABLE Meeting 
    ADD CONSTRAINT Meeting_PCase_FK FOREIGN KEY 
    ( PCaseNo ) 
    REFERENCES PCASE
    ( PCaseNo ) 
;


ALTER TABLE MPlan 
    ADD CONSTRAINT MPlan_Meeting_FK FOREIGN KEY 
    ( MeetingNo, PCaseNo ) 
    REFERENCES Meeting 
    ( MeetingNo, PCaseNo ) 
;




ALTER TABLE RGrant 
    ADD CONSTRAINT RGrant_Researcher_FK FOREIGN KEY 
    ( RescID ) 
    REFERENCES Researcher 
    ( RescID ) 
;


ALTER TABLE Researcher 
    ADD CONSTRAINT Researcher_Department_FK FOREIGN KEY 
    ( DeptNo ) 
    REFERENCES Department 
    ( DeptNo ) 
;


-- ===============================================

-- ADD THE MISSING CONSTRAINTS BELOW

ALTER TABLE Assignment
    ADD (CONSTRAINT Assignment_Researcher_FK FOREIGN KEY
    (RescID)
    REFERENCES Researcher
    (RescID),
    CONSTRAINT Assignment_RProject_FK FOREIGN KEY
    (RProjID)
    REFERENCES RProject
    (RProjID))
;


ALTER TABLE PCASE
    ADD (CONSTRAINT PCASE_Participant_FK FOREIGN KEY
    (PartID)
    REFERENCES Participant
    (PartID),
    CONSTRAINT PCASE_RProject_FK FOREIGN KEY
    (RProjID)
    REFERENCES RProject
    (RProjID))
;



ALTER TABLE RProject
    ADD CONSTRAINT RProject_RGrant_FK FOREIGN KEY
    (RGrantNo)
    REFERENCES RGrant
    (RGrantNo)
;


-- END OF SCHEMA

set echo off;
