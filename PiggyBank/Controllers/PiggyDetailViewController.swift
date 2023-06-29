//
//  PiggyDetailViewController.swift
//  PiggyBank
//
//  Created by Leon Chan on 28/6/2023.
//

import UIKit
import RealmSwift

class PiggyDetailViewController: UIViewController {
    
    @IBOutlet private weak var targetLabel: UILabel!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    @IBOutlet private weak var amountLabel: UILabel!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    private var bank: PiggyBank
    private var repository: DataRepositoryProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    init?(coder: NSCoder, repository: DataRepositoryProtocol, bank: PiggyBank) {
        self.bank = bank
        self.repository = repository
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
          fatalError("You must create this view controller with a user.")
      }
    
    private func configureView() {
        nameLabel.text = bank.name
        targetLabel.text = "Target: $\(bank.target)"
        amountLabel.text = "Saved Amount: $\(bank.amount)"
    }
    
    @IBAction func onAddButtonClicked(_ sender: UIButton) {
        guard let amount = Float(amountTextField.text!) else { return }

        repository.increasePiggyBankAmount(bank, amount)
        configureView()
    }
    
    @IBAction func onBreakButtonClicked(_ sender: UIButton) {

        repository.deletePiggyBank(bank)
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
        
    }
}
