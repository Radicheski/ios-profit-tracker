//
//  PortfolioInteractorProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

protocol PortfolioInteractorProtocol: AnyObject {
    var presenter: PortfolioPresenterProtocol { get }
    var worker: PortfolioWorkerProtocol { get }
    /// Calls `PortfolioPresenterProtocol.load(data: [Portfolio])`
    func loadData()
    func present(fromIndex index: Int)
    /// Calls `PortfolioPresenterProtocol.load(data: [Portfolio])`
    func insert()
    func delete(fromIndex index: Int)
    func move(from startIndex: Int, to endIndex: Int)
    func save()
    func discard()
    func askForConfirmation(_ completion: ((Bool) -> Void)?)
}
