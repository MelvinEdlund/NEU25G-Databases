
-- Exercise 1 Game Of Thrones
SELECT * FROM GameOfThrones

SELECT 
    Title,
    'S' + FORMAT(Season, '00') + 
    'E' + FORMAT(EpisodeInSeason, '00') 
AS 
    Episode
--    concat('S', FORMAT(Season, '00'), 
--           'E', FORMAT(EpisodeInSeason, '00')) 
--AS 
--    Episode
FROM 
    GameOfThrones;

--Exercise 2 
--select * into UsersCopy from Users;

UPDATE UsersCopy
SET UserName = LOWER(
	SUBSTRING(FirstName, 1, 2) +
	SUBSTRING(LastName, 1, 2)
);

SELECT * FROM UsersCopy;

--Exercise 3
--select * into AirportsCopy from Airports;

UPDATE AirportsCopy
SET
    Time = ISNULL(Time, '-'),
    DST = ISNULL(DST, '-');

SELECT * FROM AirportsCopy;

--Exercise 4
--select * into ElementsCopy from Elements;

DELETE FROM ElementsCopy
Where 
      Name IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
   OR Name LIKE 'd%' 
   OR Name LIKE 'k%'
   OR Name LIKE 'm%'
   OR Name LIKE 'o%'
   OR Name LIKE 'u%';

SELECT * FROM ElementsCopy
order by Name;

--Exercise 5
drop table ElementsCopy;

select Symbol, 
    Name,
    case
        when Name like Symbol + '%' then 'Yes'
        else 'No'
    end as StartsWithSymbol
into ElementsCopy 
from Elements;

select * from ElementsCopy;

--Exercise 6
select * from Colors order by code
Select Name,
    Red,
    Green,
    blue
into Colors2
from Colors

SELECT 
    Name,
    Red,
    Green,
    Blue,
    '#' +
        RIGHT('0' + CONVERT(VARCHAR(2), CONVERT(VARBINARY(1), Red), 2), 2) +
        RIGHT('0' + CONVERT(VARCHAR(2), CONVERT(VARBINARY(1), Green), 2), 2) +
        RIGHT('0' + CONVERT(VARCHAR(2), CONVERT(VARBINARY(1), Blue), 2), 2)
    AS Code
FROM Colors2
ORDER BY Code;

--Exercise 7
select * from Types;
select 
    Integer,
    String
into TypesCopy
from Types;

select 
    Integer,
    CAST(Integer AS Float) / 100 AS Float,
    string,
    DATEADD(Hour, Integer, '2019-01-09T00:00:00') AS DateTime,
    Integer % 2 AS Bool
from TypesCopy;