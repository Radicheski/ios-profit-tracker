//
//  FormField.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 26/01/22.
//

import UIKit

protocol FormField: AnyObject {
    var key: String { get }
    var tableViewCell: RegistrableTableViewCell.Type { get }
    var contentConfiguration: UIContentConfiguration { get }
    func register(_ tableView: UITableView)
    func dequeue(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}

extension FormField {

    var tableViewCell: RegistrableTableViewCell.Type { UITableViewCell.self }

    func register(_ tableView: UITableView) {
        tableView.register(self.tableViewCell)
    }

    func dequeue(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(self.tableViewCell, for: indexPath)
        cell.contentConfiguration = self.contentConfiguration
        return cell
    }

}

protocol BoxedFormField: FormField {
    associatedtype Item
    var value: Box<Item> { get }
}
