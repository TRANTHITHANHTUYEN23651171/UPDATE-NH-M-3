
------NHÓM 3

--2.	Chuyển sang lược đồ quan hệ 
--PHONGBAN(MAPB, TENPB)
--NHANVIEN(MANV, MAPB, HOTEN, NGSINH, PHAI, DIACHI,)
--CONGTRINH(MACT, TENCT, DIADIEM, NGAYCAPGP, NGAYKC, NGAYHC)
--PHANCONG( MANV, MACT, SLNGAYCONG)

--CHÚ THÍCH: 
--GẠCH NÉT LIỀN: KHÓA CHÍNH 
--GACH NÉT ĐỨT: KHÓA NGOẠI
--3.	Cài đặt CSDL - Tạo database trên SSMS, nhập dữ liệu (tự nghĩ ra mỗi bảng ít nhất 5 dòng): 
--toàn bộ dùng lệnh SQL và nộp file database (file backup)
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

--4.	Tự cho câu hỏi và trả lời:  12 câu (2 truy vấn kết nối nhiều bảng, 2 update, 2 delete, 2 group by, 2 sub query, 2 câu bất kì) – xem ví dụ tại bài tập 1.
---	2 câu truy vấn kết nối nhiều bảng
--1.	Lấy danh sách tên công trình, địa điểm và tên của tất cả các nhân viên đã tham gia vào công trình đó, sắp xếp theo tên công trình và sau đó theo tên nhân viên.
SELECT CT.TENCT AS TenCongTrinh, CT.DIADIEM AS DiaDiemCongTrinh, NV.HOTEN AS TenNhanVien 
FROM CONGTRINH CT 
JOIN PHANCONG PC ON CT.MACT = PC.MACT 
JOIN NHANVIEN NV ON PC.MANV = NV.MANV 
ORDER BY TenCongTrinh, TenNhanVien;
--2.	Lấy danh sách tên của tất cả các phòng ban và tên của tất cả các công trình mà ít nhất một nhân viên thuộc phòng ban đó đã tham gia. Hiển thị kết quả dưới dạng các cặp "Tên phòng ban - Tên công trình" duy nhất.
SELECT DISTINCT PB.TENPB AS TenPhongBan, CT.TENCT AS TenCongTrinh 
FROM PHONGBAN PB 
JOIN NHANVIEN NV ON PB.MAPB = NV.MAPB 
JOIN PHANCONG PC ON NV.MANV = PC.MANV 
JOIN CONGTRINH CT ON PC.MACT = CT.MACT 
ORDER BY TenPhongBan, TenCongTrinh
---	2 câu DELETE
--1.	Xóa tất cả phân công của những nhân viên thuộc phòng ban ‘Phòng kỹ thuật’
    DELETE FROM PHANCONG
    WHERE MANV IN (
    SELECT nv.MANV
    FROM NHANVIEN nv
    JOIN PHONGBAN pb ON nv.MAPB = pb.MAPB
    WHERE pb.TENPB = 'Phòng kỹ thuật')
--2.	Xóa tất cả nhân viên chưa từng được phân công vào bất kỳ công trình nào
   DELETE FROM NHANVIEN
   WHERE MANV NOT IN (
   SELECT DISTINCT MANV
    FROM PHANCONG)
---	2 câu GROUP BY
--1.	 Liệt kê tên phòng ban và tổng số ngày công của tất cả nhân viên trong từng phòng.
--Giải
SELECT PB.TENPB, 
    SUM(PC.SLNGAYCONG) AS TONG_NGAY_CONG
FROM NHANVIEN NV
JOIN PHANCONG PC ON NV.MANV = PC.MANV
JOIN PHONGBAN PB ON NV.MAPB = PB.MAPB
GROUP BY PB.TENPB

--2.	 Liệt kê mã công trình, mã nhân viên và tổng số ngày công từng nhân viên làm tại từng công trình.
SELECT MACT, MANV, SUM(SLNGAYCONG) AS TONG_NGAY_CONG
FROM PHANCONG
GROUP BY MACT, MANV
ORDER BY MACT
---	2 câu SUB QUERRY:
--1)	Liệt kê mã nhân viên, họ tên những nhân viên chỉ tham gia công trình ở đúng 1 địa điểm duy nhất hoặc nếu họ tham gia nhiều công trình thì tất cả công trình đó đều cùng 1 địa điểm.
SELECT NV.MANV, NV.HOTEN
FROM NHANVIEN NV
WHERE NV.MANV IN (SELECT PC.MANV
		     FROM PHANCONG PC
	   	     JOIN CONGTRINH CT ON PC.MACT = CT.MACT
			     GROUP BY PC.MANV
		     HAVING COUNT(DISTINCT CT.DIADIEM) = 1)
