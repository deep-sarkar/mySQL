-- CROSS/CARTESIAN join:

-- - Syntax:
--         SELECT ... FROM table1 CROSS JOIN table2 ...
--     - A CROSS JOIN matches every row of the first table with every row of the second table.
--     - If table A contains m number of record and table B contains n number of record then joined table will contain
--         m*n records.
--     - The column number in resultant will be sum of number of column for table A and table B.


-- cross join note and user and display record for admin

SELECT username, title
FROM note_note
CROSS JOIN auth_user
WHERE username = 'admin';