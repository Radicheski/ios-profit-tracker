//
//  PortfolioItem+Idenntifiable.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import Foundation

extension PortfolioItem : Identifiable {
    public static func ==(lhs: PortfolioItem, rhs: PortfolioItem) -> Bool {
        return lhs.name == rhs.name
    }
}
