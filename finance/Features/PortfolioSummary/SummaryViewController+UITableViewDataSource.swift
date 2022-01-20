//
//  SummaryViewController+UITableViewDataSource.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import UIKit

extension SummaryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? self.datastore.count : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolio", for: indexPath)
        
        if indexPath.section == 0 {
            var conf = CustomContentConfiguration()
            conf.title = self.datastore.data[indexPath.row].name
            conf.weight = self.datastore.data[indexPath.row].weight
            conf.quantity = self.datastore.data[indexPath.row].quantity
            cell.contentConfiguration = conf
        } else {
            var conf = cell.defaultContentConfiguration()
            conf.text = CustomLocalization.Summary.summaryUnallocated
            conf.secondaryText = Formatter.shared.percent.string(from: self.data.map( { -$0.weight } ).reduce(Decimal(1), { $0 + $1 } ))
            cell.contentConfiguration = conf
        }
        
        return cell
    }

}
