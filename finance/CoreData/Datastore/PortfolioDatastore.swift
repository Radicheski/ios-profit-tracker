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

    private var data: [UUID?: [Portfolio]] = [:]

    private init() {

        let request = Portfolio.createFetchRequest()
        if let data = try? self.context.fetch(request) {
            for item in data {
                self.insert(item)
            }
        }

    }

    func insert(_ item: Portfolio) {
        if self.data.keys.contains(item.parentId) {
            self.data[item.parentId]?.append(item)
            self.data[item.parentId]?.sort { $0.rank < $1.rank }
        } else {
            self.data[item.parentId] = [item]
        }
    }

    func getCount(for parentId: UUID?) -> Int {
        return self.data[parentId]?.count ?? 0
    }

    func getElement(for parentId: UUID?, at index: Int) -> Portfolio? {
        return self.data[parentId]?[index]
    }

    func getElement(for parentId: UUID?) -> [Portfolio] {
        guard let array = self.data[parentId] else { return [] }
        return array
    }

    func getTree(for parentId: UUID?) -> [Portfolio] {
        var array: [Portfolio] = []
        var pending: [Portfolio] = self.getElement(for: parentId)
        while !pending.isEmpty {
            let next = pending.remove(at: 0)
            array.append(next)
            pending.append(contentsOf: self.getElement(for: next.id))
        }
        return array
    }

    func remove(_ item: Portfolio) {
        self.context.delete(item)
        self.data[item.parentId]?.removeAll { $0.id == item.id }
    }

    func getUnallocated(for parentId: UUID?) -> Decimal {
        if let data = self.data[parentId] {
            return data.map { -$0.weight }.reduce(Decimal(1)) { $0 + $1 }
        } else {
            return Decimal(1)
        }
    }

}
