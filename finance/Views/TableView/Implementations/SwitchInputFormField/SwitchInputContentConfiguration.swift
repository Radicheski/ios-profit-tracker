//
//  SwitchInputFormFieldContentConfiguration.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 29/01/22.
//

import UIKit

class SwitchInputContentConfiguation: UIContentConfiguration {
    
    var title: String?
    var value: Bool
    
    weak var delegate: SwitchInputFormFieldDelegate?
    
    init(title: String?, value: Bool) {
        self.title = title
        self.value = value
    }
    
    func makeContentView() -> UIView & UIContentView {
        return SwitchInputContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> Self {
        return self
    }
    
}
