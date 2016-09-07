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
            addErrorAlert("Please enter a valid user name", alertTitle: "Set Name Error")
        } else {
            // save user's name on firebase
            let changeRequest = user?.profileChangeRequest()
            changeRequest!.displayName = userNameTextField.text
            
            changeRequest!.commitChangesWithCompletion { error in
                if error != nil {
                    // An error happened.
                    debugPrint("error")
                    self.addErrorAlert(error!.localizedDescription, alertTitle: "Set Name Error");
                } else {
                    // Profile updated.
                    self.UserNameLabel.text = self.user?.displayName
                    
                    // enable next button
                    self.NextButton.enabled = true
                    self.NextButton.backgroundColor = self.NextBackground
                    self.navigationController?.popViewControllerAnimated(true)
                }
            }

        }
    }
    
}
