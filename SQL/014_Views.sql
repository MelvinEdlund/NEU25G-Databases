--drop table NewUsers
--select * into NewUsers from Users;

--Vy / View

alter view MyView with schemabinding as
select 
	Id as ' Personnummer',
	concat(FirstName, ' ', LastName) as 'Namn',
	Email
from 
	dbo.NewUsers
where
	ID > '800101';


drop table NewUsers;

select * from MyView;

drop view MyView;

