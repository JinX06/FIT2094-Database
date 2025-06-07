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

CREATE TABLE entry_charity_allocation (
    event_id    NUMBER(6) NOT NULL,
    entry_no    NUMBER(5) NOT NULL,
    char_id     NUMBER(3) NOT NULL,
    allocation_pct NUMBER(3) NOT NULL
);

-- Comments for the ENTRY_CHARITY table attributes
COMMENT ON COLUMN entry_charity_allocation.event_id IS
  'Event identifier';
  
COMMENT ON COLUMN entry_charity_allocation.entry_no IS
  'Entry number';
  
COMMENT ON COLUMN entry_charity_allocation.char_id IS
  'Charity identifier';
  
COMMENT ON COLUMN entry_charity_allocation.allocation_pct IS
  'Percentage of funds raised for this charity';
  
-- Constraints for the ENTRY_CHARITY table attributes
ALTER TABLE entry_charity_allocation ADD CONSTRAINT eca_pk PRIMARY KEY(event_id, entry_no, char_id);
ALTER TABLE entry_charity_allocation ADD CONSTRAINT eca_entry_fk FOREIGN KEY(event_id, entry_no) REFERENCES entry(event_id, entry_no);
ALTER TABLE entry_charity_allocation ADD CONSTRAINT eca_charity_fk FOREIGN KEY(char_id) REFERENCES charity(char_id);
ALTER TABLE entry_charity_allocation ADD CONSTRAINT chk_allocation_pct CHECK(allocation_pct > 0 AND allocation_pct <= 100);

INSERT INTO entry_charity_allocation (
    event_id,
    entry_no,
    char_id,
    allocation_pct
)   SELECT 
        event_id,
        entry_no,
        char_id,
        100
    FROM entry
    WHERE char_id IS NOT NULL;

ALTER TABLE entry DROP CONSTRAINT entry_charity_fk;
ALTER TABLE entry DROP COLUMN char_id;

COMMIT;

-- Verify
DESC entry_charity_allocation;
SELECT * 
FROM entry_charity_allocation
ORDER BY event_id, entry_no, char_id;