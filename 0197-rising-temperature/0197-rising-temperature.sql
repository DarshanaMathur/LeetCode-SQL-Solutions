select *, datediff(day, recordDate, lag(recordDate) over()) as prev_date
from (select *
from weather
order by recordDate) temp1