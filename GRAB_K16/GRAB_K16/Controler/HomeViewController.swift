//
//  HomeViewController.swift
//  Grab-VietDevlopersK16
//
//  Created by chuottp on 12/12/2022.
//
import UIKit
import Kingfisher

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var list = [
        [
            "images": "car 1",
            "title": "Ôtô"
        ],
        [
            "images": "motorbike 1",
            "title": "Xe máy"
        ],
        [
            "images": "motorbike 2",
            "title": "Đồ ăn"
        ],
        [
            "images": "package 1",
            "title": "Giao hàng"
        ],
        [
            "images": "tag 1",
            "title": "Ưu đãi"
        ]
    ]
    
    
    @IBOutlet weak var cltItemView: UICollectionView!
    
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cltItemView.dequeueReusableCell(withReuseIdentifier: "navBarCell", for: indexPath)
        
        let currentList = list[indexPath.row]
        let lblTitle = cell.viewWithTag(2) as! UILabel
        lblTitle.text = currentList["title"]
        
        let btnItem = cell.viewWithTag(1) as! UIButton
        let image = UIImage(named: "\(currentList["images"]!)")
        btnItem.setImage(image, for: .normal)
        
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cltItemView.delegate = self
        cltItemView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let screenWith = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWith/5-10, height: 128)
        cltItemView.collectionViewLayout = layout
         
    
    }
   

}
