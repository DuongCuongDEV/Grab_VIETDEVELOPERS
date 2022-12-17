//
//  bookCartModel.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 14/12/2022.
//

import Foundation

struct bookCar: Decodable {
    let tenXe: String
    let anhXE: String
    let giaTien, thoiGian, soNguoi, id: String
}

typealias bookCars = [bookCar]


