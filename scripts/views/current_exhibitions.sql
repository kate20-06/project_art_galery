create or replace
view current_exhibitions as
select
	e.ID,
	e.name_exhibition as exhibition_name,
	b.Name_Branch as branch_name,
	b.Address as branch_address,
	e.Start_Date,
	e.End_Date,
	COUNT(ee.Exhibit_ID) as exhibits_count,
	e.Description
from
	art_galery.Exhibitions e
join 
    art_galery.Branches b on
	e.Branch_ID = b.ID
left join 
    art_galery.Exhibit_Exhibitions ee on
	e.ID = ee.Exhibition_ID
where
	CURRENT_DATE between e.Start_Date and e.End_Date
	and (ee.Removal_Date is null
		or CURRENT_DATE <= ee.Removal_Date)
group by
	e.ID,
	e.name_exhibition,
	b.Name_Branch,
	b.Address,
	e.Start_Date,
	e.End_Date,
	e.Description;

-- дает информацию о выставках которые происходят в настоящее время