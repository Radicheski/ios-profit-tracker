//
//  TransactionTableViewDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation
import UIKit

class TransactionTableViewDelegate: NSObject, UITableViewDelegate {
    weak var viewController: TransactionViewProtocol?
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
        return indexPath.section == 1 ? .delete : .none
        } else {
            return indexPath.section == 0 ? .delete : .none
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing && indexPath.section == 0 {
            self.viewController?.insert()
        } else if tableView.isEditing && indexPath.section == 1 {
            self.viewController?.present(fromIndex: indexPath.row)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
