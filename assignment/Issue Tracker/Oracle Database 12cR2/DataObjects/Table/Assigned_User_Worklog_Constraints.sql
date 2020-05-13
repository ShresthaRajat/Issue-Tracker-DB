ALTER TABLE assigned_user_worklog
    ADD CONSTRAINT assigned_user_worklog_pk PRIMARY KEY ( worklog_id,
                                                          username,
                                                          issue_id );