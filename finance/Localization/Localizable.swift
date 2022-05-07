//
//  Localizable.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 06/05/22.
//

import Foundation

protocol Localizable: RawRepresentable where RawValue == String {
  var key: String { get }
  var comment: String { get }
  var localizedString: String { get }
}

extension Localizable {
  var key: String { "\(String(describing: Self.self)).\(String(describing: self))" }
  var comment: String { rawValue }
  var localizedString: String { NSLocalizedString(key, comment: rawValue) }
}
