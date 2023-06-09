USE [master]
GO
/****** Object:  Database [BirdeePlatform]    Script Date: 7/12/2023 8:24:07 AM ******/
CREATE DATABASE [BirdeePlatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BirdeePlatform', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\BirdeePlatform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BirdeePlatform_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\BirdeePlatform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BirdeePlatform] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BirdeePlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BirdeePlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdeePlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdeePlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdeePlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdeePlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdeePlatform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BirdeePlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdeePlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdeePlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdeePlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdeePlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdeePlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdeePlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdeePlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdeePlatform] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BirdeePlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdeePlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdeePlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdeePlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdeePlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdeePlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdeePlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdeePlatform] SET RECOVERY FULL 
GO
ALTER DATABASE [BirdeePlatform] SET  MULTI_USER 
GO
ALTER DATABASE [BirdeePlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdeePlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdeePlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdeePlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BirdeePlatform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BirdeePlatform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BirdeePlatform', N'ON'
GO
ALTER DATABASE [BirdeePlatform] SET QUERY_STORE = OFF
GO
USE [BirdeePlatform]
GO
/****** Object:  Table [dbo].[Best_Seller]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Best_Seller](
	[ProductID] [int] NULL,
	[deleteFlag] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bird_Details]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bird_Details](
	[ProductID] [int] NULL,
	[dob] [date] NULL,
	[gender] [bit] NULL,
	[height] [float] NULL,
	[weight] [float] NULL,
	[origin] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
	[TagId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 7/12/2023 8:24:07 AM ******/
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
/****** Object:  Table [dbo].[Image_Product]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_Product](
	[ProductID] [int] NULL,
	[image] [text] NULL,
	[deleteFlag] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[New_Arrival]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[New_Arrival](
	[ProductID] [int] NOT NULL,
	[deleteFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Rate] [float] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[OrderFromUser] [int] NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Email] [varchar](255) NULL,
	[Customer_Phone] [varchar](20) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[DateTime] [datetime] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[TotalOrder] [money] NULL,
	[Status] [int] NULL,
	[IsRated] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] NOT NULL,
	[Method] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Collection]    Script Date: 7/12/2023 8:24:07 AM ******/
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
/****** Object:  Table [dbo].[Product_Tag]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Tag](
	[ProductId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [Product_Tag_PKs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/12/2023 8:24:07 AM ******/
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
	[ClassType] [int] NULL,
	[ClassValue] [nvarchar](50) NULL,
	[createDate] [date] NULL,
	[ParentId] [int] NULL,
	[CategoryId] [int] NULL,
	[IsParent] [bit] NULL,
	[ShopID] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate_Product]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate_Product](
	[RateID] [int] IDENTITY(1,1) NOT NULL,
	[Rate] [float] NULL,
	[Comment] [nvarchar](max) NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Date] [date] NULL,
	[deleteFlag] [bit] NULL,
 CONSTRAINT [PK_Rate_Product] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOrder]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOrder](
	[StatusOrderID] [int] NOT NULL,
	[StatusValue] [nvarchar](255) NULL,
 CONSTRAINT [PK_StatusOrder] PRIMARY KEY CLUSTERED 
(
	[StatusOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/12/2023 8:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[EmailID] [text] NULL,
	[Password] [varchar](255) NULL,
	[Phone] [varchar](10) NULL,
	[DOB] [date] NULL,
	[Address] [nvarchar](max) NULL,
	[Avatar] [text] NULL,
	[gender] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[ManagerID] [int] NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (3, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (6, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (12, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (7, 0)
GO
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (1, CAST(N'2023-06-12' AS Date), 1, 5.4, 34.3, N'VN')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (2, CAST(N'2023-05-28' AS Date), 0, 2.3, 34.2, N'US')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (3, CAST(N'2023-04-14' AS Date), 1, 5.2, 43.3, N'US')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (4, CAST(N'2023-05-17' AS Date), 0, 3.4, 53, N'AU')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (5, CAST(N'2023-05-05' AS Date), 1, 3.4, 43, N'UK')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (6, CAST(N'2023-05-23' AS Date), 1, 6.6, 23, N'VN')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (7, CAST(N'2023-04-30' AS Date), 0, 3.4, 23, N'VN')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (8, CAST(N'2023-06-06' AS Date), 0, 6.5, 43, N'UK')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (9, CAST(N'2023-04-30' AS Date), 1, 7.2, 35, N'US')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (1, N'Chim Cảnh', 1, NULL, 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (2, N'Chim giống', 1, NULL, 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (3, N'Cám chim', 1, NULL, 3)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (4, N'Hạt', 1, NULL, 3)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (5, N'Cám tăng trưởng', 1, NULL, 3)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (6, N'Máng nước', 1, NULL, 5)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (7, N'Máng thức ăn', 1, NULL, 5)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (8, N'Lồng chim cảnh', 1, NULL, 7)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (12, N'Nhà chim bồ câu', 1, NULL, 7)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Collections] ON 

INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (1, N'Thú vui nuôi chim', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/10-37c9706f-413a-4123-b0d6-07905851440b.png?v=1648550713910', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (3, N'Phụ kiện nổi bật', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/9-228daf39-c660-4d00-9cc0-b9bbdb8f0e1d.png?v=1648550696500', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (4, N'Sản phẩm hot', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/cuo-c-so-ng-thu-o-ng-nga-y.png?v=1648549034233', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (5, N'Người mới', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/thu-gia-n.png?v=1648549150917', 1, NULL)
SET IDENTITY_INSERT [dbo].[Collections] OFF
GO
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (1, N'https://image-us.eva.vn/upload/4-2021/images/2021-10-01/image1-1633053449-421-width600height450.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (2, N'https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2021/04/5cb00187-hinh-dai-dien-vet-kieng.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (3, N'https://naipet.com/wp-content/uploads/2017/03/ky-thuat-chon-chim-cu-gay.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (4, N'https://vcdn-dulich.vnecdn.net/2019/12/26/chim-9542-1577363880.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (5, N'https://vietnamwildlife.files.wordpress.com/2021/12/pna_5322_l2048.jpg?w=2048', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (6, N'https://www.thukieng.com/wp-content/uploads/2017/07/gia-mua-ban-chim-hoa-mi-1.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (7, N'https://runghoangda.com/wp-content/uploads/2022/06/vet-Lovebird-1.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (8, N'https://media.vov.vn/sites/default/files/styles/large/public/2022-09-2/na_62c5c8b34f6d8.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (9, N'https://redsvn.net/wp-content/uploads/2021/10/img_616f81e80d51f.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (10, N'https://longchimvac.net/app/webroot/uploads/files/demo/longchaomaovuong_750x1000.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (11, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/263/045/products/z4183064164276-a078ec090468b44fccd13da4f15fc4b1.jpg?v=1678848260617', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (12, N'https://sc01.alicdn.com/kf/HTB1qP09mwKTBuNkSne1q6yJoXXaN/200065609/HTB1qP09mwKTBuNkSne1q6yJoXXaN.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (13, N'https://lzd-img-global.slatic.net/g/p/8eb6009dba1edef59aca486a2e12311a.jpg_720x720q80.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (14, N'https://img.nhabanhang.com/sp/f/439975/fityle-dung-cu-nap-thuc-an-cho-chim-treo-hat-giong-an-gazebo-mang-dung-thuc-an-cho-chim-hoang-dung-cu-nap-thuc-an-cho-chim-buc-tranh-toan-canh-nhua-503.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (15, N'https://vn-live-01.slatic.net/p/143421766fc6e9cd1df8c5507d2d7888.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (16, N'https://cf.shopee.vn/file/sg-11134201-23020-4p6z2yyl3wnvb3', 0)
GO
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (1, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (2, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (8, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (15, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [TotalOrder], [Status], [IsRated]) VALUES (1, 8, N'Minh Ngunnnn', N'minhnd101001@gmail.com', N'2342342342', N'Đường Điên Biên, thành phố Yên Bái', CAST(N'2023-07-11T00:00:00.000' AS DateTime), 1, 2680.0000, 1, 0)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [TotalOrder], [Status], [IsRated]) VALUES (2, 18, N'Minh Nguyen', N'sdfsad@gmail.com', N'3244444444', N'dfgsdfg', CAST(N'2023-07-11T00:00:00.000' AS DateTime), 1, 500.0000, 3, 0)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [TotalOrder], [Status], [IsRated]) VALUES (3, 17, N'Minh Nguyễn', N'ndminh1010@gmail.com', N'1231233333', N'sfsdfsdfsdf', CAST(N'2023-07-11T00:00:00.000' AS DateTime), 1, 720.0000, 3, 0)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [TotalOrder], [Status], [IsRated]) VALUES (4, 17, N'Minh Nguyễn', N'cus6@gmail.com', N'1231233333', N'dfggggg', CAST(N'2023-07-11T00:00:00.000' AS DateTime), 1, 110.0000, 1, 0)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [TotalOrder], [Status], [IsRated]) VALUES (5, 18, N'Minh Nguyen', N'sdfsad@gmail.com', N'1231233333', N'dfgsdfg', CAST(N'2023-07-12T00:00:00.000' AS DateTime), 1, 110.0000, 1, 0)
GO
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (1, N'Ship COD', 1)
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (2, N'Chuyển khoản', 1)
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (3, N'Paypal', 0)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (1, N'Chim vành khuyên', 220.0000, 30, 1, 1, N'Chim trưởng thành', NULL, NULL, 2, 1, 12, N'Đây là mô tả')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (2, N'Vẹt xanh', 220.0000, 0, 1, NULL, NULL, NULL, NULL, 1, 1, 12, N'Đây là mô tả')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (3, N'Chim Cu Gáy', 280.0000, 57, 1, NULL, NULL, NULL, NULL, 2, 1, 12, N'Đây là mô tả')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (4, N'Chích chòe than', 320.0000, 45, 1, NULL, NULL, NULL, NULL, 2, 1, 13, N'Đây là mô tả')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (5, N'Sáo đầu trắng', 480.0000, 12, 1, NULL, NULL, NULL, NULL, 2, 1, 12, N'Đây là mô tả')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (6, N'Chim họa mi bổi', 350.0000, 8, 1, NULL, NULL, NULL, 5, 1, 1, 13, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (7, N'Cặp vẹt lovebird', 250.0000, 6, 1, NULL, NULL, NULL, 5, 2, 1, 16, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (8, N'Chim cánh cụt', 90.0000, 0, 1, NULL, NULL, NULL, NULL, 1, 1, 16, N'Đây là mô tả')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (9, N'Chim sáo', 90.0000, 34, 1, NULL, NULL, NULL, 8, 2, 1, 13, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (10, N'Lồng chim vuông', 90.0000, 0, 1, NULL, NULL, NULL, 8, 8, 1, 12, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (11, N'Cám chim', 90.0000, 42, 1, NULL, NULL, NULL, 8, 3, 1, 16, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (12, N'Lồng tròn xanh', 90.0000, 13, 1, 2, N'20x60cm', NULL, 8, 8, 1, 12, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (13, N'Khay đựng nước', 750.0000, 10, 1, NULL, NULL, NULL, NULL, 6, 1, 13, N'Đây là mô tả')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (14, N'Máng thức ăn', 750.0000, 8, 1, NULL, NULL, NULL, NULL, 7, 1, 13, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (15, N'Máng thức ăn tròn', 390.0000, 23, 1, NULL, NULL, NULL, NULL, 7, 1, 16, N'Đây là mô tả')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (16, N'Khay nước tự động', 180.0000, 19, 1, NULL, NULL, NULL, NULL, NULL, 1, 12, N'Đây là mô tả')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (26, N'Lồng tròn xanh', 150.0000, 20, 1, 2, N'40x80cm', NULL, 12, 8, 0, 12, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (27, N'Chim vành khuyên', 150.0000, 15, 1, 1, N'Chim non', NULL, 1, NULL, 0, 12, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description]) VALUES (28, N'Máng thức ăn', 1000.0000, 5, 1, 1, N'Tự động đổ thức ăn', NULL, 14, 7, 0, 14, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (1, N'Admin', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (2, N'Staff', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (3, N'Customer', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (4, N'Shop', 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (2, N'Đang vận chuyển')
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (3, N'Hoàn thành')
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (1, N'Chim', 1, NULL)
INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (3, N'Thức ăn', 1, NULL)
INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (5, N'Máng', 1, NULL)
INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (7, N'Lồng chim', 1, NULL)
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (1, N'Loại')
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (2, N'Kích thước')
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (3, N'Màu sắc')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (1, N'Nguyễn Ánh Linh', N'admin@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'1999-12-02' AS Date), N'Hà Ðông, Hà N?i', NULL, N'Nữ', 1, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (2, N'Đào Phúc Lộc', N'satff1@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987283476', CAST(N'1992-02-15' AS Date), NULL, NULL, N'Nữ', 3, 1, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (3, N'Quyền Hải Long', N'satff2@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0332837477', CAST(N'2002-06-23' AS Date), N'Lao Cai', NULL, N'Nam', 3, 1, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (4, N'Nguyễn Quang Huy', N'satff3@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0982678876', CAST(N'2001-05-04' AS Date), N'Khu?t Duy Ti?n, Hà N?i', NULL, N'Nam', 3, 1, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (6, N'Vũ Duy N am', N'satff5@gmail.co', NULL, N'53e6086284353cb73d4979f08537d950', N'0983123122', CAST(N'2001-10-06' AS Date), N'Hải, Nọi', NULL, N'Nam', 2, 1, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (7, N'Nguyen Duc Minh', NULL, NULL, N'53e6086284353cb73d4979f08537d950', NULL, NULL, NULL, NULL, N'Nam', 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (8, N'Nguyen Duc Minh', NULL, N'108801319630039114694', N'53e6086284353cb73d4979f08537d950', NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (10, N'Minh Nguyen', N'minhnd101001@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', NULL, N'helooooooooo', NULL, N'Nam', 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (11, N'Nguyen Minh', NULL, N'118315661978952123595', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (12, N'Tuấn Thành', N'nono@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'1234567890', NULL, N'Ðu?ng Ðiên Biên, thành ph? Yên Bái', NULL, N'Nam', 4, 4, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (13, N'Từ Chinh', N'khongco@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'3534543256', NULL, N'Hà N?i', NULL, N'Nam', 4, 4, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (14, N'Nguyen Duc Minh', N'ndminh.work@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'2023-06-06' AS Date), N'Hà N?i', NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (15, N'helo', N'efgsdgk@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'2023-06-15' AS Date), N'Hà N?i', NULL, N'Nam', 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (16, N'Hải Anh', N'shop1@gmail.com', NULL, N'202cb962ac59075b964b07152d234b70', N'0987654321', CAST(N'2002-06-13' AS Date), N'', NULL, N'Nữ', 4, 2, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (17, N'Minh Nguyễn', NULL, N'106099637354725921371', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (18, N'Minh Nguyen', NULL, N'100337919530334669808', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (19, N'Đức Hải', N'sdfsad@gmail.com', NULL, N'25d55ad283aa400af464c76d713c07ad', N'1231233333', CAST(N'2023-07-14' AS Date), N'dfgsdfg', NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (20, N'Hải Anh', N'cus6@gmail.com', NULL, N'a11b66e058a6de4997d6b88b9f3f0bfb', N'1231233444', CAST(N'2023-07-21' AS Date), N'Ha Noi', NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description]) VALUES (22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Best_Seller]  WITH CHECK ADD  CONSTRAINT [FK_Best_Seller_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Best_Seller] CHECK CONSTRAINT [FK_Best_Seller_Products]
GO
ALTER TABLE [dbo].[Bird_Details]  WITH CHECK ADD  CONSTRAINT [FK_Bird_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Bird_Details] CHECK CONSTRAINT [FK_Bird_Details_Products]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Tags]
GO
ALTER TABLE [dbo].[Image_Product]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Image_Product] CHECK CONSTRAINT [FK_Image_Product_Products]
GO
ALTER TABLE [dbo].[New_Arrival]  WITH CHECK ADD  CONSTRAINT [FK_New_Arrival_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[New_Arrival] CHECK CONSTRAINT [FK_New_Arrival_Products]
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders1] FOREIGN KEY([Status])
REFERENCES [dbo].[StatusOrder] ([StatusOrderID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payments] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[Payments] ([PaymentId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payments]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User1] FOREIGN KEY([OrderFromUser])
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
ALTER TABLE [dbo].[Product_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tag_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Product_Tag] CHECK CONSTRAINT [FK_Product_Tag_Products]
GO
ALTER TABLE [dbo].[Product_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tag_Tags1] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[Product_Tag] CHECK CONSTRAINT [FK_Product_Tag_Tags1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products1] FOREIGN KEY([ClassType])
REFERENCES [dbo].[Type] ([TypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_User] FOREIGN KEY([ShopID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_User]
GO
ALTER TABLE [dbo].[Rate_Product]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Product_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Rate_Product] CHECK CONSTRAINT [FK_Rate_Product_Products]
GO
ALTER TABLE [dbo].[Rate_Product]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Product_User] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Rate_Product] CHECK CONSTRAINT [FK_Rate_Product_User]
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
ALTER DATABASE [BirdeePlatform] SET  READ_WRITE 
GO
