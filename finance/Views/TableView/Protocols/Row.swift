//
//  Row.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 26/01/22.
//

import UIKit

protocol Row: AnyObject {
    var key: String { get }
    var didSelect: ((UITableView, IndexPath) -> Void)? { get set }
    var tableViewCell: RegistrableTableViewCell.Type { get }
    var contentConfiguration: UIContentConfiguration { get }
    func register(_ tableView: UITableView)
    func dequeue(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}

extension Row {

    var tableViewCell: RegistrableTableViewCell.Type { UITableViewCell.self }
    var didSelect: ((UITableView, IndexPath) -> Void)? {
        get { nil }
        set { }
    }

    func register(_ tableView: UITableView) {
        tableView.register(self.tableViewCell)
    }

    func dequeue(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(self.tableViewCell, for: indexPath)
        cell.contentConfiguration = self.contentConfiguration
        return cell
    }

}

protocol BoxedFormField: Row {
    associatedtype Item
    var value: Box<Item> { get }
}
