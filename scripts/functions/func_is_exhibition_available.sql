create or replace
function art_galery.is_exhibition_available(
    p_exhibition_id INTEGER
)
returns VARCHAR(3) as $$
declare
    v_start_date DATE;

v_end_date DATE;

begin
    select
	Start_Date,
	End_Date 
    into
	v_start_date,
	v_end_date
from
	art_galery.Exhibitions
where
	ID = p_exhibition_id;

return case
	when CURRENT_DATE between v_start_date and v_end_date 
                then 'yes'
	else 'no'
end;
end;

$$ language plpgsql;

-- функция проверяет доступна ли выставка для посещения в данный момент

