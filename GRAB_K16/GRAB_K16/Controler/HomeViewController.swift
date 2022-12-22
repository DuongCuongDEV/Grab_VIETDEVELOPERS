//
//  HomeViewController.swift
//  Grab-VietDevlopersK16
//
//  Created by chuottp on 12/12/2022.
//
import UIKit
import ImageSlideshow
import ImageSlideshowAlamofire

class HomeViewController: UIViewController, ImageSlideshowDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    var list = [
        [
            "images": "car 1",
            "title": "oto"
        ],
        [
            "images": "motorbike 1",
            "title": "xe máy"
        ],
        [
            "images": "motorbike 2",
            "title": "đồ ăn"
        ],
        [
            "images": "package 1",
            "title": "giao hàng"
        ],
        [
            "images": "tag 1",
            "title": "ưu đãi"
        ]
    ]
    @IBOutlet weak var cltItemView: UICollectionView!
    
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
              print("current page:", page)
          }
    
    
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
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    let imageSource = [
    ImageSource(image: UIImage(named: "319741263_676174654011613_1073944731900936552_n")!),
    ImageSource(image: UIImage(named: "319868516_3233707650226225_3437282427379472407_n")!),
    ImageSource(image: UIImage(named: "320554655_489907816606783_2074546054760606815_n")!)
    ]
    
    let alamofireSource = [
            AlamofireSource(urlString: "https://st3.depositphotos.com/1177973/12491/i/950/depositphotos_124917666-stock-photo-taxi-driver-near-car.jpg")!,
            AlamofireSource(urlString: "https://www.ridester.com/wp-content/uploads/2021/09/uber_driver_requirements_1.jpg")!,
            AlamofireSource(urlString: "https://d39raawggeifpx.cloudfront.net/styles/16_9_desktop/s3/articleimages/0717_Russia_tmt_yandex_taxi_car_adverts_CROPPED_0_2.png")!,
            AlamofireSource(urlString: "https://www.ridester.com/wp-content/uploads/2018/07/long_distance_uber_2.jpg")!,
            AlamofireSource(urlString: "https://www.ridester.com/wp-content/uploads/2021/07/loans_for_uber_drivers_2-1.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cltItemView.delegate = self
        cltItemView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let screenWith = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWith/5-10, height: 128)
        cltItemView.collectionViewLayout = layout
        slideshow.slideshowInterval = 2.0
               slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
               slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill

               let pageControl = UIPageControl()
               pageControl.currentPageIndicatorTintColor = UIColor.red
               pageControl.pageIndicatorTintColor = UIColor.lightGray
               slideshow.pageIndicator = pageControl

               // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
               slideshow.activityIndicator = DefaultActivityIndicator()
               slideshow.delegate = self

               // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
               slideshow.setImageInputs(alamofireSource)

               let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
               slideshow.addGestureRecognizer(recognizer)
           }

           @objc func didTap() {
               let fullScreenController = slideshow.presentFullScreenController(from: self)
               // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
               fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
           }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



}
