//
//  PortfolioDataSource.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 01/11/21.
//

import UIKit

class PortfolioDataSource: NSObject, UITableViewDataSource {
    
    var worker: PortfolioItemWorker
    
    init(parentId: UUID?) {
        self.worker = PortfolioItemWorker(parentId: parentId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.worker.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioItem", for: indexPath)
        var conf = cell.defaultContentConfiguration()
        conf.text = self.worker.items[indexPath.row].name
        conf.secondaryText = "\(self.worker.items[indexPath.row].weight)"
        cell.contentConfiguration = conf
        return cell
    }
    
}

