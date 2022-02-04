//
//  BrokerNoteDetailInteractor.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import Foundation

class BrokerNoteDetailInteractor: BrokerNoteDetailInteractorProtocol {

    var presenter: BrokerNoteDetailPresenterProtocol
    var worker: BrokerNoteDetailWorkerProtocol
    
    init(presenter: BrokerNoteDetailPresenterProtocol, worker: BrokerNoteDetailWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func loadData() {
        let data = self.worker.loadData()
        self.presenter.loadData(note: data[0])
    }
    
    func save() {
        self.worker.save()
    }
    
}
