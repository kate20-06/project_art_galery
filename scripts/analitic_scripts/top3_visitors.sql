select
	v.First_Name,
	v.Last_Name,
	count(t.ID) as Tickets_Count
from
	Art_Galery.Visitors v
join Art_Galery.Tickets t on
	v.ID = t.Visitor_ID
group by
	v.ID
order by
	Tickets_Count desc
limit 3;

-- находим трех самых активных посетителей