//
//  PortfolioRouter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import Foundation

class PortfolioRouter: NSObject, PortfolioRouterProtocol {
    weak var view: PortfolioViewProtocol?
    
    func present(item: Portfolio.ViewModel) {
        let configurator = PortfolioConfigurator()
        let viewController = configurator.build(for: UUID(uuidString: item.id.value)!)
        self.view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func update(item: Portfolio.ViewModel) {
        let viewController = UpdateViewController()
        viewController.viewModel = item
        self.view?.present(viewController)
    }
}
