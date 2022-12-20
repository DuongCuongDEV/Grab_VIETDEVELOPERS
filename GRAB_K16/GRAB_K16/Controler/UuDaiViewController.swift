//
//  UuDaiViewController.swift
//  GRAB_K16
//
//  Created by Thanh Dat on 20/12/2022.
//

import Foundation
import UIKit

class UuDaiViewController: UIViewController {
    
    var dataUuDai: uuDais = []
    
    @IBOutlet var tblUuDai: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblUuDai.delegate = self
        tblUuDai.dataSource = self
        tblUuDai.register(UINib(nibName: "DSUuDaiTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        getUuDaiFromAPI()
    }
    
    
    
    func getUuDaiFromAPI() {
        APIUuDai.init().getUuDai() {
            UuDaiResponseData in
            
            DispatchQueue.main.async {
                self.dataUuDai = UuDaiResponseData
                self.tblUuDai.reloadData()
            }
        }
    }
}

extension UuDaiViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataUuDai.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblUuDai.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DSUuDaiTableViewCell
        
        let currentUuDai = dataUuDai[indexPath.row]
        
        cell.lblTenUuDai.text = currentUuDai.tenUuDai
        cell.lblSoTienGiam.text = String(currentUuDai.soTienGiam)
        
        return cell
    }
    
    
}



