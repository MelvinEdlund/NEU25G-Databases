CREATE VIEW [dbo].[CityView] AS
SELECT
	[ci].[Id] AS CityId,
	[ci].[Name] AS City,
	[co].[Name] AS Country
FROM
	Cities ci
	join countries co on co.[CountryId] = ci.CountryID;

	
