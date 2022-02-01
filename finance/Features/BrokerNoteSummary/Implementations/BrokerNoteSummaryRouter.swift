//
//  BrokerNoteSummaryRouter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import UIKit

class BrokerNoteSummaryRouter: BrokerNoteSummaryRouterProtocol {
    weak var view: BrokerNoteSummaryViewProtocol?
    
    func present(item: BrokerNote.ViewModel) {
        let configurator = BrokerNoteDetailConfigurator()
        let viewController = configurator.build(for: item.id)        
        self.view?.show(viewController, sender: nil)
    }
    
}
