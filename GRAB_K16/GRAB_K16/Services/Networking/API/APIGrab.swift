//
//  APIHandler.swift
//  GRAB_K16
//
//  Created by yenyen on 24/12/2022.
//

import Foundation
import Alamofire

let URL_GRAB_GET = "http://localhost:3000/"
class APIGrabHandler{
    func getTinhs(completion: @escaping (Tinhs) -> ()){
        AF.request(URL_GRAB_GET + "grab/tinh", method: .get).responseDecodable(of: Tinhs.self){
            (response) in
            if let tinhsResponse = response.value{
                completion(tinhsResponse)
            }
        }
    }
    
    func getHuyens(tinhId: String, completion: @escaping (Huyens) -> ()){
        AF.request(URL_GRAB_GET + "grab/huyen/\(tinhId)", method: .get).responseDecodable(of: Huyens.self){
            (response) in
            if let huyensResponse = response.value{
                completion(huyensResponse)
            }
        }
    }

    func getXas(huyenId: String, completion: @escaping (Xas) -> ()){
        AF.request(URL_GRAB_GET + "grab/xa/\(huyenId)", method: .get).responseDecodable(of: Xas.self){
            (response) in
            if let xasResponse = response.value{
                completion(xasResponse)
            }
        }
    }
    func getThongTinTaiKhoan(nguoiDung: NguoiDung , completion: @escaping(TaiKhoans) -> ()){
        print(nguoiDung)
        AF.request(URL_GRAB_GET + "thongTinTaiKhoan/", method: .post, parameters: nguoiDung, encoder: JSONParameterEncoder.default, headers: nil ).responseDecodable(of: TaiKhoans.self) { (response) in
            
            if let taiKhoansResponse = response.value {
                completion(taiKhoansResponse)
            }
        }
           
            
           
            
        }
        
    }
    
    
    


