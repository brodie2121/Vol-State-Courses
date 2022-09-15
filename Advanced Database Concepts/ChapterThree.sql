SELECT 
ProductName + ' - ' + ProductCode as ProductInfo,
ListPrice as Price,
DiscountPercent as Discount
from Products
ORDER BY ProductCode DESC; 

SELECT LastName + ', ' + FirstName + ' - ' + EmailAddress as Customer_Info
from Customers
WHERE Left (LastName , 1) IN('C', 'F', 'M', 'O') 
ORDER BY LastName ASC;

SElECT
ProductName,
ListPrice,
DiscountPercent,
DateAdded
from Products
WHERE DiscountPercent >=25 AND DiscountPercent <=30
ORDER BY DateAdded DESC;

SELECT
ProductName,
ListPrice,
DiscountPercent,
cast(((DiscountPercent * .01) * ListPrice) as numeric(12,2)) as DiscountAmount,
cast(ListPrice - ((DiscountPercent * .01) * ListPrice) as numeric(12,2)) as DiscountedPrice
from Products
WHERE DiscountPercent >=20
ORDER BY DiscountPercent DESC;

SELECT 
ItemID as "The ItemID column",
ItemPrice as "The ItemPrice column",
DiscountAmount as "The DiscountAmount column",
Quantity as "The Quantity column",
ItemPrice * Quantity as PriceTotal,
cast((DiscountAmount * Quantity) as numeric(12,2)) as DiscountTotal,
cast(((ItemPrice - DiscountAmount) * Quantity) as numeric(12,2)) as ItemTotal
from OrderItems
WHERE ((ItemPrice - DiscountAmount) * Quantity) BETWEEN 400 AND 1000
ORDER BY ItemTotal desc;

SELECT
OrderId as "The OrderID column",
OrderDate as "The OrderDate column",
ShipDate as "The ShipDate column"
from Orders
WHERE ShipDate is NULL AND OrderDate >='2012-04-03' AND OrderDate <'2012-05-10';

SELECT
*
from Customers
WHERE EmailAddress LIKE'cl%' OR EmailAddress LIKE 'ma%';