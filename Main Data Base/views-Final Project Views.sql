/* Final Project Views - Cole Crain*/

USE NorthernStarFarms;
GO
CREATE VIEW VI_view
AS
SELECT CustomerID, [Type], PricePerBale, [Date] 
FROM Product
JOIN [Order] ON Product.ID = [Order].[ID]
GO

CREATE VIEW VI_limited_view
AS
SELECT OrderDetails.ID AS [OrderDetails ID], [OrderID], Quanity, ProductID
FROM OrderDetails
JOIN [Order] ON OrderDetails.ID = [Order].[ID]
--WITH CHECK OPTION;
GO

USE NorthernStarFarms;
GO 
CREATE VIEW ZipCode_SW
AS
SELECT * FROM ZipCode
WHERE City IN ('Acme', 'Kingsley','Traverse City');
GO
SELECT * FROM ZipCode_SW;

USE NorthernStarFarms;
GO
INSERT INTO VI_limited_view (OrderDetails.ID, [OrderID], Quanity, ProductID)
VALUES ('6', '6', 'Quantity', 'Product ID');























