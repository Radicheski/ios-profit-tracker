//
//  File.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

extension UpdateViewController: SaveCancelNavigationDelegate {
    
    func buttonPressed(_ button: UIBarButtonItem, event: SaveCancelNavigationBar.Event) {
        switch event {
        case .save: self.save()
        case .cancel: self.cancel()
        }
    }
    
    func save() {
        if let name = self.customView.nameTextField.text {
            self.item?.name = name
        }
        
        if let weightString = self.customView.weightTextField.text,
           let weight = try? Decimal(weightString, format: .percent){
            self.item?.weight = weight
        }
        
        self.item?.asset = !self.customView.assetSwitch.isOn
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
