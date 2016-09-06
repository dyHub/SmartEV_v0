//
//  SetUserNameViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 6/21/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SetUserNameViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Constants
    let user = FIRAuth.auth()?.currentUser
    
    // MARK: Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    
    var NextBackground: UIColor!
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        userNameTextField.delegate = self

        UserNameLabel.text = ""
        
        // disable next button
        NextButton.enabled = false
        NextBackground = NextButton.backgroundColor
        NextButton.backgroundColor = UIColor.lightGrayColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // MARK: Actions
    @IBAction func SaveAction(sender: AnyObject) {
        if (userNameTextField.text?.isEmpty == true) {
            addErrorAlert()
        } else {
            UserNameLabel.text = userNameTextField.text
            // enable next button
            NextButton.enabled = true
            NextButton.backgroundColor = NextBackground
            
            // save user's name on firebase
            user?.profileChangeRequest().displayName = UserNameLabel.text
        }
    }
    
    func addErrorAlert(){
        // alert user when error occurs
        let errorAlert = UIAlertController(title: "Error",
                                           message: "Please enter a valid user name",
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
