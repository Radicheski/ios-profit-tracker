//
//  BrokerNoteContentConfiguration.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import UIKit

struct BrokerNoteContentConfiguration: UIContentConfiguration {

    var date: String
    var brokerageHouse: String?
    var noteNumber: String?
    var total: String?

    init(from viewModel: BrokerNote.ViewModel) {
        self.date = viewModel.date.value.formatted(date: .numeric, time: .omitted)
        self.brokerageHouse = viewModel.brokerageHouse.value
        self.noteNumber = viewModel.noteNumber.value
        self.total = viewModel.total.value
    }

    func makeContentView() -> UIView & UIContentView {
        return BrokerNoteContentView(configuration: self)
    }

    func updated(for state: UIConfigurationState) -> BrokerNoteContentConfiguration {
        return self
    }

}
