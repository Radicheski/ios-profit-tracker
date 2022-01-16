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
        get { self.data.count }
    }
    
    init() {
        
        do {
            let request = Transaction.createFetchRequest()
            self.data = try Persistence.shared.persistentContainer.viewContext.fetch(request)
        } catch {
            print(error)
        }
        
        if self.data.isEmpty {
#warning("Remove mock")
            if let path = Bundle.main.path(forResource: "transactions", ofType: "json"),
               let data = FileManager.default.contents(atPath: path),
               let json = try? JSON(data: data) {
                for object in json.arrayValue {
                    let item = Transaction(context: Persistence.shared.context)
                    item.date = Formatter.shared.isoDate.date(from: object["date"].stringValue)!
                    item.quantity = object["quantity"].intValue
                    item.ticker = object["ticker"].stringValue
                    item.total = Decimal(string: object["total"].stringValue, locale: nil)!
                    self.data.append(item)
                    
                }
            }
            Persistence.shared.saveContext()
        }
        
        self.data.sort { $0.date < $1.date }
    }
    
    func create() {
        var newItem = Transaction(context: Persistence.shared.context)
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
