//
//  NumberFormatter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 06/01/22.
//

import Foundation

extension NumberFormatter {

    func string(from decimal: Decimal) -> String? {
        return self.string(from: NSDecimalNumber(decimal: decimal))
    }

}
