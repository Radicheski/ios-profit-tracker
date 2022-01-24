//
//  TransactionPresenter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

class TransactionPresenter: TransactionPresenterProtocol {
    weak var view: TransactionViewProtocol?
    
    func loadData(_ data: [Transaction]) {
        let data = data.map { Transaction.ViewModel(from: $0) }
        self.view?.updateView(data)
    }
    
    func present(item: Transaction) {
        self.view?.present(item: Transaction.ViewModel(from: item))
    }
    
}
