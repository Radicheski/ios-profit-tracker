//
//  SummaryViewProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 22/01/22.
//

import Foundation
import UIKit

protocol SummaryViewProtocol where Self: UIViewController {
    var interactor: SummaryInteractorProtocol { get }
    var router: SummaryRouterProtocol { get }
    func loadData()
    func updateView(with data: [SummaryItem.ViewModel])
}
