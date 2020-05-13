CREATE TABLE comments (
    comment_id  INTEGER NOT NULL,
    username    VARCHAR2(100 CHAR) NOT NULL,
    "Date"      DATE NOT NULL,
    text        VARCHAR2(500 CHAR) NOT NULL
);