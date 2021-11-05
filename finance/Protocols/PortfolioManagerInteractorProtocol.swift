//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import Foundation

protocol PortfolioManagerInteractorProtocol: class {

    var presenter: PortfolioManagerPresenterProtocol? { set get }

    func loadData(parentId: UUID?)
    func fetchTotalAllocated(parentId: UUID?)

}
