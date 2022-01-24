//
//  UpdateTransactionViewController+SaveCancelNavigationDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

extension UpdateTransactionViewController: SaveCancelNavigationDelegate {
    
    func buttonPressed(_ button: UIBarButtonItem, event: SaveCancelNavigationBar.Event) {
        switch event {
        case .save: self.save()
        case .cancel: self.cancel()
        }
    }
    
    func save() {
        self.item?.date.value = self.customView.dateTextField.date
        
        if let ticker = self.customView.tickerTextField.text,
           !ticker.isEmpty {
            self.item?.ticker.value = ticker
        }
        
        if let quantityString = self.customView.quantityTextField.text,
           let _ = try? Int(quantityString, format: .number) {
            self.item?.quantity.value = quantityString
        }
        
        if let totalString = self.customView.totalTextField.text,
           let currencyCode = Locale.current.currencyCode,
           let _ = try? Decimal(totalString, format: .currency(code: currencyCode)) {
            self.item?.total.value = totalString
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
