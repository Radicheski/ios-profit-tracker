//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import UIKit

class FlatPortfolioDataSource: NSObject, UITableViewDataSource {

    var source: [PortfolioItem] {
        get {
            return PortfolioItem.getItems(PortfolioMock.shared.data).sorted(by: { $0.name < $1.name } )
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioItem", for: indexPath)
        var conf = cell.defaultContentConfiguration()
        conf.text = self.source[indexPath.row].name
        conf.secondaryText = "\(self.source[indexPath.row].weight)"
        cell.contentConfiguration = conf
        return cell
    }

}