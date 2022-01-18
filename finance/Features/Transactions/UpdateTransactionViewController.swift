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
        
        self.customView.tickerTextField.delegate = self
        self.customView.quantityTextField.delegate = self
        self.customView.totalTextField.delegate = self
        
        self.customView.navigationBar.saveCancelDelegate = self
    }
    
    func updateView() {
        if let item = item {
            self.customView.dateTextField.date = item.date
            self.customView.tickerTextField.placeholder = item.ticker
            self.customView.quantityTextField.placeholder = "\(item.quantity)"
            self.customView.totalTextField.placeholder = Formatter.shared.currency.string(from: item.total)
        }
    }
    
}
