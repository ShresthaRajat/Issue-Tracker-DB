ALTER TABLE assigned_user_worklog
    ADD CONSTRAINT assigned_user_worklog_assigned_user_fk FOREIGN KEY ( issue_id,
                                                                        username )
        REFERENCES assigned_user ( issue_id,
                                   username );