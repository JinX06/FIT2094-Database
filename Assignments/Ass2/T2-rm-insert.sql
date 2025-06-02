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


