select
	t1.ProductID,
	t2.Name as 'producto',
	sum(t1.OrderQty) as 'demanda',
	avg(t1.UnitPrice) as 'precio_promedio',
	avg(t2.StandardCost) as 'costo'
from Sales.SalesOrderDetail as t1
	inner join Production.Product as t2 on t1.ProductID = t2.ProductID
	group by t1.ProductID, t2.Name