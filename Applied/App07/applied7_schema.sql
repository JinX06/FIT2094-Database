-- set echo on
-- spool applied7_schema_output.txt
/*
Databases Applied 7
applied7_schema.sql

student id: 34076352
student name: Ong Jin Xiang
last modified date: 15 Apr 2025

*/

-- DDL for Student-Unit-Enrolment model (using ALTER TABLE)
--

--
-- Place DROP commands at head of schema file
--
drop TABLE enrollment PURGE;
drop TABLE student PURGE;
drop TABLE course_unit PURGE;
drop TABLE unit PURGE;
DROP TABLE COURSE PURGE;

-- Create Tables
-- Here using both table and column constraints
--

CREATE TABLE student (
    stu_nbr     NUMBER(8) NOT NULL,
    stu_lname   VARCHAR2(50),
    stu_fname   VARCHAR2(50),
    stu_dob     DATE NOT NULL
);

COMMENT ON COLUMN student.stu_nbr IS
    'Student number';

COMMENT ON COLUMN student.stu_lname IS
    'Student last name';

COMMENT ON COLUMN student.stu_fname IS
    'Student first name';

COMMENT ON COLUMN student.stu_dob IS
    'Student date of birth';

/* Add STUDENT constraints here */
alter TABLE student add constraint student_pk primary key(stu_nbr);
alter TABLE student add constraint chk_stu_nbr check(stu_nbr > 10000000);
/* Add UNIT data types here */
CREATE TABLE unit (
    unit_code  char(7) not NULL,
    unit_name  VARCHAR2(50) not NULL
);

COMMENT ON COLUMN unit.unit_code IS
    'Unit code';

COMMENT ON COLUMN unit.unit_name IS
    'Unit name';

/* Add UNIT constraints here */
alter TABLE unit add constraint unit_pk primary key(unit_code);
alter TABLE unit add constraint un_unit_name unique(unit_name);
/* Add ENROLMENT attributes and data types here */
CREATE TABLE enrolment (
    stu_nbr NUMBER(8) NOT NULL,
    unit_code CHAR(7) NOT NULL,
    enrol_year DATE NOT NULL,
    enrol_semester CHAR(1) NOT NULL,
    enrol_mark NUMBER(3),
    enrol_grade VARCHAR2(2)
);

COMMENT ON COLUMN enrolment.stu_nbr IS
    'Student number';

COMMENT ON COLUMN enrolment.unit_code IS
    'Unit code';

COMMENT ON COLUMN enrolment.enrol_year IS
    'Enrolment year';

COMMENT ON COLUMN enrolment.enrol_semester IS
    'Enrolment semester';

COMMENT ON COLUMN enrolment.enrol_mark IS
    'Enrolment mark (real)';

COMMENT ON COLUMN enrolment.enrol_grade IS
    'Enrolment grade (letter)';

/* Add ENROLMENT constraints here */
ALTER TABLE enrolment add CONSTRAINT enrol_composite PRIMARY key(stu_nbr, unit_code, enrol_year, enrol_semester);

ALTER TABLE enrolment add CONSTRAINT enrol_stu_fk FOREIGN KEY (stu_nbr) REFERENCES student(stu_nbr);
ALTER TABLE enrolment add CONSTRAINT enrol_unit_fk FOREIGN KEY (unit_code) REFERENCES unit(unit_code);

ALTER TABLE enrolment add CONSTRAINT chk_enrol_sem CHECK(enrol_semester in ('1', '2', '3'));

spool off
set echo off