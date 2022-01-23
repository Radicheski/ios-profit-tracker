//
//  TransactionViewProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import UIKit

protocol TransactionViewProtocol where Self: UIViewController {
    var interactor: TransactionInteractorProtocol { get }
    var router: TransactionRouterProtocol { get }
}
