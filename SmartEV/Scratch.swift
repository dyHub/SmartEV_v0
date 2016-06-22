//
//  Scratch.swift
//  SmartEV
//
//  Created by Yuhan Dai on 6/21/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//
/*

import Foundation

func signUpDidTouch(sender: AnyObject) {
    let alert = UIAlertController(title: "Register",
                                  message: "Register",
                                  preferredStyle: .Alert)
    
    let saveAction = UIAlertAction(title: "Save",
                                   style: .Default) { (action: UIAlertAction) -> Void in
                                    
                                    //let userNameField = alert.textFields![0]
                                    let emailField = alert.textFields![1]
                                    let passwordField = alert.textFields![2]
                                    
                                    // create a vaild user in firebase
                                    self.CreateUser(emailField.text!, password: passwordField.text!)
    }
    
    let cancelAction = UIAlertAction(title: "Cancel",
                                     style: .Default) { (action: UIAlertAction) -> Void in
    }
    
    // add user name
    alert.addTextFieldWithConfigurationHandler {
        (textUserName) -> Void in
        textUserName.placeholder = "Enter user name"
    }
    
    
    // add email text
    alert.addTextFieldWithConfigurationHandler {
        (textEmail) -> Void in
        textEmail.placeholder = "Enter your email"
    }
    
    // add password text
    alert.addTextFieldWithConfigurationHandler {
        (textPassword) -> Void in
        textPassword.secureTextEntry = true
        textPassword.placeholder = "Enter your password"
    }
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    presentViewController(alert,
                          animated: true,
                          completion: nil)
}
 
*/
