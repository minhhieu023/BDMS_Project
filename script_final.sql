USE [QuanLyBanHang]
GO
/****** Object:  UserDefinedFunction [dbo].[Billing]    Script Date: 12/7/2019 7:29:07 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[UpdateStored]    Script Date: 12/7/2019 7:29:07 PM ******/
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
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 12/7/2019 7:29:07 PM ******/
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
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/7/2019 7:29:07 PM ******/
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
	[ThanhTien] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 12/7/2019 7:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[DanhMucID] [nchar](10) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
	[ChiNhanhID] [nchar](10) NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[DanhMucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/7/2019 7:29:07 PM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/7/2019 7:29:07 PM ******/
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
/****** Object:  Table [dbo].[NhanHieu]    Script Date: 12/7/2019 7:29:07 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/7/2019 7:29:07 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/7/2019 7:29:07 PM ******/
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
/****** Object:  Table [dbo].[SanPhamStored]    Script Date: 12/7/2019 7:29:07 PM ******/
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
/****** Object:  Table [dbo].[TemptSP]    Script Date: 12/7/2019 7:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemptSP](
	[ID] [int] NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[Soluong] [int] NULL,
 CONSTRAINT [PK_TemptSP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[DanhMuc]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc_ChiNhanh1] FOREIGN KEY([ChiNhanhID])
REFERENCES [dbo].[ChiNhanh] ([ChiNhanhID])
GO
ALTER TABLE [dbo].[DanhMuc] CHECK CONSTRAINT [FK_DanhMuc_ChiNhanh1]
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
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY([DanhMucID])
REFERENCES [dbo].[DanhMuc] ([DanhMucID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhanHieu] FOREIGN KEY([NhanHieuID])
REFERENCES [dbo].[NhanHieu] ([NhanHieuID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhanHieu]
GO
/****** Object:  StoredProcedure [dbo].[DeleteChiNhanh]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteDanhMuc]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteNhanHieu]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteNhanVien]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteSanPham]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteTempSP]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DeleteTempSP]
AS
DELETE  TemptSP
GO
/****** Object:  StoredProcedure [dbo].[InsertChiNhanh]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertChiTietHoaDon]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertChiTietHoaDon]
(
	-- Add the parameters for the stored procedure here
	@HoaDonID NCHAR(10) NULL,
	@SanPhamID NVARCHAR(50) NULL,
	@Soluong int NULL,
	@DonGia	int NULL,
	@GiamGia int NULL,
	@ThanhTien int NULL
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
		VALUES (@HoaDonID, @SanPhamID, @Soluong, @DonGia, @GiamGia, @ThanhTien)
		END
GO
/****** Object:  StoredProcedure [dbo].[InsertDanhMuc]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDanhMuc]
(
	-- Add the parameters for the stored procedure here
	@DanhMucID NCHAR(10) NULL,
	@ChiNhanhID NCHAR(10) NULL,
	@TenDanhMuc NVARCHAR(50) NULL
	)
AS 
BEGIN	
		INSERT INTO DanhMuc(DanhMucID, ChiNhanhID, TenDanhMuc)
		VALUES (@DanhMucID, @ChiNhanhID,@TenDanhMuc)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertHoaDon]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertKhachHang]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertNhanHieu]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertNhanVien]    Script Date: 12/7/2019 7:29:08 PM ******/
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
		insert into NhanhVien(MaNv,TenNV,MatKhau,ChucVu,MaNQL,ChiNhanhID,Luong)
		values (@MaNV,@TenNV,@MatKhau,@ChucVu,@MaNQL,@ChiNhanhID,@Luong)
	END
GO
/****** Object:  StoredProcedure [dbo].[InsertSP]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSP]
(
	@SanPhamID		int null,
	@ChiTiet		NVARCHAR(50) null,
	@TenSP			NVARCHAR(50) null,
	@SoLuong		NCHAR(10) null,
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
/****** Object:  StoredProcedure [dbo].[InsertTempSP]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertTempSP]
(@ID int NULL, @Soluong int NULL, @Ten NVARCHAR(50) )
AS
BEGIN
	INSERT TemptSP (ID,Ten, Soluong) VALUES ( @ID,@Ten,@Soluong)
END	
GO
/****** Object:  StoredProcedure [dbo].[RUDChiNhanh]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RUDNhanHieu]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RUDNhanVien]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectChiNhanh]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC	[dbo].[SelectChiNhanh] AS SELECT * FROM ChiNhanh
GO
/****** Object:  StoredProcedure [dbo].[SelectChiTietHoaDon]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC	[dbo].[SelectChiTietHoaDon] AS 
SELECT * FROM ChiTietHoaDon GROUP BY HoaDonID,SanPhamID,SoLuong,DonGia,GiamGia,ThanhTien;
GO
/****** Object:  StoredProcedure [dbo].[SelectDanhMuc]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDanhMuc]
@ChiNhanhID NCHAR(10) NULL
AS BEGIN 
SELECT * FROM DanhMuc WHERE ChiNhanhID = @ChiNhanhID
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNhanHieu]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectSanPham]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectTemptSP]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectTemptSP]
AS
SELECT * FROM TemptSP

GO
/****** Object:  StoredProcedure [dbo].[TimChiNhanh]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TimDanhMuc]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TimNhanHieu]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TimSP]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateChiNhanh]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateDanhMuc]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDanhMuc]
(
	-- Add the parameters for the stored procedure here
	@DanhMucID NCHAR(10) NULL,
	@ChiNhanhID NCHAR(10) NULL,
	@TenDanhMuc NVARCHAR(50) NULL
	)
AS 
BEGIN
	    UPDATE DanhMuc SET
			TenDanhMuc = @TenDanhMuc,
			ChiNhanhID = @ChiNhanhID
	WHERE  DanhMucID =  @DanhMucID
	END
GO
/****** Object:  StoredProcedure [dbo].[UpdateKhachHang]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateNhanHieu]    Script Date: 12/7/2019 7:29:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateNhanVien]    Script Date: 12/7/2019 7:29:08 PM ******/
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
	UPDATE NhanhVien SET
		TenNV=@TenNV,
		MatKhau=@MatKhau,
		ChucVu=@ChucVu,
		MaNQL=@MaNQL,
		ChiNhanhID=@ChiNhanhID,
		Luong=@Luong
	WHERE MaNv=@MaNV
	END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSP]    Script Date: 12/7/2019 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSP]
(
	@SanPhamID		int null,
	@ChiTiet		NVARCHAR(50) null,
	@TenSP			NVARCHAR(50) null,
	@SoLuong		NCHAR(10) null,
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
/****** Object:  StoredProcedure [dbo].[updateUTempSP]    Script Date: 12/7/2019 7:29:08 PM ******/
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
