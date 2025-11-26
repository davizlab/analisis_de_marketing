select
	t3.Name as 'proveedor',
	sum(t2.OrderQty) / count(distinct t1.PurchaseOrderID) as 'cantidad_promedio',
	AVG(DATEDIFF (day,t1.OrderDate, t1.ShipDate)) as 'tiempo_promedio',
	sum(t2.ReceivedQty) / sum(t2.OrderQty) as 'calidad_cantidad',
	CASE
		WHEN sum(t2.ReceivedQty) / sum(t2.OrderQty) > 0.99 THEN 'Si'
		WHEN sum(t2.ReceivedQty) / sum(t2.OrderQty) > 1 THEN 'No'
		ELSE 'No'
	END as 'aprobado'
from Purchasing.PurchaseOrderHeader as t1
	inner join Purchasing.PurchaseOrderDetail as t2 on t1.PurchaseOrderID = t2.PurchaseOrderID
	inner join Purchasing.Vendor as t3 on t1.VendorID = t3.BusinessEntityID
group by t3.Name