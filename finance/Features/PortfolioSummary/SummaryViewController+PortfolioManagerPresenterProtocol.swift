//
//  SummaryViewController+PortfolioManagerPresenterProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import Foundation

extension SummaryViewController: OldPortfolioManagerPresenterProtocol {

    func load(data: [PortfolioItem]) {
        self.data = data
        self.viewController?.updateView()
    }

}
