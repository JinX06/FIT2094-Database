
ALTER TABLE unit ADD unit_creditpoint NUMBER(2) DEFAULT 6 NOT NULL;
ALTER TABLE unit ADD CONSTRAINT chk_unit_cp CHECK(unit_creditpoint in ('3', '6', '12'))
COMMENT ON COLUMN unit.unit_creditpoint IS 'Unit Credit Points';

-- ALTER TABLE UNIT
CREATE TABLE COURSE(
    course_code CHAR(5) NOT NULL,
    course_name VARCHAR2(50) NOT NULL,
    course_totalpoints NUMBER(3) NOT NULL
)

COMMENT ON COLUMN COURSE.course_code IS
    'Course code';

COMMENT ON COLUMN COURSE.course_name IS
    'Course name';

COMMENT ON COLUMN COURSE.course_totalpoints IS
    'Course total points';

ALTER TABLE COURSE ADD CONSTRAINT course_pk PRIMARY KEY(course_code);

CREATE TABLE course_unit(
    course_code CHAR(5) NOT NULL,
    unit_code CHAR(7) NOT NULL
);

ALTER TABLE course_unit ADD CONSTRAINT course_composite_key PRIMARY KEY(course_code, course_name);
ALTER TABLE course_unit ADD CONSTRAINT course_code_fk FOREIGN KEY(course_code) REFERENCES COURSE(course_code);
ALTER TABLE course_unit ADD CONSTRAINT course_unit_code FOREIGN KEY(unit_code) REFERENCES unit(unit_code);
