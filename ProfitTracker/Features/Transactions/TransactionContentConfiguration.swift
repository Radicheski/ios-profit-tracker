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
    var quantity: String
    var total: String

    init(transaction: Transaction.ViewModel) {
        self.date = transaction.date.value
        self.ticker = transaction.ticker.value
        self.quantity = transaction.quantity.value
        self.total = transaction.total.value
    }

    func makeContentView() -> UIView & UIContentView {
        return TransactionContentView(self)
    }

    func updated(for state: UIConfigurationState) -> Self {
        return self
    }

}
