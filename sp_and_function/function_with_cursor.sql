-- get salary with hike for different salary level

DELIMITER $$
CREATE FUNCTION fn_salary_with_hike(em_id int)
RETURNS DECIMAL DETERMINISTIC
BEGIN
DECLARE final_salary DECIMAL default 0;
DECLARE cur_sal CURSOR for 
    SELECT salary FROM employee WHERE emp_id = em_id;
-- handeling exception if not found
DECLARE continue handler for NOT FOUND set final_salary = -1;
DECLARE continue handler for SQLSTATE '42S22' set final_salary = -2;

OPEN cur_sal;
FETCH cur_sal into final_salary;
IF final_salary <= 1800 then
    set final_salary = (final_salary * 0.15) + final_salary;
ELSEIF final_salary >= 2000 then
    set final_salary = (final_salary * 0.20) + final_salary;
ELSE 
set final_salary = (final_salary * 0.18) + final_salary;
END if;
CLOSE cur_sal;
return final_salary;
END$$