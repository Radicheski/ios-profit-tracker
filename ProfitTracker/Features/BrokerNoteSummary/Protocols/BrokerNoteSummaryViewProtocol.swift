//
//  BrokerNoteSummaryViewProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import UIKit

protocol BrokerNoteSummaryViewProtocol where Self: UIViewController {
    var interactor: BrokerNoteSummaryInteractorProtocol { get }
    var router: BrokerNoteSummaryRouterProtocol { get }
    func loadData()
    func loadData(_ data: [BrokerNote.ViewModel])
    func insert()
    func present(fromIndex index: Int)
    func present(item: BrokerNote.ViewModel)
    func delete(fromIndex index: Int)
}
