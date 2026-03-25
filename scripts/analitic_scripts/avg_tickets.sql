select
	e.name_exhibition as exhibition_name,
	t.Purchase_Date,
	t.Price,
	AVG(t.Price) over (partition by t.Exhibition_ID) as avg_price_for_exhibition,
	t.Price - AVG(t.Price) over (partition by t.Exhibition_ID) as price_difference
from
	art_galery.Tickets t
join 
    art_galery.Exhibitions e on
	t.Exhibition_ID = e.ID
order by
	e.name_exhibition ,
	t.Purchase_Date;

--отклонение цены билета от средней цены по выставке