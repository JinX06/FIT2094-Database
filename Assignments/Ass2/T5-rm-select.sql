/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-rm-select.sql

--Student ID: 34076352
--Student Name: Ong Jin Xiang


/* Comments for your marker:

https://www.w3schools.com/mysql/mysql_join_cross.asp - This website was used to understand the CROSS JOIN operation.

*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


SELECT
	t.team_name AS team_name,
	TO_CHAR(t.carn_date, 'dd-Mon-YYYY') AS carnival_date,
	leader.comp_fname || ' ' || leader.comp_lname AS teamleader,
	COUNT(e.comp_no) AS team_no_members
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
SELECT
	et.eventtype_desc AS Event,
  	c.carn_name || ' held ' || TO_CHAR(c.carn_date, 'DD-Mon-YYYY') AS carnival,
  	TO_CHAR(e.entry_elapsedtime, 'HH24:MI:SS') AS "Current Record",
  	LPAD(comp.comp_no, 5, '0') || ' ' || comp.comp_fname || ' ' || comp.comp_lname AS "Competitor No and Name",
  	TO_CHAR(TRUNC(months_between(c.carn_date, comp.comp_dob) / 12)) AS "Age at Carnival" -- for age of the competitor ON the carnival date
FROM entry e
JOIN Event ev ON e.event_id = ev.event_id
JOIN carnival c ON ev.carn_date = c.carn_date
JOIN eventtype et ON ev.eventtype_code = et.eventtype_code
JOIN competitor comp ON e.comp_no = comp.comp_no
WHERE e.entry_elapsedtime IS NOT NULL
AND e.entry_elapsedtime = (
    SELECT MIN(e2.entry_elapsedtime)
    FROM entry e2
        JOIN event ev2
        ON e2.event_id = ev2.event_id
    WHERE ev2.eventtype_code = ev.eventtype_code
    AND e2.entry_elapsedtime IS NOT NULL
)
ORDER BY
	et.eventtype_desc,
	comp.comp_no
;




/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
	c.carn_name AS "Carnival Name",
  
	TO_CHAR(c.carn_date, 'DD Mon YYYY') AS "Carnival Date",

  	et.eventtype_desc AS "Event Description",

  	CASE
    	WHEN COUNT(en.entry_no) = 0 THEN 'Not offered'
    	ELSE LPAD(TO_CHAR(COUNT(en.entry_no)), 20, ' ')
  	END AS "Number of Entries",

	LPAD(
     CASE
       WHEN carnival_totals.total_entries IS NULL THEN ' '
       WHEN COUNT(en.entry_no) = 0 THEN ' '
       ELSE TO_CHAR(TRUNC(COUNT(en.entry_no) * 100/carnival_totals.total_entries))
     END,
     24, ' '
   ) AS "% of Carnival Entries"

FROM
	carnival c
  	CROSS JOIN eventtype et
  	LEFT JOIN (
      	event e
      	JOIN entry en ON e.event_id = en.event_id
  	) ON c.carn_date = e.carn_date
        AND et.eventtype_code = e.eventtype_code
  	LEFT JOIN (
      SELECT
          cr.carn_date,
          COUNT(en.entry_no) AS total_entries
      FROM
          carnival cr
          JOIN event  ev ON cr.carn_date = ev.carn_date
          JOIN entry  en ON ev.event_id = en.event_id
      GROUP BY
          cr.carn_date
  ) carnival_totals ON c.carn_date = carnival_totals.carn_date
GROUP BY
	c.carn_name,
	c.carn_date,
	et.eventtype_desc,
	carnival_totals.total_entries
ORDER BY
  	c.carn_date,
  	COUNT(en.entry_no) DESC,
  	et.eventtype_desc;

