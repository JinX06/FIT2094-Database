--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-mods.sql

--Student ID: 34076352
--Student Name: Ong Jin Xiang

/* Comments for your marker:




*/

--(a)
ALTER TABLE competitor ADD comp_completed_events NUMBER(3) DEFAULT 0 NOT NULL;
ALTER TABLE competitor ADD CONSTRAINT chk_comp_event_pos CHECK (comp_completed_events >= 0);
COMMENT ON COLUMN competitor.comp_completed_events IS 'Number of events completed by the competitor';

UPDATE competitor c
SET comp_completed_events = (
    SELECT COUNT(*)
    FROM entry e
    WHERE e.comp_no = c.comp_no
    AND e.entry_finishtime IS NOT NULL
);

COMMIT;

DESC competitor;

SELECT comp_no, comp_fname, comp_lname, comp_completed_events
FROM competitor;

--(b)


