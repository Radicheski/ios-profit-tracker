//
//  SwitchInputContentView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 29/01/22.
//

import UIKit

protocol SwitchInputFormFieldDelegate: AnyObject {
    func box(didChangeValue value: Bool)
}

class SwitchInputContentView: UIView & UIContentView {

    var configuration: UIContentConfiguration {
        didSet { self.updateContentView() }
    }

    private let titleLabel: UILabel = .init()
    private let switchInput: UISwitch = .init()

    weak var delegate: SwitchInputFormFieldDelegate?

    init(configuration: SwitchInputContentConfiguation) {
        self.configuration = configuration
        super.init(frame: .zero)

        self.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.titleLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])

        self.addSubview(self.switchInput)
        self.switchInput.addAction(UIAction(handler: self.switchStateDidChange(_:)), for: .valueChanged)
        self.switchInput.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.switchInput.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.switchInput.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10),
            self.switchInput.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])

        self.updateContentView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateContentView() {
        guard let contentConfiguration = self.configuration as? SwitchInputContentConfiguation else { return }

        self.titleLabel.text = contentConfiguration.title
        self.switchInput.isOn = contentConfiguration.value
        self.delegate = contentConfiguration.delegate
    }

    func switchStateDidChange(_ action: UIAction) {
        self.delegate?.box(didChangeValue: self.switchInput.isOn)
    }

    override func becomeFirstResponder() -> Bool {
        print(#function)
        return super.becomeFirstResponder()
    }

}
