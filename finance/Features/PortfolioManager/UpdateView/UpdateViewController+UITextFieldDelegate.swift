//
//  File.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import UIKit

extension UpdateViewController: UITextFieldDelegate {
    
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

