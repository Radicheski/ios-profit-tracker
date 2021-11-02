//
//  PortfolioItem.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 29/10/21.
//

import Foundation

public struct PortfolioItem: Codable {
    
    public var id: UUID
    public var rank: Int
    public var name: String
    public var weight: Decimal
    public var items: [PortfolioItem]!
    public var parentId: UUID?
    
}

extension PortfolioItem {
    
    public static func getItems(_ items: [PortfolioItem]) -> [PortfolioItem] {
        var filtered = items.filter( { $0.parentId == nil } )
        
        var result = [PortfolioItem]()
        
        while !filtered.isEmpty {
            let firstItem = filtered[0]
            filtered.remove(at: 0)
            
            items.filter( { $0.parentId == firstItem.id } ).forEach( {
                var copy = $0
                copy.weight *= firstItem.weight
                if items.contains(where: { $0.parentId == copy.id } ) {
                    filtered.append(copy)
                } else {
                    result.append(copy)
                }
            } )
        }
        
        var map = [String: PortfolioItem]()
        
        for item in result {
            if let _ = map[item.name] {
                map[item.name]!.weight += item.weight
            } else {
                map[item.name] = item
            }
        }
        
        return map.map( { $0.value } )
    }
    
}
