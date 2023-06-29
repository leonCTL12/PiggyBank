//
//  ViewController.swift
//  PiggyBank
//
//  Created by Leon Chan on 27/6/2023.
//

import UIKit

class TitleViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func goToCollectionView() {
        let repository = RealmDataRepository()
        guard let vc = storyboard?.instantiateViewController(identifier: "PiggyBankCollectionViewController", creator: { coder in
            return PiggyBankCollectionViewController(coder: coder, using: repository)
        }) else {
            fatalError("Failed to load collection view")
        }
            
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onWithoutLoginClick(_ sender: UIButton) {
        goToCollectionView()
    }
    
}

