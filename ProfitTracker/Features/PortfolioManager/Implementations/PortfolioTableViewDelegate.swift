//
//  PortfolioTableViewDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import UIKit

class PortfolioTableViewDelegate: NSObject, UITableViewDelegate {

    weak var viewController: PortfolioViewProtocol?

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.viewController?.present(fromIndex: indexPath.row)
        } else if tableView.isEditing && indexPath.row == 0 {
            self.viewController?.insert()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return indexPath.section == 0 ? .delete : .none
    }

    func tableView(_ tableView: UITableView,
                   targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath,
                   toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return proposedDestinationIndexPath.section == 0 ? proposedDestinationIndexPath : sourceIndexPath
    }

}
