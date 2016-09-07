//
//  ChangeUserNameViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 6/22/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChangeUserNameViewController: UIViewController {
    
    // MARK: Constants
    let user = FIRAuth.auth()?.currentUser
    
    // MARK: Outlets
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var saveUserNameButton: UIButton!
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        UserNameTextField.text = user?.displayName ?? user?.email
    }
    
    // MARK: Actions
    @IBAction func changeName(sender: AnyObject) {
        if (UserNameTextField.text?.isEmpty == true) {
            addErrorAlert("Please enter a valid user name", alertTitle: "Change Name Error")
        } else {
            // save user's name on firebase
            let changeRequest = user?.profileChangeRequest()
            changeRequest!.displayName = UserNameTextField.text
            
            changeRequest!.commitChangesWithCompletion { error in
                if error != nil {
                    // An error happened.
                    debugPrint("error")
                    self.addErrorAlert(error!.localizedDescription, alertTitle: "Change Name Error");
                } else {
                    // Profile updated.
                    self.saveUserNameButton.enabled = false
                    self.navigationController?.popViewControllerAnimated(true)
                }
            }
        }
    }
    
}
