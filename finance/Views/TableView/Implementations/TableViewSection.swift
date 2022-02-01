//
//  TableViewSection.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 30/01/22.
//

import Foundation

class TableViewSection: Section {

    private(set) var key: String
    private(set) var rows: [Row]
    var headerTitle: String?
    var footerTitle: String?

    init(key: String, rows: [Row]) {
        self.key = key
        self.rows = rows
    }

}

extension TableViewSection {

    func insert(row: Row, at index: Int) {
        self.rows.insert(row, at: index)
    }

    func insert(row: Row, after key: String) {
        if let rowIndex = self.rows.firstIndex(where: { $0.key == key }) {
            self.rows.insert(row, at: rowIndex + 1)
        }
    }

    func insert(row: Row, before key: String) {
        if let rowIndex = self.rows.firstIndex(where: { $0.key == key }) {
            self.rows.insert(row, at: rowIndex)
        }
    }

    func removeRow(at index: Int) -> Row {
        return self.rows.remove(at: index)
    }

    func removeRow(withKey key: String) -> Row? {
        if let index = self.rows.firstIndex(where: { $0.key == key } ) {
            return self.rows.remove(at: index)
        } else {
            return nil
        }
    }

    func moveRow(from sourceIndex: Int, to targetIndex: Int) {
        let row = self.rows.remove(at: sourceIndex)
        self.rows.insert(row, at: targetIndex)
    }

}
