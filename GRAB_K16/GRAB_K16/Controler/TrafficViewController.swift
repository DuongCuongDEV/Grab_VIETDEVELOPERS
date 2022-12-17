//
//  TrafficViewController.swift
//  Grab-VietDevlopersK16
//
//  Created by chuottp on 15/12/2022.
//

import UIKit

class TrafficViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    class Traffic {
        var image:String?
        var title:String?
        var subtitle:String?
        var cost:Float!
        var firstTime: Int?
        var lastTime: Int?
    }
    var trafficList:[Traffic] = []

    
    @IBOutlet weak var tblViewTrafficOption: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //tblViewTrafficOption.register(UITableViewCell.self, forCellReuseIdentifier: "TrafficViewIndentifier")
        tblViewTrafficOption.dataSource = self
        tblViewTrafficOption.delegate = self
        
        initData()
        // Do any additional setup after loading the view.
    }
    func initData() {
        let grabCar = Traffic()
        grabCar.image = "baby-car 1"
        grabCar.title = "GrabCar"
        grabCar.subtitle = "Tối đa 4 hành khách"
        grabCar.cost = 91.000
        grabCar.firstTime = 2
        grabCar.lastTime = 6
        
        trafficList.append(grabCar)
        trafficList.append(grabCar)
        trafficList.append(grabCar)
        trafficList.append(grabCar)
        trafficList.append(grabCar)
        trafficList.append(grabCar)
        trafficList.append(grabCar)
        trafficList.append(grabCar)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trafficList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentTraffic = trafficList[indexPath.row]
        let cell = tblViewTrafficOption.dequeueReusableCell(withIdentifier: "TrafficViewIndentifier", for: indexPath) as! CustomTableViewCell
        
        
        
        cell.imgPhoto.image = UIImage(named: "\(currentTraffic.image!)")
         
        cell.lblTitle.text! = currentTraffic.title!
         
        cell.lblSubTitle.text! = currentTraffic.subtitle!
         
        cell.lblCost.text! = "\(currentTraffic.cost!)đ"
         
        cell.lblTime.text! = "\(currentTraffic.firstTime!) - \(currentTraffic.lastTime!)phút"
            return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        //l     Pass the selected object to the new view controller.
    }
    */
}
    
