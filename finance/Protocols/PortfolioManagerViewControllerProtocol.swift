//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import Foundation

protocol PortfolioManagerViewControllerProtocol {

    var interactor: PortfolioManagerInteractorProtocol? { get }
    func updateView()

}
