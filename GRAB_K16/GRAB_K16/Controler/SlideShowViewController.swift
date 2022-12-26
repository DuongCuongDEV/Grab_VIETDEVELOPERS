//
//  SlideShowViewController.swift
//  GRAB_K16
//
//  Created by chuottp on 25/12/2022.
//

import UIKit

class SlideShowViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    var currentCellIndex = 0
    var imageSlideShow = ["banner1", "banner2", "banner3"]
    var timer : Timer?
    
    @IBOutlet weak var cltSlideShow: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cltSlideShow.dataSource = self
        cltSlideShow.delegate = self
    
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let screenWith = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWith, height: 195)
        cltSlideShow.collectionViewLayout = layout
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        
        
    }
    @objc func slideToNext() {
        if currentCellIndex < imageSlideShow.count-1 {
            currentCellIndex = currentCellIndex + 1
        }else{
            currentCellIndex = 0
        }
        cltSlideShow.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSlideShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cltSlideShow.dequeueReusableCell(withReuseIdentifier: "ImageSlideShowIdentifier", for: indexPath)
        let currentImageSlideShow = imageSlideShow[indexPath.row]
        
        let imgSlideShow = cell.viewWithTag(1) as! UIImageView
        imgSlideShow.image = UIImage(named: "\(currentImageSlideShow)")
        
        
        
        return cell
    }
    

    

}
