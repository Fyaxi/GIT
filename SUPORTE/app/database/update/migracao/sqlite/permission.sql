--
-- File generated with SQLiteStudio v3.2.1 on sáb abr 23 19:48:44 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: system_group
CREATE TABLE system_group (
    id INTEGER PRIMARY KEY NOT NULL,
    name varchar(100));
INSERT INTO system_group (id, name) VALUES (1, 'Admin');
INSERT INTO system_group (id, name) VALUES (2, 'Standard');
INSERT INTO system_group (id, name) VALUES (3, 'Manager');
INSERT INTO system_group (id, name) VALUES (4, 'Team member');
INSERT INTO system_group (id, name) VALUES (5, 'Customer');

-- Table: system_group_program
CREATE TABLE system_group_program (
    id INTEGER PRIMARY KEY NOT NULL,
    system_group_id int,
    system_program_id int,
    FOREIGN KEY(system_group_id) REFERENCES system_group(id),
    FOREIGN KEY(system_program_id) REFERENCES system_program(id));
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (323, 4, 36);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (324, 4, 37);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (325, 4, 38);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (326, 4, 39);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (327, 4, 40);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (344, 2, 10);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (345, 2, 12);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (346, 2, 13);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (347, 2, 16);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (348, 2, 17);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (349, 2, 18);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (350, 2, 19);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (351, 2, 20);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (352, 2, 22);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (353, 2, 23);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (354, 2, 24);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (355, 2, 25);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (356, 2, 30);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (357, 5, 36);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (358, 5, 37);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (359, 5, 39);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (360, 5, 40);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (361, 3, 31);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (362, 3, 32);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (363, 3, 33);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (364, 3, 34);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (365, 3, 35);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (366, 3, 36);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (367, 3, 37);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (368, 3, 38);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (369, 3, 39);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (370, 3, 40);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (376, 3, 45);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (377, 1, 1);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (378, 1, 2);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (379, 1, 3);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (380, 1, 4);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (381, 1, 5);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (382, 1, 6);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (383, 1, 7);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (384, 1, 8);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (385, 1, 9);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (386, 1, 10);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (387, 1, 11);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (388, 1, 12);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (389, 1, 13);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (390, 1, 14);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (391, 1, 15);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (392, 1, 16);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (393, 1, 17);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (394, 1, 18);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (395, 1, 19);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (396, 1, 20);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (397, 1, 21);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (398, 1, 22);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (399, 1, 23);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (400, 1, 24);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (401, 1, 25);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (402, 1, 26);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (403, 1, 27);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (404, 1, 28);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (405, 1, 29);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (406, 1, 30);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (407, 1, 31);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (408, 1, 32);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (409, 1, 33);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (410, 1, 34);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (411, 1, 35);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (412, 1, 36);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (413, 1, 37);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (414, 1, 38);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (415, 1, 39);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (416, 1, 40);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (417, 1, 41);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (418, 1, 42);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (419, 1, 43);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (420, 1, 44);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (421, 1, 45);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (422, 1, 46);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (423, 1, 47);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (424, 1, 48);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (425, 1, 49);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (426, 1, 50);
INSERT INTO system_group_program (id, system_group_id, system_program_id) VALUES (427, 1, 51);

-- Table: system_preference
CREATE TABLE system_preference (
    id text,
    value text
);
INSERT INTO system_preference (id, value) VALUES ('mail_from', 'suporte@sistemaintegrado.tech');
INSERT INTO system_preference (id, value) VALUES ('smtp_auth', '1');
INSERT INTO system_preference (id, value) VALUES ('smtp_host', 'mail.sistemaintegrado.tech');
INSERT INTO system_preference (id, value) VALUES ('smtp_port', '465');
INSERT INTO system_preference (id, value) VALUES ('smtp_user', 'suporte@sistemaintegrado.tech');
INSERT INTO system_preference (id, value) VALUES ('smtp_pass', '102030');
INSERT INTO system_preference (id, value) VALUES ('mail_support', 'suporte@sistemaintegrado.tech');

-- Table: system_program
CREATE TABLE system_program (
    id INTEGER PRIMARY KEY NOT NULL,
    name varchar(100),
    controller varchar(100));
