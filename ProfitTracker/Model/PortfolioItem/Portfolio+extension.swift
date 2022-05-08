//
//  Portfolio.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 29/10/21.
//

import Foundation

extension Portfolio {

    public var weight: Decimal {
        get {
            self.cdweight.decimalValue
        }
        set {
            self.cdweight = NSDecimalNumber(decimal: newValue)
        }
    }

    convenience init() {
        self.init(entity: Portfolio.entity(), insertInto: nil)
    }

    public static func getItems(_ items: [Portfolio]) -> [Portfolio] {

        let map: [UUID?: Portfolio] = items.reduce(into: [:]) { dict, item in
            dict[item.id] = item
        }

        var result: [String: Portfolio] = [:]

        for item in items where item.asset {
            var weight = item.weight
            var parent = map[item.parentId]
            while parent != nil {
                weight *= parent!.weight
                parent = map[parent!.parentId]
            }
            if result[item.name] == nil {
                let newItem = Portfolio()
                newItem.name = item.name
                newItem.weight = weight
                result[item.name] = newItem
            } else {
                result[item.name]?.weight += weight
            }
        }

        return result.compactMap { $1 }
    }

}
