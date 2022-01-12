//
//  PortfolioItem.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 29/10/21.
//

import Foundation

extension PortfolioItem {
    
    public var weight: Decimal {
        get {
            self.cdweight.decimalValue
        }
        set {
            self.cdweight = NSDecimalNumber(decimal: newValue)
        }
    }
    
    convenience init() {
        self.init(entity: PortfolioItem.entity(), insertInto: nil)
    }
    
    public static func getItems(_ items: [PortfolioItem]) -> [PortfolioItem] {
        var filtered = items.filter( { $0.parentId == nil } )
        
        var result = [PortfolioItem]()
        
        while !filtered.isEmpty {
            let firstItem = PortfolioItem()
            firstItem.id = filtered[0].id
            firstItem.parentId = filtered[0].parentId
            firstItem.name = filtered[0].name
            firstItem.weight = filtered[0].weight
            filtered.remove(at: 0)
            
            items.filter( { $0.parentId == firstItem.id } ).forEach( {
                let newItem = PortfolioItem()
                newItem.id = $0.id
                newItem.parentId = $0.parentId
                newItem.name = $0.name
                newItem.weight = $0.weight
                newItem.weight *= firstItem.weight
                if items.contains(where: { $0.parentId == newItem.id } ) {
                    filtered.append(newItem)
                } else {
                    result.append(newItem)
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
        Persistence.shared.saveContext()
        return map.map( { $0.value } )
    }
    
}
