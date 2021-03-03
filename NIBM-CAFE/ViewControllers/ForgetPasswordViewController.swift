//
//  ForgetPasswordViewController.swift
//  NIBM-CAFE
//
//  Created by Udara Sachinthana on 2021-02-28.
//

import UIKit
import Firebase

class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var submitButton: roundButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() -> Void {
        
        //hide error lable
        errorLabel.alpha=0
        
        //style the elements
        
    }
    
    func validateFields() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill all the fields."
        }
        
        return nil
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        let errorMessage = validateFields()
        
        if errorMessage != nil{
            showErrorMessage(message: errorMessage!)
        }
        else {
            //cleaning fields
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                if error != nil {
                    self.showErrorMessage(message: "Please Enter Valid Email Address")
                }
                else {
                    
                }
            }
        }
    }
    
    func showErrorMessage(message: String) -> Void {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    

}
