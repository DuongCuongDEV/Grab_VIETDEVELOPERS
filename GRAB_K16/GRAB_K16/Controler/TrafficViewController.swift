//
//  TrafficViewController.swift
//  Grab-VietDevlopersK16
//
//  Created by chuottp on 15/12/2022.
//

import UIKit
import Alamofire
import Kingfisher

var thongTinXeDuocChon = bookCar(tenXe: "", anhXE: "", doDaiQuangDuong: 0, thoiGian: 0, giaTien: 0, soNguoi:"", id: "0")

class TrafficViewController: UIViewController {
    
    var bookCarData: bookCars = []

    @IBOutlet var btnDatXe: UIButton!
    
    @IBOutlet weak var tblViewTrafficOption: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblViewTrafficOption.dataSource = self
        tblViewTrafficOption.delegate = self
        tblViewTrafficOption.register(UINib(nibName: "DSXeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        designBtnDatXe()
        initData()
        
        
    }
    
    func designBtnDatXe() {
        btnDatXe.layer.borderWidth = 0.1
        btnDatXe.layer.borderColor = UIColor.gray.cgColor
        btnDatXe.layer.backgroundColor = UIColor(named: "custonButtonColor")?.cgColor
        btnDatXe.layer.cornerRadius = 10
    }
    
    func initData() {
        let bikeCar = bookCar(tenXe: "Xe may", anhXE: "motorbike1", doDaiQuangDuong: 11, thoiGian: 30, giaTien: tinhTien(quangDuong: 11, thoiGian: 30, loaiPhuongTien: "PT1"), soNguoi: "Toi da 1 nguoi", id: "1")
        let oto = bookCar(tenXe: "oTo", anhXE: "motorbike 2", doDaiQuangDuong: 5, thoiGian: 10, giaTien: tinhTien(quangDuong: 5, thoiGian: 30, loaiPhuongTien: "PT2"), soNguoi: "Toi da 5 nguoi", id: "2")
        bookCarData.append(bikeCar)
        bookCarData.append(oto)
        
    }
    
    

   
    
  
}

extension TrafficViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookCarData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentTraffic = bookCarData[indexPath.row]
        let cell = tblViewTrafficOption.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DSXeTableViewCell
        
        let currentBookCar = bookCarData[indexPath.row]
        
        let avatarURL = URL(string: currentBookCar.anhXE)
        cell.anhXe.kf.setImage(with: avatarURL)

        
        cell.lblTenXe.text = currentBookCar.tenXe
        cell.lblGiaTien.text = "\(String(currentBookCar.giaTien))đ"
        cell.lblSoLuongHanhKhach.text = currentBookCar.soNguoi
            return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.count)
         thongTinXeDuocChon = bookCarData[indexPath.row]
        print(thongTinXeDuocChon)
        
    }
    
    

    func tinhTien(quangDuong: Float, thoiGian: Int, loaiPhuongTien: String) -> Double {
        var tongSoTien = 0;
        
        switch(loaiPhuongTien) {
        case "PT1":
                if(quangDuong < 2) {
                    tongSoTien = 12000
                } else {
                    let thoiGianConLai = thoiGian - (thoiGian / Int(quangDuong)) * 2
                    let tongTienQuangDuongConLai = (quangDuong - 2) * 5000
                    tongSoTien = Int(12000 + Int(tongTienQuangDuongConLai) +  thoiGianConLai * 350)
                }
            
                break
        case "PT2":
            if(quangDuong < 2) {
                tongSoTien = 20000
            } else {
                let thoiGianConLai = thoiGian - (thoiGian / Int(quangDuong)) * 2
                let tongTienQuangDuongConLai = (quangDuong - 2) * 10000
                tongSoTien = Int(20000 + Int(tongTienQuangDuongConLai) +  thoiGianConLai * 350)
            }
            break
            
        default:
            break
        }
        
        return Double(tongSoTien)
    }
    
}
    
