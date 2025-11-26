select
	CONCAT_WS('-',YEAR(t1.OrderDate), MONTH(t1.OrderDate)) AS 'fecha',
	sum(t1.TotalDue) as 'ventas',
	sum(t2.OrderQty) as 'cantidad',
	count(distinct t1.SalesOrderID) as 'transacciones',
	sum(t1.TotalDue)/count(distinct t1.SalesOrderID) as 'monto_promedio',
	sum(t2.OrderQty)/count(distinct t1.SalesOrderID) as 'cantidad_promedio',
	count(distinct t2.ProductID) as 'variedad',
	count(distinct t1.CustomerID) as 'clientes',
	CASE 
		WHEN count(distinct t1.SalesPersonID)<1 THEN 1 ELSE count(distinct t1.SalesPersonID)
		end as 'vendedores'
from Sales.SalesOrderHeader as t1
	inner join Sales.SalesOrderDetail as t2 on t1.SalesOrderID = t2.SalesOrderID
	group by YEAR(t1.OrderDate), MONTH(t1.OrderDate)
	order by YEAR(t1.OrderDate), MONTH(t1.OrderDate)