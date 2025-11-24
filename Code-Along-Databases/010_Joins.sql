
drop table Countries;
drop table Cities;

create table Countries
(
	Id int,
	Name nvarchar(max)
);

insert into Countries values(1, 'Sweden');
insert into Countries values(2, 'Norway');
insert into Countries values(3, 'Denmark');
insert into Countries values(4, 'Finland');

create table Cities
(
	Id int,
	Name nvarchar(max),
	CountryId int
);

insert into Cities values(1, 'Stockholm', 1);
insert into Cities values(2, 'Gothenburg', 1);
insert into Cities values(3, 'Oslo', 2);
insert into Cities values(4, 'Bergen', 2);
insert into Cities values(5, 'Stavanger', 2);
insert into Cities values(6, 'Copenhagen', 3);
insert into Cities values(7, 'London', 5);

/*
select * from Countries;
select * from Cities;
*/

select 
	ci.Id,
	ci.Name as 'City',
	co.Name as 'Country'
from 
	Cities ci
	join Countries co on ci.CountryId = co.Id
	where
		ci.Id < 5;


		
/*
Övningsuppgift med join och aggregering
skriv en SELECT-sats som ger följande kollumner (1 rad för varje land i Countries):
1 - Landets ID
2 - Landets Namn
3 - Antal städer som ligger i landet.
4 - En kommaseparerad text med namnen på städerna i landet.
*/

SELECT
	co.Id,
	co.Name,
	count(ci.Id) as NumberOfCities,
	isnull(string_agg(ci.Name, ', '), '-') as Cities

FROM
	Countries co
	left join Cities ci on co.Id = ci.CountryId
GROUP BY
	co.Id,
	co.Name
ORDER BY
	co.Id;

