//
//  UpdateTransactionViewController+UITextFieldDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

extension UpdateTransactionViewController: UITextFieldDelegate {
    
    func addAccessoryView(_ textField: UITextField) {
        let accessoryView = NavigationAccessoryView()
        accessoryView.navigationDelegate = self
        textField.inputAccessoryView = accessoryView
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.addAccessoryView(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.customView.navigationManager?.navigateToNext()
        return true
    }
    
}
