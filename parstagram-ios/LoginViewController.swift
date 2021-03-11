//
//  LoginViewController.swift
//  parstagram-ios
//
//  Created by Berk Burak Tasdemir on 3/11/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameTextField.text!
        let password = usernameTextField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = usernameTextField.text
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
}
