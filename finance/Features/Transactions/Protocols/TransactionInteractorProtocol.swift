//
//  TransactionInteractorProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

protocol TransactionInteractorProtocol {
    var presenter: TransactionPresenterProtocol { get }
    var worker: TransactionWorkerProtocol { get }
}
