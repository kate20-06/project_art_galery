create table Art_Galery.Tickets (
    ID INTEGER primary key,
    Exhibition_ID INTEGER references Art_Galery.Exhibitions(ID),
    Visitor_ID INTEGER references Art_Galery.Visitors(ID),
    Purchase_Date DATE not null,
    Price DECIMAL(10, 2) not null check (Price > 0),
    Status VARCHAR(200) not null check (Status in ('bought', 'cancelled', 'used'))
);