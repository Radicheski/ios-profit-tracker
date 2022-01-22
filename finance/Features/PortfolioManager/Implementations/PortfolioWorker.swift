//
//  PortfolioWorker.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import Foundation

class PortfolioWorker: NSObject, PortfolioWorkerProtocol {
    
    var portfolioId: UUID
    var context = Persistence.shared.context
    
    init(portfolioId: UUID) {
        self.portfolioId = portfolioId
    }
    
    func loadData() -> [Portfolio] {
        do {
            let request = PortfolioItem.createFetchRequest()
            request.predicate = NSPredicate(format: "parentId == %@", self.portfolioId.uuidString)
            request.sortDescriptors = [NSSortDescriptor(key: "rank", ascending: true)]
            let data = try self.context.fetch(request)
            return data
        } catch {
            return []
        }
    }
    func insert() -> [Portfolio] {
        let newItem = PortfolioItem(context: self.context)
        newItem.id = UUID()
        newItem.parentId = self.portfolioId
        newItem.name = ""
        return loadData()
    }
    func move(from startIndex: Int, to endIndex: Int) {
        #warning("Implemet this method")
        print(#function)
    }
    
    func delete(fromIndex index: Int) {
        let request = PortfolioItem.createFetchRequest()
        request.predicate = NSPredicate(format: "parentId == %@ and rank == %i", self.portfolioId.uuidString, index)
        if let item = try? self.context.fetch(request) {
            item.forEach { self.context.delete($0)}
        }
    }
    
    func save() {
        if self.context.hasChanges { try? self.context.save() }
    }
    
    func discard() {
        if self.context.hasChanges { self.context.rollback() }
    }
}
