//
//  TransactionDataStore.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 16/01/22.
//

import Foundation

class TransactionDataStore {

    private(set) var data: [Transaction] = []

    var count: Int {
        self.data.count
    }

    init() {

        do {
            let request = Transaction.createFetchRequest()
            self.data = try Persistence.shared.persistentContainer.viewContext.fetch(request)
        } catch {
            print(error)
        }

        self.data.sort { $0.date < $1.date }
    }

    func create() {
        let newItem = Transaction(context: Persistence.shared.context)
        newItem.ticker = CustomLocalization.Transactions.newTransaction
        newItem.date = Date.now
        newItem.quantity = 0
        newItem.total = Decimal()
        self.data.insert(newItem, at: 0)
    }

    func delete(at index: Int) {
        Persistence.shared.context.delete(self.data.remove(at: index))
    }

}
