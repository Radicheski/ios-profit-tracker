//
//  TransactionInteractor.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

class TransactionInteractor: TransactionInteractorProtocol {
    var presenter: TransactionPresenterProtocol
    var worker: TransactionWorkerProtocol
    
    init(presenter: TransactionPresenterProtocol, worker: TransactionWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func loadData() {
        let data = self.worker.loadData()
        self.presenter.loadData(data)
    }
    
    func save() {
        self.worker.save()
    }
    
    func discard() {
        self.worker.discard()
    }
    
    func present(fromIndex index: Int) {
        let item = self.worker.present(fromIndex: index)
        self.presenter.present(item: item)
    }
    
    func insert() {
        self.worker.insert()
        self.loadData()
    }
    
    func delete(fromIndex index: Int) {
        self.worker.delete(fromIndex: index)
        self.loadData()
    }
}
