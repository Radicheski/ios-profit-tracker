//
//  Portfolio+ViewModel.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import UIKit

extension Portfolio {
    
    class ViewModel {
        var id: Box<String>
        var name: Box<String?>
        var weight: Box<String?>
        var parentId: Box<String>
        var isAsset: Box<Bool>
        
        init(from portfolio: Portfolio) {
            self.name = Box(portfolio.name)
            self.weight = Box(Formatter.shared.percent.string(from: portfolio.weight))
            self.parentId = Box(portfolio.parentId.uuidString)
            self.isAsset = Box(portfolio.asset)
            self.id = Box(portfolio.id.uuidString)
            
            self.id.listener = { newValue in
                portfolio.id = UUID(uuidString: newValue) ?? UUID()
            }
            
            self.name.listener = { newValue in
                if let newValue = newValue {
                    portfolio.name = newValue
                }
            }
            
            self.weight.listener = { newValue in
                do {
                    portfolio.weight = try Decimal(newValue ?? "0", format: .percent)
                } catch {
                    portfolio.weight = 0
                }
            }
            
            self.parentId.listener = { newValue in
                portfolio.parentId = UUID(uuidString: newValue) ?? UUID()
            }
            
            self.isAsset.listener = { newValue in
                portfolio.asset = newValue
            }
        
        }
        
        func configure(_ cell: UITableViewCell) {
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = self.name.value
            contentConfiguration.secondaryText = self.weight.value
            cell.contentConfiguration = contentConfiguration
        }
    }
    
}
