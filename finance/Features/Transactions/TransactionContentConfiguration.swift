//
//  TransactionContentConfiguration.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 16/01/22.
//

import UIKit

struct TransactionContentConfiguration: UIContentConfiguration {
    
    var date: Date
    var ticker: String
    var quantity: Int
    var total: Decimal
    
    init(transaction: Transaction) {
        self.date = transaction.date
        self.ticker = transaction.ticker
        self.quantity = transaction.quantity
        self.total = transaction.total
    }
    
    func makeContentView() -> UIView & UIContentView {
        return TransactionContentView(self)
    }
    
    func updated(for state: UIConfigurationState) -> Self {
        return self
    }
    
}
