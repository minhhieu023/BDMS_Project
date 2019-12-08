
USE [QuanLyBanHang]
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--ChiNhanh
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
--Chitiethoadon
CREATE PROCEDURE [dbo].[RUDChiTietHoaDon]
(
	-- Add the parameters for the stored procedure here
	@HoaDonID NCHAR(10) NULL,
	@SanPhamID NVARCHAR(50) NULL,
	@Soluong int NULL,
	@DonGia	int NULL,
	@GiamGia int NULL,
	@ThanhTien int NULL,
	@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
	IF @StatementType = 'Insert' 
		BEGIN
		INSERT INTO ChiTietHoaDon (HoaDonID, SanPhamID, Soluong, DonGia, GiamGia, ThanhTien) 
		VALUES (@HoaDonID, @SanPhamID, @Soluong, @DonGia, @GiamGia, @ThanhTien)
		END
	IF @StatementType = 'Select'
	BEGIN
		SELECT * FROM ChiTietHoaDon 
	END
END
GO
--DanhMuc
ALTER PROCEDURE [dbo].[SelectDanhMuc]
@ChiNhanhID NCHAR(10) NULL
AS BEGIN 
SELECT * FROM DanhMuc WHERE ChiNhanhID = @ChiNhanhID
END
go

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
	go
CREATE PROCEDURE [dbo].[DeleteDanhMUC]

CREATE PROCEDURE [dbo].[RUDDanhMuc]
(
	-- Add the parameters for the stored procedure here
	@DanhMucID NCHAR(10) NULL,
	@ChiNhanhID NCHAR(10) NULL,
	@TenDanhMuc NVARCHAR(50) NULL,
	@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
	IF @StatementType = 'Insert' 
		BEGIN
		INSERT INTO DanhMuc(DanhMucID, ChiNhanhID, TenDanhMuc)
		VALUES (@DanhMucID, @ChiNhanhID,@TenDanhMuc)
		END
	IF @StatementType = 'Select'
	BEGIN
		SELECT * FROM DanhMuc
	END
	IF @StatementType ='Update'
	BEGIN
	    UPDATE DanhMuc SET
			TenDanhMuc = @TenDanhMuc,
			ChiNhanhID = @ChiNhanhID
	WHERE  DanhMucID =  @DanhMucID
	END
END
GO
--HoaDon
CREATE PROCEDURE [dbo].[RUDHoaDon]
(
	-- Add the parameters for the stored procedure here
	@KhachHangID NCHAR(10) NULL,
	@HoaDonID NVARCHAR(10) NULL,
	@MaNV NCHAR(10) NULL,
	@NgayBan Datetime NULL,
	@TongTien int NULL,
	@StatementType NVARCHAR(20) = '' 
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
	IF @StatementType = 'Insert' 
		BEGIN
		INSERT INTO HoaDon(KhachHangID,HoaDonID ,MaNV, NgayBan,TongTien )
		VALUES (@KhachHangID, @HoaDonID, @MaNV, @NgayBan, @TongTien)
		END
	IF @StatementType = 'Select'
	BEGIN
		SELECT * FROM HoaDon
	END
	IF @StatementType ='Update'
	BEGIN
	    UPDATE HoaDon SET
			KhachHangID = @KhachHangID,
			MaNV = @MaNV,
			NgayBan = @NgayBan,
			TongTien =@TongTien
	WHERE HoaDonID=  @HoaDonID
	END
END
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
	go


