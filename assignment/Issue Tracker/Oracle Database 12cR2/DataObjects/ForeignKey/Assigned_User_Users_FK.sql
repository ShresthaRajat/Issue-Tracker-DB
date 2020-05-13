ALTER TABLE assigned_user
    ADD CONSTRAINT assigned_user_users_fk FOREIGN KEY ( username )
        REFERENCES users ( username );