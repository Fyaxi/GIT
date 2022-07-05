--
-- File generated with SQLiteStudio v3.2.1 on sáb abr 23 19:46:55 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: system_document
CREATE TABLE system_document
(
    id INTEGER PRIMARY KEY NOT NULL,
    system_user_id INTEGER,
    title TEXT,
    description TEXT,
    category_id INTEGER references system_document_category(id),
    submission_date DATE,
    archive_date DATE,
    filename TEXT
);

-- Table: system_document_category
CREATE TABLE system_document_category
(
    id INTEGER PRIMARY KEY NOT NULL,
    name TEXT
);
INSERT INTO system_document_category (id, name) VALUES (1, 'Documentação');

-- Table: system_document_group
CREATE TABLE system_document_group
(
    id INTEGER PRIMARY KEY NOT NULL,
    document_id INTEGER references system_document(id),
    system_group_id INTEGER
);

-- Table: system_document_user
CREATE TABLE system_document_user
(
    id INTEGER PRIMARY KEY NOT NULL,
    document_id INTEGER references system_document(id),
    system_user_id INTEGER
);

-- Table: system_message
CREATE TABLE system_message
(
    id INTEGER PRIMARY KEY NOT NULL,
    system_user_id INT,
    system_user_to_id INT,
    subject TEXT,
    message TEXT,
    dt_message TEXT,
    checked char(1)
);

-- Table: system_notification
CREATE TABLE system_notification
(
    id INTEGER PRIMARY KEY NOT NULL,
    system_user_id INT,
    system_user_to_id INT,
    subject TEXT,
    message TEXT,
    dt_message TEXT,
    action_url TEXT,
    action_label TEXT,
    icon TEXT,
    checked char(1)
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
