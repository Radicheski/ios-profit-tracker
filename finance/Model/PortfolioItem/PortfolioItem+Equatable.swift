//
//  PortfolioItem+Equatable.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 29/10/21.
//

import Foundation

extension PortfolioItem: Equatable {

    public static func ==(lhs: PortfolioItem, rhs: PortfolioItem) -> Bool {
        return lhs.name == rhs.name
    }
    
}
