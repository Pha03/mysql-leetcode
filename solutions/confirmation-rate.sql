CREATE TABLE IF NOT EXISTS Signups (user_id int, time_stamp datetime);
CREATE TABLE IF NOT EXISTS Confirmations (
    user_id int,
    time_stamp datetime,
    ACTION text CHECK(ACTION IN ('confirmed', 'timeout'))
);
INSERT INTO
    Signups (user_id, time_stamp)
VALUES
    ('3', '2020-03-21 10:16:13');
INSERT INTO
    Signups (user_id, time_stamp)
VALUES
    ('7', '2020-01-04 13:57:59');
INSERT INTO
    Signups (user_id, time_stamp)
VALUES
    ('2', '2020-07-29 23:09:44');
INSERT INTO
    Signups (user_id, time_stamp)
VALUES
    ('6', '2020-12-09 10:39:37');
INSERT INTO
    Confirmations (user_id, time_stamp, ACTION)
VALUES
    ('3', '2021-01-06 03:30:46', 'timeout');
INSERT INTO
    Confirmations (user_id, time_stamp, ACTION)
VALUES
    ('3', '2021-07-14 14:00:00', 'timeout');
INSERT INTO
    Confirmations (user_id, time_stamp, ACTION)
VALUES
    ('7', '2021-06-12 11:57:29', 'confirmed');
INSERT INTO
    Confirmations (user_id, time_stamp, ACTION)
VALUES
    ('7', '2021-06-13 12:58:28', 'confirmed');
INSERT INTO
    Confirmations (user_id, time_stamp, ACTION)
VALUES
    ('7', '2021-06-14 13:59:27', 'confirmed');
INSERT INTO
    Confirmations (user_id, time_stamp, ACTION)
VALUES
    ('2', '2021-01-22 00:00:00', 'confirmed');
INSERT INTO
    Confirmations (user_id, time_stamp, ACTION)
VALUES
    ('2', '2021-02-28 23:59:59', 'timeout');
WITH RECURSIVE cases AS (
    SELECT
        'confirmed' AS st
    UNION
    ALL
    SELECT
        'timeout'
),
p AS (
    SELECT
        ca.st,
        s.user_id
    FROM
        cases ca
        LEFT JOIN Signups s ON 1 = 1
),
table1 AS (
    SELECT
        p.st,
        p.user_id,
        COUNT(c.action) AS cnt
    FROM
        p
        LEFT JOIN Confirmations c ON p.st = c.action
        AND p.user_id = c.user_id
    GROUP BY
        p.st,
        p.user_id
)
SELECT
    user_id,
    round(
        COALESCE(
            1.0 * SUM(
                CASE
                    WHEN st = 'confirmed' THEN cnt
                    ELSE 0
                END
            ) / SUM(cnt),
            0.0
        ),
        2
    ) AS confirmation_rate
FROM
    table1
GROUP BY
    user_id