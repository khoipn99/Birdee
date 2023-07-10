USE [master]
GO
/****** Object:  Database [Birdee]    Script Date: 6/28/2023 10:35:36 AM ******/
CREATE DATABASE [Birdee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Birdee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\Birdee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Birdee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\Birdee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Birdee] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Birdee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Birdee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Birdee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Birdee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Birdee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Birdee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Birdee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Birdee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Birdee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Birdee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Birdee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Birdee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Birdee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Birdee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Birdee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Birdee] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Birdee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Birdee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Birdee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Birdee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Birdee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Birdee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Birdee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Birdee] SET RECOVERY FULL 
GO
ALTER DATABASE [Birdee] SET  MULTI_USER 
GO
ALTER DATABASE [Birdee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Birdee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Birdee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Birdee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Birdee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Birdee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Birdee', N'ON'
GO
ALTER DATABASE [Birdee] SET QUERY_STORE = OFF
GO
USE [Birdee]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[role_id] [varchar](5) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bird]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bird](
	[bird_id] [int] IDENTITY(1,1) NOT NULL,
	[bird_name] [nvarchar](50) NULL,
	[dob] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[height] [float] NOT NULL,
	[weight] [float] NOT NULL,
	[origin] [nvarchar](50) NOT NULL,
	[description] [nvarchar](255) NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[email_shop_staff] [varchar](255) NOT NULL,
	[cate_id] [int] NOT NULL,
	[email_platform_staff] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bird_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bird_Img]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bird_Img](
	[B_img_id] [int] IDENTITY(1,1) NOT NULL,
	[bird_id] [int] NOT NULL,
	[url] [varchar](255) NOT NULL,
	[is_main_img] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[B_img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bird_Sub_Cart]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bird_Sub_Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[cate_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[bird_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cate_id] [int] NOT NULL,
	[cate_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Img_Review_Accessory]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Img_Review_Accessory](
	[img_id_A] [int] IDENTITY(1,1) NOT NULL,
	[email_customer] [varchar](255) NULL,
	[order_detail_id_A] [int] NOT NULL,
	[url] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[img_id_A] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Img_Review_Bird]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Img_Review_Bird](
	[img_id_B] [int] IDENTITY(1,1) NOT NULL,
	[email_customer] [varchar](255) NOT NULL,
	[order_detail_id_B] [int] NOT NULL,
	[url] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[img_id_B] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail_Accessory]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail_Accessory](
	[order_detail_id_A] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[order_price] [float] NOT NULL,
	[order_id] [int] NOT NULL,
	[accessory_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id_A] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail_Bird]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail_Bird](
	[order_detail_id_B] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[order_id] [int] NOT NULL,
	[bird_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id_B] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[status_id] [int] NOT NULL,
	[shipping_id] [int] NOT NULL,
	[payment_id] [int] NOT NULL,
	[email_customer] [varchar](255) NOT NULL,
	[order_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Method]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Method](
	[payment_id] [int] NOT NULL,
	[payment_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review_Accessory]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review_Accessory](
	[email_customer] [varchar](255) NOT NULL,
	[order_detail_id_A] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[comment] [text] NOT NULL,
	[email_platform_staff] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email_customer] ASC,
	[order_detail_id_A] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review_Bird]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review_Bird](
	[email_customer] [varchar](255) NOT NULL,
	[order_detail_id_B] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[comment] [text] NOT NULL,
	[email_platform_staff] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email_customer] ASC,
	[order_detail_id_B] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [varchar](5) NOT NULL,
	[role_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping_Method]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping_Method](
	[shipping_id] [int] NOT NULL,
	[shipping_name] [nvarchar](255) NOT NULL,
	[shipping_price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/28/2023 10:35:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] NOT NULL,
	[status_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'admin@gmail.com', N'123', N'admin', N'ad', N'15-1 Đ. Số 5, Trường Thọ, Thủ Đức, TP.HCM', N'123')
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'customer@gmail.com', N'123', N'customer', N'cus', N'v', N'1')
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'dinhtt@gmail.com', N'dinhtt', N'Trọng Đỉnh', N'ss', N'12/1 Trần Phú, Phường 1, Thành phố Vũng Tàu, BR-VT', N'0969696969')
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'huytq@gmail.com', N'huytq', N'Quốc Huy', N'ss', N'19 Huỳnh Khương Ninh, Ða Kao, Quận 1, TP.HCM', N'0949534953')
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'khoipn@gmail.com', N'khoipn', N'Nhật Khôi', N'cus', N'10, đường 494, Tăng Nhơn Phú A, Quận 9, TP.Thủ Ðức', N'0969760721')
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'manager@gmail.com', N'123', N'manager', N'ma', N'vn', N'111')
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'phatvd@gmail.com', N'phatvd', N'Đình Phát', N'ss', N'464 Lê Quang Ðịnh, Phường 11, Bình Thạnh, TP.HCM', N'0933363636')
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'quangph@gmail.com', N'quangph', N'Hải Quang', N'cus', N'2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1, TP.HCM', N'0944787878')
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'shopstaff@gmail.com', N'123', N'shopstaff', N'ss', N'360 Lê Văn Việt, Q9, TP.HCM', N'2')
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'staff@gmail.com', N'123', N'staff', N'staff', N'vn', N'22')
INSERT [dbo].[Account] ([email], [password], [username], [role_id], [address], [phone]) VALUES (N'thanhnt@gmail.com', N'thanhnt', N'Tấn Thành', N'cus', N'4F Ð.Trần Quốc Tuấn, Phường 1, Gò Vấp, TP.HCM', N'0969821566')
GO
SET IDENTITY_INSERT [dbo].[Bird] ON 

