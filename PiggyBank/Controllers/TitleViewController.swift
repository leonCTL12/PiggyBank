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
        
        performSegue(withIdentifier: "NoLoginSegue", sender: self)
    }
    

    @IBAction func onWithoutLoginClick(_ sender: UIButton) {
        goToCollectionView()
    }
    
}

