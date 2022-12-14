USE [master]
GO
/****** Object:  Database [dbbanhang]    Script Date: 21/11/2021 7:48:46 CH ******/
CREATE DATABASE [dbbanhang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbbanhang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\dbbanhang.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbbanhang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\dbbanhang_0.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbbanhang] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbbanhang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbbanhang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbbanhang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbbanhang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbbanhang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbbanhang] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbbanhang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbbanhang] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dbbanhang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbbanhang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbbanhang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbbanhang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbbanhang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbbanhang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbbanhang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbbanhang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbbanhang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbbanhang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbbanhang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbbanhang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbbanhang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbbanhang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbbanhang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbbanhang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbbanhang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbbanhang] SET  MULTI_USER 
GO
ALTER DATABASE [dbbanhang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbbanhang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbbanhang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbbanhang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [dbbanhang]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 21/11/2021 7:48:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Admin](
	[UserAdmin] [varchar](50) NULL,
	[PassAdmin] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 21/11/2021 7:48:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK__ChiTietH__F557F66115502E78] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 21/11/2021 7:48:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[MaNV] [nchar](10) NULL,
	[NgayMua] [date] NULL,
	[TinhTrangHD] [nchar](10) NULL,
	[TongTien] [decimal](18, 0) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK__HoaDon__2725A6E0620F2F02] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 21/11/2021 7:48:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTenK] [nvarchar](50) NULL,
	[NgaySinhK] [date] NULL,
	[GioiTinhK] [nchar](10) NULL,
	[DiaChiK] [nvarchar](50) NULL,
	[EmailK] [nvarchar](50) NULL,
	[SDTK] [nvarchar](20) NULL,
	[TenTKK] [nvarchar](50) NULL,
	[PassK] [nvarchar](50) NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 21/11/2021 7:48:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](20) NULL,
	[TenTK] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NULL,
	[Cap] [int] NULL,
	[TinhTrang] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanLoai]    Script Date: 21/11/2021 7:48:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoai](
	[MaPL] [int] IDENTITY(1,1) NOT NULL,
	[TenPL] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhanLoai_1] PRIMARY KEY CLUSTERED 
