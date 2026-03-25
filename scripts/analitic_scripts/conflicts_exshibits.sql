select
	ex.ID as exhibit_id,
	ex.Name as exhibit_name,
	COUNT(*) as conflict_count
from
	art_galery.Exhibit_Exhibitions ee1
join 
    art_galery.Exhibit_Exhibitions ee2 
    on
	ee1.Exhibit_ID = ee2.Exhibit_ID
	and ee1.Exhibition_ID < ee2.Exhibition_ID
	and ee1.Addition_Date < ee2.Removal_Date
	and ee1.Removal_Date > ee2.Addition_Date
join 
    art_galery.Exhibits ex on
	ee1.Exhibit_ID = ex.ID
group by
	ex.ID,
	ex.Name
having
	COUNT(*) > 0
order by
	conflict_count desc;

--проверяет что экспонат не находится на нескольких выставках сразу
--(в случайно нагенерированных данных видно что пересечений много)