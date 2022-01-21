//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import Foundation

protocol OldPortfolioManagerPresenterProtocol: class {

    var viewController: OldPortfolioManagerViewControllerProtocol? { set get }

    func load(data: [PortfolioItem])

}
