//
//  Localizable.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 06/05/22.
//

import Foundation

/// A protocol that UI strings must conform to to prevent missing translations.
///
/// This protocol is intended to be used by enums in the following manner:
/// ```swift
/// public enum CustomLocalization: String, Localizable {
///    case someKey = "This is the comment"
/// }
/// ```
///
/// References in `Localizable.strings` file must contain enum ad case names separated by a dot (`.`).
/// ```
/// "CustomLocalization.someKey" = "This is a localized string";
/// ```
///
/// To use objects conforming to this protocol you must call `localizedString` property.
/// ```swift
/// print(CustomLocalization.someKey.localizedString)
/// ```
///
/// The main purpose of this protocol is to provide an convenient way to check if any string translation is missing.
/// This feature requires to create one test case for each enum conforming to this protocol.
/// ```swift
/// func testCustomLocalization() {
///  for strings in CutomLocalization.allCases {
///    XCTAssertNotEqual(string.key, string.localizedString)
///  }
/// }
/// ```
public protocol Localizable: RawRepresentable, CaseIterable where RawValue == String {
  /// The key used to look up an entry in a strings file.
  var key: String { get }
  /// The comment about the key-value pair. This parameter provides the translator
  /// with some context about the localized string’s presentation to the user.
  var comment: String { get }
  /// The localized string designated by `key`. If no key is found then `key` property is returned.
  var localizedString: String { get }
}

public extension Localizable {
  var key: String { "\(String(describing: Self.self)).\(String(describing: self))" }
  var comment: String { rawValue }
  var localizedString: String { NSLocalizedString(key, comment: rawValue) }
}
