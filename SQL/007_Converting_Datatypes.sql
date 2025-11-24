
-- Standard ISO-SQL, funkar med alla dialekter, alla DBMS.
select 'Value: ' + cast(5 as nvarchar)


-- T-SQL, funkar bara i MSSQLServer, 
-- har möjlighet att använda formateringskod som tredje parameter
select 'Value: ' + convert(nvarchar, 5)

-- Avnänds endast för att konvertera TILL strängar,
-- Tar en formateringssträng och har i princip ersatt convert + formateringskod.
select 'Value: ' + format(5, '0')

