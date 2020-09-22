//
//  ViewController.swift
//  ShareLocationApp
//
//  Created by Shehzad on 22/09/2020.
//  Copyright © 2020 Shehzad. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapKitView: MKMapView!
    
    var longitude: Double = 0.00
    var latitude: Double = 0.00
   
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        print(longitude)
    }
    
    
    @IBAction func btnShareLocation(_ sender: Any) {
        print(longitude)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            
        }

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            if let location = locations.first{
                guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
                
                self.longitude = locValue.longitude
                self.latitude = locValue.latitude
                
                let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                let region = MKCoordinateRegion(center: location.coordinate, span: span)
                self.mapKitView.setRegion(region, animated: true)
                
//                print(self.longitude)
            }
        }
        
    }

}
