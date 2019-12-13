USE [master]
GO
/****** Object:  Database [QuanLyBanHang]    Script Date: 12/10/2019 5:29:06 AM ******/
CREATE DATABASE [QuanLyBanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QuanLyBanHang.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyBanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QuanLyBanHang_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QuanLyBanHang] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyBanHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyBanHang] SET QUERY_STORE = OFF
GO
USE [QuanLyBanHang]
GO
/****** Object:  UserDefinedFunction [dbo].[Billing]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Billing]( @SoLuongMua int, @GiaBan int) RETURNS int
AS
BEGIN
	RETURN(@SoLuongMua*@GiaBan)
END	
GO
/****** Object:  UserDefinedFunction [dbo].[Calculate_TinhTien]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Calculate_TinhTien]
(
@Soluong INT , 
@DonGia INT ,
@GiamGia INT)
RETURNS Int	
AS
BEGIN
  
	   RETURN (@Soluong*@DonGia - @GiamGia)
    
END
GO
/****** Object:  UserDefinedFunction [dbo].[Function_ToTalPay]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Function_ToTalPay]
	(
		@HoaDonID NCHAR(10) null
	)
RETURNS int 
AS 
BEGIN
	RETURN (SELECT  SUM(ThanhTien)
	FROM ChiTietHoaDon 
	WHERE HoaDonID = @HoaDonID)
END
GO
/****** Object:  UserDefinedFunction [dbo].[helloworldfunction]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[helloworldfunction]()
RETURNS varchar(20)
AS 
BEGIN
	 RETURN 'Hello world'
END
 
 
GO
/****** Object:  UserDefinedFunction [dbo].[UpdateStored]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[UpdateStored]
(
	@SoLuongMua int,
	@SoluongBanDau int
)	RETURNS int
AS
BEGIN
    RETURN (@SoLuongBanDau - @SoLuongMua)
END
GO
/****** Object:  Table [dbo].[DanhMuc_ChiNhanh]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc_ChiNhanh](
	[DanhMucID] [nchar](10) NOT NULL,
	[ChiNhanhID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_DanhMuc_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[DanhMucID] ASC,
	[ChiNhanhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[DanhMucID] [nchar](10) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[DanhMucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[ChiNhanhID] [nchar](10) NOT NULL,
	[TenChiNhanh] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChiNhanh_1] PRIMARY KEY CLUSTERED 
(
	[ChiNhanhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ChiNhanh_DanhMuc_View]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ChiNhanh_DanhMuc_View]
AS
SELECT  ChiNhanh.TenChiNhanh,DanhMuc.TenDanhMuc FROM ChiNhanh,DanhMuc_ChiNhanh, DanhMuc
WHERE DanhMuc.DanhMucID =DanhMuc_ChiNhanh.DanhMucID AND ChiNhanh.ChiNhanhID = DanhMuc_ChiNhanh.ChiNhanhID

GROUP BY  ChiNhanh.TenChiNhanh,DanhMuc.TenDanhMuc
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[SanPhamID] [int] NOT NULL,
	[ChiTiet] [nvarchar](50) NULL,
	[TenSP] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[GiaNhap] [int] NULL,
	[GiaBan] [int] NULL,
	[NhaCungCap] [nchar](10) NULL,
	[NhanHieuID] [nchar](10) NULL,
	[DanhMucID] [nchar](10) NULL,
	[HinhAnh] [image] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanHieu]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanHieu](
	[NhanHieuID] [nchar](10) NOT NULL,
	[TenNhanHieu] [nchar](10) NULL,
 CONSTRAINT [PK_NhanHieu_1] PRIMARY KEY CLUSTERED 
(
	[NhanHieuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DASHBOARD]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[DASHBOARD]
AS
SELECT SanPhamID AS 'Mã Sản Phẩm',TenSP AS 'Tên Sản Phẩm',SoLuong as 'Số Lượng',GiaBan as 'Giá Bán',DanhMuc.TenDanhMuc as 'Tên Danh Mục', NhanHieu.TenNhanHieu as 'Tên Nhãn Hiệu', SanPham.HinhAnh as 'Hình Ảnh' FROM SanPham, DanhMuc, NhanHieu
WHERE SanPham.DanhMucID = DanhMuc.DanhMucID AND SanPham.NhanHieuID=NhanHieu.NhanHieuID
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[HoaDonID] [nchar](10) NOT NULL,
	[SanPhamID] [int] NOT NULL,
	[Soluong] [int] NULL,
	[DonGia] [int] NULL,
	[GiamGia] [int] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[HoaDonID] ASC,
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[View_tb_HoaDon]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE FUNCTION [dbo].[View_tb_HoaDon] 
  (
  @HoaDonID nchar(10)
  )
  returns table
  as	
  
		return(  Select SanPham.TenSP as 'Sản Phẩm', ChiTietHoaDon.Soluong as 'Số Lượng', ChiTietHoaDon.DonGia as 'Đơn Giá'
		from ChiTietHoaDon, SanPham 
		where ChiTietHoaDon.HoaDonID = @HoaDonID
	and SanPham.SanPhamID = ChiTietHoaDon.SanPhamID)
  
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[KhachHangID] [nchar](10) NOT NULL,
	[HoaDonID] [nchar](10) NOT NULL,
	[MaNV] [nchar](10) NULL,
	[NgayBan] [datetime] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_HoaDon_1] PRIMARY KEY CLUSTERED 
(
	[HoaDonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[KhachHangID] [nchar](10) NOT NULL,
	[HovaLot] [nvarchar](50) NULL,
	[Ten] [nchar](10) NULL,
	[Sdt] [nchar](10) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[KhachHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[TenNV] [nchar](10) NULL,
	[MatKhau] [nchar](10) NULL,
	[ChucVu] [nchar](10) NULL,
	[MaNQL] [nchar](10) NULL,
	[ChiNhanhID] [nchar](10) NULL,
	[Luong] [nchar](10) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_HoaDon]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[View_HoaDon] 
as
	select HoaDon.HoaDonID, NhanVien.TenNV ,KhachHang.KhachHangID, KhachHang.Ten, KhachHang.Sdt , HoaDon.NgayBan, HoaDon.TongTien
				  from HoaDon, Khachhang, NhanVien
				   where NhanVien.MaNv = HoaDon.MaNV and 
				   HoaDon.KhachHangId = KhachHang.KhachHangID
GO
/****** Object:  UserDefinedFunction [dbo].[function_timTenKH]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[function_timTenKH] 
(@sdt nvarchar(11)
)
returns TABLE
as
	--return ( select HoaDon.HoaDonID, NhanVien.TenNV, KhachHang.KhachHangID, KhachHang.Ten, KhachHang.Sdt , HoaDon.NgayBan, HoaDon.TongTien
	--			  from HoaDon, Khachhang, NhanVien 
	--			  where KhachHang.Sdt like '%'+ @sdt +'%' and 
	--			  NhanVien.MaNV = HoaDon.MaNV
	--			  and 
	--			  KhachHang.KhachHangID = HoaDon.KhachHangID
				 return ( select * from View_HoaDon where Sdt like @sdt + '%'
						 )		
GO
/****** Object:  Table [dbo].[SanPhamStored]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamStored](
	[SanPhamID] [nchar](10) NOT NULL,
	[DonGia] [int] NULL,
	[ChiTiet] [nchar](10) NULL,
	[TenSP] [nchar](10) NULL,
	[NhanHieuID] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TemptSP]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemptSP](
	[ID] [int] NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[Soluong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_TemptSP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Ten_SDT]    Script Date: 12/10/2019 5:29:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_Ten_SDT] ON [dbo].[KhachHang]
(
	[Ten] ASC,
	[Sdt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_ncc_sanpham_TenSP]    Script Date: 12/10/2019 5:29:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_ncc_sanpham_TenSP] ON [dbo].[SanPham]
(
	[TenSP] ASC
)
INCLUDE ( 	[SanPhamID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon1] FOREIGN KEY([HoaDonID])
REFERENCES [dbo].[HoaDon] ([HoaDonID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon1]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham1] FOREIGN KEY([SanPhamID])
REFERENCES [dbo].[SanPham] ([SanPhamID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham1]
GO
ALTER TABLE [dbo].[DanhMuc_ChiNhanh]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc_ChiNhanh_ChiNhanh] FOREIGN KEY([ChiNhanhID])
REFERENCES [dbo].[ChiNhanh] ([ChiNhanhID])
GO
ALTER TABLE [dbo].[DanhMuc_ChiNhanh] CHECK CONSTRAINT [FK_DanhMuc_ChiNhanh_ChiNhanh]
GO
ALTER TABLE [dbo].[DanhMuc_ChiNhanh]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc_ChiNhanh_DanhMuc] FOREIGN KEY([DanhMucID])
REFERENCES [dbo].[DanhMuc] ([DanhMucID])
GO
ALTER TABLE [dbo].[DanhMuc_ChiNhanh] CHECK CONSTRAINT [FK_DanhMuc_ChiNhanh_DanhMuc]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Employee] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Employee]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang1] FOREIGN KEY([KhachHangID])
REFERENCES [dbo].[KhachHang] ([KhachHangID])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang1]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_Employee_ChiNhanh1] FOREIGN KEY([ChiNhanhID])
REFERENCES [dbo].[ChiNhanh] ([ChiNhanhID])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_Employee_ChiNhanh1]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([MaNQL])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc1] FOREIGN KEY([DanhMucID])
REFERENCES [dbo].[DanhMuc] ([DanhMucID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc1]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhanHieu] FOREIGN KEY([NhanHieuID])
REFERENCES [dbo].[NhanHieu] ([NhanHieuID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhanHieu]
GO
/****** Object:  StoredProcedure [dbo].[DeleteChiNhanh]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteChiNhanh]
(
	-- Add the parameters for the stored procedure here
	@ChiNhanhId NCHAR(10) NULL
	--@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
		DELETE FROM ChiNhanh WHERE ChiNhanhID=@CHiNhanhID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDanhMuc]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDanhMuc]
(
	-- Add the parameters for the stored procedure here
	@DanhMucId NCHAR(10) NULL
	--@StatementType NVARCHAR(20) = '' 
	)
AS
 
	BEGIN
	DELETE FROM DanhMuc WHERE DanhMucID=@DanhMucID
	END
GO
/****** Object:  StoredProcedure [dbo].[DeleteNhanHieu]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteNhanHieu]
(
	-- Add the parameters for the stored procedure here
	@NhanHieuID NCHAR(10) NULL
	--@StatementType NVARCHAR(20) = '' 
	)
AS
 
	BEGIN
	DELETE FROM NhanHieu WHERE NhanHieuID=@NhanHieuID
	END
GO
/****** Object:  StoredProcedure [dbo].[DeleteNhanVien]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
CREATE PROC [dbo].[DeleteNhanVien]
(@NhanVienID NCHAR(10) NULL)
AS
	BEGIN 
		DELETE FROM NhanVien WHERE MaNV = @NhanVienID
	END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSanPham]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSanPham]
(
	-- Add the parameters for the stored procedure here
	@SanPhamID INT  NULL
	--@StatementType NVARCHAR(20) = '' 
	)
AS
 
	BEGIN
	DELETE FROM SanPham WHERE SanPhamID=@SanPhamID
	END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTempSP]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DeleteTempSP]
AS
DELETE  TemptSP
GO
/****** Object:  StoredProcedure [dbo].[InsertChiNhanh]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertChiNhanh]
(
	-- Add the parameters for the stored procedure here
	@ChiNhanhId NCHAR(10) NULL,
	@TenChiNhanh NVARCHAR(50) NULL 
	--@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
		INSERT INTO ChiNhanh(ChiNhanhID,TenChiNhanh)
		VALUES (@ChiNhanhId, @TenChiNhanh);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertChiTietHoaDon]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertChiTietHoaDon]
(
	-- Add the parameters for the stored procedure here
	@HoaDonID NCHAR(10) NULL,
	@SanPhamID int NULL,
	@SoLuong int NULL,
	@DonGia	int NULL,
	@GiamGia int NULL,
	@ThanhTien int null
	
	--@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
	--IF @StatementType = 'Insert' 
	--BEGIN
		
		
		INSERT INTO ChiTietHoaDon (HoaDonID, SanPhamID, Soluong, DonGia, GiamGia, ThanhTien) 
		VALUES (@HoaDonID, @SanPhamID, @SoLuong, @DonGia, @GiamGia, @ThanhTien)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertDanhMuc]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDanhMuc]
(
	-- Add the parameters for the stored procedure here
	@DanhMucID NCHAR(10) NULL,
	
	@TenDanhMuc NVARCHAR(50) NULL
	)
AS 
BEGIN	
		INSERT INTO DanhMuc(DanhMucID,  TenDanhMuc)
		VALUES (@DanhMucID,@TenDanhMuc)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertHoaDon]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertHoaDon]
(
	-- Add the parameters for the stored procedure here
	@KhachHangID NCHAR(10) NULL,
	@HoaDonID NVARCHAR(10) NULL,
	@MaNV NCHAR(10) NULL,
	@NgayBan Datetime NULL,
	@TongTien int NULL
	--@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
	--IF @StatementType = 'Insert' 
		--BEGIN
		INSERT INTO HoaDon(KhachHangID,HoaDonID ,MaNV, NgayBan,TongTien )
		VALUES (@KhachHangID, @HoaDonID, @MaNV, @NgayBan, @TongTien)
		END
GO
/****** Object:  StoredProcedure [dbo].[InsertKhachHang]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertKhachHang]
(
	@KhachHangID	nchar(10) null,
	@HovaLot		nvarchar(50) null,
	@Ten			nchar(10) null,
	@Sdt			nchar(10) null
	--@StatementType nvarchar(20)=' '
)
AS 
BEGIN
	--IF @StatementType='Insert'
	
		insert into KhachHang(KhachHangID, HovaLot, Ten, Sdt)
		values (@KhachHangID, @HovaLot,@Ten,@Sdt)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertNhanHieu]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertNhanHieu]
(
	-- Add the parameters for the stored procedure here
	@NhanHieuId NCHAR(10) NULL,
	@TenNhanHieu NVARCHAR(50) NULL 
	--@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
		INSERT INTO NhanHieu(NhanHieuID, TenNhanHieu)
		VALUES (@NhanHieuID, @TenNhanHieu);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertNhanVien]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertNhanVien]
(
	@MaNV			nchar(10) null,
	@TenNV			nchar(10) null,
	@MatKhau		nchar(10) null,
	@ChucVu			nchar(10) null,
	@MaNQL			nchar(10) null,
	@ChiNhanhID		nchar(10) null,
	@Luong			nchar(10) null
	--@StatementType nvarchar(20)=' '
)
AS 
BEGIN
	--IF @StatementType='Insert'
	--BEGIN
		insert into NhanVien(MaNv,TenNV,MatKhau,ChucVu,MaNQL,ChiNhanhID,Luong)
		values (@MaNV,@TenNV,@MatKhau,@ChucVu,@MaNQL,@ChiNhanhID,@Luong)
	END
GO
/****** Object:  StoredProcedure [dbo].[InsertSP]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSP]
(
	@SanPhamID		int null,
	@ChiTiet		NVARCHAR(50) null,
	@TenSP			NVARCHAR(50) null,
	@SoLuong		INT null,
	@GiaNhap		INT null,
	@GiaBan			INT null,
	@NhaCungCap	    NCHAR(10) null,
	@NhanHieuID		NCHAR(10) NULL,
	@DanhMucID		NCHAR(10) NULL,
	@HinhAnh		Image NULL
--	@StatementType nvarchar(20)=' '
)
AS

	BEGIN
		insert into SanPham(SanPhamID,
	ChiTiet,	
	TenSP,			
	SoLuong,
	GiaNhap	,	
	GiaBan,	
	NhaCungCap,  
	NhanHieuID,	
	DanhMucID,
	HinhAnh	)
		values (@SanPhamID,	@ChiTiet,		
	@TenSP	,		
	@SoLuong		,
	@GiaNhap		,
	@GiaBan			,
	@NhaCungCap	   ,
	@NhanHieuID		,
	@DanhMucID,
	@HinhAnh)
	END
GO
/****** Object:  StoredProcedure [dbo].[InsertTempSP]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertTempSP]
(@ID int NULL, @Soluong int NULL, @Ten NVARCHAR(50),@DonGia INT null )
AS
BEGIN
	INSERT TemptSP (ID,Ten, Soluong,DonGia) VALUES ( @ID,@Ten,@Soluong,@DonGia)
END	
GO
/****** Object:  StoredProcedure [dbo].[RUDChiNhanh]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RUDChiNhanh]
(
	-- Add the parameters for the stored procedure here
	@ChiNhanhID NCHAR(10) NULL,
	@TenChiNhanh NVARCHAR(50) NULL,
	@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
	IF @StatementType = 'Insert' 
		BEGIN
		INSERT INTO ChiNhanh(ChiNhanhID, TenChiNhanh)
		VALUES (@ChiNhanhID, @TenChiNhanh)
		END
	IF @StatementType = 'Select'
	BEGIN
		SELECT * FROM ChiNhanh
	END
	IF @StatementType ='Update'
	BEGIN
	    UPDATE ChiNhanh SET
			TenChiNhanh = @TenChiNhanh
	WHERE ChiNhanhID=  @ChiNhanhID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[RUDNhanHieu]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RUDNhanHieu]
(
	@NhanHieuID		nchar(10) null,
	@TenNhanHieu	nchar(10) null,
	@StatementType nvarchar(20)=' '
)
AS 
BEGIN
	IF @StatementType='Insert'
	BEGIN
		insert into NhanHieu(NhanHieuID,  TenNhanHieu )
		values (@NhanHieuID,@TenNhanHieu)
	END
	IF @StatementType='Select'
	BEGIN
		select *from NhanHieu
	END
	IF @StatementType='Update'
	BEGIN
	UPDATE NhanHieu SET
		TenNhanHieu=@TenNhanHieu
	WHERE NhanHieuID=@NhanHieuID
	END
	else IF @StatementType='Delete'
	BEGIN
	DELETE FROM NhanHieu WHERE NhanHieuID=@NhanHieuID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[RUDNhanVien]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RUDNhanVien]
(
	@MaNV			nchar(10) null,
	@TenNV			nchar(10) null,
	@MatKhau		nchar(10) null,
	@ChucVu			nchar(10) null,
	@MaNQL			nchar(10) null,
	@ChiNhanhID		nchar(10) null,
	@Luong			nchar(10) null,
	@StatementType nvarchar(20)=' '
)
AS 
BEGIN
	IF @StatementType='Insert'
	BEGIN
		insert into NhanhVien(MaNv,TenNV,MatKhau,ChucVu,MaNQL,ChiNhanhID,Luong)
		values (@MaNV,@TenNV,@MatKhau,@ChucVu,@MaNQL,@ChiNhanhID,@Luong)
	END
	IF @StatementType='Select'
	BEGIN
		select *from NhanhVien
	END
	IF @StatementType='Update'
	BEGIN
	UPDATE NhanhVien SET
		TenNV=@TenNV,
		MatKhau=@MatKhau,
		ChucVu=@ChucVu,
		MaNQL=@MaNQL,
		ChiNhanhID=@ChiNhanhID,
		Luong=@Luong
	WHERE MaNv=@MaNV
	END
	else IF @StatementType='Delete'
	BEGIN
	DELETE FROM NhanhVien WHERE MaNV=@MaNV
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SelectChiNhanh]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC	[dbo].[SelectChiNhanh] AS SELECT * FROM ChiNhanh
GO
/****** Object:  StoredProcedure [dbo].[SelectChiTietHoaDon]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC	[dbo].[SelectChiTietHoaDon] AS 
SELECT * FROM ChiTietHoaDon GROUP BY HoaDonID,SanPhamID,SoLuong,DonGia,GiamGia,ThanhTien;
GO
/****** Object:  StoredProcedure [dbo].[SelectDanhMuc]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDanhMuc]
AS BEGIN 
SELECT * FROM DanhMuc 
END
GO
/****** Object:  StoredProcedure [dbo].[SelectHoaDon]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SelectHoaDon] 
as
begin
	select * from HoaDon
end
GO
/****** Object:  StoredProcedure [dbo].[SelectKhachHang]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create proc [dbo].[SelectKhachHang] 
						as begin select * from KhachHang end
GO
/****** Object:  StoredProcedure [dbo].[SelectNhanHieu]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNhanHieu]
@NhanHieuID NCHAR(10) NULL
AS BEGIN 
SELECT * FROM NhanHieu
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNhanVien]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SelectNhanVien]
as
Begin
 select * from NhanVien
end
GO
/****** Object:  StoredProcedure [dbo].[SelectSanPham]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectSanPham]
AS
BEGIN 
SELECT * FROM SanPham
end 
GO
/****** Object:  StoredProcedure [dbo].[SelectTemptSP]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectTemptSP]
AS
SELECT * FROM TemptSP

GO
/****** Object:  StoredProcedure [dbo].[TimChiNhanh]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TimChiNhanh]
(
	-- Add the parameters for the stored procedure here
	@ChiNhanhId NCHAR(10) NULL
	--@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
		SELECT  * FROM ChiNhanh WHERE ChiNhanhID=@ChiNhanhId
END
GO
/****** Object:  StoredProcedure [dbo].[TimDanhMuc]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TimDanhMuc]
@text NVARCHAR(50) NULL
AS
begin
SELECT * FROM DanhMuc
WHERE TenDanhMuc LIKE '%' + @text + '%';
end
GO
/****** Object:  StoredProcedure [dbo].[TimKHSDT]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[TimKHSDT](@SDT nvarchar null)
 as 
 Select Ten,Sdt from KhachHang where Sdt = @SDT
GO
/****** Object:  StoredProcedure [dbo].[TimKHTenKH]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[TimKHTenKH](@Ten nvarchar null)
 as 
 Select Ten,Sdt from KhachHang where Ten = @Ten
GO
/****** Object:  StoredProcedure [dbo].[TimKiemSDT]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

				  CREATE proc [dbo].[TimKiemSDT] 
				  (
					@sdt nvarchar(11)
				  )
				  AS SELECT * FROM View_HoaDon where sdt Like @sdt+'%'
GO
/****** Object:  StoredProcedure [dbo].[TimNhanHieu]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TimNhanHieu]
@text NVARCHAR(50) NULL
AS
begin
SELECT * FROM NhanHieu
WHERE TenNhanHieu LIKE '%' + @text + '%';
end
GO
/****** Object:  StoredProcedure [dbo].[TimSP]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TimSP]
@text NVARCHAR(50) NULL
AS
begin
SELECT * FROM SanPham
WHERE TenSP LIKE '%' + @text + '%';
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateChiNhanh]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateChiNhanh]
(
	-- Add the parameters for the stored procedure here
	@ChiNhanhId NCHAR(10) NULL,
	@TenChiNhanh NVARCHAR(50) NULL
	--@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
		UPDATE ChiNhanh SET
		TenChiNhanh=@TenChiNhanh
		WHERE ChiNhanhID=@ChiNhanhId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDanhMuc]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDanhMuc]
(
	-- Add the parameters for the stored procedure here
	@DanhMucID NCHAR(10) NULL,
	
	@TenDanhMuc NVARCHAR(50) NULL
	)
AS 
BEGIN
	    UPDATE DanhMuc SET
			TenDanhMuc = @TenDanhMuc
			
	WHERE  DanhMucID =  @DanhMucID
	END
GO
/****** Object:  StoredProcedure [dbo].[UpdateKhachHang]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateKhachHang]
(
	@KhachHangID	nchar(10) null,
	@HovaLot		nvarchar(50) null,
	@Ten			nchar(10) null,
	@Sdt			nchar(10) null
	--@StatementType nvarchar(20)=' '
)
AS 
BEGIN
	--IF @StatementType='Insert'
	
--		insert into KhachHang(KhachHangID, HovaLot, Ten, Sdt)
--		values (@KhachHangID, @HovaLot,@Ten,@Sdt)
--END
--	IF @StatementType='Select'
--	BEGIN
--		select *from KhachHang
--	END
--	IF @StatementType='Update'
--	BEGIN
	UPDATE KhachHang SET
		HovaLot=@HovaLot,
		Ten=@Ten,
		Sdt=@Sdt
	WHERE KhachHangID=@KhachHangID
	END
GO
/****** Object:  StoredProcedure [dbo].[UpdateNhanHieu]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateNhanHieu]
(
	-- Add the parameters for the stored procedure here
	@NhanHieuId NCHAR(10) NULL,
	@TenNhanHieu NVARCHAR(50) NULL 
	--@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
		UPDATE  NhanHieu SET
		NhanHieuID=@NhanHieuID, 
		TenNhanHieu=@TenNhanHieu
		WHERE NhanHieuID = @NhanHieuID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateNhanVien]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateNhanVien]
(
	@MaNV			nchar(10) null,
	@TenNV			nchar(10) null,
	@MatKhau		nchar(10) null,
	@ChucVu			nchar(10) null,
	@MaNQL			nchar(10) null,
	@ChiNhanhID		nchar(10) null,
	@Luong			nchar(10) null
	--@StatementType nvarchar(20)=' '
)
AS 
BEGIN
	--IF @StatementType='Insert'
	--BEGIN
	--	insert into NhanhVien(MaNv,TenNV,MatKhau,ChucVu,MaNQL,ChiNhanhID,Luong)
	--	values (@MaNV,@TenNV,@MatKhau,@ChucVu,@MaNQL,@ChiNhanhID,@Luong)
	--END
	--IF @StatementType='Select'
	--BEGIN
	--	select *from NhanhVien
	--END
	--IF @StatementType='Update'
	--BEGIN
	UPDATE NhanVien SET
		TenNV=@TenNV,
		MatKhau=@MatKhau,
		ChucVu=@ChucVu,
		MaNQL=@MaNQL,
		ChiNhanhID=@ChiNhanhID,
		Luong=@Luong
	WHERE MaNv=@MaNV
	END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSP]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSP]
(
	@SanPhamID		int null,
	@ChiTiet		NVARCHAR(50) null,
	@TenSP			NVARCHAR(50) null,
	@SoLuong		int null,
	@GiaNhap		INT null,
	@GiaBan			INT null,
	@NhaCungCap	    NCHAR(10) null,
	@NhanHieuID		NCHAR(10) NULL,
	@DanhMucID		NCHAR(10) NULL,
	@HinhAnh		Image NULL
--	@StatementType nvarchar(20)=' '
)
AS 
	BEGIN
	UPDATE SanPham SET
	TenSP=	@TenSP	,	
	ChiTiet = @ChiTiet,	
	SoLuong=@SoLuong,
	GiaNhap	= @GiaNhap		,
	GiaBan	= @GiaBan			,
	NhaCungCap	 = @NhaCungCap	   ,
	NhanHieuID= @NhanHieuID	,
	DanhMucID= @DanhMucID,
	HinhAnh = @HinhAnh 
	WHERE SanPhamID = @SanPhamID
	END
GO
/****** Object:  StoredProcedure [dbo].[updateUTempSP]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[updateUTempSP]
(@ID int NULL)
AS
BEGIN
	UPDATE TemptSP SET Soluong+=1  WHERE ID=@ID
END	
GO
/****** Object:  StoredProcedure [dbo].[XemHoaDon]    Script Date: 12/10/2019 5:29:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[XemHoaDon]
 (@HoaDonID nchar(10) null)
 as
 begin	
  Select CHiTietHoaDon.HoaDonID,SanPham.TenSP, ChiTietHoaDon.Soluong, ChiTietHoaDon.DonGia  From ChiTietHoaDon,
	(select HoaDonID, TongTien from HoaDon where HoaDonID = @HoaDonID) as BILL, SanPham
	where BILL.HoaDonID = ChiTietHoaDon.HoaDonID and SanPham.SanPhamID = ChiTietHoaDon.SanPhamID
	group by CHiTietHoaDon.HoaDonID,SanPham.TenSP, ChiTietHoaDon.Soluong, ChiTietHoaDon.DonGia 
 end
GO
USE [master]
GO
ALTER DATABASE [QuanLyBanHang] SET  READ_WRITE 
GO
