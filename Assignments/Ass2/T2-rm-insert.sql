/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-rm-insert.sql

--Student ID: 34076352
--Student Name: Ong Jin Xiang

/* Comments for your marker:

I ackowledge the use of ChatGPT (https://chat.openai.com/) to generate the sample test data as permitted by this assignment. The output was modified to fit the requirements of the assignment.

*/

-- Task 2 Load the COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- ============================================================================================================================================
-- COMPETITOR 15 rows, 7 Monash Student/Staff, 8 Non-Monash Student/Staff
-- ============================================================================================================================================
INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (1, 'Alice', 'Wong', 'F', TO_DATE('15/MAR/2000','DD/MON/YYYY'), 'alice.wong@monash.edu', 'Y', '0400000001');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (2, 'Bob', 'Smith', 'M', TO_DATE('20/JUL/1999','DD/MON/YYYY'), 'bob.smith@monash.edu', 'Y', '0400000002');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (3, 'Carol', 'Johnson', 'F', TO_DATE('05/MAY/1998','DD/MON/YYYY'), 'carol.johnson@monash.edu', 'Y', '0400000003');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (4, 'David', 'Brown', 'M', TO_DATE('12/JAN/1997','DD/MON/YYYY'), 'david.brown@monash.edu', 'Y', '0400000004');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (5, 'Emily', 'Davis', 'F', TO_DATE('30/SEP/2001','DD/MON/YYYY'), 'emily.davis@monash.edu', 'Y', '0400000005');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (6, 'Frank', 'Wilson', 'M', TO_DATE('22/JUN/1985','DD/MON/YYYY'), 'frank.wilson@gmail.com', 'N', '0400000006');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (7, 'Grace', 'Lee', 'F', TO_DATE('18/NOV/1990','DD/MON/YYYY'), 'grace.lee@yahoo.com', 'N', '0400000007');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (8, 'Henry', 'Clark', 'M', TO_DATE('07/FEB/1988','DD/MON/YYYY'), 'henry.clark@hotmail.com', 'N', '0400000008');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (9, 'Ivy', 'Martinez', 'F', TO_DATE('25/DEC/1992','DD/MON/YYYY'), 'ivy.martinez@gmail.com', 'N', '0400000009');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (10, 'Jack', 'Taylor', 'M', TO_DATE('11/APR/1995','DD/MON/YYYY'), 'jack.taylor@outlook.com', 'N', '0400000010');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (11, 'Karen', 'Anderson', 'F', TO_DATE('14/JUN/1978','DD/MON/YYYY'), 'karen.anderson@example.com', 'N', '0400000011');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (12, 'Liam', 'Scott', 'M', TO_DATE('02/AUG/1983','DD/MON/YYYY'), 'liam.scott@example.com', 'N', '0400000012');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (13, 'Mia', 'Turner', 'F', TO_DATE('09/OCT/1999','DD/MON/YYYY'), 'mia.turner@monash.edu', 'Y', '0400000013');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (14, 'Noah', 'Phillips', 'M', TO_DATE('05/JAN/2002','DD/MON/YYYY'), 'noah.phillips@gmail.com', 'N', '0400000014');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (15, 'Olivia', 'Bennett', 'F', TO_DATE('21/MAY/2003','DD/MON/YYYY'), 'olivia.bennett@monash.edu', 'Y', '0400000015');


-- ============================================================================================================================================
-- ENTRY 
-- The first 5 entries ("team leaders") are inserted with NULL team_id first to satisfy the FK (event_id,entry_no) reference when creating the TEAM rows. and their team_ids will be updated later.
-- The other entries will be inserted after the TEAM rows are created.
-- ============================================================================================================================================

/* 
A direct update statement on unit table will return error "integrity constraint (AAA.STUDENT_ENROLMENT_FK) violated - child record found".
Thus, you need to use the ALTER TABLE statement to disable the FOREIGN KEY constraint first and then enable it back. 

From applied 8 DML Solution
*/
ALTER TABLE entry DISABLE CONSTRAINT entry_team_fk;

