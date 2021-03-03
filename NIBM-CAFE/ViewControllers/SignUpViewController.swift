//
//  SignUpViewController.swift
//  NIBM-CAFE
//
//  Created by Udara Sachinthana on 2021-02-25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var MobileNumberTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var SignUpButton: roundButton!
    
    @IBOutlet weak var LoginButton: roundButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() -> Void {
        
        //hide the error label
        ErrorLabel.alpha=0
        
        //style the elements
        
    }
    
    func validateFields() -> String? {
        
        //check if all fields are filled
        if EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || MobileNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill all the fields."
        }
        
        //password strength
        let validatePassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if validation.isPasswordValid(password: validatePassword) == false {
            //password strength is low
            return "Please enter a password with at least 8 charactors, contains a special charactor and a number"
        }
        
        return nil
    }

    @IBAction func signUpTapped(_ sender: Any) {
        
        //validate the fields
        let errormessage = validateFields()
        
        if errormessage != nil {
            showErrorMessage(message: errormessage!)
        }
        else {
            //cleaning data
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let mobileNo = MobileNumberTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //create user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //chech for errors
                if err != nil {
                    //if this block runs it means 'err' has an Error
                    self.showErrorMessage(message: "There was a error while creating new user.")
                }
                else {
                    //user created successfully and store mobile number
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["mobile_No": mobileNo, "uid" : result!.user.uid]) { (error) in
                        if error != nil {
                            self.showErrorMessage(message: "Error saving user data")
                        }
                    }
                }
                
                //navigate to home screen
                self.navigateHome()
            }
            
            
        }
        
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
