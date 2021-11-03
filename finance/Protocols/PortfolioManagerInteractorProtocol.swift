//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import Foundation

protocol PortfolioManagerInteractorProtocol {

    var presenter: PortfolioManagerPresenterProtocol? { get }
    func loadData(parentId: UUID?)

}
