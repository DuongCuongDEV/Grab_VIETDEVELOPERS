//
//  UuDaiModel.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 20/12/2022.
//

import Foundation
struct uuDaiModel: Decodable {
    let maUuDai, tenUuDai: String
    let soTienGiam: Int

    enum CodingKeys: String, CodingKey {
        case maUuDai = "ma_uu_dai"
        case tenUuDai = "ten_uu_dai"
        case soTienGiam = "so_tien_giam"
    }
}

typealias uuDais = [uuDaiModel]
