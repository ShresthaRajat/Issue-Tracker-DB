ALTER TABLE projects
    ADD CONSTRAINT projects_users_fk FOREIGN KEY ( creator )
        REFERENCES users ( username );