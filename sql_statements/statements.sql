-- 1.DDL - Data Defination language
    -- Modify object like database, table, views, procedures etc.
    -- Implicit commit after execution
    -- Can not be roll back once executed

    -- a. CREATE
            CREATE TABLE dept(dept_no integer(3) NOT NULL PRIMARY KEY,
                    dept_name varchar(10) NOT NULL
                    );
    -- b. ALTER
            -- Add new column
                alter table dept add location varchar(24);
            -- Alter column datatype
                alter table dept 
                MODIFY COLUMN dept_name varchar(15);
    -- c. DROP
        -- DROP table/database
            DROP TABLE table_name;
        -- DROP COLUMN
            ALTER TABLE dept 
            DROP COLUMN LOCATION;
    -- d. TRUNCATE
            TRUNCATE table table_name;

    -- e.RENAME
            ALTER TABLE dept RENAME department;

-- 2.DML - Data Manipulation Language
    -- Modify data inside table.
    -- Are part of transaction so required global setting or explicit commit 
    -- Can be rollback if part of active transaction

    -- a. INSERT
        INSERT INTO dept(dept_no, dept_name) 
        VALUES(101,'developer');
    -- b. UPDATE
        UPDATE employee 
        set name = 'raj' 
        where emp_id = 201;

    -- c. DELETE
        DELETE FROM emp where emp_id = 201;
    -- d. CALL
        CALL stored_procedure;

-- 3. DQL - Data Query Language
    -- a. SELECT
        SELECT * from employee;

-- 4. TCL 
    a. BEGIN
    b. SAVEPOINT
    c. ROLLBACK
    d. COMMIT