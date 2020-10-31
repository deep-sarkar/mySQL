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


CREATE TABLE note(
    id integer(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    title varchar(200) NULL,
    note varchar(2000) NULL,
    image varchar(200) NULL,
    reminder timestamp NULL,
    archive tinyint(1) NULL,
    trash tinyint(1) NULL,
    pin tinyint(1) NULL,
    color varchar(7) NULL DEFAULT('#ffffff'),
    user_id integer(4) NOT NULL);
    