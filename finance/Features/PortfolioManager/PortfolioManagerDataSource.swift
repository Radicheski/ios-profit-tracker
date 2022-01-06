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
            conf.secondaryText = Formatter.shared.percent.string(from: self.data[indexPath.row].weight)
            cell.editingAccessoryType = .detailButton
        }
        
        cell.contentConfiguration = conf
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if tableView.isEditing && indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            return false
        } else {
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedItem = self.data.first(where: { $0.rank == sourceIndexPath.row } )
        if sourceIndexPath.row < destinationIndexPath.row {
            self.data.filter( { $0.rank > sourceIndexPath.row && $0.rank <= destinationIndexPath.row } ).forEach( { $0.rank -= 1 } )
        } else {
            self.data.filter( { $0.rank < sourceIndexPath.row && $0.rank >= destinationIndexPath.row } ).forEach( { $0.rank += 1 } )
        }
        movedItem?.rank = destinationIndexPath.row
        self.data.sort(by: { $0.rank < $1.rank } )
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
