//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import Foundation

protocol PortfolioManagerPresenterProtocol {

    var viewController: PortfolioManagerViewControllerProtocol? { get }
    func load(data: [PortfolioItem])

}
