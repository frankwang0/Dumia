Create Database Dumia
GO
USE [Dumia]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 18-Sep-16 7:13:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 18-Sep-16 7:13:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](250) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Product]
GO


/** Add Products **/
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [ImageUrl], [Code]) VALUES (1, N'Ladies Bag', CAST(120.00 AS Decimal(18, 2)), N'/content/images/bag.jpg', N'Bag-01')
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [ImageUrl], [Code]) VALUES (2, N'Blanket', CAST(100.00 AS Decimal(18, 2)), N'/content/images/blanket.jpg', N'Blanket-01')
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [ImageUrl], [Code]) VALUES (3, N'Knives', CAST(20.00 AS Decimal(18, 2)), N'/content/images/knife.jpg', N'Knife-01')
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [ImageUrl], [Code]) VALUES (4, N'Pillows', CAST(45.00 AS Decimal(18, 2)), N'/content/images/pillow.jpg', N'Pillow-01')
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [ImageUrl], [Code]) VALUES (5, N'School Bag', CAST(150.00 AS Decimal(18, 2)), N'/content/images/schoolbag.jpg', N'Bag-02')
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [ImageUrl], [Code]) VALUES (6, N'Sony Television', CAST(400.00 AS Decimal(18, 2)), N'/content/images/tv.jpg', N'TV-01')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO

INSERT [dbo].[Inventory] ([ProductID], [Quantity]) VALUES (1, 15)
INSERT [dbo].[Inventory] ([ProductID], [Quantity]) VALUES (2, 15)
INSERT [dbo].[Inventory] ([ProductID], [Quantity]) VALUES (3, 15)
INSERT [dbo].[Inventory] ([ProductID], [Quantity]) VALUES (4, 15)
INSERT [dbo].[Inventory] ([ProductID], [Quantity]) VALUES (5, 15)
INSERT [dbo].[Inventory] ([ProductID], [Quantity]) VALUES (6, 15)