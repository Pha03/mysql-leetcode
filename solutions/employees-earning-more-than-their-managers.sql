CREATE TABLE IF NOT EXISTS Employee (
    id int,
    name varchar(255),
    salary int,
    managerId int
);
INSERT INTO
    Employee (id, name, salary, managerId)
VALUES
    ('1', 'Joe', '70000', '3');
INSERT INTO
    Employee (id, name, salary, managerId)
VALUES
    ('2', 'Henry', '80000', '4');
INSERT INTO
    Employee (id, name, salary, managerId)
VALUES
    ('5', 'sriram', '10000', '4');
INSERT INTO
    Employee (id, name, salary, managerId)
VALUES
    ('3', 'Sam', '60000', NULL);
INSERT INTO
    Employee (id, name, salary, managerId)
VALUES
    ('4', 'Max', '90000', NULL);
SELECT
    e.name AS Employee
FROM
    Employee e
    JOIN Employee m ON e.managerId = m.id
WHERE
    e.salary > m.salary;