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
    INCREMENT BY 5
    NOCACHE;  -- in case of a crash, the sequence will not lose numbers (have gaps)

CREATE SEQUENCE team_seq
    START WITH 100
    INCREMENT BY 5
    NOCACHE;

--(b)



--(c)


--(d)
