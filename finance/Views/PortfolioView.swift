//
//  PortfolioView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class PortfolioView: UIView {
    
    let stackView = UIStackView()

    let tableView = UITableView()
    let footer = UILabel()
    
    var footerText: String? {
        set {
            self.footer.text = newValue
        }
        get {
            return self.footer.text
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.stackView)
        self.stackView.spacing = 0
        self.stackView.axis = .vertical
        self.stackView.distribution = .fill
        self.stackView.alignment = .center
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.stackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.stackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
        ])
        
        self.stackView.addArrangedSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
        ])
        
        self.footer.textAlignment = .center
        self.stackView.addArrangedSubview(self.footer)
        self.footer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.footer.rightAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.rightAnchor),
            self.footer.leftAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.leftAnchor),
            self.footer.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
