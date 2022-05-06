//
//  Formatter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 06/01/22.
//

import Foundation

public struct Formatter {

    public static var shared = Formatter()

    private(set) public lazy var percent: NumberFormatter = {
        let formatter = NumberFormatter()

        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.minimumIntegerDigits = 1

        return formatter
    }()

    private(set) public lazy var currency: NumberFormatter = {
        let formatter = NumberFormatter()

        formatter.numberStyle = .currency

        return formatter
    }()

    private(set) public lazy var date: DateFormatter = {
        let formatter = DateFormatter()

        formatter.dateStyle = .short

        return formatter
    }()

    private(set) public lazy var isoDate: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()

        formatter.formatOptions = .withFullDate

        return formatter
    }()

    private init() {}

    private(set) public lazy var number: NumberFormatter = {
        let formatter = NumberFormatter()

        formatter.groupingSeparator = Locale.current.groupingSeparator
        formatter.decimalSeparator = Locale.current.decimalSeparator
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true

        return formatter
    }()

}
