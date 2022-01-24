//
//  TransactionRouterProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

protocol TransactionRouterProtocol {
    var view: TransactionViewProtocol? { get }
    func present(item: Transaction.ViewModel)
}
