select
	e.id as exhibition_id,
	e.name_exhibition as name_exhibition,
	sum(t.price) as revenue
from
	Art_Galery.Tickets t
join art_galery.exhibitions e
on
	e.id = t.exhibition_id
group by
	e.id
union
select
	null as exhibition_id,
	null as name_exhibition,
	sum(price) as revenue
from
	Art_Galery.Tickets t
order by
	exhibition_id
;
--выручка каждой выставки