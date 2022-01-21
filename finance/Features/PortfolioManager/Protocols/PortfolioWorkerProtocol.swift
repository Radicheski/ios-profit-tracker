//
//  PortfolioWorkerProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import Foundation

protocol PortfolioWorkerProtocol: AnyObject {
    var portfolioId: UUID { get }
    func loadData() -> [Portfolio]
    func insert() -> [Portfolio]
    func move(from startIndex: Int, to endIndex: Int)
    func delete(fromIndex index: Int)
    func save()
    func discard()
}
