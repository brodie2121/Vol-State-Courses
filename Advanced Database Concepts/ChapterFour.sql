select 
c.CategoryName,
p.ProductName, 
p.ListPrice
from Products p
join Categories c on c.CategoryID = p.CategoryID
where p.DateAdded BETWEEN '2012-07-01' AND '2012-07-31'
order by p.ListPrice;

select 
c.FirstName, c.LastName, a.City, a.State, a.ZipCode
from Addresses a
join Customers c on c.CustomerID = a.CustomerID
where Right(c.EmailAddress, 9) IN ('gmail.com');

SELECT 
c.FirstName, 
c.LastName, 
a.City, 
a.State, 
a.ZipCode
from Customers c 
join Addresses a on c.BillingAddressID = a.AddressID AND c.CustomerID = a.CustomerID
where c.ShippingAddressID <> c.BillingAddressID

select 
c.LastName, 
c.FirstName, 
o.OrderDate, 
p.ProductName, 
oi.ItemPrice, 
oi.DiscountAmount, 
oi.Quantity
from Orders o
join Customers c on c.CustomerID = o.CustomerID 
join OrderItems oi on oi.OrderID = o.OrderID
join Products p on p.ProductID = oi.ProductID
where oi.ItemPrice >400
order by 1, 3, 4;

select 
p.ProductName, 
p.ListPrice
from Products p
join Products p1 on p1.ListPrice = p.ListPrice
and p.ProductID != p1.ProductID
order by p.ProductName;

select 
c.CategoryName, 
p.ProductID
from Categories c
left join Products p on p.CategoryID = c.CategoryID
where p.ProductID is null;

select 
'SHIPPED' as ShipStatus, 
OrderID, 
OrderDate
from Orders
where ShipDate is not null
union
select 'NOT SHIPPED' as 
ShipStatus,
OrderID, 
OrderDate
from Orders
where ShipDate is null
order by OrderDate;