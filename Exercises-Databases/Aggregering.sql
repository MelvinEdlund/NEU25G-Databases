--Exercise 1
select * from Elements;
select
	Period,
	MIN(Number) AS [from],
	MAX(Number) AS [to],
	ROUND(AVG(Stableisotopes * 1.0), 2) AS [Average Isotopes],
	STRING_AGG(Symbol, ',') WITHIN GROUP (ORDER BY Symbol) AS Symbols
from Elements
GROUP BY Period
ORDER BY Period;

--Exercise 2
select * from Company.customers;

Select
	Region,
	Country,
	City,
	COUNT(*) AS Customers
From Company.customers
GROUP BY Region, Country, City
HAVING COUNT(*) >= 2
ORDER BY Country, City;

--Exercise 3
select * from GameofThrones;

DECLARE @info NVARCHAR(MAX) = N'';

SELECT @info +=
       'Säsong ' + CAST(Season AS NVARCHAR(10)) +
       ' sändes från ' +
	   FORMAT(MIN([Original air date]), 'MMMM', 'sv-SE') +
	   ' till ' +
	   FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv-SE') +
	   '. Totalt sändes ' +
	   CAST(COUNT(*) AS NVARCHAR(10)) +
	   ' avsnitt, som i genomsnitt sågs av ' +
	   FORMAT(AVG([U.S. viewers(millions)]), 'N1') +
	   ' miljoner människor i USA.' +
	   CHAR(13)
FROM GameOfThrones
GROUP BY Season
ORDER BY Season;

PRINT @info;
 .-
--_mxercise 4
SELECT
    FirstName + ' ' + LastName AS Namn,

    DATEDIFF(
        YEAR,
        CAST(LEFT(REPLACE(ID, '-', ''), 6) AS DATE),
        GETDATE()
    ) AS Ålder,

    CASE
        WHEN CAST(SUBSTRING(REPLACE(ID, '-', ''), 7, 1) AS INT) % 2 = 0
            THEN 'Kvinna'
        ELSE 'Man'
    END AS Kön

FROM Users
ORDER BY FirstName, LastName;

--Exercise 5

 