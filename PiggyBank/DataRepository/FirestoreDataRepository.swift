//
//  FirestoreDataRepository.swift
//  PiggyBank
//
//  Created by Leon Chan on 9/7/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirestoreDataRepository: DataRepositoryProtocol {
    let db = Firestore.firestore()
    
    func savePiggyBank(_ bank: PiggyBank) {
        if let owner = Auth.auth().currentUser?.email {
            db.collection(K.Firestore.collectionName).addDocument(data: [
                K.Firestore.bankNameFieldName: bank.name,
                K.Firestore.targetAmountFieldName: bank.target,
                K.Firestore.currentAmountFieldName: bank.amount,
                K.Firestore.ownerFieldName: owner
            ]) {
                (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                } else {
                    print("Successfully saved data")
                }
            }
        }
    }
    
    func getPiggyBanks() -> [PiggyBank] {
            return []
    }
    
    func increasePiggyBankAmount(_ bank: PiggyBank, _ amount: Float) {
            
    }
    
    func deletePiggyBank(_ bank: PiggyBank) {
            
    }
    
    
}
