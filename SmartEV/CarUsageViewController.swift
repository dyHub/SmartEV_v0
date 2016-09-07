//
//  CarUsageViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 9/7/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//


import UIKit
import MapKit

class CarUsageViewController: UIViewController {
    
    // MARK: Constants
    // MARK: Outlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    // MARK: Actions
    
    // MARK: helper functions

}
