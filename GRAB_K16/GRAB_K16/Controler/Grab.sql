create database Grab; 
use Grab;


CREATE TABLE `gioi_tinh` (
  `ma_gioi_tinh` varchar(255) NOT NULL,
  `ten_gioi_tinh` varchar(255) DEFAULT NULL
);

--
-- Đang đổ dữ liệu cho bảng `gioi_tinh`
--
select * from `gioi_tinh`;

CREATE TABLE `quyen_doi_tuong` (
  `ma_quyen` varchar(255) NOT NULL,
  `ten_quyen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

select * from quyen_doi_tuong;
--
-- Đang đổ dữ liệu cho bảng `quyen_doi_tuong`
--



CREATE TABLE `hang_xe` (
  `ma_hang_xe` varchar(255) NOT NULL,
  `ten_hang_xe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hang_xe`
--


select * from `hang_xe`;

CREATE TABLE `tinh` (
  `ma_tinh` varchar(255) NOT NULL,
  `ten_tinh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tinh`
--




CREATE TABLE `huyen` (
  `ma_huyen` varchar(255) NOT NULL,
  `ten_huyen` varchar(255) DEFAULT NULL,
  `ma_tinh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `huyen`
--




Select `ma_huyen` from `huyen`;
SELECT * FROM `huyen`;


CREATE TABLE `xa` (
  `ma_xa` varchar(255) NOT NULL,
  `ten_xa` varchar(255) DEFAULT NULL,
  `ma_huyen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



select * from xa;

CREATE TABLE `phuong_thuc_thanh_toan` (
  `ma_phuong_thuc_thanh_toan` varchar(255) PRIMARY KEY,
  `ten_phuong_thuc_thanh_toan` varchar(255)
);



CREATE TABLE `trang_thai` (
  `ma_trang_thai` varchar(255) NOT NULL,
  `ten_trang_thai` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `trang_thai`
--



CREATE TABLE `loai_phuong_tien` (
  `ma_loai_phuong_tien` varchar(255) NOT NULL,
  `ten_loai_phuong_tien` varchar(255) DEFAULT NULL,
  `he_so_gia` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loai_phuong_tien`
--



-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_xe`
--

CREATE TABLE `loai_xe` (
  `ma_loai_xe` varchar(255) NOT NULL,
  `ten_loai_xe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loai_xe`
--


CREATE TABLE `phuong_tien_nguoi_dung`(
    `bien_so_xe` varchar(225) primary key NOT NULL,
	`ma_nguoi_dung` int(11) DEFAULT NULL,
    `ma_phuong_tien` varchar(225) DEFAULT NULL,
    `ma_loai_xe` varchar(225) DEFAULT NULL,
    `ma_hang_xe` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE `thong_tin_nguoi_dung` (
  `ma_nguoi_dung` int(11) primary key NOT NULL AUTO_INCREMENT,
  `ho_va_ten` varchar(255) DEFAULT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  `sdt1` varchar(255) DEFAULT NULL,
  `sdt2` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ma_gioi_tinh` varchar(255) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `dia_chi_chi_tiet` varchar(255) DEFAULT NULL,
  `ma_xa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_tin_tai_Khoan`
--


CREATE TABLE `uu_dai` (
  `ma_uu_dai` varchar(11) NOT NULL,
  `ten_uu_dai` varchar(255) NOT NULL,
  `so_tien_giam` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE tai_khoan_ngan_hang_lien_ket (
	`so_tai_khoan` int primary key not null,
    `username_lien_ket` varchar(255),
    `ma_ngan_hang` varchar(255),
    `ten_chu_tai_khoan` varchar(255),
    `so_du` int
    );
    
CREATE TABLE ngan_hang (
	`ma_ngan_hang` varchar(255) primary key not null,
    `ten_ngan_hang` varchar(255) );




CREATE TABLE `thong_tin_tai_Khoan` (
  `maNguoiDung` int(11) DEFAULT NULL,
  `maQuyenNguoiDung` varchar(11) DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `ngayCapNhatCuoi` datetime DEFAULT NULL,
  `bienSoXe` varchar(255) DEFAULT NULL,
  `ma_trang_thai` varchar(255) DEFAULT NULL,
  `maNguoiTao` int(11) DEFAULT NULL,
  `tenDangNhap` varchar(255) NOT NULL,
  `matKhau` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE `Thong_tin_chuyen_xe` (
  `ma_chuyen` int(11) NOT NULL primary key AUTO_INCREMENT,
  `ma_nguoi_dat` int(11) DEFAULT NULL,
  `ma_tai_xe` int(11) DEFAULT NULL,
  `ma_trang_thai_chuyen_di` varchar(255) DEFAULT NULL,
  `longitude_bat_dau` varchar(255) DEFAULT NULL,
  `laitude_bat_dau` varchar(255) DEFAULT NULL,
  `longitude_ket_thuc` varchar(255) DEFAULT NULL,
  `laitude_ket_thuc` varchar(255) DEFAULT NULL,
  `do_dai_quang_duong` float  DEFAULT NULL,
  `thanh_tien` float DEFAULT NULL,
  `ma_giam_gia` varchar(40) DEFAULT NULL,
  `thoi_gian_dat` datetime DEFAULT NULL,
  `thoi_gian_hoan_thanh` datetime DEFAULT NULL,
  `ghi_chu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




-- bài2
select thong_tin_nguoi_dung.ho_va_ten, thong_tin_nguoi_dung.sdt1, thong_tin_nguoi_dung.ngay_sinh, thong_tin_nguoi_dung.dia_chi_chi_tiet, quyen_doi_tuong.ten_quyen from thong_tin_nguoi_dung 
inner join thong_tin_tai_khoan on thong_tin_nguoi_dung.ma_nguoi_dung = thong_tin_tai_khoan.maNguoiDung
inner join quyen_doi_tuong on quyen_doi_tuong.ma_quyen = thong_tin_tai_khoan.maQuyenNguoiDung where quyen_doi_tuong.ten_quyen = 'Tài xế';
-- bài4-- 
select avg(thanh_tien) from thong_tin_chuyen_xe;

-- Bài 3: Tìm ra 5 tài xế có ít chuyến nhất trong ngày

SELECT ho_va_ten, count(ma_chuyen) as so_chuyen
FROM thong_tin_chuyen_xe  inner Join thong_tin_nguoi_dung on thong_tin_chuyen_xe.ma_tai_xe = thong_tin_nguoi_dung.ma_nguoi_dung
WHERE date(thoi_gian_hoan_thanh) = CURDATE()
GROUP BY ma_tai_xe
ORDER BY COUNT(ma_chuyen) asc
LIMIT 5;


select ho_va_ten,anh_dai_dien,sdt1,sdt2,email,ten_gioi_tinh,ngay_sinh,dia_chi_chi_tiet,ten_xa,ten_huyen,ten_tinh,ten_quyen,ngayTao,ngayCapNhatCuoi,bienSoXe,ten_trang_thai,tenDangNhap,matKhau  from 
(((((thong_tin_tai_Khoan inner join thong_tin_nguoi_dung on thong_tin_tai_Khoan.maNguoiDung = thong_tin_nguoi_dung.ma_nguoi_dung) 
inner join (( xa inner join huyen on xa.ma_huyen = huyen.ma_huyen) 
inner join tinh on huyen.ma_tinh = tinh.ma_tinh))
inner join gioi_tinh on thong_tin_nguoi_dung.ma_gioi_tinh = gioi_tinh.ma_gioi_tinh)
inner join quyen_doi_tuong on thong_tin_tai_Khoan.maQuyenNguoiDung = quyen_doi_tuong.ma_quyen)
inner join trang_thai on thong_tin_tai_Khoan.ma_trang_thai = trang_thai.ma_trang_thai)
where ten_trang_thai = 'Offline' and (curdate() - date(ngayCapNhatCuoi)) >= 30;





-- bai1
select tinh.ten_tinh, count(tinh.ten_tinh) as so_luong_xa from xa inner join huyen 
on xa.ma_huyen = huyen.ma_huyen
inner join tinh on tinh.ma_tinh = huyen.ma_tinh group by tinh.ten_tinh order by so_luong_xa desc limit 3; 



select ma_nguoi_dung from thong_tin_nguoi_dung order by ma_nguoi_dung desc limit 1;











--
-- Đang đổ dữ liệu cho bảng `uu_dai`
--



--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `uu_dai`
--
ALTER TABLE `uu_dai`
  ADD PRIMARY KEY (`ma_uu_dai`);





ALTER TABLE `gioi_tinh`
  ADD PRIMARY KEY (`ma_gioi_tinh`);

--
-- Chỉ mục cho bảng `hang_xe`
--
ALTER TABLE `hang_xe`
  ADD PRIMARY KEY (`ma_hang_xe`);

--
-- Chỉ mục cho bảng `huyen`
--
ALTER TABLE `huyen`
  ADD PRIMARY KEY (`ma_huyen`),
  ADD KEY `ma_tinh` (`ma_tinh`);

--
-- Chỉ mục cho bảng `loai_phuong_tien`
--
ALTER TABLE `loai_phuong_tien`
  ADD PRIMARY KEY (`ma_loai_phuong_tien`);

--
-- Chỉ mục cho bảng `loai_xe`
--
ALTER TABLE `loai_xe`
  ADD PRIMARY KEY (`ma_loai_xe`);

--
-- Chỉ mục cho bảng `phuong_tien_nguoi_dung`
--


--
-- Chỉ mục cho bảng `quyen_doi_tuong`
--
ALTER TABLE `quyen_doi_tuong`
  ADD PRIMARY KEY (`ma_quyen`);

--
-- Chỉ mục cho bảng `Thong_tin_chuyen_xe`
--
ALTER TABLE `Thong_tin_chuyen_xe`
  ADD KEY `ma_nguoi_dat` (`ma_nguoi_dat`),
  ADD KEY `ma_tai_xe` (`ma_tai_xe`),
  ADD KEY `ma_trang_thai_chuyen_di` (`ma_trang_thai_chuyen_di`);

--
-- Chỉ mục cho bảng `thong_tin_nguoi_dung`
--
ALTER TABLE `thong_tin_nguoi_dung`
 
  ADD KEY `ma_xa` (`ma_xa`),
  ADD KEY `ma_gioi_tinh` (`ma_gioi_tinh`);

--
-- Chỉ mục cho bảng `thong_tin_tai_Khoan`
--
ALTER TABLE `thong_tin_tai_Khoan`
  ADD PRIMARY KEY (`tenDangNhap`);

--
-- Chỉ mục cho bảng `tinh`
--
ALTER TABLE `tinh`
  ADD PRIMARY KEY (`ma_tinh`);

--
-- Chỉ mục cho bảng `trang_thai`
--
ALTER TABLE `trang_thai`
  ADD PRIMARY KEY (`ma_trang_thai`);

--
-- Chỉ mục cho bảng `xa`
--
ALTER TABLE `xa`
  ADD PRIMARY KEY (`ma_xa`),
  ADD KEY `ma_huyen` (`ma_huyen`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `Thong_tin_chuyen_xe`
--
ALTER TABLE `Thong_tin_chuyen_xe`
  MODIFY `ma_chuyen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thong_tin_nguoi_dung`
--
ALTER TABLE `thong_tin_nguoi_dung`
  MODIFY `ma_nguoi_dung` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `huyen`
--
ALTER TABLE `huyen`
  ADD CONSTRAINT `huyen_ibfk_1` FOREIGN KEY (`ma_tinh`) REFERENCES `tinh` (`ma_tinh`);

--
-- Các ràng buộc cho bảng `phuong_tien_nguoi_dung`
--
ALTER TABLE `phuong_tien_nguoi_dung`


  ADD CONSTRAINT `phuong_tien_nguoi_dung_ibfk_1` FOREIGN KEY (`ma_phuong_tien`) REFERENCES `loai_phuong_tien` (`ma_loai_phuong_tien`),
  ADD CONSTRAINT `phuong_tien_nguoi_dung_ibfk_2` FOREIGN KEY (`ma_loai_xe`) REFERENCES `loai_xe` (`ma_loai_xe`),
  ADD CONSTRAINT `phuong_tien_nguoi_dung_ibfk_3` FOREIGN KEY (`ma_hang_xe`) REFERENCES `hang_xe` (`ma_hang_xe`),
  ADD CONSTRAINT `phuong_tien_nguoi_dung_ibfk_4` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `thong_tin_nguoi_dung` (`ma_nguoi_dung`);

--
-- Các ràng buộc cho bảng `Thong_tin_chuyen_xe`
--
ALTER TABLE `Thong_tin_chuyen_xe`
  ADD CONSTRAINT `thong_tin_chuyen_xe_ibfk_1` FOREIGN KEY (`ma_nguoi_dat`) REFERENCES `thong_tin_nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `thong_tin_chuyen_xe_ibfk_2` FOREIGN KEY (`ma_tai_xe`) REFERENCES `thong_tin_nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `thong_tin_chuyen_xe_ibfk_3` FOREIGN KEY (`ma_trang_thai_chuyen_di`) REFERENCES `trang_thai` (`ma_trang_thai`);

--
-- Các ràng buộc cho bảng `thong_tin_nguoi_dung`
--
ALTER TABLE `thong_tin_nguoi_dung`
  ADD CONSTRAINT `thong_tin_nguoi_dung_ibfk_1` FOREIGN KEY (`ma_xa`) REFERENCES `xa` (`ma_xa`),
  ADD CONSTRAINT `thong_tin_nguoi_dung_ibfk_2` FOREIGN KEY (`ma_gioi_tinh`) REFERENCES `gioi_tinh` (`ma_gioi_tinh`);

--
-- Các ràng buộc cho bảng `xa`
--
ALTER TABLE `xa`
  ADD CONSTRAINT `xa_ibfk_1` FOREIGN KEY (`ma_huyen`) REFERENCES `huyen` (`ma_huyen`);
COMMIT;

ALTER TABLE `Grab`.`thong_tin_tai_Khoan` ADD FOREIGN KEY (`maNguoiDung`) REFERENCES `Grab`.`thong_tin_nguoi_dung` (`ma_nguoi_dung`);
ALTER TABLE `Grab`.`thong_tin_tai_Khoan` ADD FOREIGN KEY (`maQuyenNguoiDung`) REFERENCES `Grab`.`quyen_doi_tuong` (`ma_quyen`);
ALTER TABLE `Grab`.`thong_tin_tai_Khoan` ADD FOREIGN KEY (`ma_trang_thai`) REFERENCES `Grab`.`trang_thai` (`ma_trang_thai`);
ALTER TABLE `Grab`.`thong_tin_tai_Khoan` ADD FOREIGN KEY (`maNguoiTao`) REFERENCES `Grab`.`thong_tin_nguoi_dung` (`ma_nguoi_dung`);

ALTER TABLE `Grab`.`phuong_tien_nguoi_dung` ADD FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `Grab`.`thong_tin_nguoi_dung` (`ma_nguoi_dung`);
ALTER TABLE `Grab`.`phuong_tien_nguoi_dung` ADD FOREIGN KEY (`ma_phuong_tien`) REFERENCES `Grab`.`loai_phuong_tien` (`ma_loai_phuong_tien`);
ALTER TABLE `Grab`.`phuong_tien_nguoi_dung` ADD FOREIGN KEY (`ma_loai_xe`) REFERENCES `Grab`.`loai_xe` (`ma_loai_xe`);
ALTER TABLE `Grab`.`phuong_tien_nguoi_dung` ADD FOREIGN KEY (`ma_hang_xe`) REFERENCES `Grab`.`hang_xe` (`ma_hang_xe`);


ALTER TABLE `thong_tin_chuyen_xe` ADD FOREIGN KEY (`ma_giam_gia`) REFERENCES `uu_dai` (`ma_uu_dai`);



INSERT INTO `gioi_tinh` (`ma_gioi_tinh`, `ten_gioi_tinh`) VALUES
('G1', 'Nam'),
('G2', 'Nữ'),
('G3', 'LGBT'),
('G4', 'Chưa xác định');
select * from `gioi_tinh`;

INSERT INTO `quyen_doi_tuong` (`ma_quyen`, `ten_quyen`) VALUES
('Q1', 'Tài xế'),
('Q2', 'Khách hàng'),
('Q3', 'Admin');

INSERT INTO `hang_xe` (`ma_hang_xe`, `ten_hang_xe`) VALUES
('B1', 'Honda'),
('B2', 'Suzuki'),
('B3', 'Yamaha');

INSERT INTO `hang_xe` (`ma_hang_xe`, `ten_hang_xe`) VALUES
('B4', 'Mazda'),
('B5', 'Toyota'),
('B6', 'KIA'),
('B7', 'Hyundai');

INSERT INTO `tinh` (`ma_tinh`, `ten_tinh`) VALUES
('T1', 'Thanh Hoá'),
('T2', 'Hà Nội'),
('T3', 'Đà Nẵng'),
('T4', 'Cần Thơ'),
('T5', 'Hải Phòng');
INSERT INTO `tinh` (`ma_tinh`, `ten_tinh`) VALUES 
('T6', 'Bắc Giang');

INSERT INTO `huyen` (`ma_huyen`, `ten_huyen`, `ma_tinh`) VALUES
('H1', 'Cầu Giấy', 'T2'),
('H2', 'Sầm Sơn', 'T1'),
('H3', 'Liên Chiểu', 'T3'),
('H4', 'Ninh Kiều', 'T4'),
('H5', 'Ngô Quyền', 'T5');

INSERT INTO `huyen` (`ma_huyen`, `ten_huyen`, `ma_tinh`) VALUES 
('H6', 'Việt yên', 'T6'),
('H7', 'Hiệp hoà', 'T6'),
('H8', 'Tân yên', 'T6'),
('H9', 'Lục ngạn', 'T6');

INSERT INTO `huyen` (`ma_huyen`, `ten_huyen`, `ma_tinh`) VALUES 
('H10', 'Quảng Xương', 'T1'),
('H11', 'Bỉm Sơn', 'T1'),
('H12', 'Hoàng Hoá', 'T1'),
('H13', 'Hậu lộc', 'T1');
INSERT INTO `huyen` (`ma_huyen`, `ten_huyen`, `ma_tinh`) VALUES 
('H14', 'Ba Đình', 'T2'),
('H15', 'Hà Đông', 'T2'),
('H16', 'Hoàn Kiếm', 'T2'),
('H17', 'Long Biên', 'T2');

INSERT INTO `xa` (`ma_xa`, `ten_xa`, `ma_huyen`) VALUES
('X1', 'Dịch Vọng', 'H1'),
('X2', 'Quảng Châu', 'H2'),
('X3', 'Hoà Minh', 'H3'),
('X4', 'An Khánh', 'H4'),
('X5', 'Máy Chai', 'H5');

INSERT INTO `xa` (`ma_xa`, `ten_xa`, `ma_huyen`) VALUES
('X6', 'Việt Tiến', 'H6'),
('X7', 'Tự Lạn', 'H6'),
('X8', 'Thượng Lan', 'H6'),
('X9', 'Ninh Sơn', 'H6'),
('X10', 'Hương mai', 'H6');


INSERT INTO `xa` (`ma_xa`, `ten_xa`, `ma_huyen`) VALUES
('X11', 'Quảng Tâm', 'H10'),
('X12', 'Quảng Minh', 'H10'),
('X13', 'Quảng Thái', 'H10'),
('X14', 'Quảng Hùng', 'H10');

INSERT INTO `xa` (`ma_xa`, `ten_xa`, `ma_huyen`) VALUES
('X15', 'Dịch Vọng Hậu', 'H1'),
('X16', 'Yên Hoà', 'H1'),
('X17', 'Nghĩa Đô', 'H1'),
('X18', 'Mai Dịch', 'H1');

INSERT INTO `phuong_thuc_thanh_toan` (`ma_phuong_thuc_thanh_toan`, `ten_phuong_thuc_thanh_toan`) VALUES
('MPT1', 'Chuyển khoản'),
('MPT2', 'Tiền mặt');

INSERT INTO `trang_thai` (`ma_trang_thai`, `ten_trang_thai`) VALUES
('C1', 'Online'),
('C2', 'Offline'),
('C3', 'Tạm khoá'),
('C4', 'Khoá'),
('C5', 'Đang thực hiện'),
('C6', 'Đã huỷ'),
('C7', 'Đã hoàn thành');

INSERT INTO `loai_xe` (`ma_loai_xe`, `ten_loai_xe`) VALUES
('A1', 'Sh-mode'),
('A2', 'Wave alpha'),
('A3', 'Exciter');
INSERT INTO `loai_xe` (`ma_loai_xe`, `ten_loai_xe`) VALUES
('A4', 'Air Blade'),
('A5', 'Future'),
('A6', 'KIA K3'),
('A7', 'Hyundai Grand i10'),
('A8', 'Toyota Vios');

INSERT INTO `loai_phuong_tien` (`ma_loai_phuong_tien`, `ten_loai_phuong_tien`) VALUES
('PT1', 'Xe máy'),
('PT2', 'Ô tô 4 chỗ'),
('PT3', 'Ô tô 7 chỗ');
select * from `loai_phuong_tien`;

INSERT INTO `uu_dai` (`ma_uu_dai`, `ten_uu_dai`, `so_tien_giam`) VALUES
('MGG1', 'Uu dai voucher 5000', 5000),
('MGG2', 'Uu dai voucher 10000', 10000),
('MGG3', 'Uu dai voucher 15000', 15000);

INSERT INTO `ngan_hang`(`ma_ngan_hang`, `ten_ngan_hang`) VALUES ('BFTVVNVX','Vietcombank'),
('VTCBVNVX','Techcombank'), 
('ICBVVNVX','Vietinbank'),
('BIDVVNVX','BIDV'),
('SGTTVNVX','Sacombank'), 
('VBAAVNVX','Agribank');

INSERT INTO `tai_khoan_ngan_hang_lien_ket`(`so_tai_khoan`, `username_lien_ket`, `ma_ngan_hang`, `ten_chu_tai_khoan`, `so_du`) 
VALUES (0823059750,6,'VTCBVNVX','DUONG VAN CUONG',5000000),
(0969691630,1,'ICBVVNVX','TRAN THI THU PHUONG',1000), 
(0976198642, 2, 'VBAAVNVX', 'PHAM THI THI YEN', 2000), 
(0364339520, 4, 'BIDVVNVX', 'CHU HUU KHANH', 20000000),
(0338739837, 8, 'BFTVVNVX', 'GIAP VAN THANH DAT', 10000000);

-- Chạy dòng đầu để có mã sau mới tự tăng
INSERT INTO `thong_tin_nguoi_dung` (`ma_nguoi_dung`, `ho_va_ten`, `anh_dai_dien`, `sdt1`, `sdt2`, `email`, `ma_gioi_tinh`, `ngay_sinh`, `dia_chi_chi_tiet`, `ma_xa`) VALUES
(1, 'Trần Thị Thu Phương', 'anh1.png', '0969691630','', 'phuong@gmail.com','G2', '2003-08-09', 'Ngách 66/18', 'X1');
INSERT INTO `thong_tin_nguoi_dung` (`ho_va_ten`, `anh_dai_dien`, `sdt1`, `sdt2`, `email`, `ma_gioi_tinh`, `ngay_sinh`, `dia_chi_chi_tiet`, `ma_xa`) VALUES
('Phạm Thị Yến', 'anh2.png', '0976198642','09827487632', 'yen@gmail.com','G2', '2003-12-08', 'Thôn 3, Ấp Hạnh', 'X6');
INSERT INTO `thong_tin_nguoi_dung` (`ho_va_ten`, `anh_dai_dien`, `sdt1`, `sdt2`, `email`, `ma_gioi_tinh`, `ngay_sinh`, `dia_chi_chi_tiet`, `ma_xa`) VALUES
('Trần Nam Anh', 'anh3.png', '0356769119', '', 'anh@gmail.com','G1', '1983-09-19', 'Khu phố An Chính', 'X2'),
('Chu Hữu Khánh', 'anh4.png', '0364339520', '098374668',  'khanh@gmail.com','G1', '1992-04-18', '191 Cầu Giấy', 'X15'),
('Trần Thị Bảo Nhi', 'anh5.png', '0337671892','', 'nhi@gmail.com','G2', '2000-07-12', 'số 288, Nguyễn Văn Linh', 'X4'),
('Dương Văn Cường', 'anh6.png', '0383656983', '','cuong@gmail.com','G1', '1994-08-25', '271 Lê Thánh Tông', 'X5'),
('Nguyễn Thế Châu', 'anh7.png', '0939481739', '0377981265',  'chau@gmail.com','G1', '1975-03-10', '237 Tống Duy Tân', 'X11'),
('Giáp Văn Thành Đạt', 'anh8.png','0338739837' ,'', 'dat@gmail.com','G1', '1993-10-20', '06 Đào Duy Từ', 'X14'),
('Hoàng Văn Huy', 'anh9.png', '0337465957', '','huy@gmail.com','G3', '1987-11-15', 'Số 137 Nguyễn Thị Thập', 'X3'),
('Vũ Anh Tú', 'anh10.png', '0935294728','', 'tu@gmail.com', 'G1','1998-05-09', '65 Hồ Tùng Mậu', 'X17');

INSERT INTO `thong_tin_tai_Khoan` (`maNguoiDung`, `maQuyenNguoiDung`, `ngayTao`, `ngayCapNhatCuoi`, `bienSoXe`, `ma_trang_thai`, `maNguoiTao`, `tenDangNhap`, `matKhau`) VALUES
(1, 'Q1', '2020-03-10 17:00', '2022-11-10 16:43', '36-B5 18972', 'C3', 1, 'phuong@gmail.com', 'phuong0908@');
INSERT INTO `thong_tin_tai_Khoan` (`maNguoiDung`, `maQuyenNguoiDung`, `ngayTao`, `ngayCapNhatCuoi`, `bienSoXe`, `ma_trang_thai`, `maNguoiTao`, `tenDangNhap`, `matKhau`) VALUES
(2, 'Q2', '2018-10-21 13:21', '2022-11-28 10:08', '30-B5 25357', 'C1', null, 'yen@gmail.com', 'tienlien12*');
INSERT INTO `thong_tin_tai_Khoan` (`maNguoiDung`, `maQuyenNguoiDung`, `ngayTao`, `ngayCapNhatCuoi`, `bienSoXe`, `ma_trang_thai`, `maNguoiTao`, `tenDangNhap`, `matKhau`) VALUES
(3, 'Q1', '2021-08-12 09:20', '2021-09-03 09:17', '30-H2 38821', 'C1', 2, 'anh@gmail.com', '7362617abc'),
(4, 'Q2', '2022-09-23 10:00', '2022-12-10 15:22', '17-C2 26539', 'C2', null, 'khanh@gmail.com', 'dangnhap&&');
INSERT INTO `thong_tin_tai_Khoan` (`maNguoiDung`, `maQuyenNguoiDung`, `ngayTao`, `ngayCapNhatCuoi`, `bienSoXe`, `ma_trang_thai`, `maNguoiTao`, `tenDangNhap`, `matKhau`) VALUES
(5, 'Q1', '2017-01-14 11:10', '2020-06-05 17:01', '26-G5 28747', 'C4', 6, 'nhi@gmail.com', 'baonhihehe'),
(6, 'Q1', '2019-12-22 14:22', '2022-02-17 13:55', '99-A5 98328', 'C1', 3, 'cuong@gmail.com', 'vietnam1$'),
(7, 'Q2', '2020-11-09 18:37', '2021-01-21 14:19', '35-G2 21764', 'C2', null, 'chau@gmail.com', 'Thaihoang456K');
INSERT INTO `thong_tin_tai_Khoan` (`maNguoiDung`, `maQuyenNguoiDung`, `ngayTao`, `ngayCapNhatCuoi`, `bienSoXe`, `ma_trang_thai`, `maNguoiTao`, `tenDangNhap`, `matKhau`) VALUES
(8, 'Q3', '2021-05-03 16:44', '2022-07-23 15:43', '98-D3 27642', 'C1', null, 'dat@gmail.com', 'qưertyuiop0'),
(9, 'Q3', '2020-06-18 08:37', '2022-08-26 12:31', '29-T2 28732', 'C4', null, 'huy@gmail.com', '0987654321aa'),
(10, 'Q1','2022-02-15 15:25', '2022-10-19 18:15', '29-C1 37279', 'C1', 2, 'tu@gmail.com', '2299774400##');


INSERT INTO `Thong_tin_chuyen_xe` (`ma_chuyen`,`ma_nguoi_dat`, `ma_tai_xe`, `ma_trang_thai_chuyen_di`, `longitude_bat_dau`, `laitude_bat_dau`, `longitude_ket_thuc`, `laitude_ket_thuc`, `do_dai_quang_duong`, `thanh_tien`, `ma_giam_gia`, `thoi_gian_dat`, `thoi_gian_hoan_thanh`, `ghi_chu`) VALUES
(1, 4, 4, 'C7', '21.032152051121923', '105.7852715682563', '20.980248458623816', '1105.84150751424521', 10.8, 100000, 'MGG1', '2021-09-08 14:25', '2021-09-08 15:05', 'Tài xế thân thiện');
INSERT INTO `Thong_tin_chuyen_xe` (`ma_nguoi_dat`, `ma_tai_xe`, `ma_trang_thai_chuyen_di`, `longitude_bat_dau`, `laitude_bat_dau`, `longitude_ket_thuc`, `laitude_ket_thuc`, `do_dai_quang_duong`, `thanh_tien`, `ma_giam_gia`, `thoi_gian_dat`, `thoi_gian_hoan_thanh`, `ghi_chu`) VALUES
(5, 5, 'C7', '21.0340875589208', '105.84920864799668', '21.031908709541167', '105.81227755711257', 4.5, 45000, 'MGG2', '2022-12-1 10:21', '2022-12-1 10:45', 'Tài xế vui vẻ');
INSERT INTO `Thong_tin_chuyen_xe` (`ma_nguoi_dat`, `ma_tai_xe`, `ma_trang_thai_chuyen_di`, `longitude_bat_dau`, `laitude_bat_dau`, `longitude_ket_thuc`, `laitude_ket_thuc`, `do_dai_quang_duong`, `thanh_tien`, `ma_giam_gia`, `thoi_gian_dat`, `thoi_gian_hoan_thanh`, `ghi_chu`) VALUES
(2, 1, 'C7', '21.052170818630927', '105.79013987400299', '21.038244263725172', '105.78613154831507', 2, 20000, 'MGG2', '2022-09-12 12:31', '2022-09-15 12:45', 'Tài xế đi nhanh quá'),
(5, 1, 'C7', '21.052170818630927', '105.79013987400299', '21.038244263725172', '105.78613154831507', 2, 23000, 'MGG1', '2022-09-12 12:31', '2022-09-16 12:45', 'Tài xế tốt');
INSERT INTO `Thong_tin_chuyen_xe` (`ma_nguoi_dat`, `ma_tai_xe`, `ma_trang_thai_chuyen_di`, `longitude_bat_dau`, `laitude_bat_dau`, `longitude_ket_thuc`, `laitude_ket_thuc`, `do_dai_quang_duong`, `thanh_tien`, `ma_giam_gia`, `thoi_gian_dat`, `thoi_gian_hoan_thanh`, `ghi_chu`) VALUES
(2, 1, 'C7', '21.052170818630927', '105.79013987400299', '21.038244263725172', '105.78613154831507', 2, 20000, 'MGG1', '2022-09-12 12:31', '2022-12-02 12:45', 'Tài xế vượt ẩu'),
(5, 1, 'C7', '21.052170818630927', '105.79013987400299', '21.038244263725172', '105.78613154831507', 2, 23000, 'MGG2', '2022-09-12 12:31', '2022-12-02 12:45', 'Tài xế tốt');

INSERT INTO `Thong_tin_chuyen_xe` (`ma_nguoi_dat`, `ma_tai_xe`, `ma_trang_thai_chuyen_di`, `longitude_bat_dau`, `laitude_bat_dau`, `longitude_ket_thuc`, `laitude_ket_thuc`, `do_dai_quang_duong`, `thanh_tien`, `ma_giam_gia`, `thoi_gian_dat`, `thoi_gian_hoan_thanh`, `ghi_chu`) VALUES
(2, 5, 'C7', '21.052170818630927', '105.79013987400299', '21.038244263725172', '105.78613154831507', 2, 20000, 'MGG2', '2022-09-12 11:31', '2022-12-02 11:55', 'Tài xế tốt');
INSERT INTO `Thong_tin_chuyen_xe` (`ma_nguoi_dat`, `ma_tai_xe`, `ma_trang_thai_chuyen_di`, `longitude_bat_dau`, `laitude_bat_dau`, `longitude_ket_thuc`, `laitude_ket_thuc`, `do_dai_quang_duong`, `thanh_tien`, `ma_giam_gia`, `thoi_gian_dat`, `thoi_gian_hoan_thanh`, `ghi_chu`) VALUES
(2, 10, 'C7', '21.052170818630927', '105.79013987400299', '21.038244263725172', '105.78613154831507', 2, 23000, 'MGG1', '2022-09-12 11:31', '2022-12-02 11:55', 'Tài xế đến lâu');

select * from loai_phuong_tien;



INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('30-H2 38821','1','PT1','A1','B1');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('35-G2 21764','2','PT2','A6','B6');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('99-A5 98328','3','PT1','A2','B1');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('98-D3 27642','4','PT1','A3','B3');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('29-T2 28732','5','PT1','A5','B3');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('17-C2 26539','6','PT2','A8','B4');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('26-G5 28747','7','PT1','A4','B2');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('36-B5 18972','8','PT2','A7','B7');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('29-C1 37279','9','PT1','A3','B3');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('30-B5 25357','10','PT1','A5','B5');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('26-G5 28347','7','PT1','A6','B6');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('36-B5 18072','8','PT2','A7','B7');
INSERT INTO `phuong_tien_nguoi_dung`(`bien_so_xe`, `ma_nguoi_dung`, `ma_phuong_tien`, `ma_loai_xe`, `ma_hang_xe`)
VALUES ('29-C1 37271','9','PT1','A5','B5'); 