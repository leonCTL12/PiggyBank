//
//  DataRepostioryProtocol.swift
//  PiggyBank
//
//  Created by Leon Chan on 29/6/2023.
//

import Foundation

protocol DataRepositoryProtocol {
    func savePiggyBank(_ bank: PiggyBank)
    func getPiggyBanks() -> [PiggyBank]
    //I agree this signature is werid, yet update implementation of Realm force me to do so
    func increasePiggyBankAmount(_ bank: PiggyBank, _ amount: Float)
    func deletePiggyBank(_ bank: PiggyBank)
}
