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
    
}
