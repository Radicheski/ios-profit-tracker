//
//  Transaction+CoreDataProperties.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 14/01/22.
//
//

import Foundation
import CoreData

extension Transaction {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var ticker: String
    @NSManaged public var date: Date
    @NSManaged public var quantity: Int
    @NSManaged public var cdtotal: NSDecimalNumber
    @NSManaged public var brokerNote: BrokerNote

}

extension Transaction: Identifiable {

}

extension Transaction {

    convenience init() {
        self.init(entity: Self.entity(), insertInto: nil)
    }

    public var total: Decimal {
        get { return self.cdtotal.decimalValue }
        set { self.cdtotal = NSDecimalNumber(decimal: newValue) }
    }
}
