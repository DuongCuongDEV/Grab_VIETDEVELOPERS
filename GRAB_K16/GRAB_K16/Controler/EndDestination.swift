//
//  EndDestination.swift
//  GRAB_K16
//
//  Created by Dương Văn Cường on 16/12/2022.
//

import UIKit
import MapKit
import FloatingPanel
import CoreLocation

class EndDestination: UIViewController, CLLocationManagerDelegate, SearchViewControllerDelegate {

    let mapView = MKMapView()
    let panel = FloatingPanelController()
    
    

    let manager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chọn điểm đến"
        // Do any additional setup after loading the view.
        
        view.addSubview(mapView)
        
        let searchVC = SearchViewController()
        searchVC.delegate = self
        
        panel.set(contentViewController: searchVC)
        panel.addPanel(toParent: self)
        
       
       
        // Ask for Authorisation from the User.
        self.manager.requestAlwaysAuthorization()

        // For use in foreground
        self.manager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            manager.startUpdatingLocation()
        }
        
        
        
        
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        
        
        panel.move(to: .tip, animated: true)

//        mapView.removeAnnotations(mapView.annotations)

       
        let pin = MKPointAnnotation()
 
        pin.coordinate = locValue
        mapView.addAnnotation(pin)

        mapView.setRegion(MKCoordinateRegion(center: locValue, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        
        print("location2222 \(locValue)")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }

    
    
    
    func searchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {

        
        
        guard let coordinates = coordinates else {
            return
        }

        panel.move(to: .tip, animated: true)
//        mapView.removeAnnotations(mapView.annotations)

        let pin = MKPointAnnotation()

        pin.coordinate = coordinates
        mapView.addAnnotation(pin)

        mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
    }
    
    

}
