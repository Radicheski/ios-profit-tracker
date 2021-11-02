//
//  TestPortfolioItem.swift
//  financeTests
//
//  Created by Erik Radicheski da Silva on 29/10/21.
//

import XCTest
import finance

class TestPortfolioItem: XCTestCase {
    
    var item: [PortfolioItem]!
    
    var expectation: [String: Decimal]!
    
    var output: [PortfolioItem]!
    
    override func setUpWithError() throws {
        
        // Load test data
        if let path = Bundle.main.path(forResource: "portfolio", ofType: "json"),
           let data = FileManager.default.contents(atPath: path) {
            let json = try JSONDecoder().decode([PortfolioItem].self, from: data)
            self.item = json
        }
        
        //Load expected output
        if let path = Bundle.main.path(forResource: "portfolioExpected", ofType: "json"),
           let data = FileManager.default.contents(atPath: path) {
            let json = try JSONDecoder().decode([String: String].self, from: data)
            self.expectation = [String: Decimal]()
            json.forEach { self.expectation[$0.key] = Decimal(string: $0.value) }
        }
        
        //Execute routine to be tested
        self.output = PortfolioItem.getItems(self.item)
    }
    
    func testCheckSize() {
        XCTAssertEqual(self.output.count, self.expectation.count)
    }
    
    func testOutputValues() {
        self.output.forEach {
            XCTAssertEqual($0.weight, self.expectation[$0.name]!)
        }
    }
    
}
