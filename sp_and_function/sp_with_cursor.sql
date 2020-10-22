-- Create a cursor to display employee with salary
DELIMITER $$
CREATE PROCEDURE proc_emp_sal()
BEGIN
DECLARE v_name varchar(20);
DECLARE v_salary integer;
DECLARE v_finished integer default 0;
DECLARE c1 CURSOR for 
    SELECT name, salary 
    from employee;
-- If not found exception occoured then loop breaking condition 
DECLARE continue handler for NOT FOUND set v_finished = 1;

OPEN c1;

-- Loop through all record
get_emp: LOOP
    FETCH c1 into v_name, v_salary;
    if v_finished = 1 THEN
        -- leave loop if condition satisfied
        leave get_emp;
    end if;
    SELECT  concat(v_name, concat('-', v_salary));
END LOOP get_emp;
CLOSE c1;
END$$

-- Create cursor to display employee of perticular dept
DELIMITER $$
CREATE PROCEDURE sp_get_emp_for_dept(IN dep_name varchar(20), INOUT emp_list varchar(2000))
BEGIN
DECLARE v_ename varchar(20);
DECLARE v_finished integer default 0;
DECLARE c2 CURSOR for 
        select name 
        FROM employee 
        WHERE dept_no = (SELECT dept_no 
                        FROM dept 
                        WHERE dept_name = dep_name);
-- If not found exception occoured then loop breaking condition 
DECLARE continue handler for NOT FOUND set v_finished = 1;
OPEN c2;
-- Loop through all record
getDeptEmp : LOOP
    FETCH c2 INTO v_ename;
    if v_finished = 1 
    THEN leave getDeptEmp;
    end if;
    set emp_list =  concat(emp_list, concat(' ', v_ename));
END LOOP getDeptEmp;
CLOSE c2;
END$$



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