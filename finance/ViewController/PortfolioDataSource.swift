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
        return self.source.data.filter( { $0.parentId == nil } ).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioItem", for: indexPath)
        var conf = cell.defaultContentConfiguration()
        let data = self.source.data.filter( { $0.parentId == nil } )
        conf.text = data[indexPath.row].name
        conf.secondaryText = "\(data[indexPath.row].weight)"
        cell.contentConfiguration = conf
        return cell
    }
    
}

