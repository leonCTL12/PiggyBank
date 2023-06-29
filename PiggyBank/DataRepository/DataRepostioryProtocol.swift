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
    func updatePiggyBanks(_ bank: PiggyBank)
    func deletePiggyBank(_ bank: PiggyBank)
}
