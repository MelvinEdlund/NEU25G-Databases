
select 
	SubQuery.Namn, 
	upper(Namn) as 'uNamn', 
	lower(Namn) as 'lNamn' 
from
(
	select 
		Id as ' Personnummer',
		concat(FirstName, ' ', LastName) as 'Namn'
	from 
		Users
	where
		ID > '800101'
) SubQuery
where
	SubQuery.[ Personnummer] < '900101'

---------------

select * from music.artists
select * from music.albums


select
	AlbumId,
	Title,
	(select top 1 Name from music.artists where artists.ArtistId = albums.ArtistId ) as 'Artist'
from
	music.albums