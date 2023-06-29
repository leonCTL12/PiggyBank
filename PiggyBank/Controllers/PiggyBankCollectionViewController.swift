//
//  PiggyBankCollectionViewController.swift
//  PiggyBank
//
//  Created by Leon Chan on 28/6/2023.
//

import UIKit
import RealmSwift


class PiggyBankCollectionViewController: UICollectionViewController {

    var piggyBanks: Results<PiggyBank>?
    
    let realm = try! Realm()
    
    var selectedBank: PiggyBank?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRealm()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return piggyBanks?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PiggyCell", for: indexPath)
        if let piggyCell = cell as? PiggyCell
        {
            if let bank = piggyBanks?[indexPath.row] {
                piggyCell.configure(withPiggyBank: bank)
                cell = piggyCell
            }
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
                self.collectionView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        popUp.addAction(confirmAction)
        popUp.addAction(cancelAction)
        
        present(popUp, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedBank = piggyBanks?[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "goToDetail" {
            return
        }
        
        guard let destinationVC = segue.destination as? PiggyDetailViewController else { fatalError("Destination is not detailed view") }
        
  
        destinationVC.bank = selectedBank   
    }
    
    //MARK: - Save Load
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
    
    private func loadRealm() {
        piggyBanks = realm.objects(PiggyBank.self)
        collectionView.reloadData()
    }
}
