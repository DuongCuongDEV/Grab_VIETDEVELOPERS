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


var diemKetThuc = CLLocationCoordinate2D()

var quangDuong = CLLocationDistance()


class EndDestination: UIViewController, CLLocationManagerDelegate, SearchViewControllerDelegate, MKMapViewDelegate {

    let mapView = MKMapView()
    let panel = FloatingPanelController()
    
    

    let manager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chọn điểm đến"
        // Do any additional setup after loading the view.
        
        view.addSubview(mapView)
        mapView.delegate = self

        
        let searchVC = SearchViewController()
        searchVC.delegate = self
        
        
        //bo
        panel.set(contentViewController: searchVC)
        panel.addPanel(toParent: self)
        //
        
       
       
        // Ask for Authorisation from the User.
        self.manager.requestAlwaysAuthorization()

        // For use in foreground
        self.manager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            manager.startUpdatingLocation()
        }
        
        
        
        panel.move(to: .tip, animated: true)

//        mapView.removeAnnotations(mapView.annotations)

       
        let pin = MKPointAnnotation()
 
        pin.coordinate = pickUpLocations
        mapView.addAnnotation(pin)

        mapView.setRegion(MKCoordinateRegion(center: pickUpLocations, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        
        
    }
    
    //MARK: chuyen man
    
    @IBAction func btnTabDatXe(_ sender: Any) {
        let chuyenSangMHDatXe = self.storyboard?.instantiateViewController(withIdentifier: "TrafficViewController") as! TrafficViewController
        self.navigationController?.pushViewController(chuyenSangMHDatXe, animated: true)
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }

    
    
    
    func searchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {

        
        
        guard let coordinates = coordinates else {
            return
        }
        
        

        self.mapView.removeOverlays(self.mapView.overlays)
        
        
        panel.move(to: .tip, animated: true)
        mapView.removeAnnotations(mapView.annotations)

        let pin = MKPointAnnotation()

        pin.coordinate = coordinates
        mapView.addAnnotation(pin)

        mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        
        self.mapThis(destinationCord: coordinates)
        
        diemKetThuc = coordinates
        //My location
        let myLocation = CLLocation(latitude: pickUpLocations.latitude, longitude: pickUpLocations.longitude)

        //My buddy's location
        let myBuddysLocation = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)

        //Measuring my distance to my buddy's (in km)
        var distance = myLocation.distance(from: myBuddysLocation) / 1000 * 1.2

        quangDuong = distance
        
        //Display the result in km
        print(String(format: "Do dai quang duong %.01fkm", quangDuong))
        
        
            

    }
    
    
    
    
    
    
    func mapThis(destinationCord: CLLocationCoordinate2D){
        let souceCordinate = pickUpLocations

        let soucePlaceMark = MKPlacemark(coordinate: souceCordinate)
        let destPlaceMark = MKPlacemark(coordinate: destinationCord)

        let sourceItem = MKMapItem(placemark: soucePlaceMark)
        let destItem = MKMapItem(placemark: destPlaceMark)

        let destinationRequest = MKDirections.Request()
        destinationRequest.source = sourceItem
        destinationRequest.destination = destItem
        destinationRequest.transportType = .automobile
        destinationRequest.requestsAlternateRoutes = true

        let directions = MKDirections(request: destinationRequest)
        directions.calculate{
            (response, error) in
            guard let response = response else {
                if let error = error {
                    print("Something is wrong :")
                }
                return
            }
            let route = response.routes[0]
            self.mapView.addOverlay(route.polyline)
            self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)

        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .blue
        return render
    }

    
    
    

}
    