INSERT [dbo].[Bird] ([bird_id], [bird_name], [dob], [gender], [height], [weight], [origin], [description], [quantity], [price], [email_shop_staff], [cate_id], [email_platform_staff]) VALUES (2, N'Chim vành khuyên', CAST(N'2022-08-13' AS Date), 1, 22, 13, N'VN', N'Cần ra đi con chim vành khuyên mồi 3 mùa rất dạng người chim đi bẫy nhiều bắt rất nhiều boi chim hót líu suốt ngày đấu nhấm cánh liên tục chim líu trên 10 mỏ có tiếng chòe nữa chim để bàn líu luôn chim ko tat loi ji hết bao test mọi địa hình jia ra đi 1tr', 5, 420, N'shopstaff@gmail.com', 1, N'staff@gmail.com')
INSERT [dbo].[Bird] ([bird_id], [bird_name], [dob], [gender], [height], [weight], [origin], [description], [quantity], [price], [email_shop_staff], [cate_id], [email_platform_staff]) VALUES (4, N'Vẹt xanh', CAST(N'2021-03-28' AS Date), 0, 33, 45, N'US', N'Ra đi bé vẹt lory màu xanh hiếm có trên thị trường, bình thường lory 7 màu hoặc đỏ.
Chim tại TPHCM, nhận gdtt. Giá 7tr5 có fix', 3, 7500, N'shopstaff@gmail.com', 1, N'staff@gmail.com')
INSERT [dbo].[Bird] ([bird_id], [bird_name], [dob], [gender], [height], [weight], [origin], [description], [quantity], [price], [email_shop_staff], [cate_id], [email_platform_staff]) VALUES (5, N'Đại bàng', CAST(N'2018-11-11' AS Date), 1, 50, 99, N'TQ', N'arrogant', 1, 50000, N'shopstaff@gmail.com', 1, N'staff@gmail.com')
INSERT [dbo].[Bird] ([bird_id], [bird_name], [dob], [gender], [height], [weight], [origin], [description], [quantity], [price], [email_shop_staff], [cate_id], [email_platform_staff]) VALUES (6, N'Chim cánh cụt', CAST(N'2019-05-13' AS Date), 0, 99, 70, N'NC', N'cool', 2, 63210, N'shopstaff@gmail.com', 1, N'staff@gmail.com')
INSERT [dbo].[Bird] ([bird_id], [bird_name], [dob], [gender], [height], [weight], [origin], [description], [quantity], [price], [email_shop_staff], [cate_id], [email_platform_staff]) VALUES (7, N'Chim ưng', CAST(N'2020-12-02' AS Date), 0, 60, 44, N'SE', N'cool', 3, 45600, N'shopstaff@gmail.com', 1, N'staff@gmail.com')
INSERT [dbo].[Bird] ([bird_id], [bird_name], [dob], [gender], [height], [weight], [origin], [description], [quantity], [price], [email_shop_staff], [cate_id], [email_platform_staff]) VALUES (9, N'Chim Cu Gáy', CAST(N'2023-05-01' AS Date), 1, 12, 120, N'Viet Nam', N'Chim nhà đẻ, mới ra lông , tầm này nuôi khiển tay thả rông phù hợp', 3, 200, N'dinhtt@gmail.com', 1, N'staff@gmail.com')
INSERT [dbo].[Bird] ([bird_id], [bird_name], [dob], [gender], [height], [weight], [origin], [description], [quantity], [price], [email_shop_staff], [cate_id], [email_platform_staff]) VALUES (10, N'Chích chòe than', CAST(N'2023-01-12' AS Date), 1, 16, 241, N'Viet Nam', N'Tôi có con chòe than siêng hót như cái máy suốt ngày. Anh nào đang kiếm chòe than siêng miệng thì liên hệ mình. Có ship mọi nơi', 5, 120, N'dinhtt@gmail.com', 1, N'staff@gmail.com')
INSERT [dbo].[Bird] ([bird_id], [bird_name], [dob], [gender], [height], [weight], [origin], [description], [quantity], [price], [email_shop_staff], [cate_id], [email_platform_staff]) VALUES (11, N'Sáo đầu trắng', CAST(N'2023-02-12' AS Date), 0, 17, 320, N'Viet Nam', N'Chim sáo đã ăn thức ăn tốt', 1, 1500, N'phatvd@gmail.com', 1, N'staff@gmail.com')
INSERT [dbo].[Bird] ([bird_id], [bird_name], [dob], [gender], [height], [weight], [origin], [description], [quantity], [price], [email_shop_staff], [cate_id], [email_platform_staff]) VALUES (12, N'Chim họa mi bổi', CAST(N'2023-01-26' AS Date), 1, 15, 289, N'Viet Nam', N'Ae Thích Bổi thì Bắt Em Này Nha … Bổi ngoài tim chưa nghe hót cũng 1,5-1,8 tr rồi Ae nhé. Em Bán thật Lòng Cũng mong gặp Ae thiện chí mua', 1, 2000, N'huytq@gmail.com', 1, N'staff@gmail.com')
INSERT [dbo].[Bird] ([bird_id], [bird_name], [dob], [gender], [height], [weight], [origin], [description], [quantity], [price], [email_shop_staff], [cate_id], [email_platform_staff]) VALUES (13, N'Cặp vẹt lovebird', CAST(N'2023-01-03' AS Date), 1, 12, 221, N'Việt Nam', N'Vài cặp lovebird đẹp .. không lem nhem, Sức khỏe tốt .. hàng chuẩn để sinh sản, Có ship xa', 1, 1600, N'huytq@gmail.com', 1, N'staff@gmail.com')
SET IDENTITY_INSERT [dbo].[Bird] OFF
GO
SET IDENTITY_INSERT [dbo].[Bird_Img] ON 

INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (1, 2, N'https://petmaster.vn/petroom/wp-content/uploads/2021/11/cac-nuoi-chim-vanh-khuyen-1.jpg', 1)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (2, 4, N'https://giadinh.mediacdn.vn/2018/11/12/v10-crop-1541998438403256574509.jpg', 1)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (3, 5, N'https://media.doanhnghiepvn.vn/Images/Uploaded/Share/2019/10/10/Choang-vang-dai-bang-khong-lo-ban-doi-thuc-than-dieu-dai-hiep_2.jpg', 1)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (6, 6, N'https://sohanews.sohacdn.com/zoom/700_438/160588918557773824/2022/1/13/photo1642055431726-1642055431990677695454.jpg', 1)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (8, 7, N'https://photo-cms-tinnhanhchungkhoan.epicdn.me/w660/Uploaded/2023/gtnwae/2020_06_03/x-1_WQSG.jpg', 1)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (9, 9, N'https://cdn.chotot.com/jILCl37bv9uCZQCp9ouSh0QzZC8M9TKGSyLBFIfEjlg/preset:view/plain/75e05991243fe8fbbbd9e579cef58c2c-2828742633390028343.jpg', 1)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (10, 9, N'https://cdn.chotot.com/NKiS70FIwrSsw_eE394biEZognwDBQDzL9sg1pkJwUM/preset:view/plain/5a5806ac8c11d0a1e7a1f74ae4dde68b-2818809075594118573.jpg', 0)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (11, 10, N'https://1.bp.blogspot.com/-ZMMn5gfwDE4/UHeE0SzWm_I/AAAAAAAAJF8/7OMhwFSuhl0/s1600/chich%2Bchoe%2Bthan.jpg', 1)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (12, 10, N'https://dogily.vn/wp-content/uploads/2020/04/chim-chich-choe-than.jpg', 0)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (13, 11, N'https://i.ytimg.com/vi/9i3XWyce72Q/hqdefault.jpg', 0)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (14, 11, N'https://redsvn.net/wp-content/uploads/2021/10/img_616f820e948b7.jpg', 1)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (15, 12, N'https://runghoangda.com/wp-content/uploads/2022/01/chim-hoa-mi.jpg', 1)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (16, 12, N'https://www.thukieng.com/wp-content/uploads/2017/07/gia-mua-ban-chim-hoa-mi-2.jpg', 0)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (17, 13, N'https://cdn.chotot.com/mdMrznSCt-l_6WS3Dx8DxHJEDen5Sej2wxeqMNuq5wU/preset:view/plain/546055d927b0aa8e70e74ab1dd67db9c-2829114308053192956.jpg', 1)
INSERT [dbo].[Bird_Img] ([B_img_id], [bird_id], [url], [is_main_img]) VALUES (18, 13, N'https://cdn.chotot.com/Nlc4OdWU8bIelikejVp08XJUEa6xRdCqxcHIPZGgVVs/preset:view/plain/d5c33c8764d1f629681fd4c8cfe79e6e-2829114307616835744.jpg', 0)
SET IDENTITY_INSERT [dbo].[Bird_Img] OFF
GO
SET IDENTITY_INSERT [dbo].[Bird_Sub_Cart] ON 

INSERT [dbo].[Bird_Sub_Cart] ([cart_id], [cate_id], [quantity], [bird_id]) VALUES (2, 1, 5, 2)
INSERT [dbo].[Bird_Sub_Cart] ([cart_id], [cate_id], [quantity], [bird_id]) VALUES (3, 1, 1, 4)
INSERT [dbo].[Bird_Sub_Cart] ([cart_id], [cate_id], [quantity], [bird_id]) VALUES (4, 1, 5, 13)
INSERT [dbo].[Bird_Sub_Cart] ([cart_id], [cate_id], [quantity], [bird_id]) VALUES (5, 1, 2, 12)
INSERT [dbo].[Bird_Sub_Cart] ([cart_id], [cate_id], [quantity], [bird_id]) VALUES (6, 1, 1, 7)
SET IDENTITY_INSERT [dbo].[Bird_Sub_Cart] OFF
GO
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (1, N'Chim Cảnh')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (2, N'Thức ăn')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (3, N'Máng ăn, Cóng')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (4, N'Lồng')
GO
SET IDENTITY_INSERT [dbo].[Img_Review_Accessory] ON 

INSERT [dbo].[Img_Review_Accessory] ([img_id_A], [email_customer], [order_detail_id_A], [url]) VALUES (1, N'customer@gmail.com', 1, N'lllll')
INSERT [dbo].[Img_Review_Accessory] ([img_id_A], [email_customer], [order_detail_id_A], [url]) VALUES (3, N'customer@gmail.com', 1, N'wwwww')
SET IDENTITY_INSERT [dbo].[Img_Review_Accessory] OFF
GO
SET IDENTITY_INSERT [dbo].[Img_Review_Bird] ON 

INSERT [dbo].[Img_Review_Bird] ([img_id_B], [email_customer], [order_detail_id_B], [url]) VALUES (1, N'customer@gmail.com', 1, N'vvv')
SET IDENTITY_INSERT [dbo].[Img_Review_Bird] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail_Accessory] ON 

