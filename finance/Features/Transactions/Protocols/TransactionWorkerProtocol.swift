//
//  TransactionWorkerProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

protocol TransactionWorkerProtocol {
    func loadData() -> [Transaction]
    func save()
    func discard()
    func present(fromIndex index: Int) -> Transaction
    func insert()
    func delete(fromIndex index: Int)
}
