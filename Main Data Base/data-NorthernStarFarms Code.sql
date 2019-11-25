--/*  Use NorthernStarFarms inputting Data*/  
USE NorthernStarFarms;

Insert Into [ZipCode] Values ('10010','Acme', 'MI')
Insert Into [ZipCode] Values ('85001', 'Traverse City','MI')
Insert Into [ZipCode] Values ('10020', 'Buckley', 'MI')
Insert Into [ZipCode] Values ('33109', 'Mesick', 'MI')
Insert Into [ZipCode] Values ('98116', 'Kingsley', 'MI')
Insert Into [ZipCode] Values ('33111', 'Buckley', 'MI')

Insert Into [Product] Values(1, 'round', 40.00, 'a round about 200 pounds')
Insert Into [Product] Values(2, 'square', 4.50, 'a rectangle about 45 pounds')
Insert Into [Product] Values(3, 'round', 40.00, 'a round about 200 pounds')
Insert Into [Product] Values(4, 'square', 4.50, 'a rectangle about 45 pounds')
Insert Into [Product] Values(5, 'round', 40.00, 'a round about 200 pounds')
Insert Into [Product] Values(6, 'square', 4.50, 'a rectangle about 45 pounds')

Insert Into [Locations] Values(1, 'Farm', '3215 Bob Drive', '10010')
Insert Into [Locations] Values(2, 'Farm', '1234 Mill Road', '85001')
Insert Into [Locations] Values(3, 'Field', '3415 Silver Line', '10020')
Insert Into [Locations] Values(4, 'Field', '3251 Ace Drive', '33109')
Insert Into [Locations] Values(5, 'Farm', '6445 Hill Road ', '98116')
Insert Into [Locations] Values(6, 'Field', '3245 Wig Drive', '33109')

Insert Into [Customer] Values(1,'Bob Wash', '(111)121-1121', '123 Park Place', 'den@wash.com', '10010')
Insert Into [Customer] Values(2, 'Josh Roberts', '(112)131-1131', '555 Old Home Road', 'julia@jroberts.net', '85001')
Insert Into [Customer] Values(3, 'Fred Matrix', '(112)222-2222', '225 Brick Road', 'neo@matrix.net', '10020')
Insert Into [Customer] Values(4, 'Ace Got', '(113)123-1234', '100 Ocean Blvd', 'sophie@got.com', '33109')
Insert Into [Customer] Values(5, 'Kim Kravitz', '(234)234-1112', '222 New Haven Drive', 'zoe@kravitz.net', '98116')
Insert Into [Customer] Values(6, 'Drew Block', '(132)123-4321', '899 Parkside Ave', 'jlo@jennytheblock.net', '33109')

Insert Into [Order] Values(1, '10/10/2020', 1, 1)
Insert Into [Order] Values(2, '6/6/2020', 1, 1)
Insert Into [Order] Values(3, '5/5/2020', 2, 2)
Insert Into [Order] Values(4, '9/9/2020', 5, 5)
Insert Into [Order] Values(5, '7/7/2020',  4, 4)
Insert Into [Order] Values(6, '8/8/2020', 6, 6)

INSERT [dbo].[OrderDetails] ([ID], [OrderID], [Quanity], [ProductID]) VALUES (N'1', N'1', N'5', N'1')
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [Quanity], [ProductID]) VALUES (N'2', N'1', N'600', N'2')
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [Quanity], [ProductID]) VALUES (N'3', N'2', N'10', N'1')
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [Quanity], [ProductID]) VALUES (N'4', N'2', N'700', N'2')
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [Quanity], [ProductID]) VALUES (N'5', N'3', N'15', N'1')
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [Quanity], [ProductID]) VALUES (N'6', N'3', N'800', N'2')
