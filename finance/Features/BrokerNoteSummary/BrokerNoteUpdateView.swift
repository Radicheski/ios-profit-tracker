//
//  BrokerNoteUpdateContentConfiguration.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 26/01/22.
//

import UIKit

class BrokerNoteUpdateView: UIView {
    
    var stackView = UIStackView()
    
    var dateLabel = UILabel()
    var datePicker = UIDatePicker()
    var brokerageHouseLabel = UILabel()
    var brokerageHouseTextField = UITextField()
    var noteNumberLabel = UILabel()
    var noteNumberTextField = UITextField()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemGroupedBackground

        self.addSubview(self.stackView)
        self.stackView.axis = .vertical
        self.stackView.spacing = 10
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.stackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10),
            self.stackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10),
        ])
        
        self.stackView.addArrangedSubview(self.dateLabel)
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.dateLabel.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.dateLabel.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.datePicker)
        self.datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.datePicker.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.datePicker.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.brokerageHouseLabel)
        self.brokerageHouseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.brokerageHouseLabel.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.brokerageHouseLabel.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.brokerageHouseTextField)
        self.brokerageHouseTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.brokerageHouseTextField.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.brokerageHouseTextField.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.noteNumberLabel)
        self.noteNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.noteNumberLabel.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.noteNumberLabel.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.noteNumberTextField)
        self.noteNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.noteNumberTextField.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.noteNumberTextField.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.datePicker.datePickerMode = .date
        [self.brokerageHouseTextField, self.noteNumberTextField].forEach { $0.borderStyle = .roundedRect }
        [self.dateLabel, self.brokerageHouseLabel, self.noteNumberLabel].forEach { $0.font = UIFont.systemFont(ofSize: 12) }
        self.dateLabel.text = "Data"
        self.brokerageHouseLabel.text = "Corretora"
        self.noteNumberLabel.text = "Nota Nº"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
