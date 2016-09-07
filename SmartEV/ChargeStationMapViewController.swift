//
//  ChargeStationMapViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 9/7/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//

import UIKit
import MapKit

class ChargeStationMapViewController: UIViewController {
    
    // MARK: Constants
    // set initial location in Honolulu
    let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
    let regionRadius: CLLocationDistance = 1000
    // MARK: Outlets
    
    @IBOutlet weak var mapView: MKMapView!

    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBarHidden = false
        
        centerMapOnLocation(initialLocation)
    }
    
    // MARK: Actions
    
    // MARK: helper functions
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
