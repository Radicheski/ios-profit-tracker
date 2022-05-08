//
//  Section.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 30/01/22.
//

import UIKit

protocol Section: AnyObject {

    var key: String { get }

    var rows: [Row] { get }

    func register(in tableView: UITableView)

    func insert(row: Row, at index: Int)
    func insert(row: Row, after key: String)
    func insert(row: Row, before key: String)
    func removeRow(at index: Int) -> Row
    func removeRow(withKey key: String) -> Row?
    func moveRow(from sourceIndex: Int, to targetIndex: Int)

    // MARK: UITableViewDataSource

    var rowCount: Int { get }

    var headerTitle: String? { get }
    var footerTitle: String? { get }

    func canEditRow(for tableView: UITableView, at index: Int) -> Bool
    func canMoveRow(for tableView: UITableView, at index: Int) -> Bool

    func row(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell

}

extension Section {

    func register(in tableView: UITableView) {
        self.rows.forEach { $0.register(tableView) }
    }

}

// MARK: UITableViewDataSource - Default implementations

extension Section {

    var rowCount: Int { self.rows.count }

    var headerTitle: String? { nil }
    var footerTitle: String? { nil }

    func canEditRow(for tableView: UITableView, at index: Int) -> Bool { false }
    func canMoveRow(for tableView: UITableView, at index: Int) -> Bool { false }

    func row(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return self.rows[indexPath.row].dequeue(tableView, for: indexPath)
    }

}
