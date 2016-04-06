//
//  LieuViewController.swift
//  Programme FISU
//
//  Created by arthur jamelot on 05/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit
import MapKit

class LieuViewController: UIViewController {

    @IBOutlet weak var navLieu: UINavigationItem!
    @IBOutlet weak var heureDebLieu: UILabel!
    @IBOutlet weak var heureFinLieu: UILabel!
    @IBOutlet weak var adresseLieu: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var monLieu: Lieu?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navLieu.title = monLieu?.nomLieu
        heureDebLieu.text = monLieu?.sHeureDeb
        heureFinLieu.text = monLieu?.sHeureFin
        adresseLieu.text = monLieu?.adresseLieu
        // Do any additional setup after loading the view.
        centerMapOnLocation(initialLocation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Map
    
    let initialLocation = CLLocation(latitude: 43.604621, longitude: 3.881323)
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius*2.0, regionRadius*2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}
