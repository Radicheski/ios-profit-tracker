//
//  TransactionViewProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import UIKit

protocol TransactionViewProtocol where Self: UIViewController {
    var interactor: TransactionInteractorProtocol { get }
    var router: TransactionRouterProtocol { get }
    func loadData()
    func updateView(_ items: [Transaction.ViewModel])
    func present(fromIndex index: Int)
    func present(item: Transaction.ViewModel)
    func present(_ viewController: UIViewController)
    func insert()
    func delete(fromIndex index: Int)
}
