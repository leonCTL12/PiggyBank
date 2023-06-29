//
//  RegisterViewController.swift
//  PiggyBank
//
//  Created by Leon Chan on 29/6/2023.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

        
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onRegisterButtonClicked(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.returnToTitlePage()
                }
                
            })
        }
    }
    
    private func returnToTitlePage() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
}
