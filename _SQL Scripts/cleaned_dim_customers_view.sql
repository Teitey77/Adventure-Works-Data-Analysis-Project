-- Instead of using the ER diagram, you createa view to link tables directly

DROP VIEW IF EXISTS dim_customers_view;

GO

CREATE VIEW dim_customers_view AS

--Clean DIM_Customer Table
--NOTE: The reason for using TOP 100 Percent (which is similar to *) is becasue Order by does not align with it hence view will be error

SELECT TOP 100 PERCENT
	c.CustomerKey AS CustomerKey,
	c.FirstName + ' ' + LastName AS "Full Name",
	CASE c. gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,
	g.City AS City,
	g.StateProvinceName AS "State-Province",
	g.EnglishCountryRegionName AS Country,
	st.SalesTerritoryRegion AS Region,
	g.PostalCode AS "Postal Code"
FROM
	DimCustomer AS c
LEFT JOIN DimGeography as g ON g.GeographyKey = c.GeographyKey
LEFT JOIN DimSalesTerritory as st ON g.SalesTerritoryKey = st.SalesTerritoryAlternateKey
Order by
	CustomerKey ASC





















