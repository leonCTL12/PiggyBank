//
//  RealmDataRepository.swift
//  PiggyBank
//
//  Created by Leon Chan on 29/6/2023.
//

import Foundation
import RealmSwift

class RealmDataRepository: DataRepositoryProtocol {
    
    let realm = try! Realm()
    
    func savePiggyBank(_ bank: PiggyBank) {
        do {
            try realm.write {
                realm.add(bank)
            }
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    func getPiggyBanks() -> [PiggyBank] {
        let piggyBanks = realm.objects(PiggyBank.self)
        return Array(piggyBanks)
    }
    
    func updatePiggyBanks(_ bank: PiggyBank) {
        
    }
    
    func deletePiggyBank(_ bank: PiggyBank) {
        
    }
    
    
}
