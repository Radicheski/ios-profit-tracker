//
//  DateInputFormField.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 03/02/22.
//

import UIKit

class DateInputFormField: Row {

    var key: String
    var value: Box<Date>
    var contentConfiguration: UIContentConfiguration

    init(key: String, value: Box<Date>, contentConfiguration: DateInputContentConfiguration) {
        self.key = key
        self.value = value
        self.contentConfiguration = contentConfiguration
        contentConfiguration.delegate = self
    }

}

extension DateInputFormField: DateInputFormFieldDelegate {
    func box(didChangeValue value: Date) {
        self.value.value = value
    }
}
