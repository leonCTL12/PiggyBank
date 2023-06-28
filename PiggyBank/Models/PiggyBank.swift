//
//  PiggyBank.swift
//  PiggyBank
//
//  Created by Leon Chan on 28/6/2023.
//

import Foundation

class PiggyBank {
    private var _name: String;
    public var name: String {
        get {
            return _name
        }
    }
    
    private var _amount: Float;
    
    public var amount: Float {
        get {
            return _amount
        }
    }
    private var _target: Float
    
    private var target: Float {
        get {
            return _target
        }
    }
    
    init(target: Float, name: String) {
        self._target = target
        self._name = name
        self._amount = 0
    }
    
    public func changeTarget(to amount: Float) {
        _target = amount
    }
    
    public func addToSavingPool(by amount: Float) {
        _amount += amount
    }
}
