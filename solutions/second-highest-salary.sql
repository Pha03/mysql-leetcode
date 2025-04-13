Create table If Not Exists Employee (id int, salary int);
insert into
    Employee (id, salary)
values ('1', '100');
insert into
    Employee (id, salary)
values ('2', '200');
insert into
    Employee (id, salary)
values ('3', '300');

select e.salary from Employee  e 