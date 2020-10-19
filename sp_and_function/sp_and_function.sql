-- 1. Stored Procedure
    --  Stored procedure is a prepared SQL code that we can save, so the code can be reused over and over again. 
    --  SHOW PROCEDURE STATUS WHERE db = 'practice'; (display all procedure)
        -- a. Create procedure to insert data into employee table
        CREATE PROCEDURE insert_emp(em_id integer, em_name varchar(20), em_salary integer, em_dept integer)
            INSERT INTO employee(emp_id , name, salary, dept_no) values(em_id, em_name, em_salary, em_dept);

        -- b. create procedure to display all data from employee table
        CREATE PROCEDURE display_all()
            SELECT * FROM employee;

        -- c. Create procedure to display salary by user id
            --  set delimiter
                DELIMITER $$
                CREATE PROCEDURE display_salary(IN em_id integer, OUT emp_salary integer)
                BEGIN

                SELECT salary into emp_salary
                from employee
                WHERE emp_id = em_id;

                END$$

            -- reset delimiter
                DELIMITER ; 

            -- call procedure
                call display_salary(202, @sal);
            -- show sal
                select @sal;

-- 2. Function
    --   Function is used to perform specific task and return a value or result. 
    --   There are 2 type of functions, in-built and user defined .
    --   eg. aggrigate function

        -- a. Create function to display avg salary from perticular dept
            DELIMITER $$
            CREATE FUNCTION avg_salary(dept_num int)
            RETURNS DECIMAL DETERMINISTIC

            BEGIN

            DECLARE avg DECIMAL;

            SELECT avg(salary) into avg
            FROM employee 
            WHERE dept_no = dept_num;

            return avg;
            END;$$

        -- b. display max salary of a department by taking department name as input
            CREATE FUNCTION max_salary_of_dept(dep_name varchar(20))
            RETURNS integer DETERMINISTIC

            BEGIN

            DECLARE sal DECIMAL;

            SELECT max(salary) INTO sal
            FROM employee
            INNER JOIN dept
            ON employee.dept_no = dept.dept_no
            WHERE dept.dept_name = dep_name;

            RETURN sal;
            END$$

        -- c. display salary with 15% hike
            CREATE FUNCTION sal_with_hike(id int)
            RETURNS DECIMAL DETERMINISTIC

            BEGIN

            DECLARE final_sal DECIMAL;

            SELECT (salary * 0.15) + salary INTO final_sal
            FROM employee
            WHERE emp_id = id;

            return final_sal;
            END$$