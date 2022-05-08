//
//  BrokerNoteSummaryConfigurator.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

class BrokerNoteSummaryConfigurator: BrokerNoteSummaryConfiguratorProtocol {

    func build() -> BrokerNoteSummaryViewProtocol {
        let router = BrokerNoteSummaryRouter()
        let worker = BrokerNoteSummaryWorker()

        let presenter = BrokerNoteSummaryPresenter()

        let interactor = BrokerNoteSummaryInteractor(presenter: presenter, worker: worker)

        let viewController = BrokerNoteSummaryViewController(interactor: interactor, router: router)
        presenter.view = viewController
        router.view = viewController

        viewController.loadData()

        return viewController
    }

}
