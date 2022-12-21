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
    var bookCarData: bookCars = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDanhSachXe.dataSource = self
        tblDanhSachXe.delegate = self
        tblDanhSachXe.register(UINib(nibName: "DSXeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        initData()
        
    }
    
    func initData() {
        let GrabBike = bookCar(tenXe: "GrabBike", anhXE: "bike", doDaiQuangDuong: Float(quangDuong) , thoiGian: 30, giaTien: tinhTien(quangDuong: Float(quangDuong),  loaiPhuongTien: "PT1"), soNguoi: "Tối đa 1 hành khách", id: "1")
        let GrabCar = bookCar(tenXe: "GrabCar", anhXE: "4cho", doDaiQuangDuong: Float(quangDuong), thoiGian: 10, giaTien: tinhTien(quangDuong: Float(quangDuong), loaiPhuongTien: "PT2"), soNguoi: "Tối đa 4 hành khách", id: "2")
        let GrabTaxi4Cho = bookCar(tenXe: "GrabTaxxi 4 chỗ", anhXE: "4cho", doDaiQuangDuong: Float(quangDuong), thoiGian: 10, giaTien: tinhTien(quangDuong: Float(quangDuong), loaiPhuongTien: "PT3"), soNguoi: "Tối đa 4 hành khách, giá cước theo đồng hồ", id: "3")
        let GrabCar7 = bookCar(tenXe: "GrabCar 7", anhXE: "7cho", doDaiQuangDuong: Float(quangDuong), thoiGian: 10, giaTien: tinhTien(quangDuong: Float(quangDuong), loaiPhuongTien: "PT3"), soNguoi: "Tối đa 7 hành khách", id: "4")
        let GrabCar4LienTinh = bookCar(tenXe: "GrabCar 4 chỗ(liên tỉnh - 2 chiều)", anhXE: "4cho", doDaiQuangDuong: Float(quangDuong), thoiGian: 20, giaTien: tinhTien(quangDuong: Float(quangDuong),  loaiPhuongTien: "PT3"), soNguoi: "Tối đa 4 hành khách", id: "5")
        let GrabCar7LienTinh = bookCar(tenXe: "GrabCar 7 chỗ(liên tỉnh - 2 chiều)", anhXE: "7cho", doDaiQuangDuong: Float(quangDuong), thoiGian: 20, giaTien: tinhTien(quangDuong: Float(quangDuong), loaiPhuongTien: "PT3"), soNguoi: "Tối đa 7 hành khách", id: "6")
        
        bookCarData.append(GrabBike)
        bookCarData.append(GrabCar)
        bookCarData.append(GrabTaxi4Cho)
        bookCarData.append(GrabCar7)
        bookCarData.append(GrabCar4LienTinh)
        bookCarData.append(GrabCar7LienTinh)
        
        
    }
    
    
    
}

extension DanhSachXeViewController: UITableViewDelegate, UITableViewDataSource {
    
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return bookCarData.count
            }
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 64
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tblDanhSachXe.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DSXeTableViewCell
            
                let currentBookCar = bookCarData[indexPath.row]

                cell.anhXe.image = UIImage(named: currentBookCar.anhXE)
                
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
            
            

            func tinhTien(quangDuong: Float,loaiPhuongTien: String) -> Double {
                var tongSoTien = 0;
                
                switch(loaiPhuongTien) {
                case "PT1":
                        if(quangDuong < 2) {
                            tongSoTien = 12000
                        } else {
                            
                            let tongTienQuangDuongConLai = (quangDuong - 2) * 5000
                            tongSoTien = Int(12000 + Int(tongTienQuangDuongConLai))
                        }
                    
                        break
                case "PT2":
                    if(quangDuong < 2) {
                        tongSoTien = 20000
                    } else {
                        
                        let tongTienQuangDuongConLai = (quangDuong - 2) * 10000
                        tongSoTien = Int(20000 + Int(tongTienQuangDuongConLai))
                    }
                    break
                    
                case "PT3":
                    if(quangDuong < 2) {
                        tongSoTien = 25000
                    } else {
                        let tongTienQuangDuongConLai = (quangDuong - 2) * 14000
                        tongSoTien = Int(25000 + Int(tongTienQuangDuongConLai))
                    }
                    break
                    
                default:
                    break
                }
                
                return Double(tongSoTien)
            }
    
}
