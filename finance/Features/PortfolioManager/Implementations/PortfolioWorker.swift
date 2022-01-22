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
            request.predicate = NSPredicate(format: "parentId == %@", self.portfolioId as CVarArg)
            request.sortDescriptors = [NSSortDescriptor(key: "rank", ascending: true)]
            let data = try self.context.fetch(request)
            return data
        } catch {
            return []
        }
    }
    func insert() -> [Portfolio] {
        let rank = count()
        let newItem = PortfolioItem(context: self.context)
        newItem.id = UUID()
        newItem.parentId = self.portfolioId
        newItem.name = ""
        newItem.rank = rank
        newItem.asset = false
        return loadData()
    }
    
    func count() -> Int {
        do {
            let request = PortfolioItem.createFetchRequest()
            request.predicate = NSPredicate(format: "parentId == %@", self.portfolioId as CVarArg)
            let data = try self.context.count(for: request)
            return data
        } catch {
            return 0
        }
    }
    
    func move(from startIndex: Int, to endIndex: Int) {
        var data = loadData()
        let item = data.remove(at: startIndex)
        data.insert(item, at: endIndex)
        updateRanks(data)
    }
    
    func delete(fromIndex index: Int) {
        var data = loadData()
        let item = data.remove(at: index)
        self.context.delete(item)
        let childrenWorker = PortfolioWorker(portfolioId: item.id)
        #warning("if has children show alert controller asking for confirmation")
        while childrenWorker.count() > 0 {
            childrenWorker.delete(fromIndex: 0)
        }
        updateRanks(data)
    }
    
    func save() {
        if self.context.hasChanges { try? self.context.save() }
    }
    
    func discard() {
        if self.context.hasChanges { self.context.rollback() }
    }
    
    func updateRanks(_ items: [PortfolioItem]) {
        for index in 0 ..< items.count {
            items[index].rank = index
        }
    }
    
}
