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
    var datastore: Datastore = Datastore.shared
    
    required init(parentId: UUID?) {
        self.parentId = parentId
    }
    
    func loadData() {
        let data = self.datastore.getElement(for: self.parentId)
        self.presenter?.load(data: data)
    }
    
    func insertData() {
        let newItem = PortfolioItem(context: Persistence.shared.persistentContainer.viewContext)
        newItem.id = UUID()
        newItem.rank = self.datastore.getCount(for: self.parentId)
        newItem.name = CustomLocalization.PortfolioManager.globalPortfolioNewItem
        newItem.weight = Decimal()
        newItem.parentId = self.parentId
        self.datastore.insert(newItem)
        self.loadData()
    }
    
    func removeData(at index: Int) {
        if let item = self.datastore.getElement(for: self.parentId, at: index) {
            var children = [item]
            repeat {
                let child = children.removeFirst()
                children.append(contentsOf: self.datastore.getElement(for: child.id))
                self.datastore.remove(child)
            } while (!children.isEmpty)
        }
        self.loadData()
    }
    
    func updateData() {
        fatalError()
    }
    
    func getItem(at index: Int) -> PortfolioItem {
        #warning("Improve method")
        return self.datastore.getElement(for: self.parentId, at: index)!
    }
    
}
