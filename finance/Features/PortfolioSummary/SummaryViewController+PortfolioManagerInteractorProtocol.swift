//
//  SummaryViewController+PortfolioManagerInteractorProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import Foundation

extension SummaryViewController: OldPortfolioManagerInteractorProtocol {

    func loadData() {        
        let data = PortfolioItem.getItems(PortfolioDatastore.shared.getTree(for: nil))
        self.presenter?.load(data: data)
    }
    
    func insertData() {
        fatalError()
    }
    
    func removeData(at index: Int) {
        fatalError()
    }
    
    func updateData() {
        fatalError()
    }
    
    func getItem(at: Int) -> PortfolioItem {
        fatalError()
    }

}
