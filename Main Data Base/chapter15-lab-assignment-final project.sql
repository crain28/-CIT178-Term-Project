/* Final Project Procedures */

USE NorthernStarFarms;
GO
CREATE PROC spCustomer
AS SELECT * 
From Customer
ORDER BY CustomerName;
GO

EXEC spCustomer;

USE NorthernStarFarms;
GO
CREATE PROC spGetCustomer
		@CustomerID int
AS
BEGIN 
		SELECT * FROM Customer
		WHERE ID = @CustomerID;
END
GO
EXEC spGetCustomer 1;

USE NorthernStarFarms;
GO 
CREATE PROC spCustomerContact
		@CustomerID int,
		@CustomerName nvarchar(50) OUTPUT,
		@PhoneNumber nvarchar(30) OUTPUT
AS
SELECT @CustomerName = CustomerName, @PhoneNumber = CustomerPhone
FROM Customer
WHERE ID = @CustomerID;
GO
DECLARE @CustomerName nvarchar(50);
DECLARE @PhoneNumber nvarchar(30);
EXEC spCustomerContact 3, @CustomerName OUTPUT, @PhoneNumber OUTPUT;
SELECT @CustomerName AS 'Customer Name', @PhoneNumber AS 'Phone #';

USE NorthernStarFarms;
GO
CREATE PROC spCostomerCount
AS
DECLARE @CustomerCount int;
SELECT @CustomerCount = COUNT(*)
FROM Customer
RETURN @CustomerCount;
GO

DECLARE @CustomerCount int;
EXEC @CustomerCount = spCostomerCount;
PRINT 'There are' + CONVERT(varchar, @CustomerCount) + 'customer in your database';
GO

/* Final Project User Defined Functions */

USE NorthernStarFarms;
GO
CREATE FUNCTION fnGetType
		(@Type nvarchar(50) = '%')
		RETURNS int
BEGIN 
	RETURN (SELECT [Type] FROM Product WHERE Type LIKE @Type);
END;

GO
SELECT [Type], [Description], [PricePerBale]  FROM Product
WHERE [Type] = dbo.fnGetType('round%');

USE NorthernStarFarms;
GO
CREATE FUNCTION fnProducts
		(@Type nchar(20) = '%')
		RETURNS table
RETURN 
		(SELECT * FROM Product WHERE [Type] LIKE @Type);
GO
SELECT * FROM dbo.fnProducts('%');

/* Final Project Triggers */

USE NorthernStarFarms;
GO 
SELECT * INTO CustomerName 
FROM Customer
WHERE 1=0;

ALTER TABLE CustomerName
ADD Activity varchar(50);
GO

CREATE TRIGGER CustomerName_Insert ON Customer
	AFTER INSERT
AS
BEGIN 
	SET NOCOUNT ON;
	DECLARE @ID int
	DECLARE @CustomerName varchar(30)
	DECLARE @CustomerPhone varchar(30)
	DECLARE @Address varchar(50)
	DECLARE @ZipCode varchar(50)
	DECLARE @Email varchar(50)
	
	SELECT @ID= INSERTED.ID,
	@CustomerName= inserted.CustomerName,
	@Address = inserted.[Address],
	@ZipCode = inserted.ZipCode,
	@CustomerPhone = inserted.CustomerPhone, 
	@Email = inserted.Email
	FROM inserted

INSERT INTO CustomerName VALUES(@ID, @CustomerName, @Address, @ZipCode, @CustomerPhone, @Email, 'Inserted')
END
GO
INSERT INTO Customer Values(5,'Fred Show','100 yabba ave','12345','(231)-123-4567', 'ShowFred@gmail.com','Null');

SELECT * FROM CustomerName;
Go
CREATE TRIGGER CustomerName_Delete ON Customer
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @ID int
	DECLARE @CustomerName varchar(30)
	DECLARE @CustomerPhone varchar(30)
	DECLARE @Address varchar(50)
	DECLARE @ZipCode varchar(50)
	DECLARE @Email varchar(50)

	
	SELECT @ID= deleted.ID,
	@CustomerName= deleted.CustomerName,
	@Address = deleted.[Address],
	@ZipCode = deleted.ZipCode,
	@CustomerPhone = deleted.CustomerPhone, 
	@Email = deleted.Email
	FROM deleted

	INSERT INTO CustomerName VALUES(@ID, @CustomerName, @Address, @ZipCode, @CustomerPhone, @Email, 'Deleted')
END
GO
DELETE FROM Customer WHERE Id =5;
GO

SELECT * FROM CustomerName;

GO
CREATE TRIGGER CustomerName_Update ON Customer
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @ID int
	DECLARE @CustomerName varchar(30)
	DECLARE @CustomerPhone varchar(30)
	DECLARE @Address varchar(50)
	DECLARE @ZipCode varchar(50)
	DECLARE @Email varchar(50)

	SELECT @ID= INSERTED.ID,
	@CustomerName= inserted.CustomerName,
	@Address = inserted.[Address],
	@ZipCode = inserted.ZipCode,
	@CustomerPhone = inserted.CustomerPhone, 
	@Email = inserted.Email
	FROM inserted

	INSERT INTO CustomerName VALUES(@ID, @CustomerName, @Address, @ZipCode, @CustomerPhone, @Email, 'Updated')
END
GO
INSERT INTO Customer Values(5,'Fred Show','100 yabba ave','12345','(231)-123-4567', 'ShowFred@gmail.com','Null');
Go 
UPDATE Customer
SET CustomerName = 'Lory'
WHERE ID = 9;
GO

SELECT * FROM CustomerName;
