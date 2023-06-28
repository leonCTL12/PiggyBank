//
//  PiggyBank.swift
//  PiggyBank
//
//  Created by Leon Chan on 28/6/2023.
//

import Foundation
import RealmSwift

class PiggyBank: Object {
    @objc dynamic var name: String = ""
    
    @objc dynamic var target: Float = 0.0
    
    @objc dynamic var amount: Float = 0

    
    public func changeTarget(to amount: Float) {
        target = amount
    }
    
    public func addToSavingPool(by amount: Float) {
        self.amount += amount
    }
    
    public func initialise(withName name: String, withTarget target: Float) {
        self.name = name
        self.target = target
    }
}
