//
//  LoginViewController.swift
//  NIBM-CAFE
//
//  Created by Udara Sachinthana on 2021-02-25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LoginButton: roundButton!
    
    @IBOutlet weak var ForgetPasswordButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() -> Void {
        
        //hide error lable
        ErrorLabel.alpha=0
        
        //style the elements
        
    }
    
    func validateFields() -> String? {
        if EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill all the fields."
        }
        
        return nil
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        //validate text fields
        let errormessage = validateFields()
        
        if errormessage != nil {
            showErrorMessage(message: errormessage!)
        }
        else {
            //cleaning data
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //login user
            Auth.auth().signIn(withEmail: email, password: password) { (results, error) in
                if error != nil {
                    self.showErrorMessage(message: "Login Error! Email or Password Wrong.")
                }
                else {
                    self.navigateHome()
                }
            }
        }
    }
    
    @IBAction func forgetPasswordTapped(_ sender: Any) {
    }
    
    func showErrorMessage(message: String) -> Void {
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
    func navigateHome() -> Void {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController) as? HomeViewController

        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
}
