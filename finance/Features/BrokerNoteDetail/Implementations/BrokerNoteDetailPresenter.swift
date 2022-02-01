//
//  BrokerNoteDetailPresenter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import UIKit

class BrokerNoteDetailPresenter: BrokerNoteDetailPresenterProtocol {
    
    weak var view: BrokerNoteDetailViewProtocol?
    
    func loadData(note: BrokerNote) {
        let item = BrokerNote.ViewModel(from: note)
        let viewController = FormViewController()
        var brokerageHouse: Box<String?> = Box(item.brokerageHouse.value)
        var noteNumber: Box<String?> = Box(item.noteNumber.value)
        var date: Box<String?> = Box(item.date.value)
        var total: Box<String?> = Box(item.total.value)
        let rows: [Row] = [
            TextInputFormField(key: "brokerageHouse", value: brokerageHouse, contentConfiguration: .init(title: "Corretora", placeholder: brokerageHouse.value)),
            TextInputFormField(key: "noteNumber", value: noteNumber, contentConfiguration: .init(title: "Nota Nº", placeholder: noteNumber.value)),
            TextInputFormField(key: "date", value: date, contentConfiguration: .init(title: "Data", placeholder: date.value)),
            TextInputFormField(key: "total", value: total, contentConfiguration: .init(title: "Total", placeholder: total.value)),
        ]
        
        let section = TableViewSection(key: "updateHeader", rows: rows)
        
        var transactionRows = item.transactions
        transactionRows.append(TextInputFormField(key: "newTransaction", value: Box(nil), contentConfiguration: .init(title: "Nova transação", placeholder: nil)))
        let transactionSection = TableViewSection(key: "transactions", rows: transactionRows)
        transactionSection.headerTitle = "Transações"
        
        self.view?.navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .cancel, primaryAction: UIAction(handler: self.action(_:)), menu: nil)
        
        self.view?.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .save, primaryAction: UIAction(handler: { [weak self] _ in
            if let brokerageHouse = brokerageHouse.value {
                item.brokerageHouse.value = brokerageHouse
            }
            if let noteNumber = noteNumber.value,
               let _ = try? Int(noteNumber, format: .number) {
                item.noteNumber.value = noteNumber
            }
            if let total = total.value {
                item.total.value = total
            }
            if let date = date.value,
               Formatter.shared.date.date(from: date) != nil {
                item.date.value = date
            }
            self?.view?.navigationController?.popViewController(animated: true)
        }))
        
        self.view?.presentData(item: [section])
    }
    
    func action( _ action: UIAction) {
        self.view?.navigationController?.popViewController(animated: true)
    }
    
}
