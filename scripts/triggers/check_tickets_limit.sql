create or replace
function check_tickets_limit()
returns trigger as $$
declare
    tickets_count INTEGER;

max_tickets INTEGER := 15;
begin
    select
	COUNT(*)
into
	tickets_count
from
	art_galery.Tickets
where
	Exhibition_ID = NEW.Exhibition_ID;

if tickets_count >= max_tickets then
        raise exception 'Достигнуто максимальное количество билетов на выставку';
end if;

return new;
end;

$$ language plpgsql;

create trigger tickets_limit_check
before
insert or update of exhibition_id
	on
	art_galery.Tickets
for each row execute function check_tickets_limit();

-- триггер проверяет не достигнуто ли максимальное количество билетов на выставку