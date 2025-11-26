select
	t1.Name as 'proveedor',
	sum(t3.OrderQty) as 'cantidad total',
	sum(t2.TotalDue) as 'monto total',
	t1.CreditRating as 'rating'
from Purchasing.Vendor as t1
	inner join Purchasing.PurchaseOrderHeader as t2 on t1.BusinessEntityID = t2.VendorID
	inner join Purchasing.PurchaseOrderDetail as t3 on t2.PurchaseOrderID = t3.PurchaseOrderID
group by t1.Name, t1.CreditRating
	