# Write your MySQL query statement below
with same_inv as (select tiv_2015
from insurance
group by tiv_2015
having count(*) > 1),

same_city as (
    select lat, lon
    from insurance
    group by lat, lon
    having count(*) = 1
)

select round(sum(tiv_2016),2) as tiv_2016
from insurance 
where tiv_2015 in (select * from same_inv) and (lat,lon) in (select * from same_city)