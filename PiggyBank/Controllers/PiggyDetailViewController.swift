//
//  PiggyDetailViewController.swift
//  PiggyBank
//
//  Created by Leon Chan on 28/6/2023.
//

import UIKit

class PiggyDetailViewController: UIViewController {
    
    var bank: PiggyBank?

    @IBOutlet private weak var targetLabel: UILabel!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    @IBOutlet private weak var amountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        guard let piggyBank = bank else {
            fatalError("Bank not found")
        }
        nameLabel.text = piggyBank.name
        targetLabel.text = "Target: $\(piggyBank.target)"
        amountLabel.text = "Saved Amount: $\(piggyBank.amount)"
    }
    
    
}
