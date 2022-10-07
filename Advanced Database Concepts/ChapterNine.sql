select 
ListPrice,
	DiscountPercent,
	round(((DiscountPercent / 100) * ListPrice), 2) as DiscountAmount
from Products;

select 
DateAdded,
year(DateAdded) as OrderYear,
day(DateAdded) as DayOnly,
dateadd(day, 30, DateAdded) as DueDate
from Products;

select
CardNumber,
len(CardNumber) as CardNumberLegnth,
right(CardNumber, 4) as LastFourDigits,
'XXXX-XXXX-XXXX-' + right(CardNumber, 4) as FormattedNumber
from Orders;

select
OrderID,
OrderDate,
dateadd(day, 2, OrderDate) as AproxShipDate,
ShipDate,
datediff(day, OrderDate, ShipDate) as DaysToShip
from Orders
where month(OrderDate) = 3
and year(OrderDate) = 2012;
