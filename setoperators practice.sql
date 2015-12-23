use TSQL2012
go

select * from hr.Employees
go

select * from Sales.Customers
go

--it only displays common row objects in both the tables
select country,region,city from hr.Employees
intersect
select country, region,city from Sales.Customers
go


--it subtracts the two tables
select country,region,city from hr.Employees
except
select country, region,city from Sales.Customers
go

select * from Sales.OrderDetails
go

select productid,sum(qty) as TotalQty from Sales.OrderDetails
-- i dont know where exactly to use group by and order by
group by productid
order by productid
go

--ERROR : you cant assign object to colums that dont exist
select 'Total' as Total, sum(qty) from Sales.OrderDetails
go

-- mistake : conversion failed when assigning total of quantity summed! 
select Productid,sum(qty) as TotalQty from Sales.OrderDetails
group by productid
union all
select 'Total' as Total, sum(qty) from Sales.OrderDetails
go

--mistake 
select productid as varchar as Productid,sum(qty) as TotalQty from Sales.OrderDetails
group by productid
union all
select 'Total' as Total, sum(qty) from Sales.OrderDetails
go

--cast helps convert, ALWAYS REMEMBER
select cast(productid as varchar) as Productid,sum(qty) as TotalQty from Sales.OrderDetails
group by productid
union all
select 'Total' as Total, sum(qty) from Sales.OrderDetails
go

