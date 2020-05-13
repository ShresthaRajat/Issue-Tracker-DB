ALTER TABLE ticket_comments
    ADD CONSTRAINT ticket_comments_tickets_fk FOREIGN KEY ( tickets_issue_id )
        REFERENCES tickets ( issue_id );