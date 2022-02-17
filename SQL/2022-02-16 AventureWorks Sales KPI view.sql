-- Sales of top 10 products across the year (TABLEAU)
CREATE VIEW ProductSalesKeyMetrics AS
SELECT [Sales].[SalesOrderDetail].[ProductID]
, TRIM([Production].[Product].[Name]) AS [Name]
, [Sales].[SalesOrderDetail].OrderQty
, CAST(ROUND([Sales].[SalesOrderDetail].LineTotal,2) AS DECIMAL(12,2)) AS TotalAmount
, [Sales].[SalesOrderHeader].[OrderDate]
FROM [Sales].[SalesOrderDetail]
INNER JOIN [Sales].[SalesOrderHeader] ON [Sales].[SalesOrderHeader].[SalesOrderID] = [Sales].[SalesOrderDetail].[SalesOrderID]
LEFT JOIN [Production].[Product] ON [Production].[Product].[ProductID] = [Sales].[SalesOrderDetail].[ProductID]
WHERE SellEndDate IS NULL