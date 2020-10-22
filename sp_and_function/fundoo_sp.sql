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


-- create note and return note id