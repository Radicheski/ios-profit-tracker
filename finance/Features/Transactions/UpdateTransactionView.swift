//
//  UpdateTransactionView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 16/01/22.
//

import UIKit

class UpdateTransactionView: UIView {
    
    private var stackView = UIStackView()
    
    private var dateLabel = UILabel()
    var dateTextField = UIDatePicker()
    
    private var tickerLabel = UILabel()
    var tickerTextField = UITextField()
    
    private var quantityLabel = UILabel()
    var quantityTextField = UITextField()
    
    private var totalLabel = UILabel()
    var totalTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .systemBackground
        
        self.addSubview(self.stackView)
        self.stackView.spacing = 5
        self.stackView.axis = .vertical
        self.stackView.distribution = .fill
        self.stackView.alignment = .center
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
        
        self.stackView.addArrangedSubview(self.dateTextField)
        self.dateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.dateTextField.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.dateTextField.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.tickerLabel)
        self.tickerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tickerLabel.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.tickerLabel.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.tickerTextField)
        self.tickerTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tickerTextField.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.tickerTextField.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.quantityLabel)
        self.quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.quantityLabel.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.quantityLabel.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.quantityTextField)
        self.quantityTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.quantityTextField.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.quantityTextField.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.totalLabel)
        self.totalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.totalLabel.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.totalLabel.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.totalTextField)
        self.totalTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.totalTextField.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.totalTextField.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        #warning("Localization")
        self.dateLabel.text = "Data"
        self.tickerLabel.text = "Ticker"
        self.quantityLabel.text  = "Quantidade"
        self.totalLabel.text = "Total"
        
        #warning("Commented")
        self.dateTextField.datePickerMode = .date
        self.dateTextField.preferredDatePickerStyle = .compact
        [/*self.dateTextField, */self.tickerTextField, self.quantityTextField, self.totalTextField].forEach({
            $0.borderStyle = .roundedRect
        })
        
        [self.dateLabel, self.tickerLabel, self.quantityLabel, self.totalLabel].forEach({
            $0.font = UIFont.systemFont(ofSize: 12)
        })
        
        [self.quantityTextField, self.totalTextField].forEach { $0.keyboardType = .decimalPad}
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
