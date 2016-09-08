//
//  ChargeStationMapViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 9/7/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ChargeStationMapViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: Constants
    let locationManager = CLLocationManager()
    
    var resultSearchController:UISearchController? = nil
    
    // MARK: Outlets
    
    @IBOutlet weak var mapView: MKMapView!

    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBarHidden = false
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
        
        // show current location as a blue dot
        self.mapView.showsUserLocation = true
        
        // embed search table into the map view
        let locationSearchTable = storyboard!.instantiateViewControllerWithIdentifier("LocationSearchTable") as! LocationSearchTableViewController
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        // embed search bar into navigation bar
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
    }
    
    // MARK: helper functions
    
    /**
     * Functions that centers at current location at initial time
     * with specific radius
     */
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        addErrorAlert(error.localizedDescription, alertTitle: "Location Error")
    }
}
