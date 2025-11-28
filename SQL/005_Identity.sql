



drop table Products;

create table Products
(
	--id int primary key identity(1, 1),
	id uniqueidentifier primary key,
	name nvarchar(MAX),
	price float
)

insert into Products values(newid(), 'Iphone', 24324);

select * from Products;

delete from Products;

truncate table Products;

select newid()

select top 1 * from users order by newid();

