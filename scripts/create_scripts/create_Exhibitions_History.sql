create table Art_Galery.Exhibitions_History (
    ID INTEGER,
    Name VARCHAR(200) not null,
    Start_Date DATE not null,
    End_Date DATE not null,
    Branch_ID INTEGER references Art_Galery.Branches(ID),
    Description text,
    History_DTTM TIMESTAMP not null, check (Start_Date < End_Date),
    primary key (ID, History_DTTM)
);