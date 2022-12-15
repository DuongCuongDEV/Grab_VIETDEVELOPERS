//
//  APIHandler.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 14/12/2022.
//

import Foundation
import Alamofire
class APIHandler {
    func getCar(completion: @escaping (bookCars) -> ()) {
        var api = "https://6399d10b16b0fdad774a46a6.mockapi.io/booCar"
        
        AF.request(api, method: .get).responseDecodable(of: bookCars.self) { (response) in
            if let bookCarResponse = response.value {
                completion(bookCarResponse)
            }
        }
        
    }
}
