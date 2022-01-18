//
//  UpdateTransactionViewController+NavigationAccessoryDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

extension UpdateTransactionViewController: NavigationAccessoryDelegate {
    
    func buttonTapped(_ button: UIBarButtonItem, event: NavigationAccessoryView.Event) {
        switch event {
        case .up: self.customView.navigationManager?.navigateToPrevious()
        case .down: self.customView.navigationManager?.navigateToNext()
        case .done: self.customView.navigationManager?.resignFirstResponder()
        }
    }
    
}
