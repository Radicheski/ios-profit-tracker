//
//  BrokerNoteSummaryPresenterProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

protocol BrokerNoteSummaryPresenterProtocol: AnyObject {
    var view: BrokerNoteSummaryViewProtocol? { get }
    func loadData(_ data: [BrokerNote])
    func present(item: BrokerNote)
}
