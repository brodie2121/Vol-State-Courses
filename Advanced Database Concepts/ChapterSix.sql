select distinct CategoryName
from Categories
where CategoryID in
	(select CategoryID from Products)
order by CategoryName;

select ProductName, 
ListPrice
from Products
where ListPrice > (select avg(ListPrice) from Products)
order by 2 desc;

select FirstName, 
LastName
from Customers c
where not exists (
    select * from Orders o where o.CustomerID = c.CustomerID
);

select c.EmailAddress, 
oi.OrderID, 
sum((oi.ItemPrice - oi.DiscountAmount) * oi.Quantity) as ItemTotal
from OrderItems oi join Orders o
on oi.OrderID = o.OrderID
join Customers c
on o.CustomerID = c.CustomerID
group by c.EmailAddress, oi.OrderID;

select EmailOrders.EmailAddress, max(EmailOrders.ItemTotal) as LargestOrder
from
	(select c.EmailAddress, oi.OrderID, sum((oi.ItemPrice - oi.DiscountAmount) * oi.Quantity) as ItemTotal
	from OrderItems oi join Orders o
  	on oi.OrderID = o.OrderID
  	join Customers c
  	on o.CustomerID = c.CustomerID
	group by c.EmailAddress, oi.OrderID) as EmailOrders
group by EmailOrders.EmailAddress;

select p1.ProductName, p1.DiscountPercent
from Products p1
where not exists
	(select *
	from Products p2
	where p2.DiscountPercent = p1.DiscountPercent
	and p2.ProductName != p1.ProductName)
order by p1.ProductName

select c.EmailAddress, oID.OrderId, OldestOrders.OldestOrderDate
from Customers c join
	(select o1.CustomerID, min(o1.OrderDate) as OldestOrderDate
	from Orders o1
	group by o1.CustomerID) as OldestOrders
on c.CustomerID = OldestOrders.CustomerID
join Orders oID
on OldestOrders.OldestOrderDate = oID.OrderDate