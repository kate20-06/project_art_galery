create or replace
procedure art_galery.update_ticket_status(
    p_ticket_id INTEGER,
    p_new_status VARCHAR(200)
)
as $$
begin
    update
	art_galery.Tickets
set
	Status = p_new_status
where
	ID = p_ticket_id;
end;

$$ language plpgsql;
