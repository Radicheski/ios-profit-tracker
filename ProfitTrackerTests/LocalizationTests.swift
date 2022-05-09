//
//  FinanceLocalizationTests.swift
//  FinanceLocalizationTests
//
//  Created by Erik Radicheski da Silva on 07/05/22.
//

import XCTest
import ProfitTracker

class LocalizationTests: XCTestCase {

  func testCommonStrings() {
    for string in CommonStrings.allCases {
      XCTAssertNotEqual(string.key, string.localizedString)
    }
  }

  func testBrokerNoteStrings() {
    for string in BrokerNoteStrings.allCases {
      XCTAssertNotEqual(string.key, string.localizedString)
    }
  }

  func testTransactionStrings() {
    for string in TransactionStrings.allCases {
      XCTAssertNotEqual(string.key, string.localizedString)
    }
  }

  func testPortfolioUpdateStrings() {
    for string in PortfolioUpdateStrings.allCases {
      XCTAssertNotEqual(string.key, string.localizedString)
    }
  }

  func testPortfolioManagerStrings() {
    for string in PortfolioManagerStrings.allCases {
      XCTAssertNotEqual(string.key, string.localizedString)
    }
  }

  func testSummaryStrings() {
    for string in SummaryStrings.allCases {
      XCTAssertNotEqual(string.key, string.localizedString)
    }
  }

}
