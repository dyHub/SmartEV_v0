//
//  SettingViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 6/20/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingViewController: UITableViewController {
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Actions
    @IBAction func logOutFromSetting(sender: UIButton) {
        try! FIRAuth.auth()!.signOut()
        let LogInVC = self.storyboard?.instantiateViewControllerWithIdentifier("LogInView") as!LoginViewController
        self.presentViewController(LogInVC, animated: true, completion: nil)
    }
    
    @IBAction func deleteAccountFromSetting(sender: AnyObject) {
    }
}