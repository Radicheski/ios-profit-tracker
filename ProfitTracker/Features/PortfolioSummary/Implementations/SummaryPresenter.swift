//
//  SummaryPresenter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

class SummaryPresenter: SummaryPresenterProtocol {
    weak var view: SummaryViewProtocol?

    func loadData(_ items: [SummaryItem]) {
        let data = items.map { SummaryItem.ViewModel(from: $0) }
        self.view?.updateView(with: data)
    }
}