(
	[MaPL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 21/11/2021 7:48:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[DoiTuong] [nchar](10) NULL,
	[GiaBan] [decimal](12, 0) NULL,
	[GioiThieuSP] [nvarchar](300) NULL,
	[Soluong] [int] NULL,
	[Anh] [nvarchar](100) NULL,
	[NgayCapNhat] [datetime] NULL,
	[MaPL] [int] NULL,
	[MaTH] [int] NULL,
 CONSTRAINT [PK__SanPham__2725081C03317E3D] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 21/11/2021 7:48:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaTH] [int] IDENTITY(1,1) NOT NULL,
	[TenTH] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[MaTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [HoTen]) VALUES (N'thien', N'thien123', N'Ngô Hoàng Thiên')
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [HoTen]) VALUES (N'admin', N'admin', N'Lê Bá Uy')
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (1, 1, 2, CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (2, 1, 3, CAST(900000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (3, 2, 2, CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (4, 3, 2, CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (5, 4, 2, CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (6, 1, 3, CAST(900000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (6, 5, 2, CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (7, 7, 3, CAST(900000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (8, 8, 2, CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (9, 9, 2, CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (10, 2, 2, CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (11, 3, 2, CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (12, 2, 2, CAST(600000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (13, 1, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (14, 2, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (15, 13, 1, CAST(300000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (1, 3, N'NV01      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(600000 AS Decimal(18, 0)), N'Vĩnh Phúc')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (2, 28, N'NV01      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(900000 AS Decimal(18, 0)), N'đồng thấp')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (3, 4, N'NV01      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(600000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (4, 5, N'NV01      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(600000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (5, 6, NULL, CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(600000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (6, 7, N'NV02      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(1500000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (7, 8, N'NV02      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(900000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (8, 9, N'NV02      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(600000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (9, 10, N'NV02      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(600000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (10, 11, N'NV02      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(600000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (11, 12, N'NV02      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(600000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (12, 13, N'NV02      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(600000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (13, 14, N'NV02      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(300000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (14, 16, N'NV03      ', CAST(N'2021-11-21' AS Date), N'thanh toan', CAST(300000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (15, 28, NULL, CAST(N'2021-11-21' AS Date), NULL, CAST(300000 AS Decimal(18, 0)), N'đồng thấp')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (3, N'Nguyễn Văn Quang', CAST(N'1993-09-05' AS Date), N'Nam       ', N'Vĩnh Phúc', N'nguyenquang93@gmail.com', N'0981330429', N'Quang 5993', N'nguyenquang93', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (4, N'Nguyễn Kim Thảo', CAST(N'1994-01-07' AS Date), N'Nữ        ', N'Ninh Bình', N'kimthao94@gmail.com', N'0932334188', N'Thảo 7194', N'kimthao94', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (5, N'Trần Thu Trang', CAST(N'1995-05-01' AS Date), N'Nữ        ', N'Hà Nội', N'thuytrang95@gmail.com', N'0971003929', N'Trang 1595', N'thuytrang95', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (6, N'Phạm Văn Tuấn', CAST(N'1993-01-21' AS Date), N'Nam       ', N'Hà Nam', N'phamtuan93@gmail.com', N'0981533589', N'Tuấn 21193', N'phamtuan93', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (7, N'Nguyễn Diệu Thu', CAST(N'1991-05-10' AS Date), N'Nữ        ', N'Hà Nội', N'dieuthu91@gmail.com', N'0981238338', N'Thu 10591', N'dieuthu91', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (8, N'Bùi Tiến Đạt', CAST(N'1995-08-18' AS Date), N'Nam       ', N'Hải Dương', N'tiendat95@gmail.com', N'0986234136', N'Đạt 18895', N'tiendat95', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (9, N'Ngô Quang Hiếu', CAST(N'1995-03-05' AS Date), N'Nam       ', N'Thái Bình', N'quanghieu95@gmail.com', N'09713483969', N'Hiếu 5395', N'quanghieu95', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (10, N'Nguyễn Mai Linh', CAST(N'1996-08-11' AS Date), N'Nữ        ', N'Hà Nội', N'mailinh96@gmail.com', N'0982356935', N'Linh 11896', N'anhtung95', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (11, N'Bùi Anh Tùng', CAST(N'1991-01-06' AS Date), N'Nam       ', N'Hà Nội', N'anhtung95@gmail.com', N'0986331518', N'Tùng 6191', N'quangtung91', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (12, N'Trần Thu Thảo', CAST(N'1989-02-19' AS Date), N'Nữ        ', N'Hà Nội', N'thuthao95@gmail.com', N'0974162562', N'Thảo 19291', N'thuthao95', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (13, N'Nguyễn Khải Minh', CAST(N'1993-08-15' AS Date), N'Nam       ', N'Vĩnh Phúc', N'khaiminh93@gmail.com', N'0982073329', N'Minh 15893', N'khaiminh93', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (14, N'Nguyễn Kim Hoa', CAST(N'1994-02-05' AS Date), N'Nữ        ', N'Ninh Bình', N'kimhoa94@gmail.com', N'0935334118', N'Hoa 5294', N'kimhoa94', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (15, N'Trần Thu Anh', CAST(N'1995-05-06' AS Date), N'Nữ        ', N'Hà Nội', N'thuanh95@gmail.com', N'0971004329', N'Anh 6595', N'thuanh95', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (16, N'Phạm Tuấn Tú', CAST(N'1993-01-12' AS Date), N'Nam       ', N'Hà Nam', N'tuantu93@gmail.com', N'0982536589', N'Tú 12193', N'tuantu93', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (17, N'Nguyễn Diệu My', CAST(N'1991-03-13' AS Date), N'Nữ        ', N'Hà Nội', N'dieumy91@gmail.com', N'0961228138', N'My 13391', N'dieumy91', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (18, N'Bùi Mạnh Khoa', CAST(N'1995-07-16' AS Date), N'Nam       ', N'Hải Dương', N'manhkhoa95@gmail.com', N'0986235126', N'Khoa 16795', N'manhkhoa95', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (19, N'Phạm Quang Huy', CAST(N'1995-03-28' AS Date), N'Nam       ', N'Thái Bình', N'quanghuy95@gmail.com', N'0974183929', N'Huy28395', N'quanghuy95', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (21, N'Phạm Thu Cúc', CAST(N'1995-02-18' AS Date), N'Nữ        ', N'Hải Dương', N'phamthucuc95@gmail.com', N'0968572713', N'ThuCuc95', N'18021995', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (22, N'Hương BTM', CAST(N'1995-11-11' AS Date), N'Nữ        ', N'hà nội', N'huongbtm@gmail.com', N'0124643546', N'HuongBTM', N'huongbtm', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (24, N'Lê Đăng Kiên', NULL, NULL, NULL, NULL, N'033233740', N'kien', N'kien', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (25, N'kien456', CAST(N'1998-10-10' AS Date), N'nam       ', N'DiaChiK', N'Email', N'14', N'kien1', N'kien', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (26, N'Nguyễn Ngọc Tuấn', NULL, NULL, NULL, NULL, N'0332337740', N'tuan', N'tuan', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (27, N'Lê Đăng Kiên', NULL, NULL, N'daklak', NULL, N'0332337740', N'kien1234', N'1234', NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK], [NgayCapNhat], [GhiChu]) VALUES (28, N'Dương Bá Uy', NULL, NULL, N'đồng thấp', NULL, N'0123456789', N'uy123', N'123123', NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'006       ', N'Phạm Văn Hùng', CAST(N'1993-03-16' AS Date), N'Nam       ', N'Hà Nam', N'phamhung93@gmail.com', N'0981333599', N'PVH93', N'phamhung93', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'007       ', N'Nguyễn Thị Trang', CAST(N'1996-01-22' AS Date), N'Nữ        ', N'Hải Dương', N'nguyentrang96@gmail.com', N'0981331236', N'NTT96', N'nguyentrang96', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'008       ', N'Bùi Quang Thắng', CAST(N'1995-11-28' AS Date), N'Nam       ', N'Hà Nội', N'quangthang95@gmail.com', N'0986698238', N'BQT95', N'quangthang95', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'009       ', N'Ngô Duy Mạnh', CAST(N'1995-02-16' AS Date), N'Nam       ', N'Thái Bình', N'duymanh95@gmail.com', N'0973328399', N'NDM95', N'duymanh95', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV01      ', N'Nguyễn Quang Minh', CAST(N'1995-08-19' AS Date), N'Nam       ', N'Hà Nội', N'quangminh95@gmail.com', N'0986666888', N'NQM95', N'quangminh95', 1, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV02      ', N'Phạm Minh Quyên', CAST(N'1995-09-11' AS Date), N'Nữ        ', N'Hà Nội', N'minhquyen95@gmail.com', N'0988668668', N'PMQ95', N'minhquyen95', 1, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV03      ', N'Nguyễn Văn Huy', CAST(N'1993-03-09' AS Date), N'Nam       ', N'Vĩnh Phúc', N'nguyenhuy93@gmail.com', N'0981330999', N'NVH93', N'nguyenhuy93', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV04      ', N'Nguyễn Xuân Mai', CAST(N'1994-05-12' AS Date), N'Nữ        ', N'Ninh Bình', N'xuanmai94@gmail.com', N'0932338888', N'NXM94', N'xuanmai94', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV05      ', N'Trần Thùy Linh', CAST(N'1995-06-10' AS Date), N'Nữ        ', N'Hà Nội', N'thuylinh95@gmail.com', N'0971003999', N'TTL95', N'thuylinh95', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV06      ', N'Phạm Văn Hùng', CAST(N'1993-03-16' AS Date), N'Nam       ', N'Hà Nam', N'phamhung93@gmail.com', N'0981333599', N'PVH93', N'phamhung93', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV07      ', N'Nguyễn Thị Trang', CAST(N'1996-01-22' AS Date), N'Nữ        ', N'Hải Dương', N'nguyentrang96@gmail.com', N'0981331236', N'NTT96', N'nguyentrang96', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV08      ', N'Bùi Quang Thắng', CAST(N'1995-11-28' AS Date), N'Nam       ', N'Hà Nội', N'quangthang95@gmail.com', N'0986698238', N'BQT95', N'quangthang95', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV09      ', N'Ngô Duy Mạnh', CAST(N'1995-02-16' AS Date), N'Nam       ', N'Thái Bình', N'duymanh95@gmail.com', N'0973328399', N'NDM95', N'duymanh95', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV10      ', N'Nguyễn Mai Hương', CAST(N'1996-12-09' AS Date), N'Nữ        ', N'Hà Nội', N'maihuong96@gmail.com', N'0989359936', N'NMH96', N'maihuong96', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV11      ', N'Nguyễn Quang Minh', CAST(N'1995-08-19' AS Date), N'Nam       ', N'Hà Nội', N'quangminh95@gmail.com', N'0986666888', N'NQM95', N'quangminh95', 1, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV12      ', N'Nguyễn Mai Hương', CAST(N'1996-12-09' AS Date), N'Nữ        ', N'Hà Nội', N'maihuong96@gmail.com', N'0989359936', N'NMH96', N'maihuong96', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV13      ', N'Phạm Minh Quyên', CAST(N'1995-09-11' AS Date), N'Nữ        ', N'Hà Nội', N'minhquyen95@gmail.com', N'0988668668', N'PMQ95', N'minhquyen95', 1, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV14      ', N'Nguyễn Văn Huy', CAST(N'1993-03-09' AS Date), N'Nam       ', N'Vĩnh Phúc', N'nguyenhuy93@gmail.com', N'0981330999', N'NVH93', N'nguyenhuy93', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV15      ', N'Nguyễn Xuân Mai', CAST(N'1994-05-12' AS Date), N'Nữ        ', N'Ninh Bình', N'xuanmai94@gmail.com', N'0932338888', N'NXM94', N'xuanmai94', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV16      ', N'Trần Thùy Linh', CAST(N'1995-06-10' AS Date), N'Nữ        ', N'Hà Nội', N'thuylinh95@gmail.com', N'0971003999', N'TTL95', N'thuylinh95', 2, N'1         ')
SET IDENTITY_INSERT [dbo].[PhanLoai] ON 

INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (1, N'Áo bé gái')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (2, N'Áo bé trai')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (3, N'Áo khoác')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (4, N'Giày')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (5, N'Quần bé gái')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (6, N'Quần bé trai')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (7, N'Váy')
SET IDENTITY_INSERT [dbo].[PhanLoai] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (1, N'Áo bé gái hoa cúc', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-thun-be-gai-tay-ngan-in-hoa-cuc-de-thuong.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (2, N'Áo bé gái sành điệu', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-thun-cho-be-gai-tay-dai-am-ap-in-logo-sanh-dieu (1).jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (3, N'Áo bé gái sành điệu', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-thun-cho-be-gai-tay-dai-am-ap-in-logo-sanh-dieu.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (4, N'Quần bé gái', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'quan-jeans-lung-dai-ong-suong-cho-be-gai (1).png', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (5, N'Áo khoác ', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-khoac-be-gai-freeship-ao-khoac-cho-be-tu-7-15kg-pba3ca30d-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (6, N'Áo khoác ', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-khoac-da-caro-cho-be-gai-tu-2-den-7-tuoi-p25439ac897c42-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (7, N'Áo khoác ', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-khoac-da-ca-ny-cho-be-trai-va-be-gai-p25339dc4c771d-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (8, N'Váy Le', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'chan-vay-be-gai-nhieu-hoa-tiet-xinh-xan__1_55vd-7s.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (9, N'Váy Bo', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'chan-vay-soc-xep-ly-sanh-dieu_4.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (10, N'Váy AP', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'dam-hoa-co-vuong-tay-canh-tien-beo-lai-de-thuong_6.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (11, N'Áo khoác AB ', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-khoac-be-trai-2-mat-hang-xuat-us-cao-cap-pa82d177a-500x500.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (12, N'Áo khoác BC', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-khoac-hoat-hinh-cau-be-ben-cho-be-trai-p252959c31ab2d-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (13, N'Áo khoác DB', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-khoac-jean-mickey-cho-be-gai-p2529173ff46b2-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (14, N'Áo khoác KL', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-khoac-hoat-hinh-elmo-cho-be-trai-va-be-gai-p252928a8733c-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (15, N'Áo khoác PO', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-khoac-hoat-hinh-elmo-cho-be-trai-va-be-gai-p252928a8733c-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (16, N'Áo khoác KY', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-khoac-kaki-dang-dai-phong-cach-han-quoc-cho-be-trai-va-be-gai-p253296aae1d87-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (17, N'Áo bé trai thun', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'Ao thun cho be tay dai co tru thue.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (18, N'Áo cổ bẻ thun', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'Ao so mi tay ngan soc Caro sanh dieu.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 2, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (19, N'Áo thun', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'Ao thun co tron.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (20, N'Áo phông sọc ngang', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'Ao so mi tay ngan soc Caro sanh dieu.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 2, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (21, N'Quần legging', N'Nữ        ', CAST(250000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'quan-legging-be-gai-lien-vay-tang-mau-tron-de-thuong-1-8-tuoi_(5).jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 5, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (110, N'Chân váy tàu', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'set-do-thoi-trang-cho-be-ao-thun-hoa-cuc-mix-chan-vay-caro.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 7, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (111, N'Áo khoác jean phối nỉ', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'ao-khoac-jean-mickey-cho-be-gai-p2529173ff46b2-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (112, N'Giày XiTan', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'giay-the-thao-phoi-2-mau-cho-be-trai-va-be-gai-p8a2383ab-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 4, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (113, N'Giày scandal', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'giay-scandal-phoi-mau-cho-be-trai-p250041f701ce2-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 4, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (114, N'Giày thể thao', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'giay-the-thao-fashion-sport-cho-be-trai-p870572ad-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 4, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (115, N'Giày Code', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'size-31-36-giay-the-thao-cho-be-trai-be-gai-giay-sneaker-cho-be-gt264-p48f4ebc3-300x300.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 4, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (116, N'Quần KLU', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'quan-kaki-lung-nhieu-hoa-tiet-dang-yeu-cho-be-trai-4-8-tuoi_(5).jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (117, N'Quần LEP', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'quan-the-thao-dai-lung-thun-don-gian.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (118, N'Quần thể thao KL', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'quan-the-thao-dai-lung-thun-tui-hop-in-chu.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (119, N'Quần sort', N'Nữ        ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'quan-short-size-dai-cho-be-gai-nhieu-mau-de-thuong-5-tuoi-12-tuoi-34516.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 5, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (120, N'Áo phông sọc ngang', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'Ao so mi tay ngan soc Caro sanh dieu.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (121, N'Quần le', N'Nữ        ', CAST(250000 AS Decimal(12, 0)), N'Thi?t k? th?i trang v?i nhi?u hình in n?i b?t (hình siêu nhân, ngu?i nh?n, kh?ng long, cá m?p... ).
- Ch?t li?u cotton 100%, m?m, m?n, th?m hút m? hôi c?c t?t cho bé.
- Xu?t x?: Made in Vietnam.
- Mi?n phí ship cho don hàng giá tr? trên 300k.', 100, N'quan-legging-dai-mix-soc-nang-dong-cho-be-gai-mau-tron-size-dai-5-9-tuoi1.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 5, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (122, N'quan dai khaki', N'Nam       ', CAST(300000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'khaki1.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (123, N'quan dai khaki 2', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'khaki2.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (124, N'quan dai khaki 3', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'kakhi3.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (125, N'quan dai khaki 4', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'kaki4', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (126, N'quan sooc 1', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'sooc1.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (127, N'quan sooc 2', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'sooc2.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (128, N'quan sooc 3', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'sooc3.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (129, N'quan sooc 4', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'sooc4.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (130, N'quan sooc 5', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'sooc5.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (131, N'quan sooc 6', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'sooc6.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (132, N'quan sooc 7', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'sooc7.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (133, N'quan sooc 9', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'sooc8.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (134, N'quan sooc 18', N'Nam       ', CAST(260000 AS Decimal(12, 0)), N'Qu?n dài khaki bé trai. ', 100, N'sooc9.jpg', CAST(N'2021-11-20 00:00:00.000' AS DateTime), 6, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (135, N'Đầm thun 1', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'thun2.jpg', CAST(N'2021-01-20 00:00:00.000' AS DateTime), 7, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (136, N'Đầm thun 2', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'thun4.jpg', CAST(N'2021-01-20 00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (137, N'Đầm thun 3', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'thun5.jpg', CAST(N'2021-01-20 00:00:00.000' AS DateTime), 7, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (138, N'Đầm thun 4', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'thun6.jpg', CAST(N'2021-01-20 00:00:00.000' AS DateTime), 7, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (139, N'Đầm thun 5', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'thun7.jpg', CAST(N'2021-01-20 00:00:00.000' AS DateTime), 7, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (140, N'Đầm thun 6', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'thun8.jpg', CAST(N'2021-01-20 00:00:00.000' AS DateTime), 7, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (141, N'Đầm thun  7', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'thun9.jpg', CAST(N'2021-01-20 00:00:00.000' AS DateTime), 7, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (142, N'Đầm thun 8', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'thun1.jpg', CAST(N'2021-01-20 00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (143, N'Đầm thun  9', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'thun1.jpg', CAST(N'2021-01-20 00:00:00.000' AS DateTime), 7, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (144, N'Áo thun 1', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao1.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (145, N'Áo thun 2', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao2.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (146, N'Áo thun 3', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao3.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (147, N'Áo thun 4', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao4.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (148, N'Áo thun 5', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao5.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (149, N'Áo thun 6', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao6.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (150, N'Áo thun 7', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao7.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (151, N'Áo thun 8', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao8.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (152, N'Áo thun 9', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao9.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (153, N'Áo thun 10', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao10.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (154, N'Áo thun 11', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao11.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (155, N'Áo thun 12', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao12.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (156, N'Áo thun 13', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao13.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (157, N'Áo thun  14', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao14.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (158, N'Áo thun 15', N'Nu~       ', CAST(500000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'ao15.jpg', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (159, N'Áo thun 1', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'1.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (160, N'Áo thun 12', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'2.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (161, N'Áo thun 13', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'3.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (162, N'Áo thun 14', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'4.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (163, N'Áo thun 15', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'5.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (164, N'Áo thun 16', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'6.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (165, N'Áo thun 17', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'7.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (166, N'Áo thun 18', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'8.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (167, N'Áo thun 19', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'9.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (168, N'Áo thun 21', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'10.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (169, N'Áo thun 22', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'11.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaBan], [GioiThieuSP], [Soluong], [Anh], [NgayCapNhat], [MaPL], [MaTH]) VALUES (170, N'Áo thun 23', N'Nam       ', CAST(200000 AS Decimal(12, 0)), N'San pham moi chat luong cao', 200, N'12.png', CAST(N'2021-01-03 00:00:00.000' AS DateTime), 2, 4)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (1, N'Bobby')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (2, N'Nike')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (3, N'Pic')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (4, N'Nova')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (5, N'PhaTol')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (6, N'FaT')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietHD__MaHD__173876EA] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK__ChiTietHD__MaHD__173876EA]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietHD__MaSP__182C9B23] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK__ChiTietHD__MaSP__182C9B23]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaKH__1DE57479] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaKH__1DE57479]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaNV__1ED998B2] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaNV__1ED998B2]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_PhanLoai] FOREIGN KEY([MaPL])
REFERENCES [dbo].[PhanLoai] ([MaPL])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_PhanLoai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ThuongHieu] FOREIGN KEY([MaTH])
REFERENCES [dbo].[ThuongHieu] ([MaTH])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ThuongHieu]
GO
USE [master]
GO
ALTER DATABASE [dbbanhang] SET  READ_WRITE 
GO
