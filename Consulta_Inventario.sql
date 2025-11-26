-- CREATE VIEW Inevntario_PowerBI as
SELECT 
a.ModifiedDate as FcehaEntrada,
a.ProductID,
b.Name as producto,
d.ProductModelID,
d.Name as ProductLine,
c.LocationID,
c.Name as location,
a.Quantity
FROM Production.ProductInventory a
join Production.Product b on a.ProductID =b.ProductID
join Production.Location c on a.LocationID = c.LocationID
join Production.ProductModel d on b.ProductModelID =d.ProductModelID