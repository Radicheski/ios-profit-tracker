//
//  BrokerNoteContentView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import UIKit

class BrokerNoteContentView: UIView, UIContentView {

    var dateLabel = UILabel()
    var brokerageHouseLabel = UILabel()
    var totalLabel = UILabel()
    var noteNumberLabel = UILabel()

    var configuration: UIContentConfiguration {
        didSet { self.updateView() }
    }

    init(configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)

        self.addSubview(self.dateLabel)
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.dateLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.dateLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10),
        ])

        self.addSubview(self.brokerageHouseLabel)
        self.brokerageHouseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.brokerageHouseLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 5),
            self.brokerageHouseLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 15),
            self.brokerageHouseLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])

        self.addSubview(self.noteNumberLabel)
        self.noteNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.noteNumberLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.noteNumberLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10),
        ])

        self.addSubview(self.totalLabel)
        self.totalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.totalLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 5),
            self.totalLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -15),
            self.totalLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])

        self.dateLabel.font = UIFont.systemFont(ofSize: 12)
        self.brokerageHouseLabel.font = UIFont.systemFont(ofSize: 17)
        self.noteNumberLabel.font = UIFont.systemFont(ofSize: 12)
        self.totalLabel.font = UIFont.systemFont(ofSize: 17)

        self.dateLabel.textAlignment = .left
        self.dateLabel.textAlignment = .left
        self.noteNumberLabel.textAlignment = .right
        self.totalLabel.textAlignment = .right

        self.updateView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    func updateView() {
        guard let configuration = self.configuration as? BrokerNoteContentConfiguration else { return }
        self.dateLabel.text = configuration.date
        self.brokerageHouseLabel.text = configuration.brokerageHouse
        self.noteNumberLabel.text = configuration.noteNumber
        self.totalLabel.text = configuration.total
    }

}
