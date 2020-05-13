ALTER TABLE tickets
    ADD CONSTRAINT tickets_users_fk FOREIGN KEY ( reporter )
        REFERENCES users ( username );