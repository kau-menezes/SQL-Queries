CREATE TABLE Room (
	IDRoom Int Primary Key Identity, 
	RoomName varchar(50), 
	Capacity Int
)


CREATE TABLE TableEvent (IDEvent Int Primary Key Identity, IDRoom Int Foreign Key REFERENCES Room(IDRoom) NOT NULL, Description varchar(50))

insert into Room 
	(RoomName, Capacity) 
values 
	('A', 20),
	('B', 10),
	('C', 40),
	('D', 25),
	('E', 5);



select * from Room
select * from TableEvent