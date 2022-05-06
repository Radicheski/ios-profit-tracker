//
//  RegistrableTableViewCell.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 20/01/22.
//

import UIKit

protocol RegistrableTableViewCell where Self: UITableViewCell {

    static var identifier: String { get }

}

extension RegistrableTableViewCell {

    static var identifier: String { get { String(describing: Self.self) } }

}