INSERT INTO system_program (id, name, controller) VALUES (1, 'System Group Form', 'SystemGroupForm');
INSERT INTO system_program (id, name, controller) VALUES (2, 'System Group List', 'SystemGroupList');
INSERT INTO system_program (id, name, controller) VALUES (3, 'System Program Form', 'SystemProgramForm');
INSERT INTO system_program (id, name, controller) VALUES (4, 'System Program List', 'SystemProgramList');
INSERT INTO system_program (id, name, controller) VALUES (5, 'System User Form', 'SystemUserForm');
INSERT INTO system_program (id, name, controller) VALUES (6, 'System User List', 'SystemUserList');
INSERT INTO system_program (id, name, controller) VALUES (7, 'Common Page', 'CommonPage');
INSERT INTO system_program (id, name, controller) VALUES (8, 'System PHP Info', 'SystemPHPInfoView');
INSERT INTO system_program (id, name, controller) VALUES (9, 'System ChangeLog View', 'SystemChangeLogView');
INSERT INTO system_program (id, name, controller) VALUES (10, 'Welcome View', 'WelcomeView');
INSERT INTO system_program (id, name, controller) VALUES (11, 'System Sql Log', 'SystemSqlLogList');
INSERT INTO system_program (id, name, controller) VALUES (12, 'System Profile View', 'SystemProfileView');
INSERT INTO system_program (id, name, controller) VALUES (13, 'System Profile Form', 'SystemProfileForm');
INSERT INTO system_program (id, name, controller) VALUES (14, 'System SQL Panel', 'SystemSQLPanel');
INSERT INTO system_program (id, name, controller) VALUES (15, 'System Access Log', 'SystemAccessLogList');
INSERT INTO system_program (id, name, controller) VALUES (16, 'System Message Form', 'SystemMessageForm');
INSERT INTO system_program (id, name, controller) VALUES (17, 'System Message List', 'SystemMessageList');
INSERT INTO system_program (id, name, controller) VALUES (18, 'System Message Form View', 'SystemMessageFormView');
INSERT INTO system_program (id, name, controller) VALUES (19, 'System Notification List', 'SystemNotificationList');
INSERT INTO system_program (id, name, controller) VALUES (20, 'System Notification Form View', 'SystemNotificationFormView');
INSERT INTO system_program (id, name, controller) VALUES (21, 'System Document Category List', 'SystemDocumentCategoryFormList');
INSERT INTO system_program (id, name, controller) VALUES (22, 'System Document Form', 'SystemDocumentForm');
INSERT INTO system_program (id, name, controller) VALUES (23, 'System Document Upload Form', 'SystemDocumentUploadForm');
INSERT INTO system_program (id, name, controller) VALUES (24, 'System Document List', 'SystemDocumentList');
INSERT INTO system_program (id, name, controller) VALUES (25, 'System Shared Document List', 'SystemSharedDocumentList');
INSERT INTO system_program (id, name, controller) VALUES (26, 'System Unit Form', 'SystemUnitForm');
INSERT INTO system_program (id, name, controller) VALUES (27, 'System Unit List', 'SystemUnitList');
INSERT INTO system_program (id, name, controller) VALUES (28, 'System Access stats', 'SystemAccessLogStats');
INSERT INTO system_program (id, name, controller) VALUES (29, 'System Preference form', 'SystemPreferenceForm');
INSERT INTO system_program (id, name, controller) VALUES (30, 'System Support form', 'SystemSupportForm');
INSERT INTO system_program (id, name, controller) VALUES (31, 'Categories', 'CategoryFormList');
INSERT INTO system_program (id, name, controller) VALUES (32, 'Statuses', 'StatusFormList');
INSERT INTO system_program (id, name, controller) VALUES (33, 'Priorities', 'PriorityFormList');
INSERT INTO system_program (id, name, controller) VALUES (34, 'Project List', 'ProjectList');
INSERT INTO system_program (id, name, controller) VALUES (35, 'Project form', 'ProjectForm');
INSERT INTO system_program (id, name, controller) VALUES (36, 'New issue form', 'NewIssueForm');
INSERT INTO system_program (id, name, controller) VALUES (37, 'Issues', 'IssueList');
INSERT INTO system_program (id, name, controller) VALUES (38, 'Update issue', 'UpdateIssueForm');
INSERT INTO system_program (id, name, controller) VALUES (39, 'View issue', 'ViewIssueForm');
INSERT INTO system_program (id, name, controller) VALUES (40, 'Issue notes', 'NoteForm');
INSERT INTO system_program (id, name, controller) VALUES (41, 'System PHP Error', 'SystemPHPErrorLogView');
INSERT INTO system_program (id, name, controller) VALUES (42, 'System Database Browser', 'SystemDatabaseExplorer');
INSERT INTO system_program (id, name, controller) VALUES (43, 'System Table List', 'SystemTableList');
INSERT INTO system_program (id, name, controller) VALUES (44, 'System Data Browser', 'SystemDataBrowser');
INSERT INTO system_program (id, name, controller) VALUES (45, 'Dashboard View', 'DashboardView');
INSERT INTO system_program (id, name, controller) VALUES (46, 'System Menu Editor', 'SystemMenuEditor');
INSERT INTO system_program (id, name, controller) VALUES (47, 'System Request Log', 'SystemRequestLogList');
INSERT INTO system_program (id, name, controller) VALUES (48, 'System Request Log View', 'SystemRequestLogView');
INSERT INTO system_program (id, name, controller) VALUES (49, 'System Administration Dashboard', 'SystemAdministrationDashboard');
INSERT INTO system_program (id, name, controller) VALUES (50, 'System Log Dashboard', 'SystemLogDashboard');
INSERT INTO system_program (id, name, controller) VALUES (51, 'System Session dump', 'SystemSessionDumpView');