--2)	Liệt kê mã công trình và tên công trình mà không có nhân viên nào thuộc "Phòng IT" tham gia.
SELECT CT.MACT, CT.TENCT
FROM CONGTRINH CT
WHERE CT.MACT not in (select distinct pc.MACT
from PHANCONG pc
join NHANVIEN nv on pc.MANV = nv.MANV
where nv.MAPB = ' PB05' )
---	2 UPDATE
--1.	Cập nhật địa điểm của công trình có mã 'CT005' thành 'Hà Nội'. 

UPDATE CONGTRINH
SET DIADIEM = 'Hà Nội'
WHERE MACT = 'CT005';
 
UPDATE NHANVIEN
SET DIACHI = DIACHI + N' (Làm nhiều công trình)'
WHERE MANV IN (
    SELECT MANV FROM PHANCONG
    GROUP BY MANV
    HAVING SUM(SLNGAYCONG) > 50
);
--2.	Viết câu lệnh SQL để cập nhật chức vụ của nhân viên thành 'Trưởng phòng' nếu tổng số ngày công của họ lớn hơn 200 và họ hiện đang giữ chức vụ 'Nhân viên'.

UPDATE NHANVIEN SET CHUCVU = 'Trưởng phòng' WHERE MANV IN ( SELECT MANV FROM PHANCONG GROUP BY MANV HAVING SUM(SLNGAYCONG) > 150 );

---	2 câu khác:
--1.	Cập nhật địa chỉ của các nhân viên có ngày sinh trước năm 1985 và đang làm ở phòng ban ‘Phòng tổ chức’ thành ‘TP.HCM’
UPDATE NHANVIEN
SET DIACHI = 'TP.HCM'
WHERE NGSINH < '1985-01-01'
  AND MAPB IN (
      SELECT MAPB
      FROM PHONGBAN
      WHERE TENPB = 'Phòng tổ chức' );

--2.	Tạo VIEW hiển thị danh sách nhân viên và phòng ban của họ.

CREATE VIEW v_NhanVienPhongBan AS
SELECT NV.HOTEN, PB.TENPB
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MAPB = PB.MAPB;

--BÀI CÁ NHÂN
---	Trần Thị Thanh Tuyền
--      Câu 1: truy vấn nhiều bảng - Tìm thông tin về tất cả nhân viên tham gia vào một công trình cụ thể.

SELECT NV.*, PB.TENPB AS TenPhongBan, PC.SLNGAYCONG, CT.TENCT AS TenCongTrinh 
FROM NHANVIEN NV 
JOIN PHANCONG PC ON NV.MANV = PC.MANV 
JOIN CONGTRINH CT ON PC.MACT = CT.MACT 
LEFT JOIN PHONGBAN PB ON NV.MAPB = PB.MAPB
WHERE CT.MACT = 'CT07';

 
--Câu 2: truy vấn UPDATE - Tăng số ngày công thêm 10% cho tất cả nhân viên đã làm việc trên công trình có mã 'CT02' hơn 20 ngày.
UPDATE PHANCONG SET SLNGAYCONG = CAST(SLNGAYCONG * 1.1 AS INTEGER) WHERE MACT = 'CT002' 
AND SLNGAYCONG > 20;

--Câu 3: Truy vấn DELETE - Xóa tất cả các công trình đã hoàn công trước ngày '2024-01-01'.
DELETE FROM CONGTRINH 
WHERE NGAYHC < '2024-01-01';

--Câu 4: Truy vấn GROUP BY - Tìm tên công trình có số lượng nhân viên tham gia khác nhau (số lượng nhân viên duy nhất) lớn hơn 3.

SELECT CT.TENCT, COUNT(DISTINCT PC.MANV) 
AS SoLuongNhanVienDuyNhat 
FROM PHANCONG PC
JOIN CONGTRINH CT ON PC.MACT = CT.MACT 
GROUP BY CT.TENCT 
HAVING COUNT(DISTINCT PC.MANV) > 3;

