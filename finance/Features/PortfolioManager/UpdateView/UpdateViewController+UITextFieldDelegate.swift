//
//  File.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import UIKit

extension UpdateViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case self.customView.nameTextField:
            self.item?.name = textField.text ?? ""
        case self.customView.weightTextField:
            if let weight = try? Decimal(textField.text ?? "0", format: .percent) {
                self.item?.weight = weight
            }
        case self.customView.parentTextField:
            self.item?.parentId = UUID(uuidString: textField.text ?? "")
        default:
            break;
        }
        
    }
    
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

