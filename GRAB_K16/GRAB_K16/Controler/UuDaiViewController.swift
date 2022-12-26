//
//  UuDaiViewController.swift
//  GRAB_K16
//
//  Created by chuottp on 25/12/2022.
//

import UIKit
import Kingfisher

class UuDaiViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var uudaisData : UuDais = []
    let defaults = UserDefaults.standard
    
    
    @IBOutlet weak var cltUuDaiView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUuDaisFromAPI()
        
        cltUuDaiView.dataSource = self
        cltUuDaiView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let screenWith = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWith/2-10, height: 249)
        cltUuDaiView.collectionViewLayout = layout
        
    }
    
    func getUuDaisFromAPI() {
        
            print("Chua goi API nen can goi lai API")
            
            UuDaiAPI.init().getUuDais { uudaisResponseData in
                self.uudaisData = uudaisResponseData
                self.defaults.set(true, forKey: "calledAPI")
                self.cltUuDaiView.reloadData()
            }
        
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return uudaisData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cltUuDaiView.dequeueReusableCell(withReuseIdentifier: "UuDaiIdentifier", for: indexPath)
        
        let currentUuDai = uudaisData[indexPath.row]
        
        let imgPicture = cell.viewWithTag(1) as! UIImageView
        imgPicture.image = UIImage(named: "\(currentUuDai.anhUuDai)")
        imgPicture.layer.cornerRadius = 15
        
        let lblTitle = cell.viewWithTag(2) as! UILabel
        lblTitle.text = currentUuDai.chiTietUuDai
        
        let lblDescription = cell.viewWithTag(3) as! UILabel
        lblDescription.text = currentUuDai.tenUuDai
        
        return cell
    }

    

}
