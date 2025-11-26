select
	year(t1.OrderDate) as 'año',
	month(t1.OrderDate) as 'mes',
	sum(t1.TotalDue) as 'ventas',
	sum(t3.StandardCost) as 'costos_ventas',
	sum(t1.TotalDue) - sum(t3.StandardCost) as 'ganancias',
	count(distinct t1.SalesPersonID) as 'empleados',
	count( distinct t1.CustomerID) as 'clientes'
from Sales.SalesOrderHeader as t1 
	inner join Sales.SalesOrderDetail as t2 on t1.SalesOrderID = t2.SalesOrderID
	inner join Production.Product as t3 on t2.ProductID = t3.ProductID
group by year(t1.OrderDate), month(t1.OrderDate)
order by year(t1.OrderDate), month(t1.OrderDate) asc