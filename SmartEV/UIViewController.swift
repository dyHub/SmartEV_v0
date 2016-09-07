//
//  UIViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 9/6/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func addErrorAlert(errorMessage: String, alertTitle: String){
        // alert user when error occurs
        let errorAlert = UIAlertController(title: alertTitle,
                                           message: errorMessage,
                                           preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .Default) { (action: UIAlertAction) -> Void in
                                        
        }
        errorAlert.addAction(okAction)
        
        self.presentViewController(errorAlert,
                                   animated: true,
                                   completion: nil)
        
    }
}
