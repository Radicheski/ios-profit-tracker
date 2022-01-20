//
//  SummaryItem.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 20/01/22.
//

import Foundation

class SummaryItem {
    
    var name: String
    lazy var price: Decimal = {
        let worker = NetworkWorker(ticker: name)
        worker.getQuote { [weak self] (price: Quote) in
            self?.price = price.vl_fechamento
        } onError: { error in
            #warning("Handle this error")
            print(error)
        }
        return Decimal()
    }()
    var weight: Decimal
    var quantity: Int
    
    init(name: String) {
        self.name = name
        self.weight = Decimal()
        self.quantity = 0

    }
    
}
