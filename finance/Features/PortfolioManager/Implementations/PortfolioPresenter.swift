//
//  PortfolioPresenter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import Foundation

class PortfolioPresenter: NSObject, PortfolioPresenterProtocol {
    
    weak var view: PortfolioViewProtocol?
    
    func load(data: [Portfolio]) {
        let viewModel = data.map { Portfolio.ViewModel(from: $0) }
        self.view?.updateView(with: viewModel)
    }
    
    func present(item: Portfolio) {
        let viewModel = Portfolio.ViewModel(from: item)
        self.view?.present(item: viewModel)
    }
    
    func askForConfirmation(_ completion: ((Bool) -> Void)?) {
        self.view?.askForConfirmation(completion)
    }
    
}
