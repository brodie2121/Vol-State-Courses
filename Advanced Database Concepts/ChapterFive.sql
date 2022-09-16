select 
count(*) as "Number of Orders", 
sum(TaxAmount) as "Total Tax Amount"
from Orders;

select 
c.CategoryName,
(select count(*)
  from Products p
  where p.CategoryID = c.CategoryID) as "Number Of Products",
(select top 1 p1.ListPrice
  from Products p1
  where p1.CategoryID = c.CategoryID
  order by 1 desc) as "Most Expensive Product"
from Categories c
where (select count(*)
  from Products p2
  where p2.CategoryID = c.CategoryID) > 0
order by 2 desc;

select 
c.FirstName + ' ' + c.LastName as CustomerName,
sum(oi.ItemPrice * oi.Quantity) as TotalPrice,
sum(oi.DiscountAmount * oi.Quantity) as TotalDiscount
from Customers c, Orders o, OrderItems oi
where c.CustomerID = o.CustomerID
and o.OrderID = oi.OrderID
group by c.FirstName + ' ' + c.LastName
order by TotalPrice desc;

select 
c.EmailAddress,
count(*) as NumberOfOrders,
sum(oi.ItemPrice * oi.Quantity) - sum(oi.DiscountAmount * oi.Quantity) as TotalPriceWithDiscount
from Customers c, Orders o, OrderItems oi 
where c.CustomerID = o.CustomerID
and o.OrderID = oi.OrderID
group by c.EmailAddress
having count(*) > 1
order by TotalPriceWithDiscount desc;

select 
c.EmailAddress,
count(*) as NumberOfOrders,
sum(oi.ItemPrice * oi.Quantity) - sum(oi.DiscountAmount * oi.Quantity) as TotalPriceWithDiscount
from Customers c, Orders o, OrderItems oi
where c.CustomerID = o.CustomerID
and o.OrderID = oi.OrderID
and oi.ItemPrice > 400
group by c.EmailAddress
having count(*) > 1
order by TotalPriceWithDiscount desc;

select 
p.ProductName,
sum(oi.ItemPrice * oi.Quantity) - sum(oi.DiscountAmount * oi.Quantity) as ProductTotal
from Products p, Orders o, OrderItems oi
where p.ProductID = oi.ProductID
and oi.OrderID = o.OrderID
group by p.ProductName with rollup;

select 
c.EmailAddress,
count(distinct p.ProductID) as NumberOfProducts
from Customers c, Orders o, OrderItems oi, Products p
where c.CustomerID = o.CustomerID
and o.OrderID = oi.OrderID
and p.ProductID = oi.ProductID
group by c.EmailAddress
having count(distinct p.ProductID) > 1;