-- Entry for "Speed Demons" team for Event 2
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (2,1,TO_DATE('08:31:00','hh24:mi:ss'),TO_DATE('09:25:00','hh24:mi:ss'), TO_DATE('00:54:00','hh24:mi:ss'),1,1,1);

-- Entry for "Flying Foxes" team for Event 4
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (4,1,TO_DATE('08:31:00','hh24:mi:ss'),TO_DATE('09:20:00','hh24:mi:ss'), TO_DATE('00:49:00','hh24:mi:ss'),4,2,2);       

-- Entry for "Speed Demons" team for Event 8 ("At least one team name used in two different carnivals")
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (8,1,TO_DATE('08:01:00','hh24:mi:ss'),TO_DATE('09:00:00','hh24:mi:ss'), TO_DATE('00:59:00','hh24:mi:ss'),1,3,1);

-- Entry for "Trail Blazers" team for Event 7
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (7,1,TO_DATE('08:30:00','hh24:mi:ss'),TO_DATE('09:05:00','hh24:mi:ss'), TO_DATE('00:35:00','hh24:mi:ss'),7,4,3);

-- Entry for "Night Owls" team for Event 12
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (12,1,TO_DATE('08:45:00','hh24:mi:ss'),TO_DATE('09:25:00','hh24:mi:ss'), TO_DATE('00:40:00','hh24:mi:ss'),9,5,2);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (2,2,TO_DATE('08:32:00','hh24:mi:ss'),TO_DATE('09:30:00','hh24:mi:ss'), TO_DATE('00:58:00','hh24:mi:ss'),2,1,2);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (2,3,TO_DATE('08:33:00','hh24:mi:ss'),TO_DATE('09:45:00','hh24:mi:ss'), TO_DATE('01:12:00','hh24:mi:ss'),3,1,3);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (2,4,TO_DATE('08:35:00','hh24:mi:ss'),TO_DATE('09:50:00','hh24:mi:ss'), TO_DATE('01:15:00','hh24:mi:ss'),6,NULL,4);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (2,5,TO_DATE('08:34:00','hh24:mi:ss'),TO_DATE('09:46:00','hh24:mi:ss'), TO_DATE('01:12:00','hh24:mi:ss'),7,NULL,NULL);



INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (4,2,TO_DATE('08:31:00','hh24:mi:ss'),TO_DATE('09:28:00','hh24:mi:ss'), TO_DATE('00:57:00','hh24:mi:ss'),5,2,3);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (4,3,TO_DATE('08:33:00','hh24:mi:ss'),TO_DATE('09:32:00','hh24:mi:ss'), TO_DATE('00:59:00','hh24:mi:ss'),6,2,NULL);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (4,4,TO_DATE('08:36:00','hh24:mi:ss'),TO_DATE('09:40:00','hh24:mi:ss'), TO_DATE('01:04:00','hh24:mi:ss'),8,NULL,1);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (4,5,TO_DATE('08:37:00','hh24:mi:ss'),TO_DATE('09:55:00','hh24:mi:ss'), TO_DATE('01:18:00','hh24:mi:ss'),9,NULL,NULL);


INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (5,1,TO_DATE('08:00:00','hh24:mi:ss'),TO_DATE('09:45:00','hh24:mi:ss'), TO_DATE('01:45:00','hh24:mi:ss'),1,NULL,1);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (5,2,TO_DATE('08:00:00','hh24:mi:ss'),TO_DATE('09:50:00','hh24:mi:ss'), TO_DATE('01:50:00','hh24:mi:ss'),2,NULL,2);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (5,3,TO_DATE('08:01:00','hh24:mi:ss'),TO_DATE('10:05:00','hh24:mi:ss'), TO_DATE('02:04:00','hh24:mi:ss'),10,NULL,3);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (5,4,TO_DATE('08:02:00','hh24:mi:ss'),TO_DATE('10:10:00','hh24:mi:ss'), TO_DATE('02:08:00','hh24:mi:ss'),11,NULL,NULL);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (5,5,TO_DATE('08:03:00','hh24:mi:ss'),TO_DATE('10:20:00','hh24:mi:ss'), TO_DATE('02:17:00','hh24:mi:ss'),12,NULL,4);


INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (7,2,TO_DATE('08:31:00','hh24:mi:ss'),TO_DATE('09:05:00','hh24:mi:ss'), TO_DATE('00:34:00','hh24:mi:ss'),8,4,1);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (7,3,TO_DATE('08:32:00','hh24:mi:ss'),TO_DATE('09:10:00','hh24:mi:ss'), TO_DATE('00:38:00','hh24:mi:ss'),3,NULL,4);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (7,4,TO_DATE('08:35:00','hh24:mi:ss'),TO_DATE('09:12:00','hh24:mi:ss'), TO_DATE('00:37:00','hh24:mi:ss'),4,NULL,2);


INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (8,2,TO_DATE('08:02:00','hh24:mi:ss'),TO_DATE('09:10:00','hh24:mi:ss'), TO_DATE('01:08:00','hh24:mi:ss'),2,3,2);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (8,3,TO_DATE('08:05:00','hh24:mi:ss'),TO_DATE('09:20:00','hh24:mi:ss'), TO_DATE('01:15:00','hh24:mi:ss'),5,NULL,3);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (8,4,TO_DATE('08:04:00','hh24:mi:ss'),TO_DATE('09:30:00','hh24:mi:ss'), TO_DATE('01:26:00','hh24:mi:ss'),6,NULL,NULL);


INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (12,2,TO_DATE('08:46:00','hh24:mi:ss'),TO_DATE('09:30:00','hh24:mi:ss'), TO_DATE('00:44:00','hh24:mi:ss'),10,5,1);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (12,3,TO_DATE('08:47:00','hh24:mi:ss'),TO_DATE('09:40:00','hh24:mi:ss'), TO_DATE('00:53:00','hh24:mi:ss'),11,5,2);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (12,4,TO_DATE('08:48:00','hh24:mi:ss'),TO_DATE('09:36:00','hh24:mi:ss'), TO_DATE('00:48:00','hh24:mi:ss'),12,5,3);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (12,5,TO_DATE('08:49:00','hh24:mi:ss'),TO_DATE('09:50:00','hh24:mi:ss'), TO_DATE('01:01:00','hh24:mi:ss'),13,NULL,4);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (12,6,NULL,NULL,NULL,14,NULL,NULL); -- registration only


INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (13,1,TO_DATE('08:30:00','hh24:mi:ss'),TO_DATE('09:35:00','hh24:mi:ss'), TO_DATE('01:05:00','hh24:mi:ss'),15,NULL,1);

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (13,2,NULL,NULL,NULL,3,NULL,NULL); -- registration only 

INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES (13,3,TO_DATE('08:31:00','hh24:mi:ss'),TO_DATE('09:45:00','hh24:mi:ss'), TO_DATE('01:14:00','hh24:mi:ss'),4,NULL,3);

-- ============================================================================================================================================
-- TEAM 
-- ============================================================================================================================================
INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES (1,'Speed Demons', TO_DATE('22/SEP/2024','DD/MON/YYYY'), 2,1);

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES (2,'Flying Foxes', TO_DATE('05/OCT/2024','DD/MON/YYYY'), 4,1);

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES (3,'Speed Demons', TO_DATE('02/FEB/2025','DD/MON/YYYY'), 8,1); -- team name reused

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES (4,'Trail Blazers', TO_DATE('02/FEB/2025','DD/MON/YYYY'), 7,1);

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES (5,'Night Owls', TO_DATE('29/JUN/2025','DD/MON/YYYY'),12,1);

ALTER TABLE entry ENABLE VALIDATE CONSTRAINT entry_team_fk;

COMMIT;