//
//  SummaryWorker.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

class SummaryWorker: SummaryWorkerProtocol {
    
    var context = Persistence.shared.context
    
    func loadData() -> [SummaryItem] {
        let request = PortfolioItem.createFetchRequest()
        let response = try! self.context.fetch(request)
        let data = PortfolioItem.getItems(response)
        return data.map { SummaryItem(from: $0) }.sorted(by: { $0.name < $1.name } )
    }
    
}
