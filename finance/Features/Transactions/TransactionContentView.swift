//
//  TransactionContentView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 15/01/22.
//

import UIKit

class TransactionContentView: UIView, UIContentView {

    var dateLabel = UILabel()
    var tickerLabel = UILabel()
    var quantityLabel = UILabel()
    var totalLabel = UILabel()

    var configuration: UIContentConfiguration {
        didSet { self.updateView() }
    }

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)

        self.addSubview(self.dateLabel)
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.dateLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.dateLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10),
        ])

        self.addSubview(self.tickerLabel)
        self.tickerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tickerLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 5),
            self.tickerLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 15),
            self.tickerLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])

        self.addSubview(self.quantityLabel)
        self.quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.quantityLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.quantityLabel.centerYAnchor.constraint(equalTo: self.tickerLabel.centerYAnchor),
        ])

        self.addSubview(self.totalLabel)
        self.totalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.totalLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 5),
            self.totalLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -15),
        ])

        self.dateLabel.font = UIFont.systemFont(ofSize: 12)
        self.tickerLabel.font = UIFont.systemFont(ofSize: 17)
        self.quantityLabel.font = UIFont.systemFont(ofSize: 17)
        self.totalLabel.font = UIFont.systemFont(ofSize: 17)

        self.dateLabel.textAlignment = .left
        self.dateLabel.textAlignment = .left
        self.quantityLabel.textAlignment = .center
        self.totalLabel.textAlignment = .right

        self.updateView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    func updateView() {
        guard let configuration = self.configuration as? TransactionContentConfiguration else { return }
        self.dateLabel.text = Formatter.shared.date.string(from: configuration.date)
        self.tickerLabel.text = configuration.ticker
        self.quantityLabel.text = configuration.quantity
        self.totalLabel.text = configuration.total
    }

}
