//
//  Sign_UpModel.swift
//  GRAB_K16
//
//  Created by yenyen on 24/12/2022.
//


import Foundation


struct Tinh: Decodable{
    let maTinh: String
    let tenTinh: String
    
    enum CodingKeys: String, CodingKey{
        case maTinh = "ma_tinh"
        case tenTinh = "ten_tinh"
    }
}
typealias Tinhs = [Tinh]


struct Huyen: Decodable{
    let maHuyen: String
    let tenHuyen: String
    
    enum CodingKeys: String, CodingKey{
        case maHuyen = "ma_huyen"
        case tenHuyen = "ten_huyen"
    }
}
typealias Huyens = [Huyen]


struct Xa: Decodable{
    let maXa: String
    let tenXa: String
    
    enum CodingKeys: String, CodingKey{
        case maXa = "ma_xa"
        case tenXa = "ten_xa"
    }
}
typealias Xas = [Xa]

struct TaiKhoan: Codable{
    let maNguoiDung: Int
    let maQuyenNguoiDung: String
    let ngayTao: Date
    let ngayCapNhatCuoi: Date
    let bienSoXe: String
    let maTrangThai: String
    let maNguoiTao: Int
    let tenDangNhap: String
    let matKhau: String
    
    
    enum CodingKeys: String, CodingKey{
        case maNguoiDung = "maNguoiDung"
        case maQuyenNguoiDung = "maQuyenNguoiDung"
        case ngayTao = "ngayTao"
        case ngayCapNhatCuoi = "ngayCapNhatCuoi"
        case bienSoXe = "bienSoXe"
        case maTrangThai = "ma_trang_thai"
        case maNguoiTao = "maNguoiTao"
        case tenDangNhap = "tenDangNhap"
        case matKhau = "matKhau"
    }
}
typealias TaiKhoans = [TaiKhoan]


