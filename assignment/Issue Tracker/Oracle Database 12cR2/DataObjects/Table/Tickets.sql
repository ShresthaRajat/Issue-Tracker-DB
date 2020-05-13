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