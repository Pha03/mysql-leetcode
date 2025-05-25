Create table If Not Exists Users (user_id int, name varchar(40));
Truncate table Users;
insert into Users (user_id, name) values ('1', 'aLice');
insert into Users (user_id, name) values ('2', 'bOB');


select user_id, (CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2)))) as name
from users
order by user_id;
