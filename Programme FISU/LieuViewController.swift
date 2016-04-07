//
//  LieuViewController.swift
//  Programme FISU
//
//  Created by arthur jamelot on 05/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit
import MapKit

class LieuViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var navLieu: UINavigationItem!
    @IBOutlet weak var heureDebLieu: UILabel!
    @IBOutlet weak var heureFinLieu: UILabel!
    @IBOutlet weak var adresseLieu: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var monLieu: Lieu?
    var geocoder = CLGeocoder()
    let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navLieu.title = monLieu?.nomLieu
        heureDebLieu.text = monLieu?.sHeureDeb
        heureFinLieu.text = monLieu?.sHeureFin
        adresseLieu.text = monLieu?.adresseLieu
        // Do any additional setup after loading the view.
        
        geocoder.geocodeAddressString((monLieu?.adresseLieu)!, completionHandler: {placemarks, error in
            let placemark = placemarks![0] as CLPlacemark
            self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
            self.centerMapOnLocation(placemark.location!)
        })
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        let authstate = CLLocationManager.authorizationStatus()
        if (authstate == CLAuthorizationStatus.NotDetermined) {
            locationManager.requestAlwaysAuthorization()

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Map
    
    let regionRadius: CLLocationDistance = 1500
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}
