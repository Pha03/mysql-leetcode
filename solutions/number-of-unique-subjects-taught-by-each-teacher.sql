CREATE TABLE IF NOT EXISTS Teacher (teacher_id int, subject_id int, dept_id int);
INSERT INTO
    Teacher (teacher_id, subject_id, dept_id)
VALUES
    ('1', '2', '3');
INSERT INTO
    Teacher (teacher_id, subject_id, dept_id)
VALUES
    ('1', '2', '4');
INSERT INTO
    Teacher (teacher_id, subject_id, dept_id)
VALUES
    ('1', '3', '3');
INSERT INTO
    Teacher (teacher_id, subject_id, dept_id)
VALUES
    ('2', '1', '1');
INSERT INTO
    Teacher (teacher_id, subject_id, dept_id)
VALUES
    ('2', '2', '1');
INSERT INTO
    Teacher (teacher_id, subject_id, dept_id)
VALUES
    ('2', '3', '1');
INSERT INTO
    Teacher (teacher_id, subject_id, dept_id)
VALUES
    ('2', '4', '1');
SELECT
    t.teacher_id AS teacher_id,
    count(DISTINCT t.subject_id) AS cnt
FROM
    Teacher t
GROUP BY
    t.teacher_id;