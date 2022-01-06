//
//  Formatter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 06/01/22.
//

import Foundation

struct Formatter {
    
    static var shared = Formatter()
    
    lazy var percent: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.minimumIntegerDigits = 1
        
        return formatter
    }()
    
    lazy var currency: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        
        return formatter
    }()
    
    private init(){}
    
}
