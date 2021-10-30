//
//  File.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 29/10/21.
//

import Foundation

protocol PortfolioComposite {
    associatedtype T
    
    var flatWeight: [T] { get }
    
}
