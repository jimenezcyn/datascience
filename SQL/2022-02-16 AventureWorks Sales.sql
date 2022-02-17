-- Find out the number of sales per product (SQL)
-- Top 10 best selling products (number of sales) (SQL)
-- Top 10 worst selling products (number of sales) (SQL)
-- Sales of top 10 products across the year (TABLEAU)

-- Find out the number of sales per product
SELECT DISTINCT([Sales].[SalesOrderDetail].[ProductID])
, [Production].[Product].[Name]
, COUNT([Sales].[SalesOrderDetail].[OrderQty]) OVER (PARTITION BY [Sales].[SalesOrderDetail].[ProductID]) AS CountOfSales
FROM [Sales].[SalesOrderDetail]
INNER JOIN [Sales].[SalesOrderHeader] ON [Sales].[SalesOrderHeader].[SalesOrderID] = [Sales].[SalesOrderDetail].[SalesOrderID]
LEFT JOIN [Production].[Product] ON [Production].[Product].[ProductID] = [Sales].[SalesOrderDetail].[ProductID]
ORDER BY CountOfSales DESC

-- Top 10 best selling products (number of sales)
SELECT DISTINCT TOP 10 ([Sales].[SalesOrderDetail].[ProductID])
, [Production].[Product].[Name]
, COUNT([Sales].[SalesOrderDetail].[OrderQty]) OVER (PARTITION BY [Sales].[SalesOrderDetail].[ProductID]) AS CountOfSales
FROM [Sales].[SalesOrderDetail]
INNER JOIN [Sales].[SalesOrderHeader] ON [Sales].[SalesOrderHeader].[SalesOrderID] = [Sales].[SalesOrderDetail].[SalesOrderID]
LEFT JOIN [Production].[Product] ON [Production].[Product].[ProductID] = [Sales].[SalesOrderDetail].[ProductID]
ORDER BY CountOfSales DESC

-- Top 10 worst selling products (number of sales)
SELECT DISTINCT TOP 10 ([Sales].[SalesOrderDetail].[ProductID])
, [Production].[Product].[Name]
, COUNT([Sales].[SalesOrderDetail].[OrderQty]) OVER (PARTITION BY [Sales].[SalesOrderDetail].[ProductID]) AS CountOfSales
FROM [Sales].[SalesOrderDetail]
INNER JOIN [Sales].[SalesOrderHeader] ON [Sales].[SalesOrderHeader].[SalesOrderID] = [Sales].[SalesOrderDetail].[SalesOrderID]
LEFT JOIN [Production].[Product] ON [Production].[Product].[ProductID] = [Sales].[SalesOrderDetail].[ProductID]
ORDER BY CountOfSales ASC

