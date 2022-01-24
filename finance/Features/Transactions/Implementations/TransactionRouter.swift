//
//  TransactionRouter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

class TransactionRouter: TransactionRouterProtocol {
    weak var view: TransactionViewProtocol?
    
    func present(item: Transaction.ViewModel) {
        let vc = UpdateTransactionViewController()
        vc.sheetPresentationController?.detents = [.medium()]
        vc.onDismiss = { self.view?.loadData() }
        vc.item = item
        self.view?.present(vc)
    }
}
