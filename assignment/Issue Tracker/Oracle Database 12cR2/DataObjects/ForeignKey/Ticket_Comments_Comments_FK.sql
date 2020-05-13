ALTER TABLE ticket_comments
    ADD CONSTRAINT ticket_comments_comments_fk FOREIGN KEY ( comments_comment_id )
        REFERENCES comments ( comment_id );