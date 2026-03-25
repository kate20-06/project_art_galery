select
	eh.ID,
	b.Name_Branch as branch_name,
	eh.Start_Date,
	eh.End_Date,
	eh.History_DTTM as change_time,
	lag(eh.History_DTTM) over (partition by eh.ID
order by
	eh.History_DTTM) as previous_change_time
from
	art_galery.Exhibitions_History eh
join 
    art_galery.Branches b on
	eh.Branch_ID = b.ID
order by
	eh.ID,
	eh.History_DTTM desc
;

--упорядочиваем историю изменений