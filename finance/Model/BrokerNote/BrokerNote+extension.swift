//
//  BrokerNote+extensionn.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

extension BrokerNote {
    
    var total: Decimal { return self.cdtransactions.reduce(0) { $0 + $1.total } }
    
}
