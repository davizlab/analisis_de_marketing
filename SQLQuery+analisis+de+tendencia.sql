select
	year(t1.OrderDate) as 'año',
	month(t1.OrderDate) as 'mes',
	sum(t1.TotalDue) as 'ventas'
from Sales.SalesOrderHeader as t1
	group by year(t1.OrderDate),month(t1.OrderDate)
	order by year(t1.OrderDate),month(t1.OrderDate)