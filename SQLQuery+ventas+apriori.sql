select
	t1.SalesOrderID as 'factura',
	t1.ProductID,
	t2.Name as 'producto',
	t1.OrderQty as 'cantidad',
	CONVERT(varchar,t3.OrderDate,105) as 'fecha',
	t1.LineTotal as 'monto'
from Sales.SalesOrderDetail as t1
	inner join Production.Product as t2 on t1.ProductID = t2.ProductID
	inner join Sales.SalesOrderHeader as t3 on t1.SalesOrderID = t3.SalesOrderID