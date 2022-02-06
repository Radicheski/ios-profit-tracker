//
//  BrokerNoteDetailWorker.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import Foundation

class BrokerNoteDetailWorker: BrokerNoteDetailWorkerProtocol {
    
    private(set) var brokerNoteId: UUID
    private let context = Persistence.shared.context
    
    required init(id: UUID) {
        self.brokerNoteId = id
    }
    
    func loadData() -> [BrokerNote] {
        let request = BrokerNote.createFetchRequest()
        request.predicate = NSPredicate(format: "id == %@", argumentArray: [self.brokerNoteId])
        do {
            let response = try self.context.fetch(request)
            return response
        } catch {
            return []
        }
    }
    
    func save() {
        try? self.context.save()
    }
    
    func insertTransaction() -> Transaction {
        let newTransaction = Transaction(context: self.context)
        newTransaction.date = Date.now
        newTransaction.ticker = CustomLocalization.Transactions.newTransaction
        let brokerNote = self.loadData()[0]
        newTransaction.brokerNote = brokerNote
        return newTransaction
    }
    
}
