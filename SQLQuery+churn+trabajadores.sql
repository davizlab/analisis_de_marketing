select
	concat(t2.FirstName, ' ', t2.LastName) as 'nombre',
	t1.JobTitle as 'cargo',
	--t3.StartDate,
	--t3.EndDate,
	CASE 
		when t3.EndDate IS NULL THEN DATEDIFF(month, t3.StartDate, GETDATE())/12
		else DATEDIFF(month, t3.StartDate, t3.EndDate)/12
	END as 'antiguedad',
	DATEDIFF(month,t1.BirthDate, GETDATE())/12 as 'edad',
	t4.Rate * 160 as 'salario',
	t5.name as 'departamento',
	CASE 
		when t3.EndDate IS NOT NULL THEN 1
		Else 0
	END as 'churn'
from HumanResources.Employee as t1
	inner join Person.Person as t2 on t1.BusinessEntityID = t2.BusinessEntityID
	inner join HumanResources.EmployeeDepartmentHistory as t3 on t1.BusinessEntityID = t3.BusinessEntityID
	inner join HumanResources.EmployeePayHistory as t4 on t1.BusinessEntityID = t4.BusinessEntityID
	inner join HumanResources.Department as t5 on t3.DepartmentID = t5.DepartmentID