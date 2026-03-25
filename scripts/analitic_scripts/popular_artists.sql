select
	a.ID,
	a.First_Name,
	a.Last_Name,
	COUNT(e.ID) as Exhibits_Count
from
	art_galery.Artists a
join 
    art_galery.Exhibits e on
	a.ID = e.Artist_ID
group by
	a.ID
having
	COUNT(e.ID) > 2
order by
	Exhibits_Count desc;

--пусть популярным считается художник у которого более двух экспонатов. Найдем всех популярных художников