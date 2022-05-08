//
//  SummaryItem.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 20/01/22.
//

import Foundation

class SummaryItem {

    var name: String
    var price: Decimal
    var weight: Decimal
    var quantity: Int

    init(name: String) {
        self.name = name
        self.weight = Decimal()
        self.quantity = 0
        self.price = 0
        self.updatePrice()
    }

    init(from item: Portfolio) {
        self.name = item.name
        self.weight = item.weight
        self.quantity = 0
        self.price = 0
        self.updatePrice()
    }

    func updatePrice() {
        let worker = NetworkWorker(ticker: name)
        worker.getQuote { [weak self] (price: Quote) in
            self?.price = price.vl_fechamento
        } onError: { error in
            print(error)
        }
    }

}
