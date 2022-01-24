//
//  TransactionWorker.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

class TransactionWorker: TransactionWorkerProtocol {
    
    var context = Persistence.shared.context
    
    func loadData() -> [Transaction] {
        do {
            let request = Transaction.createFetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            let response = try self.context.fetch(request)
            return response
        } catch {
            return []
            
        }
    }
    
    func save() {
        if self.context.hasChanges { try? self.context.save() }
    }
    
    func discard() {
        if self.context.hasChanges { self.context.rollback() }
    }
    
    func present(fromIndex index: Int) -> Transaction {
        let data = loadData()
        return data[index]
    }
    
    func insert() {
        let item = Transaction(context: self.context)
        item.date = Date.now
        item.ticker = CustomLocalization.Transactions.newTransaction
    }
    
    func delete(fromIndex index: Int) {
        let data = self.loadData()
        let item = data[index]
        self.context.delete(item)
    }
    
}
