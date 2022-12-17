//
//  ViewController.swift
//  Grab
//
//  Created by Huy on 07/12/2022.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var trips: Trips = []
    
    @IBOutlet weak var lblTripsNotification: UILabel!
    
    @IBOutlet weak var tblTrips: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTripsFromAPI()
        tblTrips.register(UINib(nibName: "TripsTableViewCell", bundle: nil), forCellReuseIdentifier: "CellTripsIdentifier")
        tblTrips.delegate = self
        tblTrips.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        165
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentTrip = trips[indexPath.row]
        let cell = tblTrips.dequeueReusableCell(withIdentifier: "CellTripsIdentifier", for: indexPath) as! TripsTableViewCell
        let url = URL(string: currentTrip.anhDaiDien)
        cell.imgCustomerAvatar.kf.setImage(with: url)
        cell.lblTripDistance.text = "\(currentTrip.doDaiQuangDuong) km"
        cell.lblCustomerName.text = currentTrip.hoVaTen
        cell.lblTripProfit.text = "\(currentTrip.thanhTien) vnd"
        cell.lblPickUpPlace.text = "\(currentTrip.longitudeBatDau) | \(String(describing: currentTrip.laitudeBatDau))"
        cell.lblDropOffPlace.text = "\(currentTrip.longitudeKetThuc) | \(String(describing: currentTrip.laitudeKetThuc))"
        lblTripsNotification.text = "Bạn nhận được \(trips.count) yêu cầu đặt chuyến"
        return cell
    }
    
    func getTripsFromAPI() {
        AF.request("http://localhost:3000/api/trips", method: .get).responseDecodable(of: Trips.self) { responseData in
            if let tripData = responseData.value{
                self.trips = tripData
                self.tblTrips.reloadData()
            }
        }
    }
    
}




