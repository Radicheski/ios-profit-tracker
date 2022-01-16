//
//  TransactionsViewController+UITableViewDataSource.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 16/01/22.
//

import UIKit

extension TransactionsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView.isEditing ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEditing {
            return section == 0 ? 1 : self.datastore.count
        } else {
            return self.datastore.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transaction", for: indexPath)
        if tableView.isEditing && indexPath.section == 0 {
            var conf = cell.defaultContentConfiguration()
            conf.text = CustomLocalization.Transactions.newTransaction
            cell.contentConfiguration = conf
            cell.editingAccessoryType = .none
        } else {
            let item = self.datastore.data[indexPath.row]
            cell.contentConfiguration = TransactionContentConfiguration(transaction: item)
            cell.editingAccessoryType = .detailButton
        }
        return cell
    }
    
}
