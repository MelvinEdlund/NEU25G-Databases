-- A - Company
-- 1.
select * from company.orders;

SELECT
	cc.City,
	COUNT(*) AS 'total orders',
	COUNT(DISTINCT cp.Id) AS 'Unique orders',
	FORMAT((CAST(COUNT(DISTINCT cp.Id) AS float) / (select count(*) from company.products)), 'P1') AS 'Percent of total products'
FROM
	company.customers cc
	JOIN company.orders co ON cc.Id = co.CustomerId
	JOIN company.order_details cod ON co.Id = cod.OrderId
	JOIN company.products cp ON cod.ProductId = cp.Id
WHERE
	CC.City = 'London'
GROUP BY
	cc.City;

-- 2.
select * from company.products;

-- B - Playlist


-- C - Music