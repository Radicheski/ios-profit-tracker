//
//  PortfolioItem.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 29/10/21.
//

import Foundation

public struct PortfolioItem: Codable {
    
    public var rank: Int
    public var name: String
    public var weight: Decimal
    public var items: [PortfolioItem]
    
}
