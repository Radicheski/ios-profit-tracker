//
//  PortfolioItem+PortfolioComposite.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 29/10/21.
//

import Foundation

extension PortfolioItem: PortfolioComposite {
    
    public var flatWeight: [PortfolioItem] {
        get {
            if items.isEmpty {
                return [self]
            } else {
                var result = [PortfolioItem]()
                
                self.items.flatMap( { $0.flatWeight } )
                    .forEach {
                        if let index = result.firstIndex(of: $0) {
                            result[index].weight += $0.weight * self.weight
                        } else {
                            var newItem = $0
                            newItem.weight *= self.weight
                            result.append(newItem)
                        }
                    }
                
                return result
            }
        }
    }
    
}
