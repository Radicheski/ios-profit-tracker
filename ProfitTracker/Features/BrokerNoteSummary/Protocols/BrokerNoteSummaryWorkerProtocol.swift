//
//  BrokerNoteSummaryWorkerProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

protocol BrokerNoteSummaryWorkerProtocol: AnyObject {
    func loadData() -> [BrokerNote]
    func save()
    func discard()
    func insert()
    func present(fromIndex index: Int) -> BrokerNote
    func delete(fromIndex index: Int)
}
