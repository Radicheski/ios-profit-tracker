//
//  BrokerNoteUpdateViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 26/01/22.
//

import Foundation

class BrokerNoteUpdateViewController: BaseViewController<BrokerNoteUpdateView> {
    
    var item: BrokerNote.ViewModel? {
        didSet { self.updateView() }
    }
    
    override func viewDidLoad() {
        self.updateView()
    }
    
    func updateView() {
        guard let item = self.item else { return }
        self.customView.datePicker.date = Formatter.shared.date.date(from: item.date.value)!
        self.customView.brokerageHouseTextField.placeholder = item.brokerageHouse.value
        self.customView.noteNumberTextField.placeholder = item.noteNumber.value
    }
    
}
