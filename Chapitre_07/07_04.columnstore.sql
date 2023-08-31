USE ContosoRetailDW
GO
SET STATISTICS IO, TIME ON
--SET STATISTICS TIME ON
GO

SELECT 
	dd.CalendarQuarter,
    dpc.ProductCategoryName,
    COUNT(*) As TotalRows,
	SUM(fs.SalesQuantity) AS TotalSales
FROM dbo.FactSales fs
JOIN dbo.DimDate dd ON fs.DateKey = dd.Datekey
JOIN dbo.DimProduct dp ON fs.ProductKey = dp.ProductKey
JOIN dbo.DimProductSubcategory dps 
	ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
JOIN dbo.DimProductCategory dpc 
	ON dps.ProductCategoryKey = dpc.ProductCategoryKey
GROUP BY dd.CalendarQuarter, dpc.ProductCategoryName
--OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX);