/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-rm-json.sql

--Student ID: 34076352
--Student Name: Ong Jin Xiang


/* Comments for your marker:




*/


-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
	JSON_OBJECT(
        '_id' VALUE t.team_id,
        'carn_name' VALUE c.carn_name,
        'carn_date' VALUE TO_CHAR(c.carn_date, 'DD-Mon-YYYY'),
        'team_name' VALUE t.team_name,
        'team_leader' VALUE (
            SELECT
                JSON_OBJECT(
                    'name' VALUE leader.comp_fname || ' ' || leader.comp_lname,
                    'phone' VALUE leader.comp_phone,
                    'email' VALUE leader.comp_email
                )
            FROM
                entry e_leader
                JOIN competitor leader ON e_leader.comp_no = leader.comp_no
            WHERE
                e_leader.event_id = t.event_id
                AND e_leader.entry_no = t.entry_no
        ),
        'team_no_of_members' VALUE (
            SELECT
                COUNT(*)
            FROM
                entry e_count
            WHERE
                e_count.team_id = t.team_id
        ),
        'team_members' VALUE (
            SELECT
                JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'competitor_name' VALUE tm_member.comp_fname || ' ' || tm_member.comp_lname,
                        'competitor_phone' VALUE tm_member.comp_phone,
                        'event_type' VALUE et.eventtype_desc,
                        'entry_no' VALUE tm_entry.entry_no,
                        'starttime' VALUE NVL(TO_CHAR(tm_entry.entry_starttime, 'HH24:MI:SS'), '-'),
                        'finishtime' VALUE NVL(TO_CHAR(tm_entry.entry_finishtime, 'HH24:MI:SS'), '-'),
                        'elapsedtime' VALUE NVL(TO_CHAR(tm_entry.entry_elapsedtime, 'HH24:MI:SS'), '-')  -- startime, finishtime, elapsedtime are all optional (without *)
                    )
                )
            FROM
                entry tm_entry
                JOIN competitor tm_member ON tm_entry.comp_no = tm_member.comp_no
                JOIN event ev ON tm_entry.event_id = ev.event_id
                JOIN eventtype et ON ev.eventtype_code = et.eventtype_code
            WHERE
                tm_entry.team_id = t.team_id
        )
    ) || ','
FROM
	team t
    JOIN carnival c ON t.carn_date = c.carn_date
ORDER BY
    t.team_id;




