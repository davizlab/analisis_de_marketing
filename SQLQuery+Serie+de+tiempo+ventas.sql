select
	CONCAT_WS('-',YEAR(t1.OrderDate), MONTH(t1.OrderDate)) as 'fecha',
	sum(t1.TotalDue) as 'ventas'
from Sales.SalesOrderHeader as t1
	group by YEAR(t1.OrderDate), MONTH(t1.OrderDate)
	order by YEAR(t1.OrderDate), MONTH(t1.OrderDate)