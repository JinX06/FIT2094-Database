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

-- Constraints for the COMPETITOR table attributes
ALTER TABLE COMPETITOR ADD CONSTRAINT competitor_pk primary key(comp_no);
ALTER TABLE COMPETITOR ADD CONSTRAINT competitor_email_uq UNIQUE(comp_email);
ALTER TABLE COMPETITOR ADD CONSTRAINT competitor_phone_uq UNIQUE(comp_phone);
ALTER TABLE COMPETITOR ADD CONSTRAINT chk_competitor_gender CHECK(comp_gender IN ('M', 'F', 'U'));
ALTER TABLE COMPETITOR ADD CONSTRAINT chk_competitor_unistatus CHECK(comp_unistatus IN ('Y', 'N'));


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

-- Constraints for the ENTRY table attributes
ALTER TABLE ENTRY ADD CONSTRAINT entry_composite_pk PRIMARY KEY(event_id, entry_no);
ALTER TABLE ENTRY ADD CONSTRAINT chk_entry_times CHECK(
    entry_finishtime IS NULL OR
    entry_starttime IS NULL OR
    entry_starttime <= entry_finishtime ); -- make sure start time is before finish time


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

-- Constraints for the TEAM table attributes
ALTER TABLE TEAM ADD CONSTRAINT team_pk PRIMARY KEY(team_id);
ALTER TABLE TEAM ADD CONSTRAINT team_name_carn_date_uq UNIQUE(team_name, carn_date);


-- Add all missing FK Constraints below here
-- Table ENTRY foreign key constraints
ALTER TABLE ENTRY ADD CONSTRAINT entry_event_fk FOREIGN KEY (event_id) REFERENCES EVENT(event_id);
ALTER TABLE ENTRY ADD CONSTRAINT entry_comp_fk FOREIGN KEY (comp_no) REFERENCES COMPETITOR(comp_no);
ALTER TABLE ENTRY ADD CONSTRAINT entry_team_fk FOREIGN KEY (team_id) REFERENCES TEAM(team_id);
ALTER TABLE ENTRY ADD CONSTRAINT entry_charity_fk FOREIGN KEY (char_id) REFERENCES CHARITY(char_id);

-- Table TEAM foreign key constraints
ALTER TABLE TEAM ADD CONSTRAINT team_carnival_fk FOREIGN KEY (carn_date) REFERENCES CARNIVAL(carn_date);
ALTER TABLE TEAM ADD CONSTRAINT team_event_fk FOREIGN KEY (event_id, entry_no) REFERENCES ENTRY(event_id, entry_no);