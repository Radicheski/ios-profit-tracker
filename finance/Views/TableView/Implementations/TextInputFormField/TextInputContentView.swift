//
//  TextInputFormFieldContentView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 26/01/22.
//

import UIKit

protocol TextInputFormFieldDelegate: AnyObject {
    func box(didChangeValue value: String?)
}

class TextInputContentView: UIView & UIContentView {

    var configuration: UIContentConfiguration {
        didSet { self.updateContentView() }
    }

    private let toolbar: UIToolbar = .init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))

    private let titleLabel: UILabel = .init()
    private let textField: UITextField = .init()

    weak var delegate: TextInputFormFieldDelegate?

    init(configuration: TextInputContentConfiguration) {
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

        self.textField.addAction(UIAction(handler: textFieldEditingChanged(_:)), for: .editingChanged)
        self.textField.textAlignment = .right
        self.textField.inputAccessoryView = self.toolbar
        self.addSubview(self.textField)
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.textField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.textField.leftAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: 10),
            self.textField.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10),
            self.textField.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])

        self.toolbar.setItems([
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDoneButton))
        ], animated: false)
        toolbar.sizeToFit()

        self.updateContentView()
    }

    @objc func didTapDoneButton() {
        self.delegate?.box(didChangeValue: self.textField.text)
        self.endEditing(true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateContentView() {
        guard let contentConfiguration = self.configuration as? TextInputContentConfiguration else { return }

        self.titleLabel.text = contentConfiguration.title
        self.textField.placeholder = contentConfiguration.placeholder
        self.delegate = contentConfiguration.delegate
    }

    func textFieldEditingChanged(_ action: UIAction) {
        self.delegate?.box(didChangeValue: self.textField.text)
    }

}
