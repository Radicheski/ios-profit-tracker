//
//  TransactionPresenterProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

protocol TransactionPresenterProtocol {
    var view: TransactionViewProtocol? { get }
    func loadData(_ data: [Transaction])
    func present(item: Transaction)
}
