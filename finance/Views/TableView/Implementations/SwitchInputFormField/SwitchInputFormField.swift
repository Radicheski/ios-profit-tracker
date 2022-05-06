//
//  SwitchInputFormField.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 29/01/22.
//

import UIKit

class SwitchInputFormField: Row {

    var key: String
    var value: Box<Bool>
    var contentConfiguration: UIContentConfiguration

    init(key: String, value: Box<Bool>, contentConfiguration: SwitchInputContentConfiguation) {
        self.key = key
        self.value = value
        self.contentConfiguration = contentConfiguration
        contentConfiguration.delegate = self
    }

}

extension SwitchInputFormField: SwitchInputFormFieldDelegate {

    func box(didChangeValue value: Bool) {
        self.value.value = value
    }

}
