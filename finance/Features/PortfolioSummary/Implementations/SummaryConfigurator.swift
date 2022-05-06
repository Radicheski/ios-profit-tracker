//
//  SummaryConfigurator.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 22/01/22.
//

import Foundation
import UIKit

class SummaryConfigurator: SummaryConfiguratorProtocol {

    func build() -> SummaryViewProtocol {
        let router = SummaryRouter()
        let worker = SummaryWorker()

        let presenter = SummaryPresenter()

        let interactor = SummaryInteractor(presenter: presenter, worker: worker)

        let viewController = SummaryViewController(interactor: interactor, router: router)
        presenter.view = viewController
        router.view = viewController

        viewController.loadData()

        return viewController
    }

}
