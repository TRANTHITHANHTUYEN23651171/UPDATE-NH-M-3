--Tạo csdl quản lý lao động
CREATE DATABASE QLLD
GO
USE QLLD
GO
-- Tạo bảng phòng ban
CREATE TABLE PHONGBAN (
    MAPB CHAR(5) PRIMARY KEY,
    TENPB NVARCHAR(50) )

-- Tạo bảng nhân viên
CREATE TABLE NHANVIEN (
    MANV CHAR(5) PRIMARY KEY,
    HOTEN NVARCHAR(50),
    NGSINH DATE,
    PHAI NVARCHAR(3),
    DIACHI NVARCHAR(100),
    MAPB CHAR(5),
    FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB) )

-- Tạo bảng công trình
CREATE TABLE CONGTRINH (
    MACT CHAR(5) PRIMARY KEY,
    TENCT NVARCHAR(100),
    DIADIEM NVARCHAR(100),
    NGAYCAPGP DATE,
    NGAYKC DATE,
    NGAYHC DATE )

-- Tạo bảng phân công
CREATE TABLE PHANCONG (
    MANV CHAR(5),
    MACT CHAR(5),
    SLNGAYCONG INT,
    PRIMARY KEY (MANV, MACT),
    FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
    FOREIGN KEY (MACT) REFERENCES CONGTRINH(MACT) )

-- Nhập liệu
-- Phòng ban
INSERT INTO PHONGBAN VALUES
('PB01', N'Phòng Kế Toán'),
('PB02', N'Phòng Kỹ Thuật'),
('PB03', N'Phòng Nhân Sự'),
('PB04', N'Phòng Dự Án'),
('PB05', N'Phòng IT'),
('PB06', N'Phòng Vật Tư'),
('PB07', N'Phòng Bảo Trì'),
('PB08', N'Phòng An Toàn'),
('PB09', N'Phòng Marketing'),
('PB10', N'Phòng Kinh Doanh')

-- Nhân viên
INSERT INTO NHANVIEN VALUES
('NV01', N'Nguyễn Văn A', '1990-01-01', N'Nam', N'Hà Nội', 'PB01'),
('NV02', N'Lê Thị B', '1992-05-10', N'Nữ', N'Đà Nẵng', 'PB02'),
('NV03', N'Trần Văn C', '1988-03-22', N'Nam', N'Hồ Chí Minh', 'PB03'),
('NV04', N'Phạm Thị D', '1995-07-18', N'Nữ', N'Cần Thơ', 'PB04'),
('NV05', N'Đỗ Văn E', '1993-11-25', N'Nam', N'Hà Nam', 'PB05'),
('NV06', N'Vũ Thị F', '1991-02-14', N'Nữ', N'Hưng Yên', 'PB06'),
('NV07', N'Ngô Văn G', '1989-06-30', N'Nam', N'Nam Định', 'PB07'),
('NV08', N'Bùi Thị H', '1994-08-20', N'Nữ', N'Ninh Bình', 'PB08'),
('NV09', N'Hoàng Văn I', '1987-12-05', N'Nam', N'Quảng Ninh', 'PB09'),
('NV10', N'Phan Thị K', '1996-03-09', N'Nữ', N'Thanh Hóa', 'PB10')

-- Công trình
INSERT INTO CONGTRINH VALUES
('CT01', N'Xây Dựng Tòa Nhà A', N'Hà Nội', '2024-01-10', '2024-02-01', '2025-01-30'),
('CT02', N'Cải Tạo Đường X', N'Đà Nẵng', '2023-11-05', '2023-12-01', '2024-12-15'),
('CT03', N'Khu Công Nghiệp Y', N'Bình Dương', '2024-03-12', '2024-04-01', '2025-05-30'),
('CT04', N'Nhà Máy Z', N'Hải Phòng', '2023-09-09', '2023-10-10', '2024-09-09'),
('CT05', N'Ký Túc Xá Sinh Viên', N'Cần Thơ', '2024-02-20', '2024-03-01', '2025-03-15'),
('CT06', N'Trung Tâm TM ABC', N'Hồ Chí Minh', '2024-05-05', '2024-06-01', '2025-06-30'),
('CT07', N'Nhà Ở Cao Tầng D', N'Hà Nội', '2023-08-08', '2023-09-01', '2024-08-30'),
('CT08', N'Cầu Vượt E', N'Hà Nam', '2023-10-10', '2023-11-01', '2024-10-20'),
('CT09', N'Trạm Xăng F', N'Bình Thuận', '2024-01-25', '2024-02-15', '2024-12-31'),
('CT10', N'Khu Du Lịch G', N'Ninh Bình', '2024-03-01', '2024-03-20', '2025-03-25')

-- Phân công

INSERT INTO PHANCONG VALUES
('NV01', 'CT02', 40),
('NV02', 'CT01', 41),
('NV03', 'CT01', 60),
('NV04', 'CT02', 25),
('NV06', 'CT05', 50),
('NV06', 'CT07', 25),
('NV08', 'CT07', 40),
('NV01', 'CT08', 55),
('NV10', 'CT09', 20),
('NV09', 'CT08', 10)

INSERT INTO PHANCONG VALUES
('NV01', 'CT01', 30),
('NV02', 'CT02', 45),
('NV03', 'CT03', 60),
('NV04', 'CT04', 25),
('NV05', 'CT05', 50),
('NV06', 'CT06', 35),
('NV07', 'CT07', 40),
('NV08', 'CT08', 55),
('NV09', 'CT09', 20),
('NV10', 'CT10', 70)

-- liệt kê tên công trình, mã công trình ngày khởi công, ngày hoàn thành, nhân viên theo dõi và số lượng ngày công của nhân viên đó.
SELECT CT.TENCT, CT.MACT, CT.NGAYKC, CT.NGAYCAPGP, NV.HOTEN, PC.SLNGAYCONG
FROM CONGTRINH CT
JOIN PHANCONG PC ON CT.MACT = PC.MACT
JOIN NHANVIEN NV ON PC.MANV = NV.MANV
ORDER BY CT.TENCT, NV.HOTEN;