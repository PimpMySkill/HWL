select *,
i.brief as 'ФО', 
case when max(d.indatetime) is null
then 0
else max(d.indatetime) as 'Дата последней операции'
end
min(d.indatetime) as 'Дата первой операции'
case when count(d.dealid) is null
then 'Отсутствуют операции'
else cast (count(d.dealid) as char(20)) as 'Количество сделок'
end --count(d.dealid)
from tinstrument i with (nolock)
left join tdeal d with(nolock)
on i.instrumentid = d.instrumentid
group by i.brief

select * from tDeal where dealdate = getdate()