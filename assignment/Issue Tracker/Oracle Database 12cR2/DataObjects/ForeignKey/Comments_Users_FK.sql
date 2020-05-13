ALTER TABLE comments
    ADD CONSTRAINT comments_users_fk FOREIGN KEY ( username )
        REFERENCES users ( username );