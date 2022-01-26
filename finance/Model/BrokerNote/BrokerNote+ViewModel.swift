//
//  BrokerNote+ViewModel.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

extension BrokerNote {
    
    class ViewModel {
        
        var noteNumber: Box<String>
        var brokerageHouse: Box<String>
        var date: Box<String>
        var total: Box<String>
        
        init(from brokerNote: BrokerNote) {
            self.noteNumber = Box(Formatter.shared.number.string(from: NSNumber(value: brokerNote.noteNumber))!)
            self.brokerageHouse = Box(brokerNote.brokerageHouse)
            self.date = Box(Formatter.shared.date.string(from: brokerNote.date))
        
            self.total = Box(Formatter.shared.currency.string(from: brokerNote.total)!)
            
            self.noteNumber.listener = { newValue in
                brokerNote.noteNumber = try! Int(newValue, format: .number)
            }
            
            self.brokerageHouse.listener = { newValue in
                brokerNote.brokerageHouse = newValue
            }
            
            self.date.listener = { newValue in
                brokerNote.date = Formatter.shared.date.date(from: newValue)!
            }
        }
    }
    
}
