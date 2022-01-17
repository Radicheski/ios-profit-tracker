//
//  Mock.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 17/01/22.
//

import Foundation

func loadMockData() throws {
    let portfolioItemRequest = PortfolioItem.createFetchRequest()
    if let portfolioItemResult = try? Persistence.shared.persistentContainer.viewContext.fetch(portfolioItemRequest) {
        if portfolioItemResult.isEmpty { loadPortfolioData() }
    } else {
        throw NSError(domain: "CoreData", code: 1, userInfo: ["description": "Fetch PortfolioItem request failed"])
    }
    
    let transactionRequest = Transaction.createFetchRequest()
    if let transactionResult = try? Persistence.shared.persistentContainer.viewContext.fetch(transactionRequest) {
        if transactionResult.isEmpty { loadTransactionData() }
    } else {
        throw NSError(domain: "CoreData", code: 2, userInfo: ["description": "Fetch Transaction request failed"])
    }
    
    if Persistence.shared.context.hasChanges { Persistence.shared.saveContext() }
}

fileprivate func loadPortfolioData() {
    if let path = Bundle.main.path(forResource: "portfolio", ofType: "json"),
       let data = FileManager.default.contents(atPath: path),
       let json = try? JSON(data: data).arrayValue {
        for object in json {
            let item = PortfolioItem(context: Persistence.shared.context)
            item.id = UUID(uuidString: object["id"].stringValue)!
            item.parentId = UUID(uuidString: object["parentId"].stringValue)
            item.rank = object["rank"].intValue
            item.weight = Decimal(string: object["weight"].stringValue, locale: nil)!
            item.name = object["name"].stringValue
            item.asset = object["asset"].boolValue
        }
    }
}

fileprivate func loadTransactionData() {
    if let path = Bundle.main.path(forResource: "transactions", ofType: "json"),
       let data = FileManager.default.contents(atPath: path),
       let json = try? JSON(data: data) {
        for object in json.arrayValue {
            let item = Transaction(context: Persistence.shared.context)
            item.date = Formatter.shared.isoDate.date(from: object["date"].stringValue)!
            item.quantity = object["quantity"].intValue
            item.ticker = object["ticker"].stringValue
            item.total = Decimal(string: object["total"].stringValue, locale: nil)!
        }
    }
}
