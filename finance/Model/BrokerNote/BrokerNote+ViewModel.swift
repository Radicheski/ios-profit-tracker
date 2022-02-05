//
//  BrokerNote+ViewModel.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation
import UIKit

extension BrokerNote {
    
    class ViewModel {
        private var item: BrokerNote
        
        var id: UUID
        var noteNumber: Box<String?>
        var brokerageHouse: Box<String?>
        var date: Box<Date>
        var total: Box<String?>
        
        var transactions: [Row]
        
        var header: [Row]
        
        init(from brokerNote: BrokerNote) {
            self.item = brokerNote
            self.id = brokerNote.id
            self.noteNumber = Box(Formatter.shared.number.string(from: NSNumber(value: brokerNote.noteNumber))!)
            self.brokerageHouse = Box(brokerNote.brokerageHouse)
            self.date = Box(brokerNote.date)
            
            self.total = Box(Formatter.shared.currency.string(from: brokerNote.total)!)
            
            self.transactions = brokerNote.cdtransactions?.allObjects as? [Row] ?? []
            
            self.header = [
                TextInputFormField(key: "brokerageHouse", value: brokerageHouse, contentConfiguration: .init(title: "Corretora", placeholder: brokerageHouse.value)),
                TextInputFormField(key: "noteNumber", value: self.noteNumber, contentConfiguration: .init(title: "Nota Nº", placeholder: self.noteNumber.value)),
                DateInputFormField(key: "date", value: date, contentConfiguration: .init(title: "Data", placeholder: date.value.formatted(date: .numeric, time: .omitted))),
                TextInputFormField(key: "total", value: total, contentConfiguration: .init(title: "Total", placeholder: total.value)),
            ]
        }
        
        func saveAction(_ action: UIAction) {
            
            if let value = self.brokerageHouse.value, !value.isEmpty {
                self.item.brokerageHouse = value
            }
            
            if let stringValue = self.noteNumber.value, !stringValue.isEmpty,
               let value = try? Int(stringValue, format: .number) {
                self.item.noteNumber = value
            }
            
            self.item.date = self.date.value
        }
    }
    
}

extension BrokerNote.ViewModel: Section {
    
    var key: String { BrokerNoteDetailSections.header.rawValue }
    
    var rows: [Row] { self.header }
    
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
