//
//  Portfolio+CoreDataProperties.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 02/01/22.
//
//

import Foundation
import CoreData

extension Portfolio {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Portfolio> {
        return NSFetchRequest<Portfolio>(entityName: "Portfolio")
    }

    @NSManaged public var id: UUID
    @NSManaged public var rank: Int
    @NSManaged public var name: String
    @NSManaged public var cdweight: NSDecimalNumber
    @NSManaged public var parentId: UUID
    @NSManaged public var asset: Bool

}