INSERT [dbo].[Order_Detail_Accessory] ([order_detail_id_A], [quantity], [order_price], [order_id], [accessory_id]) VALUES (1, 1, 10, 3, 1)
INSERT [dbo].[Order_Detail_Accessory] ([order_detail_id_A], [quantity], [order_price], [order_id], [accessory_id]) VALUES (2, 2, 7, 4, 2)
SET IDENTITY_INSERT [dbo].[Order_Detail_Accessory] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail_Bird] ON 

INSERT [dbo].[Order_Detail_Bird] ([order_detail_id_B], [quantity], [price], [order_id], [bird_id]) VALUES (1, 2, 20, 3, 2)
INSERT [dbo].[Order_Detail_Bird] ([order_detail_id_B], [quantity], [price], [order_id], [bird_id]) VALUES (2, 3, 60, 3, 4)
SET IDENTITY_INSERT [dbo].[Order_Detail_Bird] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [address], [status_id], [shipping_id], [payment_id], [email_customer], [order_date]) VALUES (3, N'q9', 1, 1, 1, N'customer@gmail.com', CAST(N'2023-05-30' AS Date))
INSERT [dbo].[Orders] ([order_id], [address], [status_id], [shipping_id], [payment_id], [email_customer], [order_date]) VALUES (4, N'q10', 2, 3, 3, N'customer@gmail.com', CAST(N'2023-05-29' AS Date))
INSERT [dbo].[Orders] ([order_id], [address], [status_id], [shipping_id], [payment_id], [email_customer], [order_date]) VALUES (5, N'q20', 3, 2, 2, N'customer@gmail.com', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[Orders] ([order_id], [address], [status_id], [shipping_id], [payment_id], [email_customer], [order_date]) VALUES (6, N'quan cam', 1, 1, 5, N'customer@gmail.com', CAST(N'2023-05-21' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Payment_Method] ([payment_id], [payment_name]) VALUES (1, N'visa')
INSERT [dbo].[Payment_Method] ([payment_id], [payment_name]) VALUES (2, N'banking online')
INSERT [dbo].[Payment_Method] ([payment_id], [payment_name]) VALUES (3, N'cod')
INSERT [dbo].[Payment_Method] ([payment_id], [payment_name]) VALUES (4, N'naspa')
INSERT [dbo].[Payment_Method] ([payment_id], [payment_name]) VALUES (5, N'mastercard')
INSERT [dbo].[Payment_Method] ([payment_id], [payment_name]) VALUES (6, N'paypal')
GO
INSERT [dbo].[Review_Accessory] ([email_customer], [order_detail_id_A], [rating], [comment], [email_platform_staff]) VALUES (N'customer@gmail.com', 1, 3, N'xau quac', N'staff@gmail.com')
GO
INSERT [dbo].[Review_Bird] ([email_customer], [order_detail_id_B], [rating], [comment], [email_platform_staff]) VALUES (N'customer@gmail.com', 1, 5, N'beautiful', N'staff@gmail.com')
INSERT [dbo].[Review_Bird] ([email_customer], [order_detail_id_B], [rating], [comment], [email_platform_staff]) VALUES (N'customer@gmail.com', 2, 4, N'ncc', N'staff@gmail.com')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (N'ad', N'admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (N'cus', N'customer')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (N'ma ', N'manager')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (N'ss', N'shop staff')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (N'staff', N'staff')
GO
INSERT [dbo].[Shipping_Method] ([shipping_id], [shipping_name], [shipping_price]) VALUES (1, N'normal delivery', 10)
INSERT [dbo].[Shipping_Method] ([shipping_id], [shipping_name], [shipping_price]) VALUES (2, N'fast delivery', 20)
INSERT [dbo].[Shipping_Method] ([shipping_id], [shipping_name], [shipping_price]) VALUES (3, N'express delivery', 30)
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (1, N'Processing')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (2, N'Cancel')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (3, N'Successful')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (4, N'Waiting')
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Bird]  WITH CHECK ADD FOREIGN KEY([cate_id])
REFERENCES [dbo].[Category] ([cate_id])
GO
ALTER TABLE [dbo].[Bird]  WITH CHECK ADD FOREIGN KEY([email_platform_staff])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Bird]  WITH CHECK ADD FOREIGN KEY([email_shop_staff])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Bird_Img]  WITH CHECK ADD FOREIGN KEY([bird_id])
REFERENCES [dbo].[Bird] ([bird_id])
GO
ALTER TABLE [dbo].[Bird_Sub_Cart]  WITH CHECK ADD FOREIGN KEY([bird_id])
REFERENCES [dbo].[Bird] ([bird_id])
GO
ALTER TABLE [dbo].[Bird_Sub_Cart]  WITH CHECK ADD FOREIGN KEY([cate_id])
REFERENCES [dbo].[Category] ([cate_id])
GO
ALTER TABLE [dbo].[Img_Review_Accessory]  WITH CHECK ADD FOREIGN KEY([email_customer], [order_detail_id_A])
REFERENCES [dbo].[Review_Accessory] ([email_customer], [order_detail_id_A])
GO
ALTER TABLE [dbo].[Img_Review_Bird]  WITH CHECK ADD FOREIGN KEY([email_customer], [order_detail_id_B])
REFERENCES [dbo].[Review_Bird] ([email_customer], [order_detail_id_B])
GO
ALTER TABLE [dbo].[Order_Detail_Accessory]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_Detail_Bird]  WITH CHECK ADD FOREIGN KEY([bird_id])
REFERENCES [dbo].[Bird] ([bird_id])
GO
ALTER TABLE [dbo].[Order_Detail_Bird]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([email_customer])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment_Method] ([payment_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping_Method] ([shipping_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([status_id])
GO
ALTER TABLE [dbo].[Review_Accessory]  WITH CHECK ADD FOREIGN KEY([email_customer])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Review_Accessory]  WITH CHECK ADD FOREIGN KEY([email_platform_staff])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Review_Accessory]  WITH CHECK ADD FOREIGN KEY([order_detail_id_A])
REFERENCES [dbo].[Order_Detail_Accessory] ([order_detail_id_A])
GO
ALTER TABLE [dbo].[Review_Bird]  WITH CHECK ADD FOREIGN KEY([email_customer])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Review_Bird]  WITH CHECK ADD FOREIGN KEY([email_platform_staff])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Review_Bird]  WITH CHECK ADD FOREIGN KEY([order_detail_id_B])
REFERENCES [dbo].[Order_Detail_Bird] ([order_detail_id_B])
GO
USE [master]
GO
ALTER DATABASE [Birdee] SET  READ_WRITE 
GO
