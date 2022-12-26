//
//  UuDaiAPI.swift
//  GRAB_K16
//
//  Created by chuottp on 25/12/2022.
//

import Foundation
import Alamofire

class UuDaiAPI {
    func getUuDais(completion: @escaping (UuDais) -> ()) {
        AF.request("http://localhost:3000/grab/uudai", method: .get).responseDecodable(of: UuDais.self) { (response) in
            if let uudaisResponse = response.value {
                completion(uudaisResponse)
            }
        }
}
}
