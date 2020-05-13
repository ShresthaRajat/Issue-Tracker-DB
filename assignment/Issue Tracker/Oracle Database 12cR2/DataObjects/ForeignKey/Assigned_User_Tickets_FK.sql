ALTER TABLE assigned_user
    ADD CONSTRAINT assigned_user_tickets_fk FOREIGN KEY ( issue_id )
        REFERENCES tickets ( issue_id );