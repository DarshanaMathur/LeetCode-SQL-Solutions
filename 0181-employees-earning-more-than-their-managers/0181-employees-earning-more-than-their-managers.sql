# Write your MySQL query statement below
select e1.name 'Employee'
from employee e1 join employee e2 on e1.managerId  = e2.id and e1.salary > e2.salary