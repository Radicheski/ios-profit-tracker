//
//  BrokerNoteSummaryInteractor.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

class BrokerNoteSummaryInteractor: BrokerNoteSummaryInteractorProtocol {
    var presenter: BrokerNoteSummaryPresenterProtocol
    var worker: BrokerNoteSummaryWorkerProtocol
    
    init(presenter: BrokerNoteSummaryPresenterProtocol, worker: BrokerNoteSummaryWorkerProtocol) {
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
        self.loadData()
    }
    
    func insert() {
        self.worker.insert()
        self.loadData()
    }
    
    func present(fromIndex index: Int) {
        let item = self.worker.present(fromIndex: index)
        self.presenter.present(item: item)
    }
    
    func delete(fromIndex index: Int) {
        self.worker.delete(fromIndex: index)
        self.loadData()
    }
    
}
