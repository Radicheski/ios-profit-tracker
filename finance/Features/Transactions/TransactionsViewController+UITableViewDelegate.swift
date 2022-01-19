//
//  TransactionsViewController+UITableViewDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 16/01/22.
//

import UIKit

extension TransactionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? nil : UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : tableView.estimatedSectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return (tableView.isEditing && indexPath.section == 0) ? .insert : .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && tableView.isEditing && indexPath.section == 1 {
            self.datastore.delete(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        } else if editingStyle == .insert && tableView.isEditing && indexPath.section == 0 {
            self.datastore.create()
            let newItemIndexPath = IndexPath(row: 0, section: 1)
            tableView.insertRows(at: [newItemIndexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.section == 0 { return }
        
        let item = self.datastore.data[indexPath.row]
        let vc = UpdateTransactionViewController()
        vc.sheetPresentationController?.detents = [.medium()]
        vc.onDismiss = { tableView.reloadSections(IndexSet(0...1), with: .automatic) }
        vc.item = item
        self.present(vc, animated: true, completion: nil)
    }
    
}

