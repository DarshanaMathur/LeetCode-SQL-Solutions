# Write your MySQL query statement below
with can_req as (select t.request_at, count(*) as no_of_canc
from trips t  join users u1 on t.client_id = u1.users_id join users u2 on t.driver_id = u2.users_id
where status <> 'completed' and u1.banned = 'No' and u2.banned = 'No'
group by t.request_at), 

tot_req as (select t.request_at, count(*) as no_of_req
from trips t  join users u1 on t.client_id = u1.users_id join users u2 on t.driver_id = u2.users_id
where u1.banned = 'No' and u2.banned = 'No'
group by t.request_at )

select tr.request_at as "Day", case when no_of_canc/ no_of_req is null then 0 else round(no_of_canc/ no_of_req,2)  end as 'Cancellation Rate' 
from tot_req tr left join can_req cr on tr.request_at = cr.request_at 
where tr.request_at between "2013-10-01" and "2013-10-03"