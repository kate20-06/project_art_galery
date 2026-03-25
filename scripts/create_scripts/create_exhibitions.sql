create table Art_Galery.Exhibitions (
    ID INTEGER primary key,
    Name_Exhibition VARCHAR(200) not null,
    Start_Date DATE not null,
    End_Date DATE not null,
    Branch_ID INTEGER references Art_Galery.Branches(ID),
    Description text, check (Start_Date < End_Date)
);