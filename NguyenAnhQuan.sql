USE [master]
GO
/****** Object:  Database [NguyenAnhQuanDB]    Script Date: 19/06/2021 11:32:21 CH ******/
CREATE DATABASE [NguyenAnhQuanDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NguyenAnhQuanDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.ANHQUAN\MSSQL\DATA\NguyenAnhQuanDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NguyenAnhQuanDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.ANHQUAN\MSSQL\DATA\NguyenAnhQuanDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NguyenAnhQuanDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NguyenAnhQuanDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NguyenAnhQuanDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET  MULTI_USER 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NguyenAnhQuanDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NguyenAnhQuanDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [NguyenAnhQuanDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19/06/2021 11:32:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/06/2021 11:32:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[UnitCost] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Image] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[IDCategory] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 19/06/2021 11:32:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (1, N'Jackets', N'Đa dạng các kiểu mới nhất 2021')
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (2, N'Shoes', N'Những dòng Brand Locals đa dạng')
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (3, N'Glasses', N'Những mẫu kính mới hợp mốt')
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (4, N'
Watches
', N'Đa dạng phong cách, sang trọng')
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (5, N'Hand Bags', N'Đa dạng mẫu mã, màu sắc, sang trọng')
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (6, N'
Bags', N'Balo sức chứa lớn, đa dạng để chọn lựa')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (2, N'Áo Khoác Bomber Nam Họa Tiết Rằn Ri', CAST(927000 AS Decimal(18, 0)), 15, N'/Data/images/12188318227_327185066.jpg', N'Main fabric composition :cotton. The content of the main fabric composition: 100%. Lining Composition : Polyester Fiber (Polyester). Lining composition content: 100 (%)', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (7, N'Áo Khoác Nam Plus', CAST(910000 AS Decimal(18, 0)), 12, N'/Data/images/12188288672_327185066.jpg', N'Main fabric composition: cotton + nylon. Lining Ingredients : Polyester (Polyester). Collar type: vertical collar, baseball uniform collar', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (8, N'Áo Khoác Nam Dài Tay Có Khóa Kéo', CAST(847000 AS Decimal(18, 0)), 18, N'/Data/images/12229506779_327185066.jpg', N'Thành phần vải chính: sợi polyester 98%. Thành phần lót: sợi polyester. Sản phẩm có thể giặt. Phong cách: thời trang, kinh doanh (24 - 35 tuổi)', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (9, N'Áo Khoác Nam Phong Cách Hip Hop Thể Thao', CAST(816000 AS Decimal(18, 0)), 12, N'/Data/images/12590216716_327185066.jpg', N'Thành phần vải chính: sợi polyester. Thành phần lót: sợi polyester. Màu sắc: đen, xanh quân đội, xanh dương, xám nhạt. Kích thước: M, L, XL, XXL, 3x, 4XL', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (17, N'Áo Khoác Nam Phong Cách Hip Hop Thể Thao', CAST(856000 AS Decimal(18, 0)), 11, N'/Data/images/9366204246_327185066.jpg', N'Thành phần vải chính: sợi polyester. Thành phần lót: sợi polyester. Màu sắc: đen, xám nhạt. Kích thước: M, L, XL, XXL, 3x, 4XL', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (18, N'Áo Khoác Thời Trang In 3D Avenger Có Khóa Kéo', CAST(260000 AS Decimal(18, 0)), 16, N'/Data/images/11545551689_327185066.jpg', N'Fashion color patchwork design, fine craft, gives you a cool different look. Skin-friendly material, soft, comfortable and eco-friendly for wearing. Avengers suits design, great for fans to wear', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (19, N'Áo Khoác Nam Dài Tay Có Khóa Kéo', CAST(885000 AS Decimal(18, 0)), 10, N'/Data/images/39.jpg', N'Kiểu túi: túi có khóa kéo. Phương pháp mặc: mặc bên ngoài. Màu; đen, xanh quân đội, xanh đậm. Kích thước: M, L, XL, XXL, 3XL, 4XL', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (20, N'VINTAS SAIGON 1980S NE - LOW TOP - VIN BLACK', CAST(560000 AS Decimal(18, 0)), 16, N'/Data/images/76ea117fd75073afdace2a315bee3c46.jpg', N'Giữ nguyên vẻ ngoài và các sắc độ đặc trưng của Sài Gòn những năm 80s, phối chỉnh trên chất liệu vải mới cùng nhiều đặc điểm nâng cấp, Vintas Saigon 1980s - NE (New Episode) mang đến nét đẹp hoài niệm, cộng hưởng cảm giác nhẹ nhàng ung dung cho mọi chuyến khám phá. Hứa hẹn sẽ trở thành một điểm nhấn thú vị cho set đồ tôn "chất nghệ" của bạn.', 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (21, N'URBAS INVERSION - LOW TOP - NAVY CITRUS', CAST(420000 AS Decimal(18, 0)), 25, N'/Data/images/pro_urbas_A61056_2.jpg', N'Phá cách bằng những phối màu đảo nghịch đầy độc đáo, tươi vui, Urbas "Inversion" là một pack giày đầy thú vị cho những ai muốn có thêm sắc màu cho cuộc sống, và tất nhiên, là cho cả những bộ outfit của riêng mình nữa.', 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (22, N'ANANAS X LUCKY LUKE PATTAS - LOW TOP - LL GRR BLUE', CAST(790000 AS Decimal(18, 0)), 13, N'/Data/images/pro_A61097_3-1.jpg', N'Phiên bản "ưu ái" dành riêng cho chú chó Rantanplan, vốn để lại ấn tượng ngốc nghếch rõ nét trong bộ truyện Lucky Luke. Sử dụng sắc thái khuôn mặt hài hước và dỉ dỏm, kết hợp phom dáng Low Top trên nền xanh chủ đạo. Chắc chắn chinh phục những bạn trẻ đang tìm thêm sắc màu trẻ trung cho cuộc sống.', 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (23, N'VINTAS MISTER - HIGH TOP - CHOCOLATE BROWN', CAST(610000 AS Decimal(18, 0)), 29, N'/Data/images/pro_A61101_2.jpg', N'Công thức pha trộn từ hai chất liệu vải và da lộn đặc trưng, điều thường thấy ở bộ Vintas Mister. Sự kết hợp mạnh mẽ tạo nên nét cổ điển, hoài niệm. Chắc chắn là sự lựa chọn "hết bài" cho những con người trầm tính và điềm đạm.', 0, 2)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (24, N'BASAS NEW FAMILIAR - LOW TOP - WHITE', CAST(420000 AS Decimal(18, 0)), 12, N'/Data/images/stu_basas_A61014_2.jpg', N'Mang ý nghĩa là một “người bạn thân” có thể đồng hành cùng bạn trên khắp các nẻo đường,“The Familiar” không mang đến những sản phẩm cầu kì phức tạp hay đủ phá cách để bạn phấn khích và mang khoe nó với nhiều người. Nó chỉ đơn giản là mang đến cho bạn một sự lựa chọn an toàn, đa-zi-năng cho một ngày học tập, làm việc, vui chơi bình dị.', 1, 2)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (25, N'Mắt kính mát nam thể thao Tensaw – Đen', CAST(650000 AS Decimal(18, 0)), 34, N'/Data/images/VGSB322T_34F.jpg', N'Mắt kính thể thao Tensaw kiểu dáng mạnh mẽ &amp; nam tính,&nbsp;&nbsp;bảo vệ mắt bạn tốt nhất.', 1, 3)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (26, N'Kính bọc màu vàng nhạt ', CAST(250000 AS Decimal(18, 0)), 17, N'/Data/images/S3580SJ_515-500x500.jpg', N'Thiết kế đặc biệt, đeo bên ngoài kính cận (xem hình minh họa).&nbsp;Thích hợp cho đi xe máy hay trong môi trường sản xuất. Kính đáp ứng những tiêu chuẩn an toàn hàng đầu của thế giới &nbsp;(ANSI Z87.1, CE EN166 Certified – Mỹ, Châu Âu).', 0, 3)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (27, N'Kính Pyramex ionix – màu xanh', CAST(450000 AS Decimal(18, 0)), 35, N'/Data/images/SB8165D_34F-500x500.jpg', N'<p>Kính màu xanh có tráng gương ngăn 84% ánh nắng chói. Thích hợp đeo ban ngày, chống nắng chói tốt.</p>
', 1, 3)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (28, N'Kính Pyramex Forum màu xám đen', CAST(220000 AS Decimal(18, 0)), 9, N'/Data/images/SB6620D_515-500x500.jpg', N'<p>Kính ngăn 99% tia tử ngoại (nguyên nhân gây bệnh đục thủy tinh thể và lão hóa mắt). Kiểu thể thao, mạnh mẽ, ôm khuôn mặt ngăn tối đa khói bụi (giảm khô mắt, cay, rát mắt khi đi xe máy).</p>
', 1, 3)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (29, N'Kính Pyramex Protocol màu xanh tráng gương', CAST(300000 AS Decimal(18, 0)), 15, N'/Data/images/SB6265D-500x500.jpg', N'<p>Kính ngăn 99% tia tử ngoại (nguyên nhân gây bệnh đục thủy tinh thể và lão hóa mắt). Kiểu thể thao, mạnh mẽ, ôm khuôn mặt ngăn tối đa khói bụi (giảm khô mắt, cay, rát mắt khi đi xe máy).</p>
', 1, 3)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (30, N'Đồng hồ Nam MVW', CAST(1200000 AS Decimal(18, 0)), 15, N'/Data/images/mvw-ml006-01-nam-nau-1-600x600-1.jpg', N'<p>Sang trọng, tinh tế. Sản phẩm đồng hồ mang thương hiệu MVW với nhiều mẫu mã năng động, trẻ trung nhưng không kém phần tinh tế và sang trọng, phù hợp với nữ giới hoạt động ở nhiều lĩnh vực từ văn phòng đến doanh nhân.</p>
', 1, 4)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (31, N'Đồng hồ Nam Casio AQF-102W-1BVDF', CAST(1100000 AS Decimal(18, 0)), 20, N'/Data/images/casio-aqf-2-1.jpg', N'Casio – Tinh hoa của sự sáng tạo. Thiết kế thời thượng hiện đại, thiết kế dành riêng cho các chàng trai năng động, trẻ trung. Nhãn hiệu đồng hồ Casio là nhãn hiệu uy tín và lâu đời tại Nhật Bản.', 1, 4)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (32, N'Đồng hồ Nam Casio MTP', CAST(500000 AS Decimal(18, 0)), 15, N'/Data/images/casio-mtp-v004l-1audf-nam-avatar-1-600x600-1.jpg', N'<p>Lớp vỏ bền bỉ, chắc chắn, bảo vệ an toàn các chi tiết bên trong.&nbsp;Mặt kính có độ trong suốt cao, độ cứng khá, hạn chế trầy xước khi có va chạm vừa phải. Khung viền đồng hồ Casio nam chống ăn mòn, chịu được mọi thời tiết khắc nghiệt. Thoải mái đeo khi đi mưa, rửa tay vì đồng hồ có hệ số chống nước 3 ATM, không mang khi đi tắm , bơi, lặn.</p>
', 1, 4)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (33, N'Đồng hồ Nam Casio MTP 1384D', CAST(1300000 AS Decimal(18, 0)), 34, N'/Data/images/mtp-1.jpg', N'<p>Ấn tượng với thiết kế thanh lịch, tinh tế,mẫu đồng hồ dành cho các quý ông sang trọng lịch lãm. Đồng hồ nam Casio MTP 1384D 7AVDF mang thương hiệu Casio-Nhật Bản, nổi tiếng bởi sự uy tín và chất lượng tuyệt hảo và độ chính xác tuyệt đối cao.&nbsp;</p>
', 1, 4)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (34, N'Đồng hồ Nam Casio', CAST(1200000 AS Decimal(18, 0)), 16, N'/Data/images/casio-mtp-1.jpg', N'<p>Lớp vỏ ngoài cứng cáp giúp đồng hồ có khả năng chịu va đập tốt: Mặt kính có độ trong suốt tốt, cứng cáp, hạn chế nứt vỡ hay trầy xước khi va chạm nhẹ. Đồng hồ nam có khung viền gia công chắc chắn, chịu lực tốt, chống oxi hóa và ăn mòn hiệu quả. Thoải mái khi tắm, rửa tay và đi mưa nhờ hệ số chống nước 5ATM, không đeo đồng hồ Casio nam khi đi bơi, lặn. Quản lý thời gian và công việc tốt hơn với tiện ích lịch thứ và lịch ngày</p>
', 1, 4)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (35, N'Túi xách tay nắp gập phối 2 màu SA0028', CAST(535500 AS Decimal(18, 0)), 26, N'/Data/images/sa0028_min_1000x1000_4050835957.jpg', N'<p>Chất liệu: Da tổng hợp. Kích Thước: 21,5*7*15. Số ngăn: 3. Dòng: Party, Office, Dạo phố. Kiểu dáng cặp mini phối 2 tone màu độc đáo, hiện đại.<br />
Không gian túi nhỏ gọn chứa đủ các vật dụng cá nhân cơ bản.<br />
Chất liệu da tổng hợp cao cấp mềm, bền.</p>
', 1, 5)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (36, N'Túi xách tay phối họa tiết caro SA0018 ', CAST(591500 AS Decimal(18, 0)), 13, N'/Data/images/sa0018_yel_1000x1000_2314362718.jpg', N'<p>Chất liệu: Da tổng hợp. Loại dây đeo: Vật tư cùng loại. Kích Thước: 22*8*13. Số ngăn: 1. Dòng: Office, Dạo phố, Party. Kiểu dáng nắp gập tựa cặp sách vô cùng xinh xắn, Thân túi phối giữa vân da trơn và họa tiết caro độc đáo. Không gian túi nhỏ gọn chứa đủ các vật dụng cá nhân cần thiết như điện thoại, mỹ phẩm. Chất liệu da tổng hợp cao cấp mềm, bền, đẹp.</p>
', 1, 5)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (37, N'Túi xách tay quai cầm đa sắc SA0032', CAST(825000 AS Decimal(18, 0)), 24, N'/Data/images/sa0032_gry_1000x1000_2200797363.jpg', N'<p>Chất liệu: Da tổng hợp. Loại dây đeo: Vật tư cùng loại. Kích Thước: 21*7*15. Dòng: Party, dạo phố, office. Túi xách tay dáng cặp, với thiết kế nắp gập kiểu cut-out xinh xắn. Quai cầm đa sắc ấn tượng. Không gian túi 2 ngăn chứa đủ các vật dụng cá nhân cơ bản.&nbsp;</p>
', 1, 5)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (38, N'Túi xách tay nắp gập quai cầm kim loại ', CAST(676000 AS Decimal(18, 0)), 24, N'/Data/images/sa0020_yel_1000x1000_0239004445.jpg', N'<p>Chất liệu: Da tổng hợp. Kích Thước: 20*6*11. Số ngăn: 2. Dòng: Dạo phố, Party. Kiểu dáng nắp gập có khóa gài kim loai chắc chắn. Hoa văn viền chỉ nổi tinh tế, vô cùng xinh xắn. Chất liệu da tổng hợp cao cấp mềm, bền, đẹp. Không gian túi nhỏ chứa đủ các vật dụng cá nhân cơ bản.</p>
', 1, 5)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (39, N'Balo Degrey Backpack ', CAST(210000 AS Decimal(18, 0)), 27, N'/Data/images/balo-laptop-strata-hb109001-01.jpg', N'Mẫu&nbsp;Basic Backpack Degrey – BBD&nbsp;là một trong những item làm tín đồ&nbsp;Backpack Local. Brand&nbsp;đứng ngồi không yên trong những đợt Restock, từ thiết kế cho đến kích thước rất phù hợp cho đi học, đi chơi , đi du lịch. Với mẫu Basic Degrey này chắc chắn là một sản phẩm không thể phớt lờ được', 1, 6)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (40, N'Balo Regods Club ', CAST(190000 AS Decimal(18, 0)), 10, N'/Data/images/balo-pixie-hb361001-01.jpg', N'Balo Regods Club&nbsp;sử dụng chất liệu vải ( 100% polyester – 80% waterproof ), Kích thước 42 x 33 x 12cm, gồm 2 ngăn lớn, chứa laptop 15 inch là chuyện nhỏ.', 1, 6)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (41, N'Balo Openroad Chic', CAST(5000000 AS Decimal(18, 0)), 23, N'/Data/images/balo-openroad-chic-cl509002-01.jpg', N'<p>Tổ chức nội thất tinh tế, đa chức năng. Logo Samsonite được chế tác phong cách. Khóa kéo sang trọng, chắc chắn. Ngăn chứa laptop 14.1". Đai giá cần đẩy vali</p>
', 0, 6)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (42, N'Balo laptop Scout  ', CAST(600000 AS Decimal(18, 0)), 31, N'/Data/images/balo-scout-hb240004-01.jpg', N'<p>Ngăn đựng laptop đến 15.6". Túi trùm chống mưa. Dây đeo vai công nghệ Tractum Suspension Strap. Ngăn laptop có thể khóa. Đệm lưng Air Groove Plus thoáng mát. Túi nhỏ đựng điện thoại ở dây đeo. Ngăn truy cập nhanh phía trước</p>
', 1, 6)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (43, N'Balo laptop Akron ', CAST(600000 AS Decimal(18, 0)), 12, N'/Data/images/balo-akron-hb409002-01.jpg', N'<p>Ngăn đựng laptop đến 15.6". Túi trùm chống mưa. Dây đeo vai&nbsp; công nghệ Tractum Suspension™. Ngăn laptop có thể khóa. Đệm lưng Air Groove Plus. Túi nhỏ đựng điện thoại ở dây đeo . Ngăn truy cập nhanh phía trước</p>
', 0, 6)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [Description], [Status], [IDCategory]) VALUES (44, N'Balo laptop Scout  ', CAST(600000 AS Decimal(18, 0)), 17, N'/Data/images/balo-scout-hb218004-01.jpg', N'<p>Ngăn đựng laptop đến 15.6". Túi trùm chống mưa. Dây đeo vai công nghệ Tractum Suspension Strap. Ngăn laptop có thể khóa. Đệm lưng Air Groove Plus thoáng mát. Túi nhỏ đựng điện thoại ở dây đeo . Ngăn truy cập nhanh phía trước</p>
', 1, 6)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[UserAccount] ON 

INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (1, N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'Active')
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (2, N'anhquan', N'a8b09e5ae7a2db76421a9ebf68d0f752', N'Blocked')
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (3, N'khanghong', N'57c06dc59d1865e1eeb84a4f088489c3', N'Active')
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (4, N'nhattan', N'b08cda081029663c72ab330106f27268', N'Active')
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (5, N'phongvi', N'eb3f6f6143f6f9b59d0f004b2e6d0040', N'Blocked')
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (6, N'boithuong', N'468f6c9e98a468052567b745060d4b46', N'Active')
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (7, N'thuynhat', N'81153df66b07b1a9328b3c14bf510c2a', N'Blocked')
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (9, N'phamlai', N'83127a88e0cb0b3699d8e1af08809d01', N'Blocked')
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (10, N'bachthuy', N'19689886389d9825edd65c57ce5c8509', N'Active')
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (11, N'nhuochoa', N'9b3a186966e076f99b56bfb548528570', N'Blocked')
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [NguyenAnhQuanDB] SET  READ_WRITE 
GO
