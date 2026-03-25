select
	e.name_exhibition as exhibition_name,
	COUNT(t.ID) as tickets_sold,
	dense_rank() over (
order by
	COUNT(t.ID) desc) as dense_rank_popularity
from
	art_galery.Exhibitions e
join 
    art_galery.Tickets t on
	e.ID = t.Exhibition_ID
group by
	e.ID,
	e.name_exhibition
order by
	tickets_sold desc;

--ранжирует выставки по колличеству проданных билетов