-- INNER join
--     - Syntax:
--         SELECT table1.column1, table2.column2...
--         FROM table1
--         INNER JOIN table2
--         ON table1.common_filed = table2.common_field;
--     - A INNER JOIN creates a new result table by combining column values of two tables 
--         (table1 and table2) based upon the join-condition.
--     - The query compares each row of table1 with each row of table2 to find all pairs of rows, 
--         which satisfy the join-condition.
--     - When the join-condition. is satisfied, column values for each matched pair of rows of 
--         table1 and table2 are combined into a result row.

-- 1. Display username with note title
SELECT title, username
FROM note_note
INNER JOIN auth_user 
ON note_note.user_id = auth_user.id;

-- 2. Display note with labels
SELECT title, name
FROM note_note
INNER JOIN note_labelmap
ON note_note.id = note_labelmap.note_id
INNER JOIN label_label
ON label_label.id = note_labelmap.label_id;


-- 3. display note with collaborators, labels, owner and save it into temporary table 
CREATE TEMPORARY TABLE tem_table AS
SELECT note_note.id, title, username, name, (select username from auth_user where id = note_note.user_id) as owner
FROM note_note 
INNER JOIN note_labelmap
ON note_note.id = note_labelmap.note_id
INNER JOIN label_label
ON label_label.id = note_labelmap.label_id
INNER JOIN note_usermap 
ON note_note.id = note_usermap.note_id
INNER JOIN auth_user
ON auth_user.id = note_usermap.user_id;

-- Display all data regarding user deep into deep_view
CREATE VIEW deep_view AS
SELECT n.id, n.title, n.reminder, u.username, l.name
FROM note_note n
INNER JOIN note_labelmap lm
ON lm.note_id = n.id
INNER JOIN label_label l
ON l.id = lm.label_id
INNER JOIN note_usermap um
ON n.id = um.note_id
INNER JOIN auth_user u
ON u.id = um.user_id
where u.username = 'deep';