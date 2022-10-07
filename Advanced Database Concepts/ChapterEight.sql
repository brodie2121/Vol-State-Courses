select 
TaxAmount,
	cast(TaxAmount as decimal(18, 1)) as PriceFormat,
	convert(int, TaxAmount) as PriceConvert,
	cast(TaxAmount as Int) as PriceCast
from Orders;

select 
OrderDate,
	cast(OrderDate as decimal(18, 1)) as PriceFormat,
	convert(int, OrderDate) as PriceConvert,
	cast(OrderDate as Int) as PriceCast
from Orders;

select 
	convert (varchar, DateAdded, 1) as DateAddedConverted,
	convert (varchar, DateAdded, 0) as AMPM,
	convert (varchar, DateAdded, 14) as OrderTime
from Products;