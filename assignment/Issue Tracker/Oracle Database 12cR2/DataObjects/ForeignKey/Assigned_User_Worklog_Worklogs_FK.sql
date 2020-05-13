ALTER TABLE assigned_user_worklog
    ADD CONSTRAINT assigned_user_worklog_worklogs_fk FOREIGN KEY ( worklog_id )
        REFERENCES worklogs ( worklog_id );