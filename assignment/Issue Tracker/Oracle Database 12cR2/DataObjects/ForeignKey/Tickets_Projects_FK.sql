ALTER TABLE tickets
    ADD CONSTRAINT tickets_projects_fk FOREIGN KEY ( project_id )
        REFERENCES projects ( project_id );