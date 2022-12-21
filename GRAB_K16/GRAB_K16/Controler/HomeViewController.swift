//
//  HomeViewController.swift
//  Grab-VietDevlopersK16
//
//  Created by chuottp on 12/12/2022.
//
import UIKit
import ImageSlideshow
import ImageSlideshowAlamofire

class HomeViewController: UIViewController, ImageSlideshowDelegate {
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    let alamofireSource = [
        AlamofireSource(urlString: "https://st3.depositphotos.com/1177973/12491/i/950/depositphotos_124917666-stock-photo-taxi-driver-near-car.jpg")!,
        AlamofireSource(urlString: "https://www.ridester.com/wp-content/uploads/2021/09/uber_driver_requirements_1.jpg")!,
        AlamofireSource(urlString: "https://d39raawggeifpx.cloudfront.net/styles/16_9_desktop/s3/articleimages/0717_Russia_tmt_yandex_taxi_car_adverts_CROPPED_0_2.png")!,
        AlamofireSource(urlString: "https://www.ridester.com/wp-content/uploads/2018/07/long_distance_uber_2.jpg")!,
        AlamofireSource(urlString: "https://www.ridester.com/wp-content/uploads/2021/07/loans_for_uber_drivers_2-1.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            slideShow()
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
            slideshow.addGestureRecognizer(recognizer)
    }
    
    
    @IBAction func btnTapTimKiem(_ sender: UIButton) {
        let chuyenDenDiemDon = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(chuyenDenDiemDon, animated: true)
    }
    

    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }

    
    func slideShow() {
        slideshow.slideshowInterval = 2.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill

        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        slideshow.pageIndicator = pageControl

        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self

        slideshow.setImageInputs(alamofireSource)
    }
    
    


}
