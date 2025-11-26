SELECT     
	T1.SalesOrderID AS orderID, 
	T1.OrderQty AS Cantidad, 
	T1.ProductID, Production.Product.Name AS producto, 
	T1.UnitPrice AS precioUnitario, 
	T1.UnitPriceDiscount AS Descuento, 
	T1.LineTotal AS Total, 
	T2.Status, 
	T2.OrderDate AS Fecha, 
	T2.SalesPersonID, 
	Person.Person.FirstName + ' ' + Person.Person.LastName AS vendedor, 
	Sales.SalesTerritory.Name AS Region
FROM        
	Sales.SalesOrderDetail T1 INNER JOIN
    Sales.SalesOrderHeader T2 ON T1.SalesOrderID = T2.SalesOrderID INNER JOIN
	Production.Product ON T1.ProductID = Production.Product.ProductID INNER JOIN
	Sales.SalesTerritory ON T2.TerritoryID = Sales.SalesTerritory.TerritoryID AND T2.TerritoryID = Sales.SalesTerritory.TerritoryID AND T2.TerritoryID = Sales.SalesTerritory.TerritoryID LEFT OUTER JOIN
	Person.Person ON T2.SalesPersonID = Person.Person.BusinessEntityID