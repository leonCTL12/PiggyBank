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
    
    var selectedBank: PiggyBank?
    
    let repository: DataRepositoryProtocol
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
    }
    
    init?(coder:NSCoder, using repository: DataRepositoryProtocol) {
        self.repository = repository
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

    //MARK: - Collection View Data Source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return piggyBanks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PiggyCell", for: indexPath)
        if let piggyCell = cell as? PiggyCell
        {
            let bank = piggyBanks[indexPath.row]
            
            piggyCell.configure(withPiggyBank: bank)
            cell = piggyCell
        }
        return cell
    }

    //MARK: - Event
    @IBAction func onAddButtonClicked(_ sender: UIBarButtonItem) {
        let popUp = constructPopUp()
        
        present(popUp, animated: true)
    }
    
    private func constructPopUp() -> UIAlertController {
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
                self.repository.savePiggyBank(bank)
                self.refreshData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        popUp.addAction(confirmAction)
        popUp.addAction(cancelAction)
        
        return popUp
    }
    
    
    //MARK: - Collection View Delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedBank = piggyBanks[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "goToDetail" {
            return
        }
        guard let destinationVC = segue.destination as? PiggyDetailViewController else { fatalError("Destination is not detailed view") }
  
        destinationVC.bank = selectedBank   
    }
    
    //MARK: - General
    private func refreshData() {
        self.piggyBanks = self.repository.getPiggyBanks()
        self.collectionView.reloadData()
    }


}
