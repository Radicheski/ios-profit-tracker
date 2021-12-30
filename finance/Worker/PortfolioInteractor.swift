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
    }
    
    func loadData() {
        self.presenter?.load(data: data)
    }

    func fetchTotalAllocated() {
        let value = self.data.map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
        self.presenter?.presentTotalAllocated(value: value)
    }
    
    func insertData() {
        self.data.append(PortfolioItem(id: UUID(), rank: 0, name: CustomLocalization.PortfolioManager.globalPortfolioNewItem, weight: Decimal(), parentId: self.parentId))
        self.loadData()
    }
    
    func removeData(at index: Int) {
        self.data.remove(at: index)
        self.loadData()
    }
    
    func updateData() {
        fatalError()
    }
    
}
