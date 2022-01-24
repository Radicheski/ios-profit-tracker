//
//  TransactionTableViewDataSource.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation
import UIKit

class TransactionTableViewDataSource: NSObject, UITableViewDataSource {
    weak var viewController: TransactionViewProtocol?
    var data: [Transaction.ViewModel] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView.isEditing ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEditing {
            return section == 0 ? 1 : self.data.count
        } else {
            return self.data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
        if tableView.isEditing && indexPath.section == 0 {
            var conf = cell.defaultContentConfiguration()
            conf.text = CustomLocalization.Transactions.newTransaction
            cell.contentConfiguration = conf
        } else {
            let item = self.data[indexPath.row]
            cell.contentConfiguration = TransactionContentConfiguration(transaction: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return tableView.isEditing ? indexPath.section == 1 : indexPath.section == 0
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section != tableView.numberOfSections - 1 { return }
        
        switch editingStyle {
        case .delete:
            self.viewController?.delete(fromIndex: indexPath.row)
        default: return
        }
        if !tableView.isEditing { self.viewController?.interactor.save() }
    }
    
}
