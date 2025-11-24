-- RadKommenter
 
/*
	Blockkommentar
*/
 
-- SQL �r case-insensetive d.v.s g�r ingen skillnad p� sm� och stora bokst�ver.
-- G�ller data s�v�l som kolumnnamn, variabler etc.
 
-- Index b�rjar p� 1. 
 
-- Databas-termer:
-- Selection - Vilka rader vi filtrerar ut (g�r med keyword Where)
-- Projection - vilka kolumner vi efterfr�gar (g�rs mellan keyword select och from)
 
-- Ge oss alla kolumner (V�ran selection = *) fr�n alla rader
--select * from students;
 
---- Anv�nd en where f�r att filtrera vilka rader vi tar ut, med ett (where-)vilkor.
--select * from students where lastname = 'breuker' and id < 4;
 
---- Projection exempel:
--select 
--	id, 
--	upper(firstname) as 'firstname in upper', 
--	id + 100 as 'id + 100', 
--	--*, 
--	'sebbe' as 'sebastians namn', 
--	'Hej ' + firstname as 'greeting',
--	firstname + ' ' + lastname as fullname
 
--from 
--	students;
/*
	string literals anv�nder 'singe quotes' inte "double quotes" som i C#
	= lika med (ist�llet f�r == som i C#)
<> inte lika med (ISO-standard, men i T-SQL �ven != funkar)
< mindre �n
> st�rre �n
<= mindre eller likamed
>= st�rre eller likamed
 
	and (motsvarar C# &&)
	or (motsvarar C# ||)
	not (motsvarar C# !)
*/
 
-- v�ljer vilken databas som �r aktiv
--use ITHS
 
 
 
use everyloop
 
-- top begr�nsar antal rader man f�r ut.
-- select top 10 percent * from users;
 
-- In
-- select * from users where firstname in ('ulla', 'milla', 'johanna');
 
-- Between
--select * from users where firstname between 'b' and 'd';
--select * from users where firstname >= 'b' and firstname <= 'd';
 
-- Like
--select * from users where firstname like 'a-c%'
 
-- Order by
--select * from users order by firstname, lastname desc
 
-- len = length
--select firstname from users order by len(firstname)
 
-- Union all, sl� ihop fr�n 2 olika tabeller
 
-- case when end (typ som if-sats)
--select 
--	firstname, 
--	case
--		when len(firstname) < 5 then 'Short'
--		when len(firstname) > 8 then 'Long'
--		else 'medium'
--	end as 'LengthOfName'
--from
--	users
--where
--	firstname like '[adfk]%'
--order by 
--	len(firstname)