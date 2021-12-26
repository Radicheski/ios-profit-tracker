//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import UIKit

class PortfolioManagerDataSource: NSObject, UITableViewDataSource {

    var data: [PortfolioItem] = []
    weak var viewController: PortfolioManagerViewControllerProtocol?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioItem", for: indexPath)
        var conf = cell.defaultContentConfiguration()
        conf.text = self.data[indexPath.row].name
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        conf.secondaryText = formatter.string(from: NSDecimalNumber(decimal: self.data[indexPath.row].weight))
        cell.contentConfiguration = conf
        return cell
    }

}

extension PortfolioManagerDataSource: PortfolioManagerPresenterProtocol {

    func load(data: [PortfolioItem]) {
        self.data = data
        self.viewController?.updateView()
    }

    func presentTotalAllocated(value: Decimal) {
        self.viewController?.updateTotalAllocated(value: value)
    }
}
