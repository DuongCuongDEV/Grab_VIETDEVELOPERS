//
//  APIUuDai.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 20/12/2022.
//

import Foundation
import Alamofire
class APIUuDai {
    func getUuDai(completion: @escaping (uuDais) -> ()) {
        let apiUuDai = "http://localhost:3000/grab/uudai"
        AF.request(apiUuDai, method: .get).responseDecodable(of: uuDais.self) { (response) in
            if let uuDaiResponse = response.value {
                completion(uuDaiResponse)
            }
        }
        
    }
}

