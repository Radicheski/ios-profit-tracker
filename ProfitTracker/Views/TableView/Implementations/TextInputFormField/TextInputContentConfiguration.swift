//
//  TextInputFormFieldContentConfiguration.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 26/01/22.
//

import UIKit

class TextInputContentConfiguration: UIContentConfiguration {

    var title: String?
    var placeholder: String?

    weak var delegate: TextInputFormFieldDelegate?

    init(title: String?, placeholder: String?) {
        self.title = title
        self.placeholder = placeholder
    }

    func makeContentView() -> UIView & UIContentView {
        return TextInputContentView(configuration: self)
    }

    func updated(for state: UIConfigurationState) -> Self {
        return self
    }

}
