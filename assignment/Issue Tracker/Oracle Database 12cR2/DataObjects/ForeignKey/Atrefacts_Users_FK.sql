ALTER TABLE atrefacts
    ADD CONSTRAINT atrefacts_users_fk FOREIGN KEY ( username )
        REFERENCES users ( username );