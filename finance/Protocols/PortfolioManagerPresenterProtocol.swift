//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import Foundation

protocol PortfolioManagerPresenterProtocol: class {

    var viewController: PortfolioManagerViewControllerProtocol? { set get }
    func load(data: [PortfolioItem])

}
