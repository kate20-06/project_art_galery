create table Art_Galery.Branches (
    ID INTEGER primary key,
    Name_Branch VARCHAR(200) not null,
    Address VARCHAR(200) not null,
    Phone VARCHAR(20) check (Phone ~ '^\+7\s\(\d{3}\)\s\d{3}-\d{2}-\d{2}$'),
    Email VARCHAR(200) check (Email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    Description_Link VARCHAR(200)
);