//
//  Datastore.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 05/01/22.
//

import CoreData

class PortfolioDatastore {
    
    static public var shared = PortfolioDatastore()
    
    private var context: NSManagedObjectContext = Persistence.shared.persistentContainer.viewContext
    
    private var data: [UUID?: [PortfolioItem]] = [:]
    
    private init() {
        
        let request = PortfolioItem.createFetchRequest()
        if let data = try? self.context.fetch(request) {
            for item in data {
                self.insert(item)
            }
        }
        
    }
    
    func insert(_ item: PortfolioItem) {
        if self.data.keys.contains(item.parentId) {
            self.data[item.parentId]?.append(item)
            self.data[item.parentId]?.sort(by: { $0.rank < $1.rank } )
        } else {
            self.data[item.parentId] = [item]
        }
    }
    
    func getCount(for parentId: UUID?) -> Int {
        return self.data[parentId]?.count ?? 0
    }
    
    func getElement(for parentId: UUID?, at index: Int) -> PortfolioItem? {
        return self.data[parentId]?[index]
    }
    
    func getElement(for parentId: UUID?) -> [PortfolioItem] {
        guard let array = self.data[parentId] else { return [] }
        return array
    }
    
    func getTree(for parentId: UUID?) -> [PortfolioItem] {
        var array: [PortfolioItem] = []
        var pending: [PortfolioItem] = self.getElement(for: parentId)
        while !pending.isEmpty {
            let next = pending.remove(at: 0)
            array.append(next)
            pending.append(contentsOf: self.getElement(for: next.id))
        }
        return array
    }
    
    func remove(_ item: PortfolioItem) {
        self.context.delete(item)
        self.data[item.parentId]?.removeAll(where: { $0.id == item.id } )
    }
    
    func getUnallocated(for parentId: UUID?) -> Decimal {
        if let data = self.data[parentId] {
            return data.map( { -$0.weight } ).reduce(Decimal(1), { $0 + $1 })
        } else {
            return Decimal(1)
        }
    }
    
}
