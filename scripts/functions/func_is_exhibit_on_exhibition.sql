create or replace
function art_galery.is_exhibit_on_exhibition(
    p_exhibit_id INTEGER,
    p_check_date DATE
)
returns VARCHAR(3)
language plpgsql
as $$
declare
    is_available BOOLEAN;

begin
    select
	not exists (
	select
		1
	from
		art_galery.exhibit_exhibitions
	where
		Exhibit_ID = p_exhibit_id
		and p_check_date between Addition_Date and Removal_Date
    )
into
	is_available;

if is_available then 
        return 'no';
else 
        return 'yes';
end if;
end;

$$;

-- проверяем участвует ли экспонат в выставках на данный период