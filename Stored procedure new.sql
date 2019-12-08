USE [QuanLyBanHang]
GO
/****** Object:  StoredProcedure [dbo].[DeleteChiNhanh]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteDanhMuc]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteNhanHieu]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteNhanVien]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteSanPham]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[InsertChiNhanh]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[InsertChiTietHoaDon]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[InsertDanhMuc]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[InsertHoaDon]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[InsertKhachHang]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[InsertNhanHieu]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[InsertNhanVien]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[InsertSP]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[SelectChiNhanh]    Script Date: 07/12/2019 7:22:18 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectChiNhanh]
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
		SELECT  * FROM ChiNhanh
END
GO
/****** Object:  StoredProcedure [dbo].[SelectDanhMuc]    Script Date: 07/12/2019 7:22:18 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDanhMuc]
@ChiNhanhID NCHAR(10) NULL
AS BEGIN 
SELECT * FROM DanhMuc
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNhanHieu]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[TimChiNhanh]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[TimDanhMuc]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[TimNhanHieu]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[TimSP]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateChiNhanh]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateDanhMuc]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateKhachHang]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateNhanHieu]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateNhanVien]    Script Date: 07/12/2019 7:22:18 CH ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateSP]    Script Date: 07/12/2019 7:22:18 CH ******/
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
