//
//  BrokerNote+CoreDataProperties.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//
//

import Foundation
import CoreData


extension BrokerNote {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<BrokerNote> {
        return NSFetchRequest<BrokerNote>(entityName: "BrokerNote")
    }

    @NSManaged public var brokerageHouse: String
    @NSManaged public var date: Date
    @NSManaged public var noteNumber: Int
    @NSManaged public var cdtransactions: NSSet?

}

// MARK: Generated accessors for transactions
extension BrokerNote {

    @objc(addCdtransactionsObject:)
    @NSManaged public func addToCdtransactions(_ value: Transaction)

    @objc(removeCdtransactionsObject:)
    @NSManaged public func removeFromCdtransactions(_ value: Transaction)

    @objc(addCdtransactions:)
    @NSManaged public func addToCdtransactions(_ values: NSSet)

    @objc(removeCdtransactions:)
    @NSManaged public func removeFromCdtransactions(_ values: NSSet)

}

extension BrokerNote : Identifiable {

}
