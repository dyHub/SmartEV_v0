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
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        UserNameTextField.text = user?.displayName ?? user?.email
    }
    
    // MARK: Actions
    @IBAction func changeName(sender: AnyObject) {
        if (UserNameTextField.text?.isEmpty == true) {
            addErrorAlert()
        } else {
            // save user's name on firebase
            user?.profileChangeRequest().displayName = UserNameTextField.text
            self.navigationController?.popViewControllerAnimated(true)
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
