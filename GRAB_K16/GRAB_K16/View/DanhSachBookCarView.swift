//
//  DanhSachBookCarView.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 14/12/2022.
//

import Foundation
import UIKit
import Alamofire
class DanhSachBookCarView: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet var tbl: UITableView!
    var arrDataXe: bookCars = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.register(UINib(nibName: "DanhSachXeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        getBookCarFromAPI()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDataXe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DanhSachXeTableViewCell
        let currentBookCar = arrDataXe[indexPath.row]
        
        //neu vi tri cell o vi tri 0 thi xet mau
        print("Vi tri ", indexPath.row)
        if(indexPath.row == 0) {
            cell.lblCarName.textColor = UIColor(named: "customTextColor")
            cell.lblSoNguoi.textColor = UIColor(named: "customTextColor")
            cell.lblGiaTien.textColor = UIColor(named: "customTextColor")
            cell.lblvnd.textColor = UIColor(named: "customTextColor")
        }
        
        
        let avatarURL = URL(string: currentBookCar.anhXE)
        cell.imgCar.kf.setImage(with: avatarURL)
        
        cell.lblCarName.text = currentBookCar.tenXe
        cell.lblGiaTien.text = currentBookCar.giaTien
        cell.lblSoNguoi.text = currentBookCar.soNguoi
        return cell
    }
    
    func getBookCarFromAPI() {
        APIHandler.init().getCar() {
            carResponseData in
            self.arrDataXe = carResponseData
            self.tbl.reloadData()
        }
        
    }
    
    
}
