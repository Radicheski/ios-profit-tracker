//
//  PortfolioViewProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import UIKit

protocol PortfolioViewProtocol: UIViewController {
    var interactor: PortfolioInteractorProtocol { get }
    var router: PortfolioRouterProtocol { get }
    func updateView(with data: [Portfolio.ViewModel])
    func present(fromIndex index: Int)
    func present(item: Portfolio.ViewModel)
    func present(_ viewController: UIViewController)
    func insert()
    func delete(fromIndex index: Int)
    func move(from startIndex: Int, to endIndex: Int)
    func loadData()
    func askForConfirmation(_ completion: ((Bool) -> Void)?)
}
