//
//  UITableView+extension.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 27/12/21.
//

import UIKit

extension UITableView {
    
    func scrollToBottom(at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        let lastSection = self.numberOfSections - 1
        let lastRow = self.numberOfRows(inSection: lastSection) - 1
        let indexPath = IndexPath(row: lastRow, section: lastSection)
        self.scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    func register(_ type: RegistrableTableViewCell.Type) {
        self.register(type, forCellReuseIdentifier: type.identifier)
    }
    
    func dequeueReusableCell<T: RegistrableTableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
    
}
