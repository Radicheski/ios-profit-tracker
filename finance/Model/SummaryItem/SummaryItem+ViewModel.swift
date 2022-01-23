//
//  SummaryItem+ViewModel.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 22/01/22.
//

import Foundation

extension SummaryItem {
    
    class ViewModel {
        
        var weight: Box<String>
        var name: Box<String>
        var price: Box<String>
        var quantity: Box<String>
        
        init(from item: SummaryItem) {
            self.weight = Box(Formatter.shared.percent.string(from: item.weight) ?? "0,00%")
            self.name = Box(item.name)
            self.price = Box(Formatter.shared.currency.string(from: item.price) ?? "<N/D")
            self.quantity = Box("\(item.quantity)")
        }
    }
    
}
