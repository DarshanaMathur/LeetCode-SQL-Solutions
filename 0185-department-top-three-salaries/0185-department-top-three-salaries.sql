# Write your MySQL query statement below
with ranked_sal as (
    select *, dense_rank() over (partition by departmentID order by salary  desc) as ranked
    from employee
)

select d.name as Department, e.name as Employee, e.salary as Salary
from ranked_sal rs join employee e on rs.id = e.id join department d on rs.departmentId = d.id
where ranked < 3
order by Department