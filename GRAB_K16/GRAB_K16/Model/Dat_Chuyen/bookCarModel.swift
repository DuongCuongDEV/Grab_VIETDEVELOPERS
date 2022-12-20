//
//  bookCarModel.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 19/12/2022.
//

import Foundation
struct bookCar: Decodable {
    let tenXe: String
    let anhXE: String
    let doDaiQuangDuong: Float
    let thoiGian: Int
    let giaTien: Double
    let soNguoi, id: String
}

typealias bookCars = [bookCar]
