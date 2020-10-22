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



