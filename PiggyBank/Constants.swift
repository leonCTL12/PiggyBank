//
//  Constants.swift
//  PiggyBank
//
//  Created by Leon Chan on 9/7/2023.
//

import Foundation

struct K {
    struct SwiftID {
        static let collectionViewStoryboardID = "PiggyBankCollectionViewController"
        static let piggyCellID = "PiggyCell"
        static let detailViewStoryboardID = "PiggyDetailViewController"
    }
    
    struct Firestore {
        static let collectionName = "PiggyBanks"
        static let currentAmountFieldName = "CurrentAmount"
        static let bankNameFieldName = "Name"
        static let targetAmountFieldName = "TargetAmount"
        static let ownerFieldName = "User"
    }
    
}
