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
    var searchedUuDai: [String] = []
    
    @IBOutlet var searchUuDai: UISearchBar!

    @IBOutlet var tblUuDai: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblUuDai.delegate = self
        tblUuDai.dataSource = self
        
        tblUuDai.register(UINib(nibName: "DSUuDaiTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
//        searchUuDai.delegate = self
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataUuDai.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblUuDai.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DSUuDaiTableViewCell
        
        let currentUuDai = dataUuDai[indexPath.row]
        
        cell.lblTenUuDai.text = currentUuDai.tenUuDai
        cell.lblSoTienGiam.text = "\(String(currentUuDai.soTienGiam))đ"
        
        return cell
    }
    
    
}

//extension UuDaiViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        <#code#>
//    }
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        <#code#>
//    }
//}


