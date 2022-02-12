//
//  BrokerNoteDetailRouter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import UIKit

class BrokerNoteDetailRouter: BrokerNoteDetailRouterProtocol {
    
    weak var view: BrokerNoteDetailViewProtocol?
    
    func present(transaction: Transaction.ViewModel) {

        let viewController = FormViewController()
        var ticker: Box<String?> = Box(transaction.ticker.value)
        var quantity: Box<String?> = Box(transaction.quantity.value)
        var date: Box<String?> = Box(transaction.date.value.formatted())
        var total: Box<String?> = Box(transaction.total.value)
        let rows: [Row] = [
            TextInputFormField(key: "ticker", value: ticker, contentConfiguration: .init(title: "Ticker", placeholder: ticker.value)),
            TextInputFormField(key: "quantity", value: quantity, contentConfiguration: .init(title: "Quantidade", placeholder: quantity.value)),
            TextInputFormField(key: "date", value: date, contentConfiguration: .init(title: "Data", placeholder: date.value)),
            TextInputFormField(key: "total", value: total, contentConfiguration: .init(title: "Total", placeholder: total.value)),
        ]
        
        let section = TableViewSection(key: "updateHeader", rows: rows)
        
        viewController.dataSource.insert(section: section, at: 0)
        viewController.registerSections()
        
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .cancel, primaryAction: UIAction(handler: self.action(_:)), menu: nil)
        
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .save, primaryAction: UIAction(handler: { [weak self] _ in
            if let ticker = ticker.value {
                transaction.ticker.value = ticker
            }
            if let quantity = quantity.value {
                transaction.quantity.value = quantity
            }
            if let total = total.value {
                transaction.total.value = total
            }
            if let dateString = date.value,
               let date = Formatter.shared.date.date(from: dateString) {
                transaction.date.value = date
            }
            self?.view?.navigationController?.popViewController(animated: true)
        }))
        
        self.view?.show(viewController, sender: nil)
    }

    func action( _ action: UIAction) {
        self.view?.navigationController?.popViewController(animated: true)
    }
    
}