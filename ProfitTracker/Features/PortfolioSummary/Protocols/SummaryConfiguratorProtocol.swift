//
//  SummaryConfiguratorProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 22/01/22.
//

import Foundation

protocol SummaryConfiguratorProtocol: AnyObject {
    func build() -> SummaryViewProtocol
}
