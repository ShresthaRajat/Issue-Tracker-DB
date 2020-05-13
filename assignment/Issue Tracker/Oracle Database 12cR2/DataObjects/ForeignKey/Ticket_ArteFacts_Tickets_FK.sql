ALTER TABLE ticket_artefacts
    ADD CONSTRAINT ticket_artefacts_tickets_fk FOREIGN KEY ( tickets_issue_id )
        REFERENCES tickets ( issue_id );