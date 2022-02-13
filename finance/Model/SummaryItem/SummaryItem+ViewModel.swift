//
//  SummaryItem+ViewModel.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 22/01/22.
//

import Foundation

extension SummaryItem {
    
    class ViewModel {
        
        private var item: SummaryItem
        
        var weight: String { Formatter.shared.percent.string(from: self.item.weight) ?? "0,00%" }
        var name: String { self.item.name }
        var price: String? { Formatter.shared.currency.string(from: self.item.price) }
        var quantity: String { "\(item.quantity)" }
        
        init(from item: SummaryItem) {
            self.item = item
        }
    }
    
}
