//
//  PortfolioItemWorker.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 02/11/21.
//

import Foundation

class PortfolioItemWorker {
    
    var datasource = PortfolioMock.shared
    var parentId: UUID?
    
    var items: [PortfolioItem] {
        get {
            return self.datasource.data.filter( { $0.parentId == self.parentId } ).sorted(by: { $0.rank < $1.rank} )
        }
    }
    
    init(parentId: UUID?) {
        self.parentId = parentId
    }    
    
}
