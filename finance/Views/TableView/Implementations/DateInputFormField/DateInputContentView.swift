//
//  DateInputContentView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 03/02/22.
//

import UIKit

protocol DateInputFormFieldDelegate: AnyObject {
    func box(didChangeValue value: Date)
}

class DateInputContentView: UIView & UIContentView {
    
    var configuration: UIContentConfiguration {
        didSet { self.updateContentView() }
    }
    
    private let toolbar: UIToolbar = .init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
    
    private let titleLabel: UILabel = .init()
    private let textField: UITextField = .init()
    
    private let datePicker: UIDatePicker = .init()
    
    weak var delegate: DateInputFormFieldDelegate?
    
    init(configuration: DateInputContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        
        self.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.titleLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
        
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.datePickerMode = .date
        self.datePicker.addAction(UIAction(handler: didDateSelect(_:)), for: .valueChanged)
        
        self.textField.addAction(UIAction(handler: textFieldEditingChaged(_:)), for: .editingDidEnd)
        self.textField.textAlignment = .right
        self.textField.inputAccessoryView = self.toolbar
        self.addSubview(self.textField)
        self.textField.inputView = self.datePicker
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.textField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.textField.leftAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: 10),
            self.textField.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10),
            self.textField.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
        
        self.toolbar.setItems([
            UIBarButtonItem.flexibleSpace(),
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton))
        ], animated: false)
        toolbar.sizeToFit()
        
        self.updateContentView()
        
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func updateContentView() {
        guard let contentConfiguration = self.configuration as? DateInputContentConfiguration else { return }
        
        self.titleLabel.text = contentConfiguration.title
        self.textField.placeholder = contentConfiguration.placeholder
        self.delegate = contentConfiguration.delegate
    }
    
    func textFieldEditingChaged(_ action: UIAction) {
        self.delegate?.box(didChangeValue: self.datePicker.date)
    }
    
    @objc func didTapDoneButton() {
        self.delegate?.box(didChangeValue: self.datePicker.date)
        self.endEditing(true)
    }
    
    func didDateSelect(_ action: UIAction) {
        self.textField.text = self.datePicker.date.formatted(date: .numeric, time: .omitted)
    }
    
}
