select
	Name
from
	art_galery.Exhibits e
where
	not exists (
	select
		ee.id
	from
		art_galery.Exhibit_Exhibitions ee
	where
		ee.Exhibit_ID = e.ID);

--ищем экспонаты которые никогда не выставлялись