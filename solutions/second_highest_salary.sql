-- Active: 1744558639377@@db@3306@mydatabase;
Create table If Not Exists Employee (id int, salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');


select (
    select distinct salary 
    from Employee
    order by salary DESC
    limit 1 offset 1 
)
as SecondHighestSalary;