//
//  PiggyBankCollectionViewController.swift
//  PiggyBank
//
//  Created by Leon Chan on 28/6/2023.
//

import UIKit



class PiggyBankCollectionViewController: UICollectionViewController {

    var piggyBanks: [PiggyBank] = []
    var temp = ["aaa", "bbb", "eruhweyfghweyuifhweyuifhbwyuefhbuw"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempConstructPiggyBank()
    }
    
    func tempConstructPiggyBank() {
        var bank1 = PiggyBank(target: 1500, name: "PS5")
        var bank2 = PiggyBank(target: 2500, name: "Nintendo Switch")
        piggyBanks.append(bank1)
        piggyBanks.append(bank2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return temp.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PiggyCell", for: indexPath)
        if let piggyCell = cell as? PiggyCell
        {
            piggyCell.setCellName(to: temp[indexPath.row])
            cell = piggyCell
        }
        
        return cell
    }





}
