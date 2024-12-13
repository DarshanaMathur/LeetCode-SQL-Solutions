# Write your MySQL query statement below
select id, 'Root' as type
from tree
where p_id is null

union all

select id, 'Inner' as type
from tree
where id in (select p_id from tree) and p_id is not null

union all 

select id, 'Leaf' as type
from tree
where id not in (# Write your MySQL query statement below
select id
from tree
where p_id is null

union all

select id
from tree
where id in (select p_id from tree) and p_id is not null)