//
//  PiggyDetailViewController.swift
//  PiggyBank
//
//  Created by Leon Chan on 28/6/2023.
//

import UIKit
import RealmSwift

class PiggyDetailViewController: UIViewController {
    
    var bank: PiggyBank?

    @IBOutlet private weak var targetLabel: UILabel!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    @IBOutlet private weak var amountLabel: UILabel!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    let realm = try! Realm()
    
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
    
    @IBAction func onAddButtonClicked(_ sender: UIButton) {
        guard let amount = Float(amountTextField.text!) else { return }
        
        addAmountToPiggyBank(by: amount)
        
        configureView()
        
    }
    
    private func addAmountToPiggyBank(by amount: Float) {
        do {
            try realm.write {
                bank?.addToSavingPool(by: amount)
            }
        } catch {
            fatalError("Cannot update the bank amount")
        }
    }
    
    
}
