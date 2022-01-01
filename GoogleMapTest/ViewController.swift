//
//  ViewController.swift
//  GoogleMapTest
//
//  Created by Ye Lynn Htet on 30/12/2021.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        GMSServices.provideAPIKey("AIzaSyD3miAZjDq0JaHikJVZCUNJ0ZlRYD7jj7Y")
        
        
        
//        let destinationMarker = GMSMarker()
//        destinationMarker.position = CLLocationCoordinate2D(latitude: -33.2, longitude: 151.20)
//        destinationMarker.title = "Yangon"
//        destinationMarker.snippet = "Australia"
//        destinationMarker.map = mapView
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        let coordinate = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 20.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let sourceMarker = GMSMarker()
        sourceMarker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        sourceMarker.title = "Sydney"
        sourceMarker.snippet = "Australia"
        sourceMarker.map = mapView
    }


}

