//
//  BrokerNoteDetailWorkerProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import Foundation

protocol BrokerNoteDetailWorkerProtocol: AnyObject {
    init(id: UUID)
    func loadData() -> [BrokerNote]
    func save()
    func insertTransaction() -> Transaction
}
