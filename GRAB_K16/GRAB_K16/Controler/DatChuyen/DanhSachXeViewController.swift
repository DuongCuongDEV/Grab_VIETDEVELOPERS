//
//  DanhSachXeViewController.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 19/12/2022.
//

import Foundation
import UIKit
import Alamofire
import Kingfisher
class DanhSachXeViewController: UIViewController {
    
    @IBOutlet var tblDanhSachXe: UITableView!
    var arrDataXe: bookCars = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDanhSachXe.dataSource = self
        tblDanhSachXe.delegate = self
        tblDanhSachXe.register(UINib(nibName: "DSXeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        getBookCarFromAPI()
        
    }
    
    
    
}

extension DanhSachXeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDataXe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblDanhSachXe.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DSXeTableViewCell
        
        let currentBookCar = arrDataXe[indexPath.row]
        
        let avatarURL = URL(string: currentBookCar.anhXE)
        cell.anhXe.kf.setImage(with: avatarURL)
        
        cell.lblTenXe.text = currentBookCar.tenXe
        cell.lblGiaTien.text = String(currentBookCar.giaTien)
        cell.lblSoLuongHanhKhach.text = currentBookCar.soNguoi
        cell.lblThoiGianDi.text = String(currentBookCar.thoiGian)
        
        return cell
    }
    
    func getBookCarFromAPI() {
        APIHandler.init().getCar() {
            carResponseData in
            self.arrDataXe = carResponseData
            self.tblDanhSachXe.reloadData()
        }
        
    }
    
}
