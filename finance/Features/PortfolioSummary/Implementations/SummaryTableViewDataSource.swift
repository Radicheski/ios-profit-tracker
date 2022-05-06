//
//  SummaryTableViewDataSource.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 22/01/22.
//

import UIKit

class SummaryTableViewDataSource: NSObject, UITableViewDataSource {

    weak var viewController: SummaryViewProtocol?
    var data: [SummaryItem.ViewModel] = []

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? self.data.count : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 {
            var conf = CustomContentConfiguration()
            let item = self.data[row]
            conf.title = item.name
            conf.weight = item.weight
            conf.quantity = item.quantity
            conf.price = item.price
            cell.contentConfiguration = conf
        } else {
            var conf = cell.defaultContentConfiguration()
            conf.text = CustomLocalization.PortfolioManager.globalPortfolioUnallocated
            let percentArray = self.data.map { try? Decimal($0.weight, format: .percent) }
            let percentValue = percentArray.filter { $0 != nil }.reduce(1) { $0 - ($1 ?? 0) }
            conf.secondaryText = Formatter.shared.percent.string(from: percentValue)
            cell.contentConfiguration = conf
        }
        
        return cell
    }

}
