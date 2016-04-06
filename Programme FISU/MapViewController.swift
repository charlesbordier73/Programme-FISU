//
//  MapViewController.swift
//  Programme FISU
//
//  Created by arthur jamelot on 06/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {


    @IBOutlet weak var mapView: MKMapView!
    
    var lieux = [Lieu]()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerMapOnGare()
        fetchLieu()
        
        for (var i = 0; i < lieux.count; i++) {
            let geocoderFor = CLGeocoder()
            let adress = lieux[i].adresseLieu
            let name = lieux[i].nomLieu
            geocoderFor.geocodeAddressString(adress!, completionHandler: {placemarks, error in
                let placemark = placemarks![0] as CLPlacemark

                let p1 = MKPointAnnotation()
                p1.coordinate = (placemark.location?.coordinate)!
                p1.title = name
                p1.subtitle = adress
                self.mapView.addAnnotation(p1)
            })
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchLieu(){
        let fetchRequest = NSFetchRequest(entityName: "Lieu")
        do {
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as? [Lieu]
            guard let myFetchResult = fetchResults else {
                return
            }
            lieux = myFetchResult
        } catch {
        }

    }
    
    // MARK: Map
    
    let regionRadius: CLLocationDistance = 5000
    
    func centerMapOnGare() {
        geocoder.geocodeAddressString("1 Rue des deux ponts, Montpellier", completionHandler: {placemarks, error in
            let placemark = placemarks![0] as CLPlacemark
            self.centerMapOnLocation(placemark.location!)
        })
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}