--Câu 5: Tìm tên nhân viên có tổng số ngày công làm việc trong tất cả các công trình lớn hơn tổng số ngày công trung bình của tất cả các nhân viên.

SELECT NV.HOTEN, SUM(PC.SLNGAYCONG) AS TongNgayCong 
FROM NHANVIEN NV 
JOIN PHANCONG PC ON NV.MANV = PC.MANV 
GROUP BY NV.HOTEN 
HAVING SUM(PC.SLNGAYCONG) > (
    SELECT AVG(TongNgayCong) 
    FROM (  SELECT SUM(SLNGAYCONG) AS TongNgayCong 
        FROM PHANCONG  
        GROUP BY MANV ) AS T  ) 

---	Lê Quang Vinh
--Câu 1: Liệt kê họ tên nhân viên, giới tính, tên phòng ban và tên công trình mà họ đã tham gia

SELECT nv.HOTEN, nv.PHAI, pb.TENPB, ct.TENCT
FROM NHANVIEN nv
JOIN PHONGBAN pb ON nv.MAPB = pb.MAPB
JOIN PHANCONG pc ON nv.MANV = pc.MANV
JOIN CONGTRINH ct ON pc.MACT = ct.MACT;
 --Câu 2: Cập nhật địa điểm của công trình có mã 'CT003' thành 'Quận 9, TP.HCM'
UPDATE CONGTRINH
SET DIADIEM = 'Quận 9, TP.HCM'
WHERE MACT = 'CT003';
  --Câu 3: Xóa tất cả thông tin phân công của nhân viên có mã 'NV015'
DELETE FROM PHANCONG
WHERE MANV = 'NV015';

--Câu 4: Đếm số lượng nhân viên đã tham gia từng công trình
SELECT ct.TENCT, COUNT(pc.MANV) AS so_nhan_vien
FROM CONGTRINH ct
JOIN PHANCONG pc ON ct.MACT = pc.MACT
GROUP BY ct.TENCT;

---	Lưu Nguyễn Cẩm Tú
--Truy vấn kết nối nhiều bảng 
--Câu hỏi 1: Liệt kê họ tên nhân viên, tên phòng ban và tổng số ngày công của từng nhân viên trên tất cả công trình.
--Trả lời:
SELECT NV.HOTEN, PB.TENPB, SUM(PC.SLNGAYCONG) AS TongNgayCong
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MAPB = PB.MAPB
JOIN PHANCONG PC ON NV.MANV = PC.MANV
GROUP BY NV.HOTEN, PB.TENPB
--Kết quả: 10 rows
--Câu hỏi 2: UPDATE
--Tăng số ngày công thêm 5 ngày cho tất cả nhân viên thuộc phòng 'Phòng Kỹ Thuật'.
--Trả lời:
UPDATE PC
SET PC.SLNGAYCONG = PC.SLNGAYCONG + 5
FROM PHANCONG PC
JOIN NHANVIEN NV ON PC.MANV = NV.MANV
WHERE NV.MAPB = 'PB02'
--Câu hỏi 3:
--Liệt kê các công trình có tổng số ngày công lớn hơn 50 và sắp xếp giảm dần theo tổng ngày công.
--Trả lời:
SELECT CT.MACT, CT.TENCT, CT.DIADIEM , SUM(PC.SLNGAYCONG) AS TongNgayCong
FROM CONGTRINH CT
JOIN PHANCONG PC ON CT.MACT = PC.MACT
GROUP BY CT.MACT, CT.TENCT, CT.DIADIEM
HAVING SUM(PC.SLNGAYCONG) > 50 
ORDER BY TongNgayCong DESC
--Kết quả: 3 rows
--Sub Query (Truy vấn lồng)
--Câu hỏi 4: Liệt kê họ tên nhân viên tham gia công trình 'Cầu Vượt E' và có số ngày công trên 30 ngày.
--Trả lời:
SELECT MANV, HOTEN, SL
FROM NHANVIEN
WHERE MANV IN (SELECT MANV
  			FROM PHANCONG
    			WHERE MACT = (SELECT MACT
       					FROM CONGTRINH
        					WHERE TENCT = N'Cầu Vượt E' 
AND SLNGAYCONG > 30))
--Kết quả: 1 row
--Câu hỏi 5: Liệt kê họ tên nhân viên và tên công trình họ tham gia, chỉ hiện những công trình có địa điểm trùng với địa chỉ của nhân viên đó.
SELECT NV.HOTEN, CT.TENCT, DIACHI, DIADIEM
FROM NHANVIEN NV
JOIN PHANCONG PC ON NV.MANV = PC.MANV
JOIN CONGTRINH CT ON PC.MACT = CT.MACT
WHERE NV.DIACHI = CT.DIADIEM
Kết quả: 2 rows

