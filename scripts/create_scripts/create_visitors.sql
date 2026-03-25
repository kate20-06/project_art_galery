CREATE TABLE Art_Galery.Visitors (
    ID INTEGER PRIMARY KEY,
    First_Name VARCHAR(200) NOT NULL,
    Last_Name VARCHAR(200) NOT NULL,
    Email VARCHAR(200) CHECK (Email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    Phone VARCHAR(20) CHECK (Phone ~ '^\+7\s\(\d{3}\)\s\d{3}-\d{2}-\d{2}$')
);