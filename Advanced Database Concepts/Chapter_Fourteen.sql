DECLARE @retVal INT
SELECT @retVal = COUNT(*) 
FROM PRODUCTS
IF (@retVal >= 7)
BEGIN
PRINT N'The number of products is greater than or equal to 7';
END
ELSE
BEGIN
PRINT N'The number of products is less than 7';
END;

DECLARE @AllProduct2 INT;
DECLARE @AvgListPrice MONEY;
SELECT @AllProduct2 = COUNT(ProductID),
@AvgListPrice = AVG (ListPrice)
FROM Products
IF @AllProduct2 >= 7
BEGIN
PRINT 'The number of products is greater than or equal to 7';
PRINT 'The average list price is $' + CONVERT (VARCHAR, @AvgListPrice,1) + '.';
END;
ELSE 
PRINT 'The number of products is less than 7';

DECLARE @num1 INT = 10;
DECLARE @num2 INT = 20;
DECLARE @count INT = 1;
WHILE @count <= @num1
BEGIN
IF (@num1 % @count = 0 and @num2 % @count = 0)
PRINT @count
set @count = @count + 1
END;

BEGIN TRY
INSERT INTO Categories (CategoryName)
VALUES ('Guitars')
PRINT 'SUCCESS: Record was inserted.'
END TRY
BEGIN CATCH
PRINT 'FAILURE: Record was not inserted.';
PRINT 'Error ' + CONVERT(VARCHAR, ERROR_NUMBER(), 1) + ': '+ ERROR_MESSAGE()
END CATCH;