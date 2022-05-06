//
//  SummaryInteractor.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

class SummaryInteractor: SummaryInteractorProtocol {

    var presenter: SummaryPresenterProtocol
    var worker: SummaryWorkerProtocol

    init(presenter: SummaryPresenterProtocol, worker: SummaryWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }

    func loadData() {
        let data = self.worker.loadData()
        self.presenter.loadData(data)
    }

}
