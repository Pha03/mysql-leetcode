CREATE TABLE IF NOT EXISTS Followers(user_id int, follower_id int);
INSERT INTO
    Followers (user_id, follower_id)
VALUES
    ('0', '1');
INSERT INTO
    Followers (user_id, follower_id)
VALUES
    ('1', '0');
INSERT INTO
    Followers (user_id, follower_id)
VALUES
    ('2', '0');
INSERT INTO
    Followers (user_id, follower_id)
VALUES
    ('2', '1');
SELECT
    f.user_id AS user_id,
    count(f.follower_id) AS followers_count
FROM
    Followers f
GROUP BY
    f.user_id
ORDER BY
    f.user_id;