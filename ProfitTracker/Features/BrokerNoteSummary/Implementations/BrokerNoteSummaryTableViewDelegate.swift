//
//  BrokerNoteSummaryTableViewDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//
import UIKit

class BrokerNoteSummaryTableViewDelegate: NSObject, UITableViewDelegate {
    weak var viewController: BrokerNoteSummaryViewProtocol?

    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing && indexPath.section == 0 {
            return .none
        } else {
            return .delete
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing && indexPath.section == 0 {
            self.viewController?.insert()
        } else {
            self.viewController?.present(fromIndex: indexPath.row)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
