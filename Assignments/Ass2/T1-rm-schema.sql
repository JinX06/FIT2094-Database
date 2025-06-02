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

-- Comments for the COMPETITOR table attributes
COMMENT ON COLUMN COMPETITOR.comp_no IS
    'Unique identifier for the competitor';

COMMENT ON COLUMN COMPETITOR.comp_fname IS
    'Competitor first name (optional)';

COMMENT ON COLUMN COMPETITOR.comp_lname IS
    'Competitor last name (optional)';

COMMENT ON COLUMN COMPETITOR.comp_gender IS
    'Competitor gender (M/F/U)';

COMMENT ON COLUMN COMPETITOR.comp_dob IS
    'Competitor date of birth';

COMMENT ON COLUMN COMPETITOR.comp_email IS
    'Competitor email address (unique)';

COMMENT ON COLUMN COMPETITOR.comp_unistatus IS
    'Competitor university student/staff status (Y/N)';

COMMENT ON COLUMN COMPETITOR.comp_phone IS
    'Competitor phone number (unique)';




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

-- Comments for the ENTRY table attributes
COMMENT ON COLUMN ENTRY.event_id IS
    'Event identifier';

COMMENT ON COLUMN ENTRY.entry_no IS
    'Entry number (Unique to each event)';

COMMENT ON COLUMN ENTRY.entry_starttime IS
    'Start time of the entrant (hh24:mi:ss)';

COMMENT ON COLUMN ENTRY.entry_finishtime IS
    'Finish time of the entrant (hh24:mi:ss)';

COMMENT ON COLUMN ENTRY.entry_elapsedtime IS
    'Elapsed time of the entrant (hh24:mi:ss)';

COMMENT ON COLUMN ENTRY.comp_no IS
    'Competitor number';

COMMENT ON COLUMN ENTRY.team_id IS
    'Team identifier if the entrant is in a team';

COMMENT ON COLUMN ENTRY.char_id IS
    'Charity identifier of this entry';




--TEAM
CREATE TABLE TEAM (
    team_id NUMBER(3) NOT NULL,
    team_name VARCHAR2(30) NOT NULL,
    carn_date DATE NOT NULL,
    event_id NUMBER(6) NOT NULL,
    entry_no NUMBER(5) NOT NULL
);

-- Comments for the TEAM table attributes
COMMENT ON COLUMN TEAM.team_id IS
    'Unique identifier for the team';

COMMENT ON COLUMN TEAM.team_name IS
    'Team name (unique)';

COMMENT ON COLUMN TEAM.carn_date IS
    'Date of carnival in which the team is participating';

COMMENT ON COLUMN TEAM.event_id IS
    'Event identifier of the event the team is participating in';

COMMENT ON COLUMN TEAM.entry_no IS
    'Entry number of the team in the event';




-- Add all missing FK Constraints below here
