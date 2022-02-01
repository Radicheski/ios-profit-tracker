//
//  BrokerNoteDetailViewProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import UIKit

protocol BrokerNoteDetailViewProtocol: UIViewController {
    var interactor: BrokerNoteDetailInteractorProtocol { get }
    var router: BrokerNoteDetailRouterProtocol { get }
    func loadData()
    func presentData(item: [Section])
}
