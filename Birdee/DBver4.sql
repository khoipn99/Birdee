USE [master]
GO
/****** Object:  Database [Birdee_oke]    Script Date: 6/28/2023 10:47:23 AM ******/
CREATE DATABASE [Birdee_oke]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Birdee_oke', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\Birdee_oke.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Birdee_oke_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\Birdee_oke_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Birdee_oke] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Birdee_oke].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Birdee_oke] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Birdee_oke] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Birdee_oke] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Birdee_oke] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Birdee_oke] SET ARITHABORT OFF 
GO
ALTER DATABASE [Birdee_oke] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Birdee_oke] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Birdee_oke] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Birdee_oke] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Birdee_oke] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Birdee_oke] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Birdee_oke] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Birdee_oke] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Birdee_oke] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Birdee_oke] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Birdee_oke] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Birdee_oke] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Birdee_oke] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Birdee_oke] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Birdee_oke] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Birdee_oke] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Birdee_oke] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Birdee_oke] SET RECOVERY FULL 
GO
ALTER DATABASE [Birdee_oke] SET  MULTI_USER 
GO
ALTER DATABASE [Birdee_oke] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Birdee_oke] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Birdee_oke] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Birdee_oke] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Birdee_oke] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Birdee_oke] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Birdee_oke', N'ON'
GO
ALTER DATABASE [Birdee_oke] SET QUERY_STORE = OFF
GO
USE [Birdee_oke]
GO
/****** Object:  Table [dbo].[Bird_Details]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bird_Details](
	[productID] [int] NULL,
	[dob] [date] NULL,
	[gender] [bit] NULL,
	[height] [float] NULL,
	[weight] [float] NULL,
	[origin] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[Description] [text] NULL,
	[Image] [text] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[CollectionID] [int] IDENTITY(1,1) NOT NULL,
	[CollectionName] [nvarchar](255) NOT NULL,
	[link] [varchar](max) NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Collections] PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImgID] [int] IDENTITY(1,1) NOT NULL,
	[link] [varchar](max) NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmloyeeID] [int] NULL,
	[DateTime] [datetime] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Method] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Collection]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Collection](
	[ProductId] [int] NOT NULL,
	[CollectionId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [Product_Collection_PKs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[Status] [bit] NULL,
	[createDate] [date] NULL,
	[CategoryId] [int] NULL,
	[ShopID] [int] NULL,
	[Description] [text] NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/28/2023 10:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Username] [varchar](255) NULL,
	[EmailID] [text] NULL,
	[Password] [varchar](255) NULL,
	[Phone] [varchar](10) NULL,
	[DOB] [date] NULL,
	[Address] [text] NULL,
	[Avatar] [text] NULL,
	[RoleID] [int] NULL,
	[ManagerID] [int] NULL,
	[Status] [bit] NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Bird_Details] ([productID], [dob], [gender], [height], [weight], [origin]) VALUES (1, CAST(N'2023-06-12' AS Date), 1, 5.4, 34.3, N'VN')
INSERT [dbo].[Bird_Details] ([productID], [dob], [gender], [height], [weight], [origin]) VALUES (2, CAST(N'2023-05-28' AS Date), 1, 2.3, 34.2, N'US')
INSERT [dbo].[Bird_Details] ([productID], [dob], [gender], [height], [weight], [origin]) VALUES (3, CAST(N'2023-04-14' AS Date), 1, 5.2, 43.3, N'US')
INSERT [dbo].[Bird_Details] ([productID], [dob], [gender], [height], [weight], [origin]) VALUES (4, CAST(N'2023-05-17' AS Date), 1, 3.4, 53, N'AU')
INSERT [dbo].[Bird_Details] ([productID], [dob], [gender], [height], [weight], [origin]) VALUES (5, CAST(N'2023-05-05' AS Date), 0, 3.4, 43, N'UK')
INSERT [dbo].[Bird_Details] ([productID], [dob], [gender], [height], [weight], [origin]) VALUES (6, CAST(N'2023-05-23' AS Date), 1, 6.6, 23, N'VN')
INSERT [dbo].[Bird_Details] ([productID], [dob], [gender], [height], [weight], [origin]) VALUES (7, CAST(N'2023-04-30' AS Date), 1, 3.4, 23, N'VN')
INSERT [dbo].[Bird_Details] ([productID], [dob], [gender], [height], [weight], [origin]) VALUES (8, CAST(N'2023-06-06' AS Date), 0, 6.5, 43, N'UK')
INSERT [dbo].[Bird_Details] ([productID], [dob], [gender], [height], [weight], [origin]) VALUES (9, NULL, 0, 7.2, 35, N'US')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [Image]) VALUES (1, N'Chim cảnh', 1, NULL, N'https://inoxthaian.vn/wp-content/uploads/2021/02/hinh-anh-chim-chao-mao-trong-tu-nhien.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [Image]) VALUES (2, N'Chim giống', 1, NULL, N'data:image/jpeg;base64,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')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [Image]) VALUES (3, N'Thức ăn', 1, NULL, N'https://product.hstatic.net/200000339367/product/480x480-01_ab7c2c2d1a024261b3454bc10b686959_large.png')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [Image]) VALUES (4, N'Máng, cóng', 1, NULL, N'https://img.nhabanhang.com/sp/f/439975/fityle-dung-cu-nap-thuc-an-cho-chim-treo-hat-giong-an-gazebo-mang-dung-thuc-an-cho-chim-hoang-dung-cu-nap-thuc-an-cho-chim-buc-tranh-toan-canh-nhua-503.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [Image]) VALUES (5, N'Lồng chim', 1, NULL, N'https://maytretrungphuong.com/wp-content/uploads/2016/04/den-long-tre-mau-den-tre-hinh-long-chim-2-510x510.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (1, N'Chim vành khuyên', 120.0000, 12, 1, CAST(N'2023-06-13' AS Date), 1, NULL, N'ok', N'https://image-us.eva.vn/upload/4-2021/images/2021-10-01/image1-1633053449-421-width600height450.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (2, N'Vẹt xanh', 120.0000, 0, 1, CAST(N'2023-05-20' AS Date), 1, NULL, N'Con chim này lông r?t
                            dài', N'https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2021/04/5cb00187-hinh-dai-dien-vet-kieng.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (3, N'Chim Cu Gáy', 340.0000, 3, 1, CAST(N'2023-06-24' AS Date), 2, NULL, NULL, N'https://naipet.com/wp-content/uploads/2017/03/ky-thuat-chon-chim-cu-gay.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (4, N'Chích chòe than', 350.0000, 34, 1, CAST(N'2023-06-20' AS Date), 2, NULL, N'Con chim này lông r?t
                            dài', N'https://vcdn-dulich.vnecdn.net/2019/12/26/chim-9542-1577363880.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (5, N'Sáo đầu trắng', 420.0000, 43, 1, CAST(N'2023-06-05' AS Date), 1, NULL, NULL, N'https://vietnamwildlife.files.wordpress.com/2021/12/pna_5322_l2048.jpg?w=2048')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (6, N'Chim họa mi bổi', 100.0000, 0, 1, CAST(N'2023-06-05' AS Date), 2, NULL, N'Chim ngon', N'https://www.thukieng.com/wp-content/uploads/2017/07/gia-mua-ban-chim-hoa-mi-1.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (7, N'Cặp vẹt lovebird', 340.0000, 123, 1, CAST(N'2023-06-06' AS Date), 1, NULL, N'oke', N'https://runghoangda.com/wp-content/uploads/2022/06/vet-Lovebird-1.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (8, N'Chim cánh cụt', 900.0000, 42, 1, CAST(N'2023-06-07' AS Date), 1, NULL, NULL, N'https://media.vov.vn/sites/default/files/styles/large/public/2022-09-2/na_62c5c8b34f6d8.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (9, N'Chim sáo', 300.0000, 432, 1, CAST(N'2023-06-12' AS Date), 1, NULL, NULL, N'https://redsvn.net/wp-content/uploads/2021/10/img_616f81e80d51f.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (10, N'Lồng chim vuông', 500.0000, 25, 1, CAST(N'2023-05-29' AS Date), 5, NULL, NULL, N'https://longchimvac.net/app/webroot/uploads/files/demo/longchaomaovuong_750x1000.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (11, N'Cám chim', 150.0000, 52, 1, CAST(N'2023-06-24' AS Date), 4, NULL, NULL, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/263/045/products/z4183064164276-a078ec090468b44fccd13da4f15fc4b1.jpg?v=1678848260617')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (12, N'Lồng tròn xanh', 200.0000, 52, 1, CAST(N'2023-06-20' AS Date), 5, NULL, N'ngon', N'https://sc01.alicdn.com/kf/HTB1qP09mwKTBuNkSne1q6yJoXXaN/200065609/HTB1qP09mwKTBuNkSne1q6yJoXXaN.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (13, N'Khay đựng nước', 300.0000, 534, 1, CAST(N'2023-06-20' AS Date), 4, NULL, N'okela', N'https://lzd-img-global.slatic.net/g/p/8eb6009dba1edef59aca486a2e12311a.jpg_720x720q80.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (14, N'Máng thức ăn', 200.0000, 200, 1, CAST(N'2023-06-05' AS Date), 3, NULL, NULL, N'https://img.nhabanhang.com/sp/f/439975/fityle-dung-cu-nap-thuc-an-cho-chim-treo-hat-giong-an-gazebo-mang-dung-thuc-an-cho-chim-hoang-dung-cu-nap-thuc-an-cho-chim-buc-tranh-toan-canh-nhua-503.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (15, N'Máng thức ăn tròn', 500.0000, 10, 1, CAST(N'2023-06-05' AS Date), 3, NULL, NULL, N'https://vn-live-01.slatic.net/p/143421766fc6e9cd1df8c5507d2d7888.jpg')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [createDate], [CategoryId], [ShopID], [Description], [Image]) VALUES (16, N'Khay nước tự động', 800.0000, 9, 1, CAST(N'2023-06-20' AS Date), 3, NULL, NULL, N'https://cf.shopee.vn/file/sg-11134201-23020-4p6z2yyl3wnvb3')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (1, N'Admin', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (2, N'Staff', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (3, N'Shop', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (4, N'Customer', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (5, N'Manager', 0)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [Username], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (1, N'Nguyen Thanh', N'thanhthanh', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', NULL, NULL, NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Username], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (2, N'Minh Nguyễn', NULL, N'106099637354725921371', NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Username], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (3, N'hello', N'user1', NULL, N'53e6086284353cb73d4979f08537d950', N'0123456789', CAST(N'2003-06-16' AS Date), N'adsfasdfasdf', NULL, 4, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Username], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (5, N'afdasdfasdf', N'asd', NULL, N'53e6086284353cb73d4979f08537d950', N'123123123', CAST(N'1998-12-15' AS Date), N'asdfasdfasdf', NULL, 4, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Username], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (6, N'shop1', N'shop1', NULL, N'53e6086284353cb73d4979f08537d950', NULL, CAST(N'2002-12-15' AS Date), N'asdfasdf', NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Username], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (7, N'shop2', N'shop2', NULL, N'53e6086284353cb73d4979f08537d950', NULL, CAST(N'2000-02-23' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Bird_Details]  WITH CHECK ADD  CONSTRAINT [FK_Bird_Details_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Bird_Details] CHECK CONSTRAINT [FK_Bird_Details_Products]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payments] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[Payments] ([PaymentId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payments]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([EmloyeeID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User1]
GO
ALTER TABLE [dbo].[Product_Collection]  WITH CHECK ADD  CONSTRAINT [FK_Product_Collection_Collections] FOREIGN KEY([CollectionId])
REFERENCES [dbo].[Collections] ([CollectionID])
GO
ALTER TABLE [dbo].[Product_Collection] CHECK CONSTRAINT [FK_Product_Collection_Collections]
GO
ALTER TABLE [dbo].[Product_Collection]  WITH CHECK ADD  CONSTRAINT [FK_Product_Collection_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Product_Collection] CHECK CONSTRAINT [FK_Product_Collection_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_User] FOREIGN KEY([ShopID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
USE [master]
GO
ALTER DATABASE [Birdee_oke] SET  READ_WRITE 
GO
