CREATE VIEW CustomerWithAddresses AS
SELECT custo. CustomerID, EmailAddress , LastName ,FirstName,
bill.Line1 AS BillLine1, bill.Line2 AS BillLine2, bill.City AS BillCity, bill.State AS BillState, bill.ZipCode AS BillZip,
ship.Line1 AS ShipLine1, ship.Line2 AS ShipLine2, ship.City AS ShipCity, ship.State AS ShipState, ship.ZipCode AS ShipZip
FROM Customers custo , Addresses ship , Addresses bill
WHERE custo. BillingAddressID= bill.AddressID AND custo.ShippingAddressID= ship. AddressID;

SELECT CustomerID, LastName, FirstName, BillLine1 FROM CustomerWithAddresses;

UPDATE CustomerAddresses
SET ShipLine1='2001 Southwood Blvd.'
WHERE CustomerID =6;

CREATE VIEW OrderProducts
AS
SELECT Orders.OrderID, OrderDate, TaxAmount, ShipDate,
ItemPrice, DiscountAmount, (ItemPrice- DiscountAmount) AS FinalPrice,
Quantity, (Quantity * (ItemPrice-DiscountAmount)) AS ItemTotal,
ProductName FROM
Orders, OrderItems, Products
WHERE
Orders.OrderID = OrderItems.OrderID AND
OrderItems.ProductID = Products. ProductID;

CREATE VIEW ProductSummary
AS
SELECT distinct
ProductName, COUNT(ProductName) over (partition by ProductName) AS OrderCount
, SUM(ItemTotal) over (partition by ProductName) AS OrderTotal
FROM
OrderProducts;

SELECT ProductName p, OrderTotal FROM ProductSummary x
 WHERE 5 > (SELECT COUNT(*) FROM ProductSummary y
 WHERE x.OrderTotal < y.OrderTotal ) ORDER BY OrderTotal;