//
//  UuDaiModel.swift
//  GRAB_K16
//
//  Created by chuottp on 25/12/2022.
//

import Foundation

// MARK: - UuDaiElement
struct UuDai: Decodable {
    let maUuDai, tenUuDai, anhUuDai, chiTietUuDai: String
    let soTienGiam: Int

    enum CodingKeys: String, CodingKey {
        case maUuDai = "ma_uu_dai"
        case tenUuDai = "ten_uu_dai"
        case anhUuDai = "anh_uu_dai"
        case chiTietUuDai = "chi_tiet_uu_dai"
        case soTienGiam = "so_tien_giam"
    }
}

typealias UuDais = [UuDai]

