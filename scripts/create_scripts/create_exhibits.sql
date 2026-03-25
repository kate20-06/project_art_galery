create table Art_Galery.Exhibits (
    ID INTEGER primary key,
    Name VARCHAR(200) not null,
    Year_of_Creation INTEGER,
    Description_Link VARCHAR(200) not null,
    Artist_ID INTEGER references Art_Galery.Artists(ID)
);