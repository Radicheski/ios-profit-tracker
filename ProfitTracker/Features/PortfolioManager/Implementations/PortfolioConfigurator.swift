//
//  PortfolioConfigurator.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import Foundation

class PortfolioConfigurator: PortfolioConfiguratorProtocol {

    func build(for portfolioId: UUID) -> PortfolioViewProtocol {
        let router = PortfolioRouter()
        let worker = PortfolioWorker(portfolioId: portfolioId)

        let presenter = PortfolioPresenter()

        let interactor = PortfolioInteractor(presenter: presenter, worker: worker)

        let viewController = PortfolioViewController(interactor: interactor, router: router)
        presenter.view = viewController
        router.view = viewController

        viewController.loadData()

        return viewController
    }

}
