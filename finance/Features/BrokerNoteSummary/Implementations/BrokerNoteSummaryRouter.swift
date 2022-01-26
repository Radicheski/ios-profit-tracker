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
        let vc = BrokerNoteUpdateViewController()
        vc.item = item
        self.view?.present(vc, animated: true, completion: nil)
    }
}
