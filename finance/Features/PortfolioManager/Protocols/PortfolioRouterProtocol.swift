//
//  PortfolioRouterProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

protocol PortfolioRouterProtocol: AnyObject {
    var view: PortfolioViewProtocol? { get }
    func present(item: Portfolio.ViewModel)
}
