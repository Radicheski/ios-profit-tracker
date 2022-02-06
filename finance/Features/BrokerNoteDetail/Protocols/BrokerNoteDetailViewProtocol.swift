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
    var saveAction: ((UIAction) -> Void) { get set }
    func loadData()
    func insertTransaction()
    func insertTransaction(_ transaction: Row)
    func presentData(item: [Section])
}
