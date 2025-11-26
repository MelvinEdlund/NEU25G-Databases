
drop table Users;


create table Users
(
	Id int,
	Username nvarchar(20) check(len(Username) >= 3) default('default_user'),
	CreatedAt datetime2 default(getdate()),
	constraint PK_Users primary key (Id, Username)
)

insert into Users (Id, Username) values (1, 'user');

insert into Users (Id, CreatedAt) values (2, getdate());

insert into Users (Id, Username, CreatedAt) values (3, 'Sebbi', SYSDATETIME());

update Users set Username = 'user2' where Id = 2 

select * from Users;

