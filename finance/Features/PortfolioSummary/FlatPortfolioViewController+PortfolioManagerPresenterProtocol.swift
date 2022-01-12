//
//  FlatPortfolioViewController+PortfolioManagerPresenterProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import Foundation

extension FlatPortfolioViewController: PortfolioManagerPresenterProtocol {

    func load(data: [PortfolioItem]) {
        self.data = data
        self.viewController?.updateView()
    }

}
