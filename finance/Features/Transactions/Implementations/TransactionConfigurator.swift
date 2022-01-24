//
//  TransactionConfigurator.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

class TransactionConfigurator: TransactionConfiguratorProtocol {
    
    func build() -> TransactionViewProtocol {
        let router = TransactionRouter()
        let worker = TransactionWorker()
        
        let presenter = TransactionPresenter()
        
        let interactor = TransactionInteractor(presenter: presenter, worker: worker)
        
        let viewController = TransactionViewController(interactor: interactor, router: router)
        presenter.view = viewController
        router.view = viewController
        
        viewController.loadData()
        
        return viewController
    }
    
}
