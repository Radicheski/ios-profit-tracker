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
        if let path = Bundle.main.path(forResource: "portfolio", ofType: "json"),
           let data = FileManager.default.contents(atPath: path),
           let json = try? JSONDecoder().decode([PortfolioItem].self, from: data) {
            self.data = json
        } else {
            self.data = []
        }
    }
    
}

extension PortfolioMock: PortfolioManagerInteractorProtocol {
    func loadData(parentId: UUID?) {
        let data = self.data.filter( { $0.parentId == parentId } )
        self.presenter?.load(data: data)
    }

    func fetchTotalAllocated(parentId: UUID?) {
        let value = self.data.filter( { $0.parentId == parentId } ).map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
        self.presenter?.presentTotalAllocated(value: value)
    }
}