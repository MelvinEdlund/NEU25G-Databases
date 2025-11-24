SELECT * FROM Elements;

SELECT 
	count(*) as 'Total number of rows', 
	count(Mass) as 'Number of values in Mass',
	count(*) - count(Mass) as 'Number of NULL values in Mass',
	count(Stableisotopes) as 'Number of values in Stableisotopes' 
FROM 
	Elements;

SELECT * FROM Elements order by Boilingpoint;

SELECT
	sum(Mass) as 'Sum of Mass',
	avg(BoilingPoint) as 'Average Boiling Point',
	min(BoilingPoint) as 'Min Boiling Point',
	max(BoilingPoint) as 'Max Boiling Point',
	string_agg(Symbol, ', ') as 'Smybols'
FROM
	Elements
WHERE
	Number <= 10;

SELECT count(DISTINCT Period) FROM Elements


SELECT * FROM Elements;


SELECT 
	Period,
	--Valenceel,
	--[Group],
	count(*) as 'Number of elements',
	string_agg(Symbol, ' ') as 'List of symbols',
	avg(MeltingPoint) as 'Average Meltingpoint',
	avg(cast(Radius as float)) as 'Average Radius',
	sum(cast(Radius as float)) / count(*) as 'Average Radius, counting null as zero'
FROM 
	Elements
WHERE
	len(Symbol) = 2
group by 
	Period --, Valenceel
having
	count(*) < 10

--order by
--	'Average Meltingpoint'

	SELECT * FROM Elements order by [Group];
