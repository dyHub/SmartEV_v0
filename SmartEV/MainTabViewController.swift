//
//  MainTabViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 6/20/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class MainTabViewController: UITabBarController {
    
    // MARK: Constants
    let user = FIRAuth.auth()?.currentUser
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        user?.reloadWithCompletion(nil)
    }
    
}
