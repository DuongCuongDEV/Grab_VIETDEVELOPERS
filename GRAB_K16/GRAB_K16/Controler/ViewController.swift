//
//  ViewController.swift
//  GRAB_K16
//
//  Created by Dương Văn Cường on 08/12/2022.
//

import UIKit
import MapKit
import FloatingPanel
import CoreLocation

class ViewController: UIViewController, SearchViewControllerDelegate {

    let mapView = MKMapView()
    let panel = FloatingPanelController()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chọn điểm đón"
        // Do any additional setup after loading the view.
        
        view.addSubview(mapView)
        
        let searchVC = SearchViewController()
        searchVC.delegate = self
        
        panel.set(contentViewController: searchVC)
        panel.addPanel(toParent: self)
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
        mapView.removeAnnotations(mapView.annotations)

        let pin = MKPointAnnotation()
 
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)

        mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
    }
    
}

// print("anhhtusadgj")
