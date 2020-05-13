ALTER TABLE tickets
    ADD CONSTRAINT parent_issue_fk FOREIGN KEY ( parent_issue )
        REFERENCES tickets ( issue_id );