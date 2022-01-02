//
//  PortfolioMock.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 01/11/21.
//

import Foundation

class PortfolioMock {
    
    static var shared = PortfolioMock()

    weak var presenter: PortfolioManagerPresenterProtocol?
    var data: [PortfolioItem]
    
    private init() {
        self.data = []
        do {
            let request = PortfolioItem.createFetchRequest()
            self.data = try Persistence.shared.persistentContainer.viewContext.fetch(request)
        } catch {
            print(error)
        }
        
        if self.data.isEmpty {
            
            if let path = Bundle.main.path(forResource: "portfolio", ofType: "json"),
               let data = FileManager.default.contents(atPath: path),
               let json = try? JSON(data: data).arrayValue {
                for object in json {
                    let item = PortfolioItem(context: Persistence.shared.persistentContainer.viewContext)
                    item.id = UUID(uuidString: object["id"].stringValue)!
                    item.parentId = UUID(uuidString: object["parentId"].stringValue)
                    item.rank = object["rank"].intValue
                    item.weight = Decimal(string: object["weight"].stringValue, locale: nil)!
                    item.name = object["name"].stringValue
                    self.data.append(item)
                }
            }
            Persistence.shared.saveContext()
        }
    }
    
}
