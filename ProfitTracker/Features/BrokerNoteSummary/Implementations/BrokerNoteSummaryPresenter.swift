//
//  BrokerNoteSummaryPresenter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

class BrokerNoteSummaryPresenter: BrokerNoteSummaryPresenterProtocol {
    weak var view: BrokerNoteSummaryViewProtocol?

    func loadData(_ data: [BrokerNote]) {
        let data = data.map { BrokerNote.ViewModel(from: $0) }
        self.view?.loadData(data)
    }

    func present(item: BrokerNote) {
        self.view?.present(item: BrokerNote.ViewModel(from: item))
    }
}
