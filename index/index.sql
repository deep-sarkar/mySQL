-- Indexs are used to retrive data in faster way. It create a unique address for each record of table.

-- 1. Clustered
    -- if primary key is present in table by default it will create clustered index .
    -- Clustered index is unique and it will assign data in ascending order.
    -- It does not create any new table to store index value.
    -- Get stored in physical memory.
    -- Table can have only one clustered key.

-- 2. Non - Clustered
    -- Index rather than clustered index is called non cullestered index.
    -- It does not create index in physical table.
    -- To store it create logical pointer in db. 
    -- Table can have multiple non clustered key.
    ex. CREATE index IX_ename_dno ON employee(name asc, dept_no asc);


    -- DISPLAY ALL INDEX
        SHOW index from employee;