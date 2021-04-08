CREATE DATABASE ProjectC
GO
USE ProjectC
GO
CREATE TABLE [dbo].[MenuItems](
	[MenuItemID] [int] IDENTITY(1,1) NOT NULL,
	[MenuItemType] [varchar](25) NULL,
	[ItemName] [nvarchar](100) NULL,
	[ItemSize] [varchar](20) NULL,
	[ItemPrice] [float] NULL,
	[Description] [varchar](255) NULL,
	[GraphicFileName] [nvarchar](25) NULL,
 CONSTRAINT [PK_MenuItems] PRIMARY KEY CLUSTERED 
(
	[MenuItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[OrderDate] [smalldatetime] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Tel] [varchar](15) NULL,
	[PaymentType] [varchar](15) NULL,
	[Description] [nvarchar](500) NULL,
	[TotalValue] [varchar](50) NULL,
	[RegisterDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 

INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(1, N'Food', N'Fried chicken',N'Huge', 250000, N'Delecious', N'breakfast1.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(2, N'Food', N'Beef Steak',N'Large', 150000, N'Delecious', N'breakfast2.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(3, N'Food', N'Ramen',N'Medium', 100000, N'Delecious', N'breakfast3.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(4, N'Food', N'Sushi',N'Slice', 50000, N'Delecious', N'CF2.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(5, N'Food', N'Dimsung',N'Small', 75000, N'Delecious', N'CF4.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(6, N'Food', N'Ice Cream',N'Small', 75000, N'Delecious', N'IC4.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(7, N'Food', N'Ice Cream',N'Small', 75000, N'Delecious', N'IC1.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(8, N'Food', N'Ice Cream',N'Small', 75000, N'Delecious', N'IC2.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(9, N'Food', N'Ice Cream',N'Small', 75000, N'Delecious', N'IC3.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(10, N'Drink', N'Pepsi',N'330 ml.', 20000, N'Delecious', N'drink3.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(11, N'Drink', N'Cola', N'330 ml', 40000, N'Delecious', N'drink2.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(12, N'Drink', N'String', N'330 ml', 30000, N'Delecious', N'drink1.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(13, N'Drink', N'Strongbow', N'600 ml', 60000, N'Delecious', N'drink4.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(14, N'Drink', N'Heniken', N'500 ml', 40000, N'Delecious', N'drink5.jpg')
INSERT INTO MenuItems(MenuItemID,MenuItemType,ItemName,ItemSize,ItemPrice,Description,GraphicFileName) VALUES(15, N'Drink', N'Heniken', N'800 ml', 80000, N'Delecious', N'drink5.jpg')
SET IDENTITY_INSERT [dbo].[MenuItems] ON
/****** Object:  StoredProcedure [dbo].[SPOrderDetails]    Script Date: 3/26/2021 9:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SPOrderDetails]
	@OrderID int, 
	@ItemID int, 
	@Quantity int, 
	@Price int
As	 
	Insert into OrderDetails
	values 
	(@OrderID, getdate(),
	@ItemID, @Quantity, @Price)

GO
/****** Object:  StoredProcedure [dbo].[sp_Select_MenuItems]    Script Date: 3/26/2021 9:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_Select_MenuItems]
@MenuItemType varchar(25) output
-- use output parameters to return values to the caller of the procedure
As
Select * 
from MenuItems
where MenuItemType = @MenuItemType

GO
/****** Object:  StoredProcedure [dbo].[SPOrderDetails]    Script Date: 3/26/2021 9:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SPOrderDetails]
	@OrderID int, 
	@ItemID int, 
	@Quantity int, 
	@Price int
As	 
	Insert into OrderDetails
	values 
	(@OrderID, getdate(),
	@ItemID, @Quantity, @Price)

GO
/****** Object:  StoredProcedure [dbo].[SPOrders]    Script Date: 3/26/2021 9:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SPOrders]
	@CustomerName nvarchar(50), 
	@ContactPerson nvarchar(50), 
	@Address nvarchar(100), 
	@Tel varchar(15), 
	@PaymentType varchar(15), 
	@Description nvarchar(500),
	@TotalValue varchar(50)
As	 
	Insert into Orders 
values 
	(@CustomerName, @ContactPerson, @Address, @Tel, @PaymentType, @Description, @TotalValue, getdate())
	return @@IDENTITY

GO