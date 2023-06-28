//
//  PiggyCell.swift
//  PiggyBank
//
//  Created by Leon Chan on 27/6/2023.
//

import UIKit

class PiggyCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    
    func configure(withPiggyBank piggyBank: PiggyBank) {
        nameLabel?.text = piggyBank.name
    }
}
