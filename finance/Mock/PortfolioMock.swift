//
//  PortfolioMock.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 01/11/21.
//

import Foundation

class PortfolioMock {
    
    static var shared = PortfolioMock()

    weak var presenter: PortfolioManagerPresenterProtocol?
    var data: [PortfolioItem]
    
    private init() {
        if let path = Bundle.main.path(forResource: "portfolio", ofType: "json"),
           let data = FileManager.default.contents(atPath: path),
           let json = try? JSONDecoder().decode([PortfolioItem].self, from: data) {
            self.data = json
        } else {
            self.data = []
        }
    }
    
}
