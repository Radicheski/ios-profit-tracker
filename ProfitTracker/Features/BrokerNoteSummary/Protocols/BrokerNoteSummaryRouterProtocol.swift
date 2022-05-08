//
//  BrokerNoteSummaryRouterProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

protocol BrokerNoteSummaryRouterProtocol: AnyObject {
    var view: BrokerNoteSummaryViewProtocol? { get }
    func present(item: BrokerNote.ViewModel)
}
