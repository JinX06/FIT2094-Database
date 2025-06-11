/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-rm-select.sql

--Student ID: 34076352
--Student Name: Ong Jin Xiang


/* Comments for your marker:




*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT
    t.team_name AS team_name,
    TO_CHAR(t.carn_date, 'dd-Mon-YYYY') AS carnival_date,
    leader.comp_fname || ' ' || leader.comp_lname AS teamleader,
    COUNT(e.comp_no) AS no_of_members
FROM team t
JOIN entry lead_ent ON t.event_id = lead_ent.event_id
AND t.entry_no  = lead_ent.entry_no 
JOIN competitor leader ON lead_ent.comp_no = leader.comp_no
JOIN entry e ON t.team_id = e.team_id
WHERE t.carn_date < SYSDATE -- completed carnivals only
AND t.team_name IN (
    SELECT team_name
    FROM team
    WHERE carn_date < SYSDATE
    GROUP BY team_name
    HAVING COUNT(*) = (
        SELECT MAX(team_count)
        FROM (
            SELECT team_name, COUNT(*) AS team_count
            FROM team
            WHERE carn_date < SYSDATE
            GROUP BY team_name
        )
    )
)
GROUP BY
  t.team_name,
  t.carn_date,
  leader.comp_fname,
  leader.comp_lname
ORDER BY
  t.team_name,
  t.carn_date;




/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer






/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


