//
//  ViewController.swift
//  SmartEV
//
//  Created by Yuhan Dai on 6/20/16.
//  Copyright © 2016 Yuhan Dai. All rights reserved.
//

import UIKit
import QuartzCore
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: Constants
    let LoginToCarUsage = "LoginToCarUsage"
    
    // MARK: Outlets
    @IBOutlet weak var textFieldLoginEmail: UITextField!
    @IBOutlet weak var textFieldLoginPassword: UITextField!
    
    // MARK: Properties
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        if (FIRAuth.auth()?.currentUser != nil) { //error here
            self.showMainTabView()
        }
    }
    
    // MARK: Actions
    
    /**
     * Triger: user clicked on Log In button
     */
    @IBAction func loginDidTouch(sender: AnyObject) {
        
        /* DEVELOPING SIGN UP INITIAL STORY
        self.showNewUserView() */
        
        
        
        /*
         * Remove COMMENT WHEN FINISH SIGNUP STORY */
        // Sign In with credentials.
        let email = textFieldLoginEmail.text
        let password = textFieldLoginPassword.text
        
        // Sign in user use firebase
        self.SignInUser(email!, password: password!)
        
    }
    
    /**
     * Triger: user clicked on Sign Up button
     */
    @IBAction func signUpDidTouch(sender: AnyObject) {
        let email = textFieldLoginEmail.text
        let password = textFieldLoginPassword.text
                                     
        // create a vaild user in firebase
        self.CreateUser(email!, password: password!)
    }
    
    
    // MARK: helper functions
    
    func addErrorAlert(error: NSError, alertTitle: String){
        // alert user when error occurs
        let errorAlert = UIAlertController(title: alertTitle,
                                           message: "Please make sure your email and password are valid",
                                           preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .Default) { (action: UIAlertAction) -> Void in
                                        
        }
        errorAlert.addAction(okAction)
        
        self.presentViewController(errorAlert,
                                   animated: true,
                                   completion: nil)
        
    }
    
    func SignInUser(email: String, password: String){
        FIRAuth.auth()?.signInWithEmail(email, password: password) {
            (user, error) in
            if ((error) != nil) {
                print(error!.localizedDescription)
                let alertTitle = "Log In Error"
                self.addErrorAlert(error!, alertTitle: alertTitle)
                return
            }
            else {
                // sign in authenticated user
                //self.performSegueWithIdentifier(self.LoginToCarUsage, sender: nil)
                self.showMainTabView()
            }
        }
    }
    
    func CreateUser(email: String, password: String){
        FIRAuth.auth()?.createUserWithEmail(email, password: password) {
            (user, error) in
            if ((error) != nil) {
                print(error!.localizedDescription)
                let alertTitle = "Sign Up Error"
                self.addErrorAlert(error!, alertTitle: alertTitle)
                return
            }
            else {
                // Sign in user use firebase
                //self.SignInUser(email, password: password)
                FIRAuth.auth()?.signInWithEmail(email, password: password) {
                    (user, error) in //...
                }
                self.showNewUserView()
            }
        }
    }
    
    func showNewUserView(){
        let SignUpBoard = UIStoryboard(name: "SignUpInit", bundle: nil)
        let newUserVC = SignUpBoard.instantiateViewControllerWithIdentifier("SetUserNameView") as!SetUserNameViewController
        self.presentViewController(newUserVC, animated: true, completion: nil)
    }
    
    func showMainTabView(){
        let MainVC = self.storyboard?.instantiateViewControllerWithIdentifier("MainTabView") as!MainTabViewController
        self.presentViewController(MainVC, animated: true, completion: nil)
    }
    
}

