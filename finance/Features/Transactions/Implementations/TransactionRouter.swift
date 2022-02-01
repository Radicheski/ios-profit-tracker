//
//  TransactionRouter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import UIKit

class TransactionRouter: TransactionRouterProtocol {
    weak var view: TransactionViewProtocol?
    
    func present(item: Transaction.ViewModel) {
        let viewController = FormViewController()
        var ticker: Box<String?> = Box(item.ticker.value)
        var quantity: Box<String?> = Box(item.quantity.value)
        var date: Box<String?> = Box(item.date.value.formatted())
        var total: Box<String?> = Box(item.total.value)
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
                item.ticker.value = ticker
            }
            if let quantity = quantity.value {
                item.quantity.value = quantity
            }
            if let total = total.value {
                item.total.value = total
            }
            if let dateString = date.value,
               let date = Formatter.shared.date.date(from: dateString) {
                item.date.value = date
            }
            self?.view?.navigationController?.popViewController(animated: true)
        }))
        
        self.view?.show(viewController, sender: nil)
    }

    func action( _ action: UIAction) {
        self.view?.navigationController?.popViewController(animated: true)
    }
}
