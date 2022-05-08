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

    var alertPresenter: ((((Bool) -> Void)?) -> Void)?

    var reloadData: (() -> Void)?

    init(portfolioId: UUID) {
        self.portfolioId = portfolioId
    }

    func loadData() -> [Portfolio] {
        do {
            let request = Portfolio.createFetchRequest()
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
        let newItem = Portfolio(context: self.context)
        newItem.id = UUID()
        newItem.parentId = self.portfolioId
        newItem.name = ""
        newItem.rank = rank
        newItem.asset = false
        return loadData()
    }

    func count() -> Int {
        do {
            let request = Portfolio.createFetchRequest()
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
        let childrenWorker = PortfolioWorker(portfolioId: item.id)
        if childrenWorker.count() == 0 {
            self.context.delete(item)
            updateRanks(data)
            self.reloadData?()
        } else {
            self.alertPresenter? { [weak self] response in
                if response {
                    while childrenWorker.count() > 0 {
                        childrenWorker.delete(fromIndex: 0)
                    }
                    self?.context.delete(item)
                    self?.updateRanks(data)
                    self?.reloadData?()
                }
            }
        }
    }

    func save() {
        if self.context.hasChanges { try? self.context.save() }
    }

    func discard() {
        if self.context.hasChanges { self.context.rollback() }
    }

    func updateRanks(_ items: [Portfolio]) {
        for index in 0 ..< items.count {
            items[index].rank = index
        }
    }

}
