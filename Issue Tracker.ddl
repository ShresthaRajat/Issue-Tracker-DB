-- Generated by Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   at:        2020-05-09 20:23:54 NPT
--   site:      Oracle Database 12cR2
--   type:      Oracle Database 12cR2



CREATE TABLE assigned_user (
    issue_id  INTEGER NOT NULL,
    username  VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE assigned_user ADD CONSTRAINT assigned_user_pk PRIMARY KEY ( issue_id,
                                                                        username );

CREATE TABLE assigned_user_worklog (
    issue_id    INTEGER NOT NULL,
    username    VARCHAR2(100 CHAR) NOT NULL,
    worklog_id  INTEGER NOT NULL
);

ALTER TABLE assigned_user_worklog
    ADD CONSTRAINT assigned_user_worklog_pk PRIMARY KEY ( worklog_id,
                                                          username,
                                                          issue_id );

CREATE TABLE atrefacts (
    artefact_id  INTEGER NOT NULL,
    username     VARCHAR2(100 CHAR) NOT NULL,
    title        VARCHAR2(100 CHAR) NOT NULL,
    description  VARCHAR2(500 CHAR) NOT NULL,
    category     VARCHAR2(100 CHAR) NOT NULL,
    "Size"       VARCHAR2(100 CHAR) NOT NULL,
    data         httpuritype
);

ALTER TABLE atrefacts ADD CONSTRAINT atrefacts_pk PRIMARY KEY ( artefact_id );

CREATE TABLE comments (
    comment_id  INTEGER NOT NULL,
    username    VARCHAR2(100 CHAR) NOT NULL,
    "Date"      DATE NOT NULL,
    text        VARCHAR2(500 CHAR) NOT NULL
);

ALTER TABLE comments ADD CONSTRAINT comments_pk PRIMARY KEY ( comment_id );

CREATE TABLE projects (
    project_id       INTEGER NOT NULL,
    title            VARCHAR2(100 CHAR) NOT NULL,
    description      VARCHAR2(500 CHAR),
    completion_date  DATE NOT NULL,
    creator          VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE projects ADD CONSTRAINT projects_pk PRIMARY KEY ( project_id );

CREATE TABLE ticket_artefacts (
    tickets_issue_id       INTEGER NOT NULL,
    atrefacts_artefact_id  INTEGER NOT NULL
);

ALTER TABLE ticket_artefacts ADD CONSTRAINT ticket_artefacts_pk PRIMARY KEY ( tickets_issue_id,
                                                                              atrefacts_artefact_id );

CREATE TABLE ticket_comments (
    comments_comment_id  INTEGER NOT NULL,
    tickets_issue_id     INTEGER NOT NULL
);

ALTER TABLE ticket_comments ADD CONSTRAINT ticket_comments_pk PRIMARY KEY ( comments_comment_id,
                                                                            tickets_issue_id );

CREATE TABLE tickets (
    issue_id      INTEGER NOT NULL,
    issue         VARCHAR2(255 CHAR),
    type          URITYPE,
    "Date"        DATE NOT NULL,
    status        VARCHAR2(100 CHAR) NOT NULL,
    parent_issue  INTEGER,
    reporter      VARCHAR2(100 CHAR) NOT NULL,
    project_id    INTEGER NOT NULL
);

ALTER TABLE tickets ADD CONSTRAINT ticket_pk PRIMARY KEY ( issue_id );

CREATE TABLE users (
    username     VARCHAR2(100 CHAR) NOT NULL,
    name         VARCHAR2(100 CHAR) NOT NULL,
    department   VARCHAR2(100 CHAR) NOT NULL,
    designation  VARCHAR2(100 CHAR) NOT NULL,
    contact      VARCHAR2(100 CHAR) NOT NULL,
    password     VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE users ADD CONSTRAINT employees_pk PRIMARY KEY ( username );

CREATE TABLE worklogs (
    worklog_id  INTEGER NOT NULL,
    "Date"      DATE NOT NULL,
    milestone   VARCHAR2(100 CHAR) NOT NULL,
    details     VARCHAR2(500 CHAR) NOT NULL
);

ALTER TABLE worklogs ADD CONSTRAINT worklog_pk PRIMARY KEY ( worklog_id );

ALTER TABLE assigned_user
    ADD CONSTRAINT assigned_user_tickets_fk FOREIGN KEY ( issue_id )
        REFERENCES tickets ( issue_id );

ALTER TABLE assigned_user
    ADD CONSTRAINT assigned_user_users_fk FOREIGN KEY ( username )
        REFERENCES users ( username );

ALTER TABLE assigned_user_worklog
    ADD CONSTRAINT assigned_user_worklog_assigned_user_fk FOREIGN KEY ( issue_id,
                                                                        username )
        REFERENCES assigned_user ( issue_id,
                                   username );

ALTER TABLE assigned_user_worklog
    ADD CONSTRAINT assigned_user_worklog_worklogs_fk FOREIGN KEY ( worklog_id )
        REFERENCES worklogs ( worklog_id );

ALTER TABLE atrefacts
    ADD CONSTRAINT atrefacts_users_fk FOREIGN KEY ( username )
        REFERENCES users ( username );

ALTER TABLE comments
    ADD CONSTRAINT comments_users_fk FOREIGN KEY ( username )
        REFERENCES users ( username );

ALTER TABLE tickets
    ADD CONSTRAINT parent_issue_fk FOREIGN KEY ( parent_issue )
        REFERENCES tickets ( issue_id );

ALTER TABLE projects
    ADD CONSTRAINT projects_users_fk FOREIGN KEY ( creator )
        REFERENCES users ( username );

ALTER TABLE ticket_artefacts
    ADD CONSTRAINT ticket_artefacts_atrefacts_fk FOREIGN KEY ( atrefacts_artefact_id )
        REFERENCES atrefacts ( artefact_id );

ALTER TABLE ticket_artefacts
    ADD CONSTRAINT ticket_artefacts_tickets_fk FOREIGN KEY ( tickets_issue_id )
        REFERENCES tickets ( issue_id );

ALTER TABLE ticket_comments
    ADD CONSTRAINT ticket_comments_comments_fk FOREIGN KEY ( comments_comment_id )
        REFERENCES comments ( comment_id );

ALTER TABLE ticket_comments
    ADD CONSTRAINT ticket_comments_tickets_fk FOREIGN KEY ( tickets_issue_id )
        REFERENCES tickets ( issue_id );

ALTER TABLE tickets
    ADD CONSTRAINT tickets_projects_fk FOREIGN KEY ( project_id )
        REFERENCES projects ( project_id );

ALTER TABLE tickets
    ADD CONSTRAINT tickets_users_fk FOREIGN KEY ( reporter )
        REFERENCES users ( username );

CREATE SEQUENCE a_artefact_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER a_artefact_id_trg BEFORE
    INSERT ON atrefacts
    FOR EACH ROW
    WHEN ( new.artefact_id IS NULL )
BEGIN
    :new.artefact_id := a_artefact_id_seq.nextval;
END;
/

CREATE SEQUENCE c_comment_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER c_comment_id_trg BEFORE
    INSERT ON comments
    FOR EACH ROW
    WHEN ( new.comment_id IS NULL )
BEGIN
    :new.comment_id := c_comment_id_seq.nextval;
END;
/

CREATE SEQUENCE p_project_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER p_project_id_trg BEFORE
    INSERT ON projects
    FOR EACH ROW
    WHEN ( new.project_id IS NULL )
BEGIN
    :new.project_id := p_project_id_seq.nextval;
END;
/

CREATE SEQUENCE t_issue_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_issue_id_trg BEFORE
    INSERT ON tickets
    FOR EACH ROW
    WHEN ( new.issue_id IS NULL )
BEGIN
    :new.issue_id := t_issue_id_seq.nextval;
END;
/

CREATE SEQUENCE w_worklog_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER w_worklog_id_trg BEFORE
    INSERT ON worklogs
    FOR EACH ROW
    WHEN ( new.worklog_id IS NULL )
BEGIN
    :new.worklog_id := w_worklog_id_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             24
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           5
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          5
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0