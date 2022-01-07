//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import Foundation

protocol PortfolioManagerInteractorProtocol: class {

    var presenter: PortfolioManagerPresenterProtocol? { set get }
    var parentId: UUID? { get }

    func loadData()

    func insertData()
    func removeData(at: Int)
    func updateData()
    func getItem(at: Int) -> PortfolioItem
    
}
