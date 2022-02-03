//
//  DateInputContentConfiguration.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 03/02/22.
//

import UIKit

class DateInputContentConfiguration: UIContentConfiguration {
    
    var title: String?
    var placeholder: String?
    
    weak var delegate: DateInputFormFieldDelegate?
    
    init(title: String?, placeholder: String?) {
        self.title = title
        self.placeholder = placeholder
    }
    
    func makeContentView() -> UIView & UIContentView {
        return DateInputContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> Self {
        return self
    }
    
}
