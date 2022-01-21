//
//  PortfolioConfiguratorProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import Foundation

protocol PortfolioConfiguratorProtocol {
    func build(for portfolioId: UUID) -> PortfolioViewProtocol
}
