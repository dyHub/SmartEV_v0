//
//  SetHomeLocViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 6/21/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//

import UIKit

class SetHomeLocViewController: UIViewController {
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: Actions
    
    @IBAction func SaveAction(sender: AnyObject) {
        showMainTabPage()
    }
    
    @IBAction func SkipAction(sender: AnyObject) {
        showMainTabPage()
    }
    
    // MARK: helper functions
    func showMainTabPage(){
        let MainBoard = UIStoryboard(name: "Main", bundle: nil)
        let MainVC = MainBoard.instantiateViewControllerWithIdentifier("MainTabView") as!MainTabViewController
        self.presentViewController(MainVC, animated: true, completion: nil)
    }
}