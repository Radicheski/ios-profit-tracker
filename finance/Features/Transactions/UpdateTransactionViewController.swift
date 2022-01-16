//
//  UpdateTransactionViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 16/01/22.
//

import Foundation

class UpdateTransactionViewController: BaseViewController<UpdateTransactionView> {
    
    var item: Transaction? {
        didSet { self.updateView() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateView() {
        if let item = item {
            self.customView.dateTextField.date = item.date
            self.customView.tickerTextField.text = item.ticker
            self.customView.quantityTextField.text = "\(item.quantity)"
            self.customView.totalTextField.text = Formatter.shared.currency.string(from: item.total)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.item?.date = self.customView.dateTextField.date
        self.item?.ticker = self.customView.tickerTextField.text ?? ""
        #warning("Unsafe unwrap")
        
        do {
            self.item?.quantity = try Int(self.customView.quantityTextField.text ?? "", format: .number)
            self.item?.total = try Decimal(self.customView.totalTextField.text ?? "", format: .currency(code: Locale.current.currencyCode ?? ""))
            
            super.viewWillDisappear(animated)
        } catch {
            print("error \(#function) - \(error)")
        }
    }
    
    #warning("Implement delegate to update values in Core Data")
    
}
