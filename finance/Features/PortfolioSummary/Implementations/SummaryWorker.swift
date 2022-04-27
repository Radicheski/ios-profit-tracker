//
//  SummaryWorker.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

class SummaryWorker: SummaryWorkerProtocol {
    
    var context = Persistence.shared.context
    
    func loadData() -> [SummaryItem] {
        let request = Portfolio.createFetchRequest()
        let response = try! self.context.fetch(request)
        var data = Portfolio.getItems(response).map { SummaryItem(from: $0) }
        
        let transactionRequest = Transaction.createFetchRequest()
        let transactionResponse = try! self.context.fetch(transactionRequest)
        
        for transaction in transactionResponse {
            if let item = data.first(where: { $0.name == transaction.ticker } ) {
                item.quantity += transaction.quantity
            } else {
                let newItem = SummaryItem(name: transaction.ticker)
                newItem.quantity += transaction.quantity
                data.append(newItem)
            }
        }
        
        return data.filter { $0.quantity != 0 || $0.weight != 0 }.sorted(by: { $0.name < $1.name } )
    }
    
}
