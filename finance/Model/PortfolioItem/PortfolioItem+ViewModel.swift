//
//  PortfolioItem+ViewModel.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import UIKit

extension PortfolioItem {
    
    class ViewModel {
        var id: String
        var name: String
        var weight: String?
        var parentId: String
        var isAsset: Bool
        
        init(from portfolio: Portfolio) {
            self.name = portfolio.name
            self.weight = Formatter.shared.percent.string(from: portfolio.weight)
            self.parentId = portfolio.parentId.uuidString
            self.isAsset = portfolio.asset
            self.id = portfolio.id.uuidString
        }
        
        func configure(_ cell: UITableViewCell) {
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = self.name
            contentConfiguration.secondaryText = self.weight
            cell.contentConfiguration = contentConfiguration
        }
    }
    
}
