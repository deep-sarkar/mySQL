-- LABEL

-- create a procedure to check label exists or not, if exists return id else return -1
CREATE PROCEDURE get_label( IN l_name varchar(20), IN l_user_id integer(4))
BEGIN
DECLARE l_id integer(4) default -1;
DECLARE label_cursor CURSOR FOR SELECT id FROM label_label WHERE user_id = l_user_id and name = l_name;
DECLARE continue handler FOR NOT FOUND SET l_id = -1;

OPEN label_cursor;
FETCH label_cursor INTO l_id;
CLOSE label_cursor;
SELECT l_id;
END$$





-- create label and get back id
CREATE PROCEDURE sp_insert_label(IN l_name varchar(20), IN l_user_id integer(4))
BEGIN
INSERT INTO label_label(name, user_id) values(l_name, l_user_id);
SELECT LAST_INSERT_ID();
END$$




-- COLLABORATOR
-- create a procedure to check user exists or not, if exists return id else return -1
CREATE PROCEDURE sp_get_user( IN var_username varchar(20))
BEGIN
DECLARE user_id integer(4) default -1;
DECLARE user_cursor CURSOR FOR SELECT id FROM auth_user WHERE username = var_username;
DECLARE continue handler FOR NOT FOUND SET user_id = -1;

OPEN user_cursor;
FETCH user_cursor INTO user_id;
CLOSE user_cursor;
SELECT user_id;
END$$



-- NOTE
-- create note and return note id
CREATE PROCEDURE sp_create_note_and_get_id(IN v_title varchar(100), IN v_note longtext, IN v_image varchar(100), 
            IN v_reminder datetime(6), IN v_acrhive tinyint(1), IN v_trash tinyint(1), IN v_pin tinyint(1), IN v_color varchar(7),
            IN v_user_id int)
BEGIN
INSERT INTO note_note(title , note, image, reminder, archive, trash, pin, color, user_id)
    VALUES(v_title, v_note, v_image, v_reminder, v_acrhive, v_trash, v_pin, v_color, v_user_id);
    SELECT LAST_INSERT_ID();
END$$





