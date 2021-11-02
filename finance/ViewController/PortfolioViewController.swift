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
        self.customView.tableView.dataSource = self.datasource
        self.customView.tableView.tableFooterView = self.getFooter()
    }
    
    func getFooter() -> UIView {
        let footer = UILabel()
        footer.backgroundColor = .yellow
        footer.textAlignment = .center
        footer.frame = CGRect(x: 0, y: 0, width: self.customView.tableView.frame.width, height: 40)
//        let value = PortfolioMock.shared.data[0].items.map ( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
        let value = PortfolioMock.shared.data.filter( { $0.parentId == nil } ).map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
        footer.text = "Unallocated: \(100 - value * 100)%"
        return footer
    }


}
