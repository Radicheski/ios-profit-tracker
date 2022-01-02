//
//  PortfolioItem+CoreDataProperties.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 02/01/22.
//
//

import Foundation
import CoreData


extension PortfolioItem {
    
    @nonobjc public class func createFetchRequest() -> NSFetchRequest<PortfolioItem> {
        return NSFetchRequest<PortfolioItem>(entityName: "PortfolioItem")
    }
    
    @NSManaged public var id: UUID
    @NSManaged public var rank: Int
    @NSManaged public var name: String
    @NSManaged public var cdweight: NSDecimalNumber
    @NSManaged public var parentId: UUID?
    
    public var weight: Decimal {
        get {
            self.cdweight.decimalValue
        }
        set {
            self.cdweight = NSDecimalNumber(decimal: newValue)
        }
    }
    
}

extension PortfolioItem : Identifiable {
    public static func ==(lhs: PortfolioItem, rhs: PortfolioItem) -> Bool {
        return lhs.name == rhs.name
    }
}
