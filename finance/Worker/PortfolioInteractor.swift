//
//  PortfolioInteractor.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 30/12/21.
//

import Foundation

class PortfolioInteractor: PortfolioManagerInteractorProtocol {
    
    var parentId: UUID?
    weak var presenter: PortfolioManagerPresenterProtocol?
    var data: [PortfolioItem]
    
    required init(parentId: UUID?) {
        self.parentId = parentId
        self.data = PortfolioMock.shared.data.filter( { $0.parentId == parentId } )
        self.data.sort(by: { $0.rank < $1.rank } )
    }
    
    func loadData() {
        self.presenter?.load(data: data)
    }

    func fetchTotalAllocated() {
        let value = self.data.map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
        self.presenter?.presentTotalAllocated(value: value)
    }
    
    func insertData() {
        let newItem = PortfolioItem(context: Persistence.shared.persistentContainer.viewContext)
        newItem.id = UUID()
        newItem.rank = self.data.count
        newItem.name = CustomLocalization.PortfolioManager.globalPortfolioNewItem
        newItem.weight = Decimal()
        newItem.parentId = self.parentId
        self.data.append(newItem)
        self.loadData()
    }
    
    func removeData(at index: Int) {
        let item = self.data.remove(at: index)
        Persistence.shared.persistentContainer.viewContext.delete(item)
        let request = PortfolioItem.createFetchRequest()
        request.predicate = NSPredicate(format: "parentId == %@", item.id.description)
        try? Persistence.shared.persistentContainer.viewContext.fetch(request).forEach( { Persistence.shared.persistentContainer.viewContext.delete($0) } )
        self.loadData()
    }
    
    func updateData() {
        fatalError()
    }
    
    func getItem(at index: Int) -> PortfolioItem {
        return self.data[index]
    }
    
}
