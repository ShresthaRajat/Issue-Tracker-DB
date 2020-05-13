CREATE TABLE projects (
    project_id       INTEGER NOT NULL,
    title            VARCHAR2(100 CHAR) NOT NULL,
    description      VARCHAR2(500 CHAR),
    completion_date  DATE NOT NULL,
    creator          VARCHAR2(100 CHAR) NOT NULL
);