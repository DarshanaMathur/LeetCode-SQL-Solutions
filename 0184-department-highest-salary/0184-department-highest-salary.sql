with ranked_sal as(
    select *, rank() over(partition by departmentId order by salary desc) as ranked
    from employee
)

select d.name as Department, rs.name as Employee, rs.salary as Salary
from ranked_sal rs join department d on rs.departmentId = d.id
where rs.ranked = 1