//
//  PortfolioView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class PortfolioView: UIView {

    let tableView = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        NSLayoutConstraint.activate([
            self.tableView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            self.tableView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            self.tableView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.tableView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
