//
//  TestPortfolio.swift
//  financeTests
//
//  Created by Erik Radicheski da Silva on 29/10/21.
//

import XCTest
import ProfitTracker
import SwiftyJSON

class TestPortfolio: XCTestCase {

    var item: [Portfolio] = []

    var expectation: [String: Decimal]!

    var output: [Portfolio]!

    override func setUpWithError() throws {

        // Load test data
        if let path = Bundle.main.path(forResource: "portfolio", ofType: "json"),
           let data = FileManager.default.contents(atPath: path),
           let json = try? JSON(data: data).arrayValue {
            for object in json {
                let item = Portfolio(entity: Portfolio.entity(), insertInto: nil)
                item.id = UUID(uuidString: object["id"].stringValue)!
                item.parentId = UUID(uuidString: object["parentId"].stringValue) ?? UUID()
                item.rank = object["rank"].intValue
                item.weight = Decimal(string: object["weight"].stringValue, locale: nil)!
                item.name = object["name"].stringValue
                item.asset = object["asset"].boolValue
                self.item.append(item)
            }
        }

        // Load expected output
        if let path = Bundle.main.path(forResource: "portfolioExpected", ofType: "json"),
           let data = FileManager.default.contents(atPath: path) {
            let json = try JSONDecoder().decode([String: String].self, from: data)
            self.expectation = [String: Decimal]()
            json.forEach { self.expectation[$0.key] = Decimal(string: $0.value) }
        }

        // Execute routine to be tested
        self.output = Portfolio.getItems(self.item)
    }

    func testCheckSize() {
        XCTAssertEqual(self.output.count, self.expectation.count)
    }

    func testUniqueNames() {
        var output = Set<String>()
        self.output.forEach { output.insert($0.name) }

        var expectation = Set<String>()
        self.expectation.keys.forEach { expectation.insert($0) }

        XCTAssertEqual(output, expectation)
    }

    func testOutputValues() {
        self.output.forEach {
            XCTAssertEqual($0.weight, self.expectation[$0.name]!)
        }
    }

    func testGetItemsPerfomance() {
        self.measure {
            Portfolio.getItems(self.item)
        }
    }

}
