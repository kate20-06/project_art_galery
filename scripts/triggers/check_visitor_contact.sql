create or replace
function check_visitor_contact()
returns trigger as $$
begin
    if exists (
select
	1
from
	art_galery.Visitors
where
	Email = NEW.Email
	and ID <> NEW.ID) then
        raise exception 'Посетитель с таким email уже существует';
end if;

if exists (
select
	1
from
	art_galery.Visitors
where
	Phone = NEW.Phone
	and ID <> NEW.ID) then
        raise exception 'Посетитель с таким телефоном уже существует';
end if;

return new;
end;

$$ language plpgsql;

create trigger visitor_contact_check
before
insert
	or
update
	on
	art_galery.Visitors
for each row execute function check_visitor_contact();

-- тригер проверяет что номер телефона и почта не встречались в базе данных