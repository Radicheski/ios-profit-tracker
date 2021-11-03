//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import Foundation

protocol PortfolioManagerViewControllerProtocol: class {

    var interactor: PortfolioManagerInteractorProtocol? { set get }
    func updateView()
    func updateTotalAllocated(value: Decimal)

}
