//
//  BrokerNoteDetailConfigurator.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import Foundation

class BrokerNoteDetailConfigurator: BrokerNoteDetailConfiguratorProtocol {
    
    func build(for id: UUID) -> BrokerNoteDetailViewProtocol {
        let router = BrokerNoteDetailRouter()
        let worker = BrokerNoteDetailWorker(id: id)
        
        let presenter = BrokerNoteDetailPresenter()
        
        let interactor = BrokerNoteDetailInteractor(presenter: presenter, worker: worker)
        
        let viewController = BrokerNoteDetailViewController(interactor: interactor, router: router)
        presenter.view = viewController
        router.view = viewController
        
        viewController.loadData()
        
        return viewController
    }
    
}
