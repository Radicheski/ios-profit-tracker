//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import Foundation

protocol OldPortfolioManagerViewControllerProtocol: class {

    var interactor: OldPortfolioManagerInteractorProtocol? { set get }

    func updateView()

}
