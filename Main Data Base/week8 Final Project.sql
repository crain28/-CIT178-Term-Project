/*Final Project Lab Assignment*/

USE NorthernStarFarms;
SELECT ZipCode.State, Count(DISTINCT C.CustomerName) AS [Customer per State]
From Customer AS C Join ZipCode ON C.ZipCode = ZipCode.ZipCode
Group BY ZipCode.State
Order BY ZipCode.State ASC;

SELECT OD.ProductID, SUM(OD.Quanity*P.PricePerBale) AS 'Total Price', 
AVG(OD.Quanity * P.PricePerBale) AS 'Up Front Price Due'
FROM OrderDetails AS OD JOIN Product AS P on OD.ProductID = P.ID
GROUP BY OD.ProductID;

SELECT COUNT(ProductID) AS [Total Items Ordered],
	     AVG(ProductID) AS [Average per Item]
		 FROM OrderDetails JOIN Product ON OrderDetails.ID = ProductID	  		 

Select MIN(OrderDetails.Quanity) AS [Minimum Amount Due],
	   MAX(OrderDetails.Quanity) AS [Maximum Amount Due]
FROM OrderDetails;
		
USE NorthernStarFarms;
SELECT ZipCode.City, COUNT (OrderDetails.OrderID) AS [Number of Orders]
FROM Customer JOIN ZipCode ON ZipCode.ZipCode = Customer.ZipCode
JOIN OrderDetails ON Customer.ID = OrderDetails.ID
GROUP BY ZipCode.CIty
ORDER BY ZipCode.City;