---	Diệp Thị Diệu Hiền
--Câu 1: Liệt kê công trình mà không nhân viên nào từ ‘Phòng Kỹ Thuật’ tham gia.

SELECT C.TENCT 
FROM CONGTRINH C 
WHERE C.MACT NOT IN 
( SELECT DISTINCT P.MACT 
FROM PHANCONG P JOIN NHANVIEN N ON P.MANV = N.MANV 
WHERE N.MAPB = 'PB02' )

--Câu 2: Liệt kê nhân viên làm ở công trình tại địa điểm ‘Hồ Chí Minh’.

SELECT DISTINCT N.HOTEN 
FROM NHANVIEN N 
JOIN PHANCONG P ON N.MANV = P.MANV 
JOIN CONGTRINH C ON P.MACT = C.MACT 
WHERE C.DIADIEM = N'Hồ Chí Minh'

--Câu 3: Liệt kê phòng ban có nhân viên tham gia công trình ‘Trung Tâm TM ABC’.

SELECT DISTINCT PB.TENPB 
FROM PHONGBAN PB 
JOIN NHANVIEN N ON PB.MAPB = N.MAPB 
JOIN PHANCONG P ON N.MANV = P.MANV 
JOIN CONGTRINH C ON P.MACT = C.MACT WHERE C.TENCT = N'Trung Tâm TM ABC'

--Câu 4: Tìm tên công trình có tên chứa từ ‘Cầu’ hoặc ‘Đường’.

SELECT TENCT 
FROM CONGTRINH 
WHERE TENCT LIKE N'%Cầu%' OR TENCT LIKE N'%Đường%'

--Câu 5: Tính tổng số ngày công trung bình theo phòng ban.

SELECT P.TENPB, AVG(PC.SLNGAYCONG) AS TBNgayCong 
FROM PHONGBAN P 
JOIN NHANVIEN N ON P.MAPB = N.MAPB 
JOIN PHANCONG PC ON N.MANV = PC.MANV 
GROUP BY P.TENPB

---	Hoàng Đức Gia Huy
--Câu 1: Liệt kê tên công trình, tên phòng ban phụ trách và tổng số ngày công của tất cả nhân viên trong công trình đó.

SELECT CT.TENCT, PB.TENPB, SUM(PC.SLNGAYCONG) AS TongNgayCong
FROM CONGTRINH AS CT
JOIN PHANCONG AS PC ON CT.MACT = PC.MACT
JOIN NHANVIEN AS NV ON PC.MANV = NV.MANV
JOIN PHONGBAN AS PB ON NV.MAPB = PB.MAPB
GROUP BY CT.TENCT, PB.TENPB;
 
----Câu 2: Liệt kê mã nhân viên, họ tên và tên phòng ban của họ.

SELECT NV.MANV, NV.HOTEN, PB.TENPB
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MAPB = PB.MAPB;
--Truy vấn DELETE 
--Câu 3: Xóa công trình có mã 'CT007'. 

DELETE FROM CONGTRINH
WHERE MACT = 'CT007';
 
--Câu 4: Tính tổng số ngày công của từng phòng ban.

SELECT PB.TENPB, SUM(PC.SLNGAYCONG) AS TongNgayCong
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MAPB = PB.MAPB
JOIN PHANCONG PC ON NV.MANV = PC.MANV
GROUP BY PB.TENPB;


--BÀI TẬP THẦY CHO
-- liệt kê tên công trình, mã công trình ngày khởi công, ngày hoàn thành, 
--nhân viên theo dõi và số lượng ngày công của nhân viên đó.
SELECT CT.TENCT, CT.MACT, CT.NGAYKC, CT.NGAYCAPGP, NV.HOTEN, PC.SLNGAYCONG
FROM CONGTRINH CT
JOIN PHANCONG PC ON CT.MACT = PC.MACT
JOIN NHANVIEN NV ON PC.MANV = NV.MANV
ORDER BY CT.TENCT, NV.HOTEN;