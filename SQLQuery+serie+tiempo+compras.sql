select	
	CONCAT_WS('-',YEAR(t1.OrderDate), MONTH(t1.OrderDate)) as 'fecha',
	sum(t1.TotalDue) as 'compras'
from Purchasing.PurchaseOrderHeader as t1
	group by YEAR(t1.OrderDate),MONTH(t1.OrderDate)
	order by YEAR(t1.OrderDate),MONTH(t1.OrderDate)