//
// Created by Erik Radicheski da Silva on 03/11/21.
//

import UIKit

class PortfolioManagerDataSource: NSObject, UITableViewDataSource {

    var data: [PortfolioItem] = []
    weak var viewController: PortfolioManagerViewControllerProtocol?
    weak var interactor: PortfolioManagerInteractorProtocol?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEditing {
            return self.data.count + 1
        } else {
            return self.data.count
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            self.interactor?.insertData()
        case .delete:
            self.interactor?.removeData(at: indexPath.row)
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioItem", for: indexPath)
        var conf = cell.defaultContentConfiguration()
        
        if tableView.isEditing && indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            conf.text = CustomLocalization.PortfolioManager.globalPortfolioNewItem
            conf.secondaryText = nil
        } else {
            conf.text = self.data[indexPath.row].name
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            conf.secondaryText = formatter.string(from: NSDecimalNumber(decimal: self.data[indexPath.row].weight))
        }
        
        cell.contentConfiguration = conf
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
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
