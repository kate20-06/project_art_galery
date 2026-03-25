select
	ex.name_exhibition ,
	ex.Start_Date,
	ex.End_Date
from
	art_galery.Exhibitions ex
where
	ex.ID in (
	select
		ee.Exhibition_ID
	from
		Exhibit_Exhibitions ee
	where
		ee.Exhibit_ID in (
		select
			e.ID
		from
			art_galery.Exhibits e
		where
			e.Year_of_Creation > 2000
    )
);

--найдем выставки современного искусства