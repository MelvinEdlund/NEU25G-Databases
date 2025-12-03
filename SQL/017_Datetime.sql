
-- Aktuell datum och tid
select getdate() as 'Serverns datum och tid som datetime', sysdatetime() as 'Serverns datum och tid som datetime2'

-- Beräkna skillnad i dagar (eller year, minute etc..) mellan två datum
select datediff(year, '2001-04-09', SYSDATETIME());

-- Addera x antal dagar (eller year, minute etc..) till en datetime
select dateadd(day, 5, getdate())

--SET DATEFIRST 1; -- Konfigurera om sql server så måndag är dag 1 i veckan.

select datepart(DAY, getdate())
select datepart(WEEK, getdate())
select datepart(WEEKDAY, getdate())
select datepart(DAYOFYEAR, getdate())

select DATEDIFF(year, '2000-11-15',GETDATE()) -
    CASE WHEN DATEADD(YEAR,DATEDIFF(YEAR,'2000-12-04',GETDATE()),'2000-12-04') > GETDATE() THEN 1 ELSE 0 END AS 'Ålder'