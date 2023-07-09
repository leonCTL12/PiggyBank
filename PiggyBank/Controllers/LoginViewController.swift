//
//  LoginViewController.swift
//  PiggyBank
//
//  Created by Leon Chan on 29/6/2023.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
@IBOutlet weak var emailTextField: UITextField!

@IBOutlet weak var passwordTextField: UITextField!


override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
}


@IBAction func onRegisterButtonClicked(_ sender: Any) {
    if let email = emailTextField.text, let password = passwordTextField.text {
        Auth.auth().signIn(withEmail: email, password: password, completion: { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                goToCollectionView()
            }
            
        })
    }
    
    func goToCollectionView() {
        let repository = FirestoreDataRepository()
        guard let vc = storyboard?.instantiateViewController(identifier: K.SwiftID.collectionViewStoryboardID, creator: { coder in
            return PiggyBankCollectionViewController(coder: coder, using: repository)
        }) else {
            fatalError("Failed to load collection view")
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
}
