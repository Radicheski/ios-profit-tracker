//
//  BrokerNoteSummaryConfigurator.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

protocol BrokerNoteSummaryConfiguratorProtocol: AnyObject {
    func build() -> BrokerNoteSummaryViewProtocol
}
