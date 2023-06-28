//
//  PiggyBankCollectionViewController.swift
//  PiggyBank
//
//  Created by Leon Chan on 28/6/2023.
//

import UIKit
import RealmSwift


class PiggyBankCollectionViewController: UICollectionViewController {

    var piggyBanks: [PiggyBank] = []
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return piggyBanks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PiggyCell", for: indexPath)
        if let piggyCell = cell as? PiggyCell
        {
            piggyCell.setCellName(to: piggyBanks[indexPath.row].name)
            cell = piggyCell
        }
        
        return cell
    }



    @IBAction func onAddButtonClicked(_ sender: UIBarButtonItem) {
        var nameTextField = UITextField()
        var targetTextField = UITextField()
        
        let popUp = UIAlertController(title: "Start a new saving!", message: "", preferredStyle: .alert)
        
        popUp.addTextField() { (textField) in
            textField.placeholder = "Name of the piggy bank"
            nameTextField = textField
        }
        popUp.addTextField() { (textField) in
            textField.placeholder = "Target amount"
            targetTextField = textField
        }
        
        let confirmAction = UIAlertAction(title: "Create", style: .default) { (action) in
            if let target = Float(targetTextField.text!) {
                let bank = PiggyBank()
                bank.initialise(withName: nameTextField.text!, withTarget: target)
                self.savePiggyBank(piggyBank: bank)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        popUp.addAction(confirmAction)
        popUp.addAction(cancelAction)
        
        present(popUp, animated: true)
    }
    
    //TODO: Extract it into a repository
    func savePiggyBank(piggyBank bank: PiggyBank) {
        do {
            try realm.write {
                realm.add(bank)
            }
        } catch {
            print("Error saving context: \(error)")
        }
    }
    

}
