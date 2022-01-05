//
//  UpdateViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 04/01/22.
//

import UIKit

class UpdateViewController: BaseViewController<UpdateView> {
    
    var item: PortfolioItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customView.nameTextField.text = item?.name
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        self.customView.weightTextField.text = formatter.string(from: NSDecimalNumber(decimal: item?.weight ?? Decimal()))
        self.customView.parentTextField.text = item?.parentId?.description
        
        self.customView.nameTextField.delegate = self
        self.customView.weightTextField.delegate = self
        self.customView.parentTextField.delegate = self
    }
    
}

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
    
}
