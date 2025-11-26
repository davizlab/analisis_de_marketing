select
	convert(varchar, t3.OrderDate,103) as 'fecha',
	t2.Name as 'producto',
	sum(t1.OrderQty) as 'cantidad',
	sum(t1.OrderQty) * (avg(t1.UnitPrice) - avg(t2.StandardCost)) as 'ganancia'
from Sales.SalesOrderDetail as t1
	inner join Production.Product as t2 on t1.ProductID = t2.ProductID
	inner join Sales.SalesOrderHeader as t3 on t1.SalesOrderID = t3.SalesOrderID
group by t3.OrderDate, t1.ProductID, t2.Name