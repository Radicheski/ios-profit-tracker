//
//  PortfolioDataSource.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 01/11/21.
//

import UIKit

class PortfolioDataSource: NSObject, UITableViewDataSource {
    
    var source: PortfolioMock = PortfolioMock.shared
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.source.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioItem", for: indexPath)
        var conf = cell.defaultContentConfiguration()
        conf.text = source.data[indexPath.row].name
        conf.secondaryText = "\(source.data[indexPath.row].weight)"
        cell.contentConfiguration = conf
        return cell
    }
    
}

