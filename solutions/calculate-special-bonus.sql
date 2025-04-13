CREATE TABLE IF NOT EXISTS Employees (employee_id int, name varchar(30), salary int);
INSERT INTO
    Employees (employee_id, name, salary)
VALUES
    ('2', 'Meir', '3000');
INSERT INTO
    Employees (employee_id, name, salary)
VALUES
    ('3', 'Michael', '3800');
INSERT INTO
    Employees (employee_id, name, salary)
VALUES
    ('7', 'Addilyn', '7400');
INSERT INTO
    Employees (employee_id, name, salary)
VALUES
    ('8', 'Juan', '6100');
INSERT INTO
    Employees (employee_id, name, salary)
VALUES
    ('9', 'Kannon', '7700');
SELECT
    e.employee_id AS employee_id,
    CASE
        WHEN e.name NOT LIKE 'M%'
        AND e.employee_id % 2 = 1 THEN e.salary
        ELSE 0
    END AS bonus
FROM
    Employees e
ORDER BY
    e.employee_id;