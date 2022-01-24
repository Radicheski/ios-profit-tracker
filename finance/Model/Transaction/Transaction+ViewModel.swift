//
//  Transaction+ViewModel.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation

extension Transaction {
    class ViewModel {
        var quantity: Box<String>
        var total: Box<String>
        var date: Box<Date>
        var ticker: Box<String>
        
        init(from transaction: Transaction) {
            self.quantity = Box("\(transaction.quantity)")
            self.total = Box(Formatter.shared.currency.string(from: transaction.total) ?? "R$ 0,00")
            self.date = Box(transaction.date)
            self.ticker =  Box(transaction.ticker)
            
            self.quantity.listener = { newValue in
                if let quantity = try? Int(newValue, format: .number) {
                    transaction.quantity = quantity
                }
            }
            
            self.total.listener = { newValue in
                if let total = try? Decimal(newValue, format: .number) {
                    transaction.total = total
                }
            }
            
            self.date.listener = { newValue in
                transaction.date = newValue
            }
            
            self.ticker.listener = { newValue in
                transaction.ticker = newValue
            }
        }
    }
}
