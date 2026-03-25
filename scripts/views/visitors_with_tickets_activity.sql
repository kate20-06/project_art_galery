create view visitors_with_tickets_activity as
select
	v.ID as visitor_id,
	v.First_Name,
	v.Last_Name,
	v.Email,
	v.Phone,
	COUNT(t.ID) as total_tickets,
	SUM(case when t.Status = 'used' then 1 else 0 end) as used_tickets,
	SUM(case when t.Status = 'bought' then 1 else 0 end) as active_tickets,
	SUM(case when t.Status = 'cancelled' then 1 else 0 end) as cancelled_tickets,
	SUM(t.Price) as total_spent,
	MAX(t.Purchase_Date) as last_purchase_date
from
	art_galery.Visitors v
left join 
    art_galery.Tickets t on
	v.ID = t.Visitor_ID
group by
	v.ID,
	v.First_Name,
	v.Last_Name,
	v.Email,
	v.Phone;

-- помогает анализировать активность каждого посетителя