//
//  CustomContentConfiguration.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import UIKit

struct CustomContentConfiguration: UIContentConfiguration {

    var title: String?
    var weight: Decimal?
    var price: Decimal?

    func makeContentView() -> UIView & UIContentView {
        return CustomContentView(self)
    }

    func updated(for state: UIConfigurationState) -> Self {
        return self
    }

}
