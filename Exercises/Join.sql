-- A - Company
-- 1.
--select * from company.orders;

--SELECT
--	cc.City,
--	COUNT(*) AS 'total orders',
--	COUNT(DISTINCT cp.Id) AS 'Unique orders',
--	FORMAT((CAST(COUNT(DISTINCT cp.Id) AS float) / (select count(*) from company.products)), 'P1') AS 'Percent of total products'
--FROM
--	company.customers cc
--	JOIN company.orders co ON cc.Id = co.CustomerId
--	JOIN company.order_details cod ON co.Id = cod.OrderId
--	JOIN company.products cp ON cod.ProductId = cp.Id
--WHERE
--	CC.City = 'London'
--GROUP BY
--	cc.City;

-- 2.
--select * from company.products;

-- B - Playlist
declare @playlist varchar(max) = 'Heavy Metal Classic';

select 
	g.Name as 'Genre',
	ar.Name as 'Artist',
	al.title as 'Album',
	t.Name as 'Track',
	format(Milliseconds / 60000, '00') + ':'
	+format(Milliseconds / 1000 % 60, '00') as 'Length',
	format(Bytes / 1024.0 / 1024.0, 'N1') +'MiB' as 'Size',
	Composer
from 
	music.tracks t
	join music.albums al on al.AlbumId = t.AlbumId
	join music.artists ar on ar.ArtistId = al.ArtistId
	join music.Genres g on g.GenreId = t.GenreId
	join music.playlist_track pt on pt.TrackId = t.TrackId
	join music.playlists p on p.PlaylistId = pt.PlaylistId
where
	p.Name = @playlist

--select * from music.playlists

-- C - Music