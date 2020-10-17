-- Create dept table
CREATE TABLE dept(dept_no integer(3) NOT NULL PRIMARY KEY,
                    dept_name varchar(15) NOT NULL
                    );


CREATE TABLE employee(
    emp_id integer(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(20) NOT NULL,
    salary integer(6) NOT NULL,
    dept_no integer(3),
    FOREIGN KEY (dept_no) REFERENCES dept(dept_no)
    ON DELETE NO ACTION
);

--  mysql -u deep -p practice < /home/deep/Documents/mysql/practice/emp_dept_relation.sql (create table in db)
