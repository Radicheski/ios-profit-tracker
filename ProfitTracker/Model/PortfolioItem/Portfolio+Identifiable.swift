//
//  Portfolio+Identifiable.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import Foundation

extension Portfolio: Identifiable {
    public static func == (lhs: Portfolio, rhs: Portfolio) -> Bool {
        return lhs.name == rhs.name
    }
}
