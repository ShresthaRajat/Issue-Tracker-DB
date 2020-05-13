CREATE TABLE worklogs (
    worklog_id  INTEGER NOT NULL,
    "Date"      DATE NOT NULL,
    milestone   VARCHAR2(100 CHAR) NOT NULL,
    details     VARCHAR2(500 CHAR) NOT NULL
);