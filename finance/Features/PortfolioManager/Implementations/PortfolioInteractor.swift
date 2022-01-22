//
//  PortfolioInteractor.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import Foundation

class PortfolioInteractor: NSObject, PortfolioInteractorProtocol {
    
    var presenter: PortfolioPresenterProtocol
    var worker: PortfolioWorkerProtocol
    
    init(presenter: PortfolioPresenterProtocol, worker: PortfolioWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func loadData() {
        let data = self.worker.loadData()
        self.presenter.load(data: data)
    }
    
    func present(fromIndex index: Int) {
        let data = self.worker.loadData()
        self.presenter.present(item: data[index])
    }
    
    func insert() {
        let data = self.worker.insert()
        self.presenter.load(data: data)
    }
    
    func delete(fromIndex index: Int) {
        self.worker.delete(fromIndex: index)
        self.loadData()
    }
    
    func move(from startIndex: Int, to endIndex: Int) {
        self.worker.move(from: startIndex, to: endIndex)
    }
    
    func save() {
        self.worker.save()
    }
    
    func discard() {
        self.worker.discard()
        self.loadData()
    }

}
