//
//  PortfolioTableViewDataSource.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import UIKit

class PortfolioTableViewDataSource: NSObject, UITableViewDataSource {
    
    private enum Sections: Int, CaseIterable {
        case main
        case accessory
    }
    
    weak var viewController: PortfolioViewProtocol?
    var data: [Portfolio.ViewModel] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? self.data.count : tableView.isEditing ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Sections(rawValue: indexPath.section)
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
        switch section {
        case .main:
            self.data[row].configure(cell)
        case .accessory:
            var conf = cell.defaultContentConfiguration()
            if tableView.isEditing && indexPath.row == 0 {
                conf.text = CustomLocalization.PortfolioManager.globalPortfolioNewItem
                conf.secondaryText = nil
            } else {
                conf.text = CustomLocalization.PortfolioManager.globalPortfolioUnallocated
                conf.secondaryText = Formatter.shared.percent.string(from: self.data.map { try! Decimal($0.weight.value ?? "0", format: .percent) }.reduce(1, { $0 - $1 }))
            }
            cell.contentConfiguration = conf
        default: break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == Sections.main.rawValue
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == Sections.main.rawValue
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.viewController?.move(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section != 0 { return }
        switch editingStyle {
        case .delete:
            self.viewController?.delete(fromIndex: indexPath.row)
        default: return
        }
        if !tableView.isEditing { self.viewController?.interactor.save() }
    }
    
}
