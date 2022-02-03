//
//  BrokerNote+ViewModel.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

extension BrokerNote {
    
    class ViewModel {
        
        var id: UUID
        var noteNumber: Box<String>
        var brokerageHouse: Box<String>
        var date: Box<Date>
        var total: Box<String>
        
        var transactions: [Row]
        
        init(from brokerNote: BrokerNote) {
            self.id = brokerNote.id
            self.noteNumber = Box(Formatter.shared.number.string(from: NSNumber(value: brokerNote.noteNumber))!)
            self.brokerageHouse = Box(brokerNote.brokerageHouse)
            self.date = Box(brokerNote.date)
        
            self.total = Box(Formatter.shared.currency.string(from: brokerNote.total)!)
            
            self.transactions = brokerNote.cdtransactions?.allObjects as? [Row] ?? []
            
            self.noteNumber.listener = { newValue in
                brokerNote.noteNumber = try! Int(newValue, format: .number)
            }
            
            self.brokerageHouse.listener = { newValue in
                brokerNote.brokerageHouse = newValue
            }
            
            self.date.listener = { newValue in
                brokerNote.date = newValue
            }
        }
    }
    
}

extension BrokerNote.ViewModel: Section {
    
    var key: String { BrokerNoteDetailSections.header.rawValue }
    
    var rows: [Row] {
        var brokerageHouse: Box<String?> = Box(self.brokerageHouse.value)
        var noteNumber: Box<String?> = Box(self.noteNumber.value)
        var date: Box<Date> = Box(self.date.value)
        var total: Box<String?> = Box(self.total.value)
        return [
            TextInputFormField(key: "brokerageHouse", value: brokerageHouse, contentConfiguration: .init(title: "Corretora", placeholder: brokerageHouse.value)),
            TextInputFormField(key: "noteNumber", value: noteNumber, contentConfiguration: .init(title: "Nota Nº", placeholder: noteNumber.value)),
            DateInputFormField(key: "date", value: date, contentConfiguration: .init(title: "Data", placeholder: date.value.formatted(date: .numeric, time: .omitted))),
            TextInputFormField(key: "total", value: total, contentConfiguration: .init(title: "Total", placeholder: total.value)),
        ]
    }
    
    func insert(row: Row, at index: Int) {}
    
    func insert(row: Row, after key: String) {}
    
    func insert(row: Row, before key: String) {}
    
    func removeRow(at index: Int) -> Row {
        #warning("FIX THIS")
        return self.transactions.last!
    }
    
    func removeRow(withKey key: String) -> Row? { nil }
    
    func moveRow(from sourceIndex: Int, to targetIndex: Int) {}
    
}
