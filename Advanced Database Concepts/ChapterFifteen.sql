CREATE PROCEDURE [dbo].[spInsertNewCategory]
        @CategoryName varchar(100),
        @category_entity varchar(100)
AS
BEGIN
        INSERT INTO  Categories
                (CategoryName)
        VALUES
                (@CategoryName)
END


CREATE FUNCTION fnDiscountPrice
(@ItemID int)
RETURNS money
BEGIN
RETURN (SELECT SUM(ItemPrice - DiscountAmount) AS DP_ItemPrice
FROM OrderItems
WHERE ItemID = @ItemID);
END;


create function fnItemTotal (@ItemIdDiscount int)
returns money
begin
declare @TotalItemAmount money;
select @TotalItemAmount = oi.DiscountAmount*oi.Quantity
from OrderItems oi
where oi.ItemID = @ItemIdDiscount
return @TotalItemAmount
end;


Create PROCEDURE spInsertProduct
@CategoryID int ,
@ProductCode varchar(max) ,
@ProductName varchar(max) ,
@ListPrice INT ,
@DiscountPercent INT
AS
BEGIN
IF (SIGN(@ListPrice) != 1 )
BEGIN
PRINT 'Error check the ListPrice!.'
end
ELSE IF ( SIGN(@DiscountPercent) != 1)
BEGIN
PRINT 'Error check the DiscountPercent!'
end
ELSE
BEGIN
INSERT INTO Products(CategoryID, ProductCode, ProductName,ListPrice,DiscountPercent)
VALUES(@CategoryID, @ProductCode,@ProductName,@ListPrice,@DiscountPercent )
end 
END


CREATE PROCEDURE spUpdateProductDiscount
@product_id NUMBER
@discount_percent NUMBER
AS
BEGIN
BEGIN TRANSACTION 
BEGIN TRY
    IF @discount_percent<0
        BEGIN
            RAISERROR (N'Discount percent is negative', 12,1)
        END
    ELSE
        UPDATE Products set DiscountPercent = @discount_percent 
        where 
ProductID=@product_id 
    IF @@TRANCOUNT > 0 
    BEGIN
        commit TRANSACTION;
    END
END TRY 
BEGIN CATCH
    IF @@TRANCOUNT < 0 
    BEGIN 
        Rollback TRANSACTION
    END
END CATCH
END 


create trigger Products_UPDATE
before update on Products
for each row
begin
    declare msg varchar(128);
    if new.DiscountPercent < 0 then
        set msg = concat('MyTriggerError: The discount percent cannot be less than 0');
        signal sqlstate '45000' set message_text = msg;
    else if new.DiscountPercent >100.0 then
        set msg = concat('MyTriggerError: The discount percent cannot be greater than 100');
        signal sqlstate '45000' set message_text = msg;
    else if new.DiscountPercent <1.0 then
        set new.DiscountPercent = (NEW.discountPercent * 100);
    else
        set new.discountPercent = (NEW.discountPercent);
    end if;
END;


CREATE TRIGGER Products_INSERT
  ON Products
  AFTER INSERT
AS
  UPDATE Products
  SET DateAdded = GETDATE()
  WHERE ProductID = (SELECT ProductID FROM inserted);


CREATE TABLE ProductsAudit (
  AuditID           INT            PRIMARY KEY IDENTITY,
  ProductID         INT            NOT NULL,
  CategoryID        INT            NOT NULL,
  ProductCode       VARCHAR(10)    NOT NULL,
  ProductName       VARCHAR(255)   NOT NULL,
  ListPrice         MONEY          NOT NULL,
  DiscountPercent   MONEY          NOT NULL      DEFAULT 0.00,
  DateUpdated       DATETIME                     DEFAULT NULL
);
GO
IF EXISTS (SELECT DB_ID('Products_UPDATE_AUDIT'))
  DROP TRIGGER Products_UPDATE_AUDIT;
GO
CREATE TRIGGER Products_UPDATE
  ON Products
  AFTER UPDATE
AS
  INSERT INTO ProductsAudit
    (ProductID, CategoryID,
     ProductCode, ProductName, ListPrice, DiscountPercent, DateUpdated)
  VALUES(
    (SELECT ProductID FROM deleted),
    (SELECT CategoryID FROM deleted),
    (SELECT ProductCode FROM deleted),
    (SELECT ProductName FROM deleted),
    (SELECT ListPrice FROM deleted),
    (SELECT DiscountPercent FROM deleted),
     GETDATE());