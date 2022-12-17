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
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
              print("current page:", page)
          }
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    let alamofireSource = [AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
