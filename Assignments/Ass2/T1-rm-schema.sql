/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T1-rm-schema.sql

--Student ID: 34076352
--Student Name: Ong Jin Xiang

/* Comments for your marker:




*/

/* drop table statements - do not remove*/

DROP TABLE competitor CASCADE CONSTRAINTS PURGE;

DROP TABLE entry CASCADE CONSTRAINTS PURGE;

DROP TABLE team CASCADE CONSTRAINTS PURGE;

/* end of drop table statements*/

-- Task 1 Add Create table statements for the Missing TABLES below.
-- Ensure all column comments, and constraints (other than FK's)are included.
-- FK constraints are to be added at the end of this script

-- COMPETITOR
CREATE TABLE COMPETITOR (
    comp_no NUMBER(5) NOT NULL,
    comp_fname VARCHAR2(30),
    comp_lname VARCHAR2(30),
    comp_gender CHAR(1) NOT NULL,
    comp_dob DATE NOT NULL,
    comp_email VARCHAR2(50) NOT NULL,
    comp_unistatus CHAR(1) NOT NULL,
    comp_phone CHAR(10) NOT NULL
);


--ENTRY
CREATE TABLE ENTRY (
    event_id NUMBER(6) NOT NULL,
    entry_no NUMBER(5) NOT NULL,
    entry_starttime DATE,
    entry_finishtime DATE,
    entry_elapsedtime DATE,
    comp_no NUMBER(5) NOT NULL,
    team_id NUMBER(3),
    char_id NUMBER(3)
);


--TEAM
CREATE TABLE TEAM (
    team_id NUMBER(3) NOT NULL,
    team_name VARCHAR2(30) NOT NULL,
    carn_date DATE NOT NULL,
    event_id NUMBER(6) NOT NULL,
    entry_no NUMBER(5) NOT NULL
);


-- Add all missing FK Constraints below here
