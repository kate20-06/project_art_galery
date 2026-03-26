create index idx_exhibits_artist_name on
Exhibits(Artist_ID,
Name);
--1. индекс для ускорения поиска экспонатов по автору и названию

create index idx_tickets_visitor_status_date on
Tickets(Visitor_ID,
Status,
Purchase_Date);
--2. индекс для поиска актуальных билетов посетителей
