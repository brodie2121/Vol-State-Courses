BEGIN TRAN; 
BEGIN TRY DELETE FROM Addresses WHERE CustomerID=8; 
DELETE FROM Customers WHERE CustomerID = 8; 
COMMIT TRAN; 
END TRY BEGIN CATCH ROLLBACK TRAN; 
END CATCH

BEGIN
DECLARE @OrderID INT
INSERT Orders VALUES (3, GETDATE(), '10.00', '0.00', NULL, 4, 'American Express', '378282246310005', '04/2013', 4);
SET @OrderID = @@IDENTITY;
INSERT OrderItems VALUES (@OrderID, 6, '415.00', '161.85', 1);
INSERT OrderItems VALUES (@OrderID, 1, '699.00', '209.70', 1); COMMIT; PRINT 'The transaction was commited.';
EXCEPTION
WHEN OTHERS THEN ROLLBACK;
PRINT 'The transaction was rolled back.';
END