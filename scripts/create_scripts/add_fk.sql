alter table Art_Galery.Exhibits add foreign key (Artist_ID) references Art_Galery.Artists(ID);

alter table Art_Galery.Exhibitions add foreign key (Branch_ID) references Art_Galery.Branches(ID);

alter table Art_Galery.Exhibit_Exhibitions add foreign key (Exhibit_ID) references Art_Galery.Exhibits(ID);

alter table Art_Galery.Exhibit_Exhibitions add foreign key (Exhibition_ID) references Art_Galery.Exhibitions(ID);

alter table Art_Galery.Tickets add foreign key (Exhibition_ID) references Art_Galery.Exhibitions(ID);

alter table Art_Galery.Tickets add foreign key (Visitor_ID) references Art_Galery.Visitors(ID);

alter table Art_Galery.Exhibitions_History add foreign key (Branch_ID) references Art_Galery.Branches(ID);