//
//  UpdateView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 04/01/22.
//

import UIKit

class UpdateView: UIView {
    
    private var stackView: UIStackView = UIStackView()
    private var allocationView: UIStackView = UIStackView()
    
    private var nameLabel: UILabel = UILabel()
    var nameTextField: UITextField = UITextField()
    
    private var weightLabel: UILabel = UILabel()
    var weightTextField: UITextField = UITextField()
    
    private var parentLabel: UILabel = UILabel()
    var parentTextField: UITextField = UITextField()
    
    private var assetLabel: UILabel = UILabel()
    var assetSwitch: UISwitch = UISwitch()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
        self.stackView.addArrangedSubview(self.nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nameLabel.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.nameLabel.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.nameTextField)
        self.nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nameTextField.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.nameTextField.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.weightLabel)
        self.weightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.weightLabel.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.weightLabel.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.weightTextField)
        self.weightTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.weightTextField.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.weightTextField.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.parentLabel)
        self.parentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.parentLabel.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.parentLabel.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.parentTextField)
        self.parentTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.parentTextField.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.parentTextField.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        
        self.allocationView.axis = .horizontal
        self.stackView.addArrangedSubview(self.allocationView)
        self.allocationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.allocationView.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.allocationView.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.allocationView.addArrangedSubview(self.assetLabel)
        self.assetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.assetLabel.topAnchor.constraint(equalTo: self.allocationView.safeAreaLayoutGuide.topAnchor),
            self.assetLabel.bottomAnchor.constraint(equalTo: self.allocationView.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        self.allocationView.addArrangedSubview(self.assetSwitch)
        self.assetSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.assetSwitch.topAnchor.constraint(equalTo: self.allocationView.safeAreaLayoutGuide.topAnchor),
            self.assetSwitch.bottomAnchor.constraint(equalTo: self.allocationView.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        self.parentTextField.isEnabled = false
        
        self.nameLabel.text = CustomLocalization.UpdateView.updateViewNameLabel
        self.weightLabel.text = CustomLocalization.UpdateView.updateViewWeightLabel
        self.parentLabel.text = CustomLocalization.UpdateView.updateViewParentLabel
        self.assetLabel.text = CustomLocalization.UpdateView.updateViewPortfolioLabel
        
        [self.nameTextField, self.weightTextField, self.parentTextField].forEach({
            $0.borderStyle = .roundedRect
        })
        
        [self.nameLabel, self.weightLabel, self.parentLabel].forEach({
            $0.font = UIFont.systemFont(ofSize: 12)
        })
        
        self.weightTextField.keyboardType = .decimalPad
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
