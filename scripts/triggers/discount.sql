create or replace
function apply_regular_discount()
returns trigger as $$
declare
    visits_count INTEGER;

begin
    select
	COUNT(*)
into
	visits_count
from
	art_galery.Tickets
where
	Visitor_ID = NEW.Visitor_ID;

if visits_count > 5 then
        NEW.Price := NEW.Price * 0.9;
        raise notice 'Применена скидка 10%% для постоянного посетителя';
end if;

return new;
end;

$$ language plpgsql;

create trigger regular_visitor_discount
before
insert
	on
	art_galery.Tickets
for each row execute function apply_regular_discount();


-- тригер делает 10% скику постоянным покупателям