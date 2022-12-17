//
//  ViewController.swift
//  GRAB_K16
//
//  Created by Dương Văn Cường on 08/12/2022.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    
    @IBOutlet var btnTienMat: UIButton!
    @IBOutlet var btnUuDai: UIButton!
    @IBOutlet var btnDatXe: UIButton!
    @IBOutlet var tbl: UITableView!
    
    @IBOutlet var btnDanhSach: UIButton!
    
    var bookCarData: bookCars = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.dataSource = self
        tbl.delegate = self
        tbl.register(UINib(nibName: "DanhSachXeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        getBookCarFromAPI()
        designBtnDatXe()
       
        
     
        
    }
    
   

    
    func designBtnDatXe() {
        btnDatXe.layer.borderWidth = 0.1
        btnDatXe.layer.borderColor = UIColor.gray.cgColor
        btnDatXe.layer.backgroundColor = UIColor(named: "custonButtonColor")?.cgColor
        btnDatXe.layer.cornerRadius = 10
    }
    
    
    
    @IBAction func btnTapDanhSach(_ sender: UIButton) {
        let DetailGoToListXe = self.storyboard?.instantiateViewController(withIdentifier: "DanhSachBookCarView") as! DanhSachBookCarView
        self.navigationController?.pushViewController(DetailGoToListXe, animated: true)
    }
    
    
   
    
    
    

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookCarData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DanhSachXeTableViewCell
        let currentBookCar = bookCarData[indexPath.row]
        
        //neu vi tri cell o vi tri 0 thi xet mau
        if(bookCarData[indexPath.row].giaTien == "984.00") {
            print("sssss", bookCarData[indexPath.row].giaTien == "984.00")
//            print("lsalsa", bookCarData.first)
            cell.lblCarName.textColor = UIColor(named: "customTextColor")
            cell.lblSoNguoi.textColor = UIColor(named: "customTextColor")
            cell.lblGiaTien.textColor = UIColor(named: "customTextColor")
            cell.lblvnd.textColor = UIColor(named: "customTextColor")
        }
        
        
        let avatarURL = URL(string: currentBookCar.anhXE)
        cell.imgCar.kf.setImage(with: avatarURL)
//        let avata = try? Data(contentsOf: avatarURL!)
//        cell.imgCar.image = UIImage(data: avata!)
        
        cell.lblCarName.text = currentBookCar.tenXe
        cell.lblGiaTien.text = currentBookCar.giaTien
        cell.lblSoNguoi.text = currentBookCar.soNguoi
        return cell
    }
    
    
    func getBookCarFromAPI() {
        APIHandler.init().getCar() {
            carResponseData in
            
            DispatchQueue.main.async {
                self.bookCarData = carResponseData
                self.tbl.reloadData()
            }
//            self.tbl.reloadData()
        }
        
    }
    
    
    
}


