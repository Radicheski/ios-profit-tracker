//
//  PortfolioPresenterProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

protocol PortfolioPresenterProtocol: AnyObject {
    var view: PortfolioViewProtocol? { get }
    func load(data: [Portfolio])
    func present(item: Portfolio)
    func askForConfirmation(_ completion: ((Bool) -> Void)?)
}
