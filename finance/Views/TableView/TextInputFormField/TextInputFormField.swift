//
//  TextInputFormField.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 26/01/22.
//

import UIKit

class TextInputFormField: FormField {

    var key: String
    var value: Box<String?>
    var contentConfiguration: UIContentConfiguration

    init(key: String, value: Box<String?>, contentConfiguration: TextInputContentConfiguration) {
        self.key = key
        self.value = value
        self.contentConfiguration = contentConfiguration
        contentConfiguration.delegate = self
    }

}

extension TextInputFormField: TextInputFormFieldDelegate {

    func box(didChangeValue value: String?) {
        self.value.value = value
    }

}
