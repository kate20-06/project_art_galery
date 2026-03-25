create table Art_Galery.Exhibit_Exhibitions (
    ID INTEGER primary key,
    Exhibit_ID INTEGER references Art_Galery.Exhibits(ID),
    Exhibition_ID INTEGER references Art_Galery.Exhibitions(ID),
    Addition_Date DATE not null,
    Removal_Date DATE not null,
    check (Addition_Date < Removal_Date)
);