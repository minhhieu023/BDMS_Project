USE [QuanLyBanHang]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertKhachHang]
(
	@KhachHangID	nchar(10) null,
	@HovaLot		nvarchar(50) null,
	@Ten			nchar(10) null,
	@Sdt			nchar(10) null,
	@StatementType nvarchar(20)=' '
)
AS 
BEGIN
	IF @StatementType='Insert'
	BEGIN
		insert into KhachHang(KhachHangID, HovaLot, Ten, Sdt)
		values (@KhachHangID, @HovaLot,@Ten,@Sdt)
	END
	IF @StatementType='Select'
	BEGIN
		select *from KhachHang
	END
	IF @StatementType='Update'
	BEGIN
	UPDATE KhachHang SET
		HovaLot=@HovaLot,
		Ten=@Ten,
		Sdt=@Sdt
	WHERE KhachHangID=@KhachHangID
	END
	else IF @StatementType='Delete'
	BEGIN
	DELETE FROM KhachHang WHERE KhachHangID=@KhachHangID
	END
END
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
ALTER PROCEDURE [dbo].[RUDSanPham]
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
	@HinhAnh		Image NULL,
	@StatementType nvarchar(20)=' '
)
AS 
BEGIN
	IF @StatementType='Insert'
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
	IF @StatementType='Select'
	BEGIN
		select *from SanPham
	END
	IF @StatementType='Update'
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
	else IF @StatementType='Delete'
	BEGIN
	DELETE FROM SanPham WHERE SanPhamID = @SanPhamID
	END
END
GO

ALTER PROCEDURE [dbo].[UpdateSP]
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