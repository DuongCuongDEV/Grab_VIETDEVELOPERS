//
//  TrafficViewController.swift
//  Grab-VietDevlopersK16
//
//  Created by chuottp on 15/12/2022.
//

import UIKit
import Alamofire
import Kingfisher
import MapKit
import CoreLocation

var thongTinXeDuocChon = bookCar(tenXe: "", anhXE: "", doDaiQuangDuong: Float(quangDuong), thoiGian: 0, giaTien: 0, soNguoi:"", id: "0")

class TrafficViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet var mkMapView: MKMapView!
    
    var bookCarData: bookCars = []

    @IBOutlet var btnDatXe: UIButton!
    
    @IBOutlet weak var tblViewTrafficOption: UITableView!
    
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: code gg map
        //code map view
        mkMapView.delegate = self
        
        // Ask for Authorisation from the User.
        self.manager.requestAlwaysAuthorization()

        // For use in foreground
        self.manager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            manager.startUpdatingLocation()
        
        }
        
        
        
        
        let pin = MKPointAnnotation()
 
        pin.coordinate = pickUpLocations
        mkMapView.addAnnotation(pin)

        mkMapView.setRegion(MKCoordinateRegion(center: pickUpLocations, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        
        
        let vitriKetthuc = MKPointAnnotation()
        
        vitriKetthuc.coordinate = diemKetThuc
        mkMapView.addAnnotation(vitriKetthuc)
        mkMapView.setRegion(MKCoordinateRegion(center: diemKetThuc, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        
        self.mapThis(destinationCord: diemKetThuc)

        
    
        tblViewTrafficOption.dataSource = self
        tblViewTrafficOption.delegate = self
        tblViewTrafficOption.register(UINib(nibName: "DSXeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    
        initData()
        
    }
    
    
    
    
    
    func mapThis(destinationCord: CLLocationCoordinate2D){
        let souceCordinate = pickUpLocations

        let soucePlaceMark = MKPlacemark(coordinate: souceCordinate)
        let destPlaceMark = MKPlacemark(coordinate: diemKetThuc)

        let sourceItem = MKMapItem(placemark: soucePlaceMark)
        let destItem = MKMapItem(placemark: destPlaceMark)

        let destinationRequest = MKDirections.Request()
        destinationRequest.source = sourceItem
        destinationRequest.destination = destItem
        destinationRequest.transportType = .automobile
        destinationRequest.requestsAlternateRoutes = true

        let directions = MKDirections(request: destinationRequest)
        directions.calculate{
            (response, error) in
            guard let response = response else {
                if let error = error {
                    print("Something is wrong :")
                }
                return
            }
            let route = response.routes[0]
            self.mkMapView.addOverlay(route.polyline)
            self.mkMapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)

        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = UIColor(named: "customTextColor")
        return render
    }
    
    //den day

    
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
    
    
    
    @IBAction func btnTapUuDai(_ sender: UIButton) {
        let chuyenSangManUuDai = self.storyboard?.instantiateViewController(withIdentifier: "UuDaiViewController") as! UuDaiViewController
        self.navigationController?.pushViewController(chuyenSangManUuDai, animated: true)
    }
    
    
    @IBAction func btnTapDanhSachXe(_ sender: Any) {
        let chuyenSangManDSXe = self.storyboard?.instantiateViewController(withIdentifier: "DanhSachXeViewController") as! DanhSachXeViewController
        self.navigationController?.pushViewController(chuyenSangManDSXe, animated: true)
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
        let cell = tblViewTrafficOption.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DSXeTableViewCell
    
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



