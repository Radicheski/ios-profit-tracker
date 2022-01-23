//
//  CustomContentConfiguration.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import UIKit

struct CustomContentConfiguration: UIContentConfiguration {

    var title: String?
    var weight: String?
    var price: String?
    var quantity: String?

    func makeContentView() -> UIView & UIContentView {
        return CustomContentView(self)
    }

    func updated(for state: UIConfigurationState) -> Self {
        return self
    }

}
