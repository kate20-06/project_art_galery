select
	b.Name_Branch,
	e.name_exhibition,
	e.Start_Date,
	e.End_Date
from
	art_galery.Branches b
left join art_galery.Exhibitions e on
	b.ID = e.Branch_ID
order by
	b.Name_Branch;

--сопоставляем всем филиалам выставки, которые там проводятся или null если выставок сейчас нет