//
//  TransactionTests.swift
//  financeTests
//
//  Created by Erik Radicheski da Silva on 14/01/22.
//

import XCTest
import finance
import SwiftyJSON

class TransactionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testTest() throws {
        var array: [Transaction] = []
        if let path = Bundle.main.path(forResource: "transactions", ofType: "json"),
           let data = FileManager.default.contents(atPath: path) {
            let json = try JSON(data: data)
            for object in json.arrayValue {
                let item = Transaction()
                #warning("Unsafe unwrap")
                item.date = Formatter.shared.isoDate.date(from: object["date"].stringValue)!
                item.quantity = object["quantity"].intValue
                item.ticker = object["ticker"].stringValue
                item.total = Decimal(string: object["total"].stringValue, locale: nil)!
                array.append(item)
            }
        }

        var data: [String: Int] = [:]
        for transaction in array {
            data[transaction.ticker, default: 0] += transaction.quantity
        }
        data.keys.filter { data[$0]! == 0 }.forEach { data.removeValue(forKey: $0) }
        data.forEach { print("\($0.key)\t\($0.value)") }

    }

}
