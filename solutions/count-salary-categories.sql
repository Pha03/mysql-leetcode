CREATE TABLE IF NOT EXISTS Accounts (account_id int, income int);
INSERT INTO
    Accounts (account_id, income)
VALUES
    ('3', '108939');
INSERT INTO
    Accounts (account_id, income)
VALUES
    ('2', '12747');
INSERT INTO
    Accounts (account_id, income)
VALUES
    ('8', '87709');
INSERT INTO
    Accounts (account_id, income)
VALUES
    ('6', '91796');
WITH categories AS (
    SELECT
        "Low Salary" AS category
    UNION
    ALL
    SELECT
        "Average Salary"
    UNION
    ALL
    SELECT
        "High Salary"
)
SELECT
    c.category AS category,
    count(a.account_id) AS accounts_count
FROM
    categories c
    LEFT JOIN Accounts a ON CASE
        WHEN a.income < 20000
        AND a.income >= 0 THEN "Low Salary"
        WHEN a.income >= 20000
        AND a.income <= 50000 THEN "Average Salary"
        ELSE "High Salary"
    END = c.category
GROUP BY
    c.category;