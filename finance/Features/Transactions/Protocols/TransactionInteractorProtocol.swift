//
//  TransactionInteractorProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

protocol TransactionInteractorProtocol {
    var presenter: TransactionPresenterProtocol { get }
    var worker: TransactionWorkerProtocol { get }
    func loadData()
    func save()
    func discard()
    func present(fromIndex index: Int)
    func insert()
    func delete(fromIndex index: Int)
}