-- Table: system_unit
CREATE TABLE system_unit (
    id INTEGER PRIMARY KEY NOT NULL,
    name varchar(100), connection_name TEXT);
INSERT INTO system_unit (id, name, connection_name) VALUES (1, 'Sistema Integrado', 'changeman');

-- Table: system_user
CREATE TABLE system_user (
    id INTEGER PRIMARY KEY NOT NULL,
    name varchar(100),
    login varchar(100),
    password varchar(100),
    email varchar(100),
    frontpage_id int, system_unit_id int references system_unit(id), active char(1),
    FOREIGN KEY(frontpage_id) REFERENCES system_program(id));
INSERT INTO system_user (id, name, login, password, email, frontpage_id, system_unit_id, active) VALUES (1, 'Administrator', 'admin', 'e46cac0ecd0b491c2eb6531326e57f9a', 'jaiirobarreto@gmail.com', 45, 1, 'Y');

-- Table: system_user_group
CREATE TABLE system_user_group (
    id INTEGER PRIMARY KEY NOT NULL,
    system_user_id int,
    system_group_id int,
    FOREIGN KEY(system_user_id) REFERENCES system_user(id),
    FOREIGN KEY(system_group_id) REFERENCES system_group(id));
INSERT INTO system_user_group (id, system_user_id, system_group_id) VALUES (1, 1, 1);

-- Table: system_user_program
CREATE TABLE system_user_program (
    id INTEGER PRIMARY KEY NOT NULL,
    system_user_id int,
    system_program_id int,
    FOREIGN KEY(system_user_id) REFERENCES system_user(id),
    FOREIGN KEY(system_program_id) REFERENCES system_program(id));

-- Table: system_user_unit
CREATE TABLE system_user_unit (
    id INTEGER PRIMARY KEY NOT NULL,
    system_user_id int,
    system_unit_id int,
    FOREIGN KEY(system_user_id) REFERENCES system_user(id),
    FOREIGN KEY(system_unit_id) REFERENCES system_unit(id));
INSERT INTO system_user_unit (id, system_user_id, system_unit_id) VALUES (1, 1, 1);

-- Index: system_group_program_group_idx
CREATE INDEX system_group_program_group_idx ON system_group_program(system_group_id);

-- Index: system_group_program_program_idx
CREATE INDEX system_group_program_program_idx ON system_group_program(system_program_id);

-- Index: system_user_group_group_idx
CREATE INDEX system_user_group_group_idx ON system_user_group(system_group_id);

-- Index: system_user_group_user_idx
CREATE INDEX system_user_group_user_idx ON system_user_group(system_user_id);

-- Index: system_user_program_idx
CREATE INDEX system_user_program_idx ON system_user(frontpage_id);

-- Index: system_user_program_program_idx
CREATE INDEX system_user_program_program_idx ON system_user_program(system_program_id);

-- Index: system_user_program_user_idx
CREATE INDEX system_user_program_user_idx ON system_user_program(system_user_id);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
