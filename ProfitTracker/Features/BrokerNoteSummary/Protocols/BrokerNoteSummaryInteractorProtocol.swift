//
//  BrokerNoteSummaryInteractorProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

protocol BrokerNoteSummaryInteractorProtocol: AnyObject {
    var presenter: BrokerNoteSummaryPresenterProtocol { get }
    var worker: BrokerNoteSummaryWorkerProtocol { get }
    func loadData()
    func save()
    func discard()
    func present(fromIndex index: Int)
    func insert()
    func delete(fromIndex index: Int)
}
