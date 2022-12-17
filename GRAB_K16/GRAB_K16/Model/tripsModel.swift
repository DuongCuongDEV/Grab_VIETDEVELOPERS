import Foundation

// MARK: - Trip
struct Trip: Codable {
    let maChuyen, maNguoiDAT, maTaiXe: Int
    let maTrangThaiChuyenDi, longitudeBatDau: String
    let laitudeBatDau: String?
    let longitudeKetThuc: String
    let laitudeKetThuc: String?
    let doDaiQuangDuong: Double
    let thanhTien: Int
    let maGiamGia, thoiGianDAT, thoiGianHoanThanh, ghiChu: String
    let maNguoiDung: Int
    let hoVaTen, anhDaiDien, sdt1, sdt2: String
    let email, maGioiTinh, ngaySinh, diaChiChiTiet: String
    let maXa: String

    enum CodingKeys: String, CodingKey {
        case maChuyen = "ma_chuyen"
        case maNguoiDAT = "ma_nguoi_dat"
        case maTaiXe = "ma_tai_xe"
        case maTrangThaiChuyenDi = "ma_trang_thai_chuyen_di"
        case longitudeBatDau = "longitude_bat_dau"
        case laitudeBatDau = "laitude_bat_dau"
        case longitudeKetThuc = "longitude_ket_thuc"
        case laitudeKetThuc = "laitude_ket_thuc"
        case doDaiQuangDuong = "do_dai_quang_duong"
        case thanhTien = "thanh_tien"
        case maGiamGia = "ma_giam_gia"
        case thoiGianDAT = "thoi_gian_dat"
        case thoiGianHoanThanh = "thoi_gian_hoan_thanh"
        case ghiChu = "ghi_chu"
        case maNguoiDung = "ma_nguoi_dung"
        case hoVaTen = "ho_va_ten"
        case anhDaiDien = "anh_dai_dien"
        case sdt1, sdt2, email
        case maGioiTinh = "ma_gioi_tinh"
        case ngaySinh = "ngay_sinh"
        case diaChiChiTiet = "dia_chi_chi_tiet"
        case maXa = "ma_xa"
    }
}

typealias Trips = [Trip]
