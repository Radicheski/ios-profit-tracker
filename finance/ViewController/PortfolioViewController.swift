//
//  PortfolioViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class PortfolioViewController: BaseViewController<PortfolioView> {
    
    var datasource: UITableViewDataSource = PortfolioDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolioItem")
        self.title = "Global portfolio"
        self.customView.tableView.dataSource = self.datasourc
    }


}
