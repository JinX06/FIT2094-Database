--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

--Student ID: 34076352
--Student Name: Ong Jin Xiang

/* Comments for your marker:




*/

-- Drop the sequence (competitor_seq, team_seq) if it exists.
DROP SEQUENCE competitor_seq;
DROP SEQUENCE team_seq;

--(a)
CREATE SEQUENCE competitor_seq
    START WITH 100
    INCREMENT BY 5;

CREATE SEQUENCE team_seq
    START WITH 100
    INCREMENT BY 5;

--(b)
INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (competitor_seq.NEXTVAL,'Keith','Rose','M', TO_DATE('14-FEB-2004','DD-MON-YYYY'), 'keith.rose@monash.edu','Y','0422141112');

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES (competitor_seq.NEXTVAL,'Jackson','Bull','M', TO_DATE('05-MAY-2003','DD-MON-YYYY'), 'jackson.bull@monash.edu','Y','0422412524');

-- Keith Rose's entry (team_id NULL for now)
INSERT INTO entry (
    event_id,
    entry_no,
    comp_no,
    team_id,
    char_id
) VALUES (
    (SELECT e.event_id
    FROM event e
    WHERE e.carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
    AND UPPER(e.eventtype_code) = UPPER('10K')),

    (SELECT NVL(MAX(entry_no),0)+1
    FROM entry
    WHERE event_id = (SELECT event_id
        FROM event
        WHERE carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
        AND UPPER(eventtype_code) = UPPER('10K'))
    ),

    (SELECT comp_no FROM competitor WHERE UPPER(comp_email) = UPPER('keith.rose@monash.edu')),
    
    NULL,
    
    (SELECT char_id FROM charity WHERE UPPER(char_name) = UPPER('Salvation Army'))
    );

-- Keith Rose's new team
INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES (
    team_seq.NEXTVAL,

    'Super Runners',

    TO_DATE('29/JUN/2025','DD/MON/YYYY'),

    (SELECT e.event_id
    FROM event e
    WHERE e.carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
    AND UPPER(e.eventtype_code) = UPPER('10K')),

    (SELECT NVL(MAX(entry_no),0)
    FROM entry
    WHERE event_id = (SELECT event_id
        FROM event
        WHERE carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
        AND UPPER(eventtype_code) = UPPER('10K'))
    )
);

-- Add keith rose to his new team
UPDATE entry
    SET team_id = team_seq.CURRVAL
WHERE comp_no = (SELECT comp_no FROM competitor WHERE UPPER(comp_email) = UPPER('keith.rose@monash.edu'))
    AND event_id =
    (SELECT event_id
    FROM event
    WHERE carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
    AND UPPER(eventtype_code) = UPPER('10K'));

-- Jackson bull entry joins the same team
INSERT INTO entry (
    event_id,
    entry_no,
    comp_no,
    team_id,
    char_id
) VALUES (
    (SELECT e.event_id
    FROM event e
    WHERE e.carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
    AND UPPER(e.eventtype_code) = UPPER('10K')),
    
    (SELECT NVL(MAX(entry_no),0)+1
    FROM entry
    WHERE event_id = (SELECT event_id
    FROM event
    WHERE carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
    AND UPPER(eventtype_code) = UPPER('10K'))
    ),

    (SELECT comp_no FROM competitor WHERE UPPER(comp_email) = UPPER('jackson.bull@monash.edu')),

    (SELECT team_id FROM team WHERE UPPER(team_name) = UPPER('Super Runners') AND carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')),

    (SELECT char_id FROM charity WHERE UPPER(char_name) = UPPER('RSPCA'))
);

COMMIT;
--(c)

-- Remove Jackson from the 10K team
UPDATE entry
    SET team_id = NULL
    WHERE comp_no = (SELECT comp_no FROM competitor WHERE UPPER(comp_email) = UPPER('jackson.bull@monash.edu'))
    AND event_id = (SELECT event_id
        FROM event
        WHERE carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
        AND UPPER(eventtype_code) = UPPER('10K'));

-- New 5K individual entry for Jackson
INSERT INTO entry (
    event_id,
    entry_no,
    comp_no,
    team_id,
    char_id
) VALUES (
    (SELECT event_id
    FROM event
    WHERE carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
    AND UPPER(eventtype_code) = UPPER('5K')),
    
    (SELECT NVL(MAX(entry_no),0)+1
    FROM entry
    WHERE event_id = (SELECT event_id
        FROM event
        WHERE carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
        AND UPPER(eventtype_code) = UPPER('5K'))),
    
    (SELECT comp_no FROM competitor WHERE UPPER(comp_email) = UPPER('jackson.bull@monash.edu')),
    
    NULL,
    
    (SELECT char_id FROM charity WHERE UPPER(char_name) = UPPER('Beyond Blue'))
);

-- Delete Jackson’s old 10K entry
DELETE FROM entry
WHERE comp_no = (SELECT comp_no FROM competitor WHERE UPPER(comp_email) = UPPER('jackson.bull@monash.edu'))
AND event_id = (SELECT event_id
    FROM event
    WHERE carn_date = TO_DATE('29/JUN/2025','DD/MON/YYYY')
    AND UPPER(eventtype_code) = UPPER('10K')
);

COMMIT;

--(d)
