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
    
    func getPiggyBanks(completion: @escaping ([PiggyBank]) -> Void) {
        var banks:[PiggyBank] = []
        
        if let owner = Auth.auth().currentUser?.email {
            let query = db.collection(K.Firestore.collectionName).whereField(K.Firestore.ownerFieldName, isEqualTo: owner)
            query.getDocuments{ (querySnapshot, error) in
                    
                    if let e = error {
                        print("There was an issue retrieving data from firestore. \(e)")
                    } else {
                        if let snapshotDocuments = querySnapshot?.documents {
                            for doc in snapshotDocuments {
                                let data = doc.data()
                                if let name = data[K.Firestore.bankNameFieldName] as? String, let targetAmount = data[K.Firestore.targetAmountFieldName] as? Float, let currentAmount = data[K.Firestore.currentAmountFieldName] as? Float
                                {
                                    let bank = PiggyBank()
                                    bank.initialise(withName: name, withTarget: targetAmount, withAmount: currentAmount)
                                    banks.append(bank)
                                }
                            }
                            
                            completion(banks)
                        }
                    }
                    
                }
        }
    }
    
    func increasePiggyBankAmount(_ bank: PiggyBank, _ amount: Float) {
            
    }
    
    func deletePiggyBank(_ bank: PiggyBank) {
            
    }
    
    
}